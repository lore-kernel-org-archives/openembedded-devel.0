Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkoP-00010c-8a
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:37:50 +0100
Received: by mail-ea0-f174.google.com with SMTP id e13so2606021eaa.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=/SWG2IGgr3tQKcbWFLHpdJDa7jKkcjwIargxmYantew=;
	b=u3d+dMpf41DQfwpKJI1RoGwxwM1phnpr5JXBkHEO7pRzSG+uVhVmTti5vtv4aJ6wr6
	dKkNQLVMP1fV1dAdR5o2IfPLFdN39ufjegkoYZamZwS3rBMginQHNoxEoyQQIPdhWqxk
	8DAp82HLUFrXo48huS7xQSz+EgYMwqXsq0XVGlpZ3L86vfUrB51zlmjpqEQowC7yhOvL
	khXN5LN+iBKhltU0w5W6o6KFu5kbD8gMf7SloJFOATLdVFXSw3n1OE40gfH9U2uqSkC2
	O0Tsn5aM27dlgy1YqhmuOKevX5rqhQ+Ol+Vf0zR5q0eqYgxjbL9cDUYIcbZ2FRrpbP6a
	gBWA==
X-Received: by 10.14.225.72 with SMTP id y48mr47537994eep.46.1356265380959;
	Sun, 23 Dec 2012 04:23:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm34568636eep.15.2012.12.23.04.23.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:23:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:32 +0100
Message-Id: <44eea8e0790ca6a2d19ab372aa4eb2b74dad2602.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/30] emacs: fix build with libpng-1.5 from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2012 12:37:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs.inc     | 2 +-
 meta-oe/recipes-support/emacs/emacs_23.4.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index b7a7b75..e2a7e97 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -109,7 +109,7 @@ do_compile_prepend() {
 		${STAGING_DIR_TARGET}/${libdir}/libjpeg.so.* \
 		${STAGING_DIR_TARGET}/${libdir}/liblzma.so.* \
 		${STAGING_DIR_TARGET}/${libdir}/libpixman-1.so.* \
-		${STAGING_DIR_TARGET}/${libdir}/libpng12.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libpng1*.so.* \
 		${STAGING_DIR_TARGET}/${libdir}/librsvg-2.so.* \
 		${STAGING_DIR_TARGET}/${libdir}/libstdc++.so.* \
 		${STAGING_DIR_TARGET}/${libdir}/libtiff.so.* \
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
index 5ad5644..cb0368e 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -1,6 +1,6 @@
 require emacs.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
            file://use-qemu.patch \
-- 
1.8.0.2



