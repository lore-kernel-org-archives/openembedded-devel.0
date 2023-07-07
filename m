Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26606C001DF
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:07 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.4895.1688699639497557542
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="103044571"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="103044571"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:13:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 73B02C53C3
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:13:55 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A8BA5BCB6F
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:13:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C6F587E03;
	Fri,  7 Jul 2023 12:13:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gvfs: upgrade 1.50.4 -> 1.51.1
Date: Fri,  7 Jul 2023 11:13:27 +0800
Message-Id: <1688699627-2519-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--7.438000-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrgbNN0R684zO3L2aPW6sT0lYM
	JR3dIrh2KNTWdZLYnbSeGQd2dJpjimKztShDQzFujzeQxKnNxBz5UnqVnIHSz+TpBuL72LoP5zt
	F8OuvYTAkp+ZJWo+5wppTwVdhX5TUV2+1Nt1whFUkFrn8AyeCvdTEKbROYuuQ31GU/N5W5BCCDx
	bm2wVcgPu0HEWlaGvJ/7XTrlYjb7gv+0FNnM7lDRO7C3UVWhpn+KgiyLtJrSC8awBtjpu6dinRF
	REO9WNBsX24ahsS5PuAMuqetGVetnyef22ep6XYOwBXM346/+wZbx5fALS2rCsxrL4ZU+Q3m3B6
	ede+U32trqb0JOZhNOgY6VgBFcmO
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103688

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* trash: Run blocking methods on a thread to avoid hangs
* smbbrowse: Fix empty device listing after unrelated mount failure
* udisks: Fix missing unmount notifications
* trash: Fix nfs4 and cifs monitoring
* smb: Allow renaming a file to the same name with a different case
* mtp: Add support for incremental enumeration
* mtp: Emit delete event on device disconnection
* trash: Fix wrongly reported item-count
* Some other fixes and improvements
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.50.4.bb => gvfs_1.51.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.4.bb => gvfs_1.51.1.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.51.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.51.1.bb
index 31eea47bab..32d47efd16 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.51.1.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.sha256sum] = "ab9059a676a537edbea21388c2aafe1a7e2c8f1ac2dfdc6d64550233075457fd"
+SRC_URI[archive.sha256sum] = "5baaf0cc81e2c690a726f7d5eb59eed48a33ea220fd5378df93c556173a3c143"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.34.1


