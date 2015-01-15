Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id A245472BE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 20:47:55 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so37795188wiw.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 12:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IIB1egeG+9vyi9Ksy8DWQErgpmtKfWxjo1VwqcnRgAo=;
	b=OoVcJhgXqlKps77PVzFEHuyjkKNlznlY7LkC3aEdQLBQ/74R1uS3tShPxwuzlOf7cv
	XbTy8PIgqEtV2mmybBIVdPQ9ADqSExhsR1vhQPBNZDN5aV6IwBvPgL8h4oJs94RN6JUC
	2wneDHqEB5/TB4Og0odzbU/MgUbUC/IVAoT9dupSC5+kD6UYUQr4aqAxBUxuIF0MXmWX
	KGslHn9+Ny/ZJDfaU7P1V/swN1FHW5Uz+KGJGcT6OJlc0VDYMwje5voxsKJDRUhNOBPV
	pNTRGezeLgbZK3lBhdhw7nJoxBWdN6g05g8VicoJFnoKg2FoPkZOpYjVR6t3yuioPPMQ
	ajIg==
X-Received: by 10.194.203.234 with SMTP id kt10mr22434612wjc.88.1421354875435; 
	Thu, 15 Jan 2015 12:47:55 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id gz7sm392409wib.22.2015.01.15.12.47.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 12:47:54 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jan 2015 21:47:01 +0100
Message-Id: <1421354822-21485-3-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1421354822-21485-1-git-send-email-max.oss.09@gmail.com>
References: <1421354822-21485-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-java][RFC 2/3] gcc-static-test: initial commit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Jan 2015 20:47:57 -0000

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-test/gcc-static-test/gcc-static-test.bb    | 40 ++++++++++++++++++++++
 .../gcc-static-test/gcc-static-test/hello.c        |  6 ++++
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-test/gcc-static-test/gcc-static-test.bb
 create mode 100644 recipes-test/gcc-static-test/gcc-static-test/hello.c

diff --git a/recipes-test/gcc-static-test/gcc-static-test.bb b/recipes-test/gcc-static-test/gcc-static-test.bb
new file mode 100644
index 0000000..c0fd852
--- /dev/null
+++ b/recipes-test/gcc-static-test/gcc-static-test.bb
@@ -0,0 +1,40 @@
+SUMMARY = "Test if cross-gcc can compile a linked binary which runs on qemu"
+DESCRIPTION = \
+"Have cross-gcc compile a simple helloworld style program linked statically \
+and dynamically and then test if qemu is able to run it without segfaulting. \
+Should help in hunting the following bug in building java: \
+http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099795.html"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+DEPENDS = ""
+
+SRC_URI = "file://hello.c"
+
+QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 2097152 -L ${STAGING_DIR_TARGET} -E LD_LIBRARY_PATH=${STAGING_BASELIBDIR}"
+
+trapsegfault() {
+    echo "We have a segmenation fault!"
+
+    # Reset handler
+    trap - 11
+}
+
+do_compile() {
+    #disable the trap built into run.do_compile by default
+    set +e
+    trap '' 0
+    trap 'trapsegfault' 11
+    ${CC} -static hello.c -o hello
+    ${QEMU} hello ; FAILED_STATIC=$?
+    ${CC} hello.c -o hello
+    ${QEMU} hello ; FAILED_DYNAMIC=$?
+    echo FAILED_STATIC $FAILED_STATIC
+    echo FAILED_DYNAMIC $FAILED_DYNAMIC
+    ( [ $FAILED_STATIC -eq 0 ] && [ $FAILED_DYNAMIC -eq 0 ] ) || exit -1
+}
+
+S = "${WORKDIR}"
+
+inherit qemu
diff --git a/recipes-test/gcc-static-test/gcc-static-test/hello.c b/recipes-test/gcc-static-test/gcc-static-test/hello.c
new file mode 100644
index 0000000..5bd0da7
--- /dev/null
+++ b/recipes-test/gcc-static-test/gcc-static-test/hello.c
@@ -0,0 +1,6 @@
+#include <stdio.h>
+int main (void) {
+  printf("Hi\n");
+  return 0;
+}
+
-- 
1.9.3


