Return-Path: <stephanoc@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 68C2A7050C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:08:21 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id g10so5279927pdj.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1RCsx0O1zmpjW1ThbWGjxnyZJ7Y/la1TdyL4xk8SpbU=;
	b=S+W9Kst/5gx3ZlMPV4+yTaV05MgywcMnaSFuazB7DCa6c2O+L6ZAuiS/OXnm1Ig4xJ
	/ys3fOJU2vkcieOeJsaSp/OA0ETtqr276h+X64L0E6sqDbdxD7ofhQ/cMBD+XA+O0TL2
	aLaEZCKMl2fqAjs2gSh1fKFWQ0GJOYrC9dmvT7gIYQDh5Slfuawbz81sn5BmM+Skage0
	PTy3zbf86cilzSAIxdbOkoDnkZ5JJmzII+6Ev7p4IGmOTo9yr7Pn8yf3ROQN32PKZATY
	PfnkA+x30ou5u6C+x1LhNAd9nLZWUpDHv1pWnCVIzc3UjkBbTKFVk2UH3CGVogb5vN/W
	i/Yg==
X-Received: by 10.66.141.76 with SMTP id rm12mr3802882pab.138.1405447702409;
	Tue, 15 Jul 2014 11:08:22 -0700 (PDT)
Received: from localhost.localdomain
	(74-92-165-193-Oregon.hfc.comcastbusiness.net. [74.92.165.193])
	by mx.google.com with ESMTPSA id
	dd5sm14608426pbc.85.2014.07.15.11.08.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 11:08:21 -0700 (PDT)
From: Stephano Cetola <stephanoc@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jul 2014 11:07:51 -0700
Message-Id: <1405447671-23272-1-git-send-email-stephanoc@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] php: stop removing directories that do not exist
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
X-List-Received-Date: Tue, 15 Jul 2014 18:08:28 -0000

The directory ${D}/${TMPDIR} does not exist. This patch removes code
that was calling rm and rmdir on that location.

Signed-off-by: Stephano Cetola <stephanoc@gmail.com>
---
 meta-oe/recipes-devtools/php/php.inc |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index b1bf79c..011eea7 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -74,7 +74,6 @@ do_install_append_pn-php() {
     if [ -d ${D}/${STAGING_DIR_NATIVE}/${sysconfdir} ];then
          mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* ${D}/${sysconfdir}/
     fi
-    rm -rf ${D}/${TMPDIR}
     rm -rf ${D}/.registry
     rm -rf ${D}/.channels
     rm -rf ${D}/.[a-z]*
@@ -89,11 +88,6 @@ do_install_append_pn-php() {
     sed -i 's:=/etc:=${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
     sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
     install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
-    TMP=`dirname ${D}/${TMPDIR}`
-    while test ${TMP} != ${D}; do
-        rmdir ${TMP}
-        TMP=`dirname ${TMP}`;
-    done
 }
 
 PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
-- 
1.7.10.4


