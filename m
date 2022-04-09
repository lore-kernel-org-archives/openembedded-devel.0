Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB8FC636C8
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.4592.1649494442545399900
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 01:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2398rxd4024988
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 9 Apr 2022 01:54:00 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sat, 9 Apr 2022 01:53:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 9 Apr 2022 01:53:58 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sat, 9 Apr 2022 01:53:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-wxgtk4: Require DISTRO_FEATURES as gtk3
Date: Sat, 9 Apr 2022 16:54:39 +0800
Message-ID: <20220409085439.116819-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96495

It can't be built without gtk3:
No package 'gtk+-3.0' found

So make it have the same DISTRO_FEATURES as gtk3. It may also support gtk2, but
it depends on wxwidgets which doesn't support gtk2, so we don't have to
consider that.

And python3-wxgtk4 doesn't have PACKAGECONFIG, so remove the checking for
PACKAGECONFIG.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python3-wxgtk4/python3-wxgtk4_4.1.1.bb                | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
index dcb373a1f..cbe3aedd1 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
@@ -4,10 +4,6 @@ HOMEPAGE = "http://www.wxpython.org"
 LICENSE = "WXwindows"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce1d18e2d633d41786c0a8dfbc80917"
 
-inherit features_check
-
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'no_gui', '', 'x11', d)}"
-
 DEPENDS = "wxwidgets-native wxwidgets"
 
 PYPI_PACKAGE = "wxPython"
@@ -20,7 +16,9 @@ SRC_URI[sha256sum] = "00e5e3180ac7f2852f342ad341d57c44e7e4326de0b550b9a5c4a8361b
 
 S = "${WORKDIR}/wxPython-${PV}"
 
-inherit pypi setuptools3 pkgconfig
+inherit pypi setuptools3 pkgconfig features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 export WX_CONFIG = "'${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config --prefix=${STAGING_EXECPREFIXDIR}'"
 
-- 
2.17.1


