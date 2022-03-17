Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C41BC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 02:48:04 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.5937.1647485283173363942
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 19:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22H2lwUm001335
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 19:47:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 22H2lv15013858
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 19:47:58 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 16 Mar 2022 19:47:57 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 19:47:57 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 16 Mar 2022 19:47:56 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] graphviz: 2.44.1 -> 2.50.0
Date: Thu, 17 Mar 2022 10:47:54 +0800
Message-ID: <20220317024754.34012-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 02:48:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96030

From: Kai Kang <kai.kang@windriver.com>

Update graphviz from 2.44.1 to 2.50.0.

* update SRC_URI
* remove patches can not be applied
* mkdefs is not provided any longer, so remove installation for
  graphviz-native
* rrecommends on liberation-fonts that there will be tofos in outputed
  pictures without any font

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{graphviz_2.44.1.bb => graphviz_2.50.0.bb}  | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_2.44.1.bb => graphviz_2.50.0.bb} (86%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
similarity index 86%
rename from meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
index ff9939ebd..0eca7fdba 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
@@ -19,19 +19,17 @@ DEPENDS:append:class-nativesdk = " ${BPN}-native"
 
 inherit autotools-brokensep pkgconfig gettext
 
-SRC_URI = "https://www2.graphviz.org/Packages/stable/portable_source/${BP}.tar.gz \
-           file://0001-plugin-pango-Include-freetype-headers-explicitly.patch \
-"
+SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
+           "
 # Use native mkdefs
 SRC_URI:append:class-target = "\
-           file://0001-Use-native-mkdefs.patch \
            file://0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch \
 "
 SRC_URI:append:class-nativesdk = "\
-           file://0001-Use-native-mkdefs.patch \
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "8e1b34763254935243ccdb83c6ce108f531876d7a5dfd443f255e6418b8ea313"
+
+SRC_URI[sha256sum] = "6b16bf990df114195be669773a1dae975dbbffada45e1de2849ddeb5851bb9a8"
 
 PACKAGECONFIG ??= "librsvg"
 PACKAGECONFIG:class-nativesdk ??= ""
@@ -65,11 +63,6 @@ do_configure:prepend() {
     ./autogen.sh NOCONFIG || true
 }
 
-do_install:append:class-native() {
-    # install mkdefs for target build
-    install -m755 ${B}/lib/gvpr/mkdefs ${D}${bindir}
-}
-
 do_install:append:class-nativesdk() {
     # graphviz-setup.sh must be executed at SDK installation
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
@@ -98,6 +91,8 @@ RDEPENDS:${PN}-perl += "perl"
 RDEPENDS:${PN}-python += "python3"
 RDEPENDS:${PN}-demo += "python3 perl"
 
+RRECOMMENDS:${PN} = "liberation-fonts"
+
 INSANE_SKIP:${PN}-perl = "dev-so"
 INSANE_SKIP:${PN}-python = "dev-so"
 
-- 
2.17.1


