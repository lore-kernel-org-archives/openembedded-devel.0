Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 65C966A932
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Jun 2013 10:36:58 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so3032993eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jun 2013 03:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KPHyHL8Svj743dx04dl4EfgQBskQpiZeI6X/IzTVys8=;
	b=bcsv9zQmyYUcAwi57IyLwN7RGWKwtzRNGUGcTcIXLbQ/7i1Xv0PbXg+TwrJq1nwaEM
	22tXb1WbIY0veHCPMX7iw11uQ2HjuSi8ZVLzyrhdX/MZbhFqwUq3kRzqkEZK2zfUlkf4
	OmoSVxSYa86876sBwL1S3HW7/QndQtu5uHW9uVdT4efFg/MmWpF8STABFs6uilpscUcm
	mtq0x6VnS3dBD5eQc0CrIhEmfmMkg6aNFjeRRolJmtVjfjDFpM8a+v2BMonvd9eQSNPQ
	3dsTnezy1PeEdcheV5MTVH9ivf6rm68g3n7DAiF140Ri3RvRJXaLbiKKOwI7X2OTg/SQ
	xReA==
X-Received: by 10.14.172.70 with SMTP id s46mr2577070eel.133.1370687818212;
	Sat, 08 Jun 2013 03:36:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cf47sm5205284eeb.17.2013.06.08.03.36.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Jun 2013 03:36:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Jun 2013 12:36:53 +0200
Message-Id: <1370687813-14789-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] emacs: zlib is now in base_libdir
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
X-List-Received-Date: Sat, 08 Jun 2013 10:36:59 -0000

* moved in
  http://git.openembedded.org/openembedded-core/commit/?id=ebb8382af892bef8e11fb590292506e1124276c5

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index 5068596..fa554ed 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -94,6 +94,7 @@ do_compile_prepend() {
         # after:   86M   ../../qemu-treedir/
         cp -pPR \
         ${STAGING_DIR_TARGET}/${base_libdir}/libuuid.so.* \
+        ${STAGING_DIR_TARGET}/${base_libdir}/libz.so.* \
         ${STAGING_DIR_TARGET}/${libdir}/libICE.so.* \
         ${STAGING_DIR_TARGET}/${libdir}/libSM.so.* \
         ${STAGING_DIR_TARGET}/${libdir}/libatk-1.0.so.* \
@@ -118,8 +119,7 @@ do_compile_prepend() {
         ${STAGING_DIR_TARGET}/${libdir}/libharfbuzz.so.* \
         ${STAGING_DIR_TARGET}/${libdir}/libicule.so.* \
         ${STAGING_DIR_TARGET}/${libdir}/libicuuc.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libicudata.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libz.so.* $treedir/${base_libdir}/
+        ${STAGING_DIR_TARGET}/${libdir}/libicudata.so.* $treedir/${base_libdir}/
 
         # X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xft Xpm Xrandr Xrender
         cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libX*.so.* $treedir/${base_libdir}/
-- 
1.8.2.1


