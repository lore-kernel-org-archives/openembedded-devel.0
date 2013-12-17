Return-Path: <andrei@gherzan.ro>
Received: from mail-qe0-f47.google.com (mail-qe0-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id D556F60CED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 16:42:02 +0000 (UTC)
Received: by mail-qe0-f47.google.com with SMTP id t7so5480215qeb.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 08:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1GvlyZsCi1X0HEa0Y49KvhBGaHeHRDFCktpMiGPuaps=;
	b=e4NyFzZfWELKDVhS8/0W76jvxCuKNd7j9MqsSz9DUi+Dpk5WDNOM8UFOe3mL7PkNEU
	RESk492RE8N76DHFv1kjGLE3VXJhUps41soDqE9zD641yPQwsQQZHn1sZ8NlRnA7WTV1
	wsfWA/uE0eugKwjJjsFyzyFvj3CSDH0mVxcCgYXTXuUoovSbwffPd7bCj4M0iz1Gl9oV
	3/BlKhv3CeHB3qE68L6zllCrBjRr9lrHWrlwWrNpF/OYOXaQ1J8piRSmbKKANc7nvjBt
	TIYioZLI1uxphO01wYx3Eohhx8azECy2GILOp4EMhR8/fMwTxfkBwVVoTEfB8JNRBe+s
	X50Q==
X-Gm-Message-State: ALoCoQkD4qJw5M0ICygw6HnKWZLcrhRpQHtdZFm/VlIsBPFaWK8/2IZOBsNcZuQsIQ4OYyj+43gP
X-Received: by 10.49.86.169 with SMTP id q9mr44516569qez.19.1387298523251;
	Tue, 17 Dec 2013 08:42:03 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPSA id a5sm58120708qae.2.2013.12.17.08.41.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Dec 2013 08:42:02 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Dec 2013 18:41:48 +0200
Message-Id: <1387298509-20865-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
Subject: [meta-oe][PATCH 1/2] libssh: Integrate package
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
X-List-Received-Date: Tue, 17 Dec 2013 16:42:03 -0000

Commit based on:
https://raw.github.com/tworaz/oe-tworaz/master/meta-jlime/recipes-support/libssh/libssh_0.5.2.bb

Updated version to latest.

Change-Id: If6cad765acdfdd1a3310d830cfd8e7072e27cd22
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-oe/recipes-support/libssh/libssh_0.5.5.bb | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh_0.5.5.bb

diff --git a/meta-oe/recipes-support/libssh/libssh_0.5.5.bb b/meta-oe/recipes-support/libssh/libssh_0.5.5.bb
new file mode 100644
index 0000000..1440ebe
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh_0.5.5.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Mulitplatform C library implementing the SSHv2 and SSHv1 protocol"
+HOMEPAGE = "http://www.libssh.org"
+SECTION = "libs"
+
+DEPENDS = "zlib openssl libgcrypt"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=388a4fb1dea8ceae0be78ba9b01fc139"
+
+SRC_URI = "git://git.libssh.org/projects/libssh.git"
+SRCREV = "43914a5f07702fe292a968322d5ff2627e0431db"
+S = "${WORKDIR}/git"
+
+OECMAKE_BUILDPATH = "${S}/build"
+OECMAKE_SOURCEPATH = "${S}"
+EXTRA_OECMAKE = " \
+    -DWITH_GCRYPT=1 \
+    -DWITH_PCAP=1 \
+    -DWITH_SFTP=1 \
+    -DWITH_ZLIB=1 \
+    "
+EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
+
+inherit cmake
+
+do_configure_prepend () {
+    # Disable building of examples
+    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' CMakeLists.txt \
+        || bb_fatal "Failed to disable examples"
+}
-- 
1.8.1.4


