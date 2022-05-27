Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18991C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 02:45:46 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.3225.1653619535835040256
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 19:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24R2jX3F024923
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 19:45:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24R2jOMr000785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 19:45:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 26 May 2022 19:45:24 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 26 May 2022 19:45:23 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH] libportal: add distro features check
Date: Fri, 27 May 2022 10:45:21 +0800
Message-ID: <20220527024521.15591-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 02:45:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97304

From: Kai Kang <kai.kang@windriver.com>

Add distro features check for libportal because it depends on gtk+3
which requires one of ${GTK3DISTROFEATURES}.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-gnome/recipes-gnome/libportal/libportal_0.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb b/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb
index ec728d78b..9784f0481 100644
--- a/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb
+++ b/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb
@@ -10,7 +10,9 @@ SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
 SRCREV = "13df0b887a7eb7b0f9b14069561a41f62e813155"
 S = "${WORKDIR}/git"
 
-inherit meson gtk-doc gobject-introspection
+inherit meson gtk-doc gobject-introspection features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
 
-- 
2.17.1


