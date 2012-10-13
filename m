Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TMxmn-0002rD-Bv
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Oct 2012 11:13:33 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so2216522wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Oct 2012 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=MnCEa3lOV7bhLOFTR5AZlyCxdqDkuVbDgPuTyM9/PZQ=;
	b=a3zZQQWDkcKBmb2tvANyxiVMsFZ+CJRWm1ErJZlykcoDD5Apxv0iGoFaO2QbuEBOSK
	SyA1c33iWelflTtbNfWuAkcSyKaqmZ33Qdep+wR7oMsOqWb7LRf8Z076lzHpKXH6Sdn3
	XwwL1jTt6bRfVka6XWOb2S/j8ASjRP9aaYmXRbCaTlkFjaXwnrpmVbGj0crGMCJ3fRK9
	9m5vujbtDesOfGAcdwyeexiqXkiBnvzEQRQAtd75Q05chMmODc59HC9U8PWLS1+hRAF7
	K0/MaLWNFyaOcQaGlm/WNmFFG9J4AuuUvw3so48RUwJZ3sSq6cUhcjQYGZ3m2eUPuSxk
	yfew==
Received: by 10.180.105.168 with SMTP id gn8mr11334342wib.10.1350118820755;
	Sat, 13 Oct 2012 02:00:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei1sm2242378wid.7.2012.10.13.02.00.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 13 Oct 2012 02:00:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Oct 2012 11:00:18 +0200
Message-Id: <1350118818-29342-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.3
Subject: [meta-oe][PATCH] mcnavi: remove myslq_config include path work around
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
X-List-Received-Date: Sat, 13 Oct 2012 09:13:33 -0000

* it was fixed in mysql5 3f95bb907381ac5fd789452e1330c12f9a8904f9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb b/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
index 35c304c..75958d0 100644
--- a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
+++ b/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
 SRC_URI[md5sum] = "acc07debcdb3ef448b95e6a6cfcf53d8"
@@ -12,9 +12,4 @@ SRC_URI[sha256sum] = "d3ce1f5901f13985d877b2b6ad06b64094ba43a4e13cbfe06c7cb2f1ab
 
 S = "${WORKDIR}/${PN}"
 
-do_configure_prepend() {
-  # for some reason our mysql_config returns just sysroot/include_dir while mysql.h is in include_dir/mysql
-  sed -i 's#`mysql_config --include`$#`mysql_config --include`/mysql#g' ${S}/configure.ac
-}
-
 inherit autotools
-- 
1.7.12.3



