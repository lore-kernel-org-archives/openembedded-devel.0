Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D04ECCFA07
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:54:55 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2312.1693965289942901993
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130902228"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130902228"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:54:48 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04470C68E2
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:54:45 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CC02CFBC8
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:54:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B3808653F;
	Wed,  6 Sep 2023 10:54:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libgphoto2: upgrade 2.5.30 -> 2.5.31
Date: Wed,  6 Sep 2023 09:54:32 +0800
Message-Id: <1693965272-14029-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10-1.662400-10.000000
X-TMASE-MatchedRID: +ZFRJsd3dVej375FgQ+73n1zro62qhdCpxAd6mi1Ga2nw6VQ+/MY/SFy
	PmxUh2nDat9+/v4VESUu+F+B9CDczs4Cn0fUiJuCCtzGvPCy/m5NltUb/0XhASt+gViu+UDkOcY
	/jkDGKiILy4U5+Bt2OaZjq58Vyh0JLygTU2ChvqW1ely0q8aUoayjyePKj1olty9mj1urE9K/iI
	ZoI+jcVqDaQPNKX0/KjXqykC2KceAS5iXdhf8hbj9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frluIhU1mamEFmvLxMb03vub9PKZUMHzJkSUngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSqb
	xBgG0w4shm9fo87dU/k4HE25531oqhPvlicD/9U57INwuxOtezW2PjbVBwmo+5ftHJHrNMh9jpI
	VWxf3v48epbndaIgBk+JEMWdtyYaCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104737

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
pentax:
* added Pentax KP id

ptp2:
* do better event queueing during capture (makes capture faster, avoids losing events)
* Canon EOS: OLC logic rewritten to be table driven, more debugging of the content,
  config "testolc" to generate debugoutput. Supports more cameras better.
* Canon EOS: various bugfixes
* Sony Alpha: Added config options: focusarea, liveviewsettingeffect
* Olympus: Enabled OM-1 capture
* Battery Level: also support ENUM style battery reporting for Canon
* Nikon 1: S1 also does not support everything
* Sony Alpha: small changes in config setters
* merged some improvements from NorthOfYou fork for Canon EOS, Nikon and Sony
* New ids:
  - Canon EOS 850D, R7, R10, R5 C, R6m2
  - Fuji X-H2, X-T5
  - GOPRO HERO 11 BLACK, 11 BLACK mini
  - new ids also imported from libmtp
  - Nikon Z30, Z8
  - OMSYSTEM OM-1
  - Pentax KP (PTP mode)
  - Ricoh GR IIIx
  - Sigma fp L
  - Sony A7S III, ILCE-1, ILME-FX3, 7RM5 aka A7-RV,

digigr8:
* fixed init to not switch to webcam mode

pentax:
* Added Pentax KP

general:
* disable log formatting when we are not logging (speeds up large downloads, as
  we are not hex dumping the whole data and immediately discard the result)
* libltdl usage now thread-safe. (some other library pieces are not threadsafe yet)
* some time_t 32bit vs 64bit fixes
* some cleanups and warning fixes

translations:
* updated swedish, spanish
* added georgian, friulian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gphoto2/{libgphoto2_2.5.30.bb => libgphoto2_2.5.31.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.30.bb => libgphoto2_2.5.31.bb} (95%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.30.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
similarity index 95%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.30.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
index b1fb7579ee..cc42b6a9c6 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.30.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
 "
-SRC_URI[libgphoto2.sha256sum] = "ee61a1dac6ad5cf711d114e06b90a6d431961a6e7ec59f4b757a7cd77b1c0fb4"
+SRC_URI[libgphoto2.sha256sum] = "4f81c34c0b812bee67afd5f144940fbcbe01a2055586a6a1fa2d0626024a545b"
 
 inherit autotools pkgconfig gettext lib_package
 
-- 
2.34.1


