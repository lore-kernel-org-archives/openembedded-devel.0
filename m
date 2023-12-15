Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAACBC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 03:56:24 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.52903.1702612581937105309
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 19:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="143479299"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="143479299"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 12:56:19 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 69660E8D29
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:56:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 86BE8D8AF5
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:56:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4A91E51BA;
	Fri, 15 Dec 2023 12:56:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gjs: upgrade 1.78.0 -> 1.78.1
Date: Fri, 15 Dec 2023 11:55:50 +0800
Message-Id: <1702612550-3378-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28058.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28058.004
X-TMASE-Result: 10--4.610400-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxdTgH6um3orjol
	6Yfi0eMdhJtbBPDn7JtwE0Mkl9ZaE/7cb+WoSIGS/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwU
	evDt+uW5/XjpbSJS7a9acKv4Eu3PwyGOiXr1rOL585pjA/x1xfukphWnlDPb3NBBNXB5b9My7FY
	/sCUPw0/x9cvDC2IuW6EBlBcRddm7lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07aLm7
	9W+wVodeP1sHTnvW10W0dB2mCuBeoBpsDWnXYBlbQy4WmI5HAqErGlLu4m1VoIhMwzjNPbNgOZm
	ImxXozt66kT4kWrt3Vubg5E9shNo8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 03:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107484

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Gtk template signals cause a reference cycle that is not detected
* Modules from resources may get loaded twice
* docs: add examples for creating cairo image surfaces
* Deadlocks between GJS GC and dconf gsettings when a setting value is changed
* Gtk3: Fix leak in GtkBuilder template signal connections

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.78.0.bb => gjs_1.78.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.78.0.bb => gjs_1.78.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.78.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.78.1.bb
index 67efdabd7..34eef1403 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "mozjs-115 cairo"
 
 inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "fbaa20e0917668830800f92951688f9fc08f01296affd5cdb4b35f750be27dc9"
+SRC_URI[archive.sha256sum] = "7e90511c429127c39eac0068c4ac9a353df7e6fbbc646f5f18e8962882c18641"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.34.1


