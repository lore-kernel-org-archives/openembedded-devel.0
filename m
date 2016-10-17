Return-Path: <gizero@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 18FCF71998
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2016 21:28:32 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id x79so28951280lff.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2016 14:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2JQC4KYDVS2IFge+9TRenyJ9+oibvvLpR7zdKN9Euew=;
	b=kQLWdG3q83dSEG3FkEE4Z9bo75ggSaW4aCmllHUZv7m3uGkSMlwdRSai1TZEX51irr
	miYlQ4t+fQZfcEFd7w6kTODrBD5vPqr1wk/ZmpjXP+UM3NX/yN8mLeBXh813zmyObTw/
	lc+NbxBX9LpCT5yBTnJw0DbMXJhqqVkNqvN/PUHsEfqeEHqnWJdWBFl5S8bst07ua7gv
	PwB3Az485MMDA3y9iY0QQi/SpjyGCzrIkQ3M59Xv4UHhD8bAI6oy7TcAfjXbHeD/F5Hc
	vMjmYcbjYbTIq28U4xTcZnIib9nwhX/4LRK8Ps06tQwHo470rwWhYDVQU/yF/yhOzfxA
	8cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2JQC4KYDVS2IFge+9TRenyJ9+oibvvLpR7zdKN9Euew=;
	b=fCIdirPa5AiY9B4t1nerIeOaNXVajajbSSjbbgs1y5m51qmZrcQn/jrEXJmYTw8CP3
	DAmo0xSfcQm+NrLVr+rxh1zGFtYzan3bhuGqQIFP4Asrevj3leAMb097PeB9FMbuN+dn
	mtJq0BDRm5XbSuMmNvakyemyoAmw7r5W47owqEp1aUXT2XYZxuPtEGQyGLRnFSwK0OFM
	7Yc2L/KXaoVaDvgz1CzR/05jNW4jTHC1U9XeAB6A/lDyXGG5k5uPutCkoR/LERuR3/NZ
	NI+TynYNmJHIAIbvgLzYK/hVnpv4wZG/Jd0u3RivtwPaecbywL7ginUkd4uLifgpJpVl
	Wfxg==
X-Gm-Message-State: AA6/9RkXEDn/lGtSwKjYtXJ3viUrFTVGXU6R7+SEU+fTIdIjSyyPZHXyl5QjJRgYgJgi4w==
X-Received: by 10.194.93.234 with SMTP id cx10mr12733238wjb.140.1476739713551; 
	Mon, 17 Oct 2016 14:28:33 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id
	a1sm56344626wju.41.2016.10.17.14.28.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 14:28:30 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2016 23:28:01 +0200
Message-Id: <1476739681-14848-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] inotify-tools: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2016 21:28:34 -0000

inotify-tools is a C library and a set of command-line programs for Linux
providing a simple interface to inotify.

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 .../inotifywait-fix-compile-error-with-GCC-6.patch | 45 ++++++++++++++++++++++
 .../inotify-tools/inotify-tools_git.bb             | 23 +++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch
new file mode 100644
index 0000000..ba042a2
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch
@@ -0,0 +1,45 @@
+From 7affb288d6c0726e7b1ebc317a878927b6ef0d02 Mon Sep 17 00:00:00 2001
+From: Andrea Galbusera <gizero@gmail.com>
+Date: Tue, 13 Sep 2016 08:10:29 +0200
+Subject: [PATCH] inotifywait: fix compile error with GCC 6
+
+Fails to compile with misleading-indentation error
+
+| src/inotifywait.c: In function 'output_event_csv':
+| src/inotifywait.c:126:5: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
+|      if (filename != NULL)
+|      ^~
+| src/inotifywait.c:129:2: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'if'
+|   printf("%s,", csv_escape( inotifytools_event_to_str( event->mask ) ) );
+|   ^~~~~~
+| cc1: all warnings being treated as errors
+
+Fix indentation to resolve.
+
+Upstream-Status: Submitted [https://github.com/rvoicilas/inotify-tools/pull/66]
+
+Signed-off-by: Andrea Galbusera <gizero@gmail.com>
+---
+ src/inotifywait.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/inotifywait.c b/src/inotifywait.c
+index c5ce5e3..404a85b 100644
+--- a/src/inotifywait.c
++++ b/src/inotifywait.c
+@@ -122,9 +122,9 @@ void validate_format( char * fmt ) {
+ 
+ 
+ void output_event_csv( struct inotify_event * event ) {
+-    char *filename = csv_escape(inotifytools_filename_from_wd(event->wd));
+-    if (filename != NULL)
+-        printf("%s,", filename);
++	char *filename = csv_escape(inotifytools_filename_from_wd(event->wd));
++	if (filename != NULL)
++		printf("%s,", filename);
+ 
+ 	printf("%s,", csv_escape( inotifytools_event_to_str( event->mask ) ) );
+ 	if ( event->len > 0 )
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
new file mode 100644
index 0000000..a8ef557
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Command line tools and C library providing a simple interface to inotify"
+AUTHOR = "Rohan McGovern <rohan@mcgovern.id.au>"
+HOMEPAGE = "http://wiki.github.com/rvoicilas/inotify-tools"
+SECTION = "console/devel"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
+
+SRCREV = "1df9af4d6cd0f4af4b1b19254bcf056aed4ae395"
+PV = "3.14+git${SRCPV}"
+
+SRC_URI = "git://github.com/rvoicilas/${BPN} \
+           file://inotifywait-fix-compile-error-with-GCC-6.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-doxygen"
+
+PACKAGES =+ "libinotifytools"
+
+FILES_libinotifytools = "${libdir}/lib*.so.*"
-- 
1.9.1


