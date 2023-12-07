Return-Path: <jean-marc.bouche@foss.st.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C21C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 09:48:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
 by mx.groups.io with SMTP id smtpd.web10.80479.1701942483881164575
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 01:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foss.st.com header.s=selector1 header.b=s/V8ZWVR;
 spf=pass (domain: foss.st.com, ip: 185.132.182.106, mailfrom: prvs=070576c65d=jean-marc.bouche@foss.st.com)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3B77dXbg013672
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Dec 2023 10:48:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=DDgdERr
	1p6xPwB/2+WsTnzp/QQZhFSCrNMbvKBWZZB8=; b=s/V8ZWVR85nmG4tfbWAczjr
	2ocyu0rgMs2BN6iMNY5TDbDiiw6keXDJ2Lu8GO38K4Pmx75MJ2LDrZLby+HUolwN
	I+rInjrAYxEZJPnowyMh4pKYkSmitxm1G5A8gxfniM8eMQiVy8mbXV1IuDxpx4Rc
	68plwP+hO/pQvTh0F11CHRsAFUWkU39lDb1Tk8WqTMcGTT1ALmPbUFN6PaEbIUxe
	a+oSfS9wYXLYH5mAAsQRcctkhmZwmAGspl9zCT3usYe68HCw4JX4FAsQ1Sb6qKnZ
	fImYKDXF8Yjif5foh8GcHVVGRjFfm/B9Qqw/A0zuzmjxp+EgdQRg/ytzR59X6rw=
	=
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3utd2gf9yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 10:48:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C897100056
	for <openembedded-devel@lists.openembedded.org>; Thu,  7 Dec 2023 10:48:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63CA7233C91
	for <openembedded-devel@lists.openembedded.org>; Thu,  7 Dec 2023 10:48:00 +0100 (CET)
Received: from localhost (10.129.178.205) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 7 Dec
 2023 10:48:00 +0100
From: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
Subject: [oe][meta-oe][PATCH] terminus-font: build compressed archives with -n
Date: Thu, 7 Dec 2023 10:47:57 +0100
Message-ID: <20231207094757.1089092-1-jean-marc.bouche@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.205]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_07,2023-12-06_01,2023-05-22_02
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 09:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107276

When building this recipe, internal archives are compressed with
gzip. The compressed archives contain a header with the field
MTIME (Modification Time) which is initialized from the built
date. As a consequence, two builds of this recipe always generate
packages whose checksum differs.
Adding the -n option to gzip while compressing the archive does
not save the original time stamp by default hence making
reproducible package.

Signed-off-by: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
---
 .../use-no-name-option-for-gzip.patch         | 52 +++++++++++++++++++
 .../terminus-font/terminus-font_4.49.1.bb     |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/terminus-font/terminus-font/use-no-name-option-for-gzip.patch

diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font/use-no-name-option-for-gzip.patch b/meta-oe/recipes-graphics/terminus-font/terminus-font/use-no-name-option-for-gzip.patch
new file mode 100644
index 000000000..cb1fbcfaf
--- /dev/null
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font/use-no-name-option-for-gzip.patch
@@ -0,0 +1,52 @@
+Index: terminus-font-4.49.1/Makefile
+===================================================================
+--- terminus-font-4.49.1.orig/Makefile
++++ terminus-font-4.49.1/Makefile
+@@ -92,9 +92,9 @@ otbdir  = $(prefix)/share/fonts/terminus
+ 
+ install: $(PSF) $(PCF)
+ 	mkdir -p $(DESTDIR)$(psfdir)
+-	for i in $(PSF) ; do gzip -c $$i > $(DESTDIR)$(psfdir)/$$i.gz ; done
++	for i in $(PSF) ; do gzip -c -n $$i > $(DESTDIR)$(psfdir)/$$i.gz ; done
+ 	mkdir -p $(DESTDIR)$(x11dir)
+-	for i in $(PCF) ; do gzip -c $$i > $(DESTDIR)$(x11dir)/$$i.gz ; done
++	for i in $(PCF) ; do gzip -c -n $$i > $(DESTDIR)$(x11dir)/$$i.gz ; done
+ 
+ uninstall:
+ 	for i in $(PSF) ; do rm -f $(DESTDIR)$(psfdir)/$$i.gz ; done
+@@ -193,7 +193,7 @@ psf: $(PSF)
+ 
+ install-psf: $(PSF)
+ 	mkdir -p $(DESTDIR)$(psfdir)
+-	for i in $(PSF) ; do gzip -c $$i > $(DESTDIR)$(psfdir)/$$i.gz ; done
++	for i in $(PSF) ; do gzip -c -n $$i > $(DESTDIR)$(psfdir)/$$i.gz ; done
+ 
+ uninstall-psf:
+ 	for i in $(PSF) ; do rm -f $(DESTDIR)$(psfdir)/$$i.gz ; done
+@@ -202,7 +202,7 @@ psf-vgaw: $(PSF_VGAW)
+ 
+ install-psf-vgaw: $(PSF_VGAW)
+ 	mkdir -p $(DESTDIR)$(psfdir)
+-	for i in $(PSF_VGAW) ; do gzip -c $$i > $(DESTDIR)$(psfdir)/$$i.gz ; done
++	for i in $(PSF_VGAW) ; do gzip -c -n $$i > $(DESTDIR)$(psfdir)/$$i.gz ; done
+ 
+ uninstall-psf-vgaw:
+ 	for i in $(PSF_VGAW) ; do rm -f $(DESTDIR)$(psfdir)/$$i.gz ; done
+@@ -279,7 +279,7 @@ pcf: $(PCF)
+ 
+ install-pcf: $(PCF)
+ 	mkdir -p $(DESTDIR)$(x11dir)
+-	for i in $(PCF) ; do gzip -c $$i > $(DESTDIR)$(x11dir)/$$i.gz ; done
++	for i in $(PCF) ; do gzip -c -n $$i > $(DESTDIR)$(x11dir)/$$i.gz ; done
+ 
+ uninstall-pcf:
+ 	for i in $(PCF) ; do rm -f $(DESTDIR)$(x11dir)/$$i.gz ; done
+@@ -288,7 +288,7 @@ pcf-8bit: $(PCF_8BIT)
+ 
+ install-pcf-8bit: $(PCF_8BIT)
+ 	mkdir -p $(DESTDIR)$(x11dir)
+-	for i in $(PCF_8BIT) ; do gzip -c $$i > $(DESTDIR)$(x11dir)/$$i.gz ; done
++	for i in $(PCF_8BIT) ; do gzip -c -n $$i > $(DESTDIR)$(x11dir)/$$i.gz ; done
+ 
+ uninstall-pcf-8bit:
+ 	for i in $(PCF_8BIT) ; do rm -f $(DESTDIR)$(x11dir)/$$i.gz ; done
diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
index 65cafab9e..1fabe2e29 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://OFL.TXT;md5=f57e6cca943dbc6ef83dc14f1855bdcc"
 
 DEPENDS = "hostperl-runtime-native gzip-native bdftopcf-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+          file://use-no-name-option-for-gzip.patch \
+          "
 SRC_URI[md5sum] = "1b6acbd221957e33c8a792ebfaf3a659"
 SRC_URI[sha256sum] = "d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79"
 
-- 
2.25.1


