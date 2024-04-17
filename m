Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AFEC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2759.1713318098760736329
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ULcIkxDD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318098; x=1744854098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LCPQ0NcUwJlS+IBbwA8QKLoP2DZckdGPOIyNX0fcrSk=;
  b=ULcIkxDDglAGYzYZyVysMI03U4r16/l7hYtCRA5oV8esreMqTtneFAKI
   iZiXz58kzwsG50SN31VH5uB14x3oX5belrejHO82vZ2E+4OHLEjUBvHDV
   rvdx2ZismOKLUK8W4G2zi0fzW4oOHkx9ttJVkV9mpsgaXYKWiNqZ0ziDN
   rm3ncCMeH2uvTdswUPl8sw748Dtemp/x9DnKnHR5AuKWM/V0N26xs58/6
   grEiiuKnKqTV5A9Sxs3gtcQdCNflhJW+Vgv16At9DxezrUk1AZdTIQcU3
   vSn2IcBl6WIxIFtE6IJBwLIeGOLkl8btBJbFzd+70FTGkJpAttva4VQ2s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="134609861"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="134609861"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C5053D4800
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 06C081531E8
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9096922D91A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D0E91A0002;
	Wed, 17 Apr 2024 09:41:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/49] python3-path: upgrade 16.10.0 -> 16.14.0
Date: Wed, 17 Apr 2024 09:40:41 +0800
Message-Id: <1713318061-17128-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--0.853600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy/UKSk38cGDNSH
	nJDq2yhMo1xJ2rTehfd7nZmSglxg9u1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4mqNaL7KsYW4G3Jt29YAwfDdCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07aqzOOiUJy/IHGL7Ex2QGZCyrcg/u1BUQQrByDrP6Mme4Sb10SJNDdroDIBIC0ox+yxfa
	/OeelHygGIOFc+BsCE3mTPfk+r1wfUkLRnHLBI08gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110015

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Add .symlink_to and .hardlink_to.
-Add .cwd method and deprecated .getcwd.
-Create 'absolute' method and deprecate 'abspath'.
-In readlink, prefer the display path to the substitute path.
-Restore functionality in .isdir and .isfile.
-Added .is_dir and .is_file for parity with pathlib. Deprecates .isdir and .isfile.
-Inlined some types.
-Fix iterdir - it also accepts match.
-Add type annotation for iterdir.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-path_16.10.0.bb => python3-path_16.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-path_16.10.0.bb => python3-path_16.14.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.10.0.bb b/meta-python/recipes-devtools/python/python3-path_16.14.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-path_16.10.0.bb
rename to meta-python/recipes-devtools/python/python3-path_16.14.0.bb
index f95fce3b0..b4d290a23 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.14.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A module wrapper for os.path"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "b32b22b76fe810a8ded6d136268cc8b6698ae7c47c29b94a9ea12623f3051e46"
+SRC_URI[sha256sum] = "dbaaa7efd4602fd6ba8d82890dc7823d69e5de740a6e842d9919b0faaf2b6a8e"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.34.1


