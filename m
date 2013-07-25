Return-Path: <net147@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id CBE6F6065F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2013 02:37:59 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc8so153708pbc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 19:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=LMeJSNfgQMkyEa+EXiteuYzja7RYJMgut7rISEcsMAg=;
	b=Es3oTT5FUH6NDrpIYgprG5ZTeEUPLnoA5ViX3C8yNNKxcESck+m8ZoogbK5AcOtJcz
	DcWSEkwD6Efndt48AjcKYTSsu4aGpJJFQPcpnsJvoyp5ES9B1qHHdXbWtOfff0+2znlS
	AbTbInqrpuPYhBhgWnfY5hDIrG5UjLwV+Bn7hwb6hecRAhY85dk4eX27bBsYS+y9/jRu
	X9T/z2U68ZGzY6oCAueOP1gUmp5I9SN4gymZ64cZBEg16YSiqFiEE91WAmj2d0gLyG7Y
	F03y+aCB4LTDDXLSCceH5vi5qPAPMNfPRkVqrn2UZTUVDteF6i2clOxYenUHAfkgIhdb
	Es6w==
X-Received: by 10.66.102.101 with SMTP id fn5mr12095491pab.115.1374719880588; 
	Wed, 24 Jul 2013 19:38:00 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	xe9sm50931343pbc.21.2013.07.24.19.37.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 19:37:59 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jul 2013 12:53:39 +1000
Message-Id: <1374720819-23241-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] qwt: install Qt Designer plugins to correct directory
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
X-List-Received-Date: Thu, 25 Jul 2013 02:37:59 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-qt/qwt/qwt.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
index d9d47f0..60f73a6 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -29,10 +29,12 @@ do_install() {
     for i in * ; do
         cp -pPR ${i} ${D}/${bindir}/${i}${QT_LIBINFIX}
     done
+    install -d ${D}${libdir}/${QT_DIR_NAME}
+    mv ${D}${prefix}/plugins ${D}${libdir}/${QT_DIR_NAME}
 }
 
 PACKAGES_prepend = "${PN}-examples ${PN}-features ${PN}-plugins "
 FILES_${PN}-examples = "${bindir}/*"
 FILES_${PN}-features = "${prefix}/features"
-FILES_${PN}-plugins = "${prefix}/plugins/designer/*.so"
-FILES_${PN}-dbg += "${prefix}/plugins/designer/.debug"
+FILES_${PN}-plugins = "${libdir}/${QT_DIR_NAME}/plugins/designer/*.so"
+FILES_${PN}-dbg += "${libdir}/${QT_DIR_NAME}/plugins/designer/.debug"
-- 
1.8.3.2


