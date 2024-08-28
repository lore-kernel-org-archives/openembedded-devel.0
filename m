Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9ADC54752
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8728.1724833552292739088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pW01QYra;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833553; x=1756369553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Bee8k0szZHuqjfD3YAzs388V9VrEt6OVVA1r0ydHNEY=;
  b=pW01QYra3YLYdTh52sPpfb0abvA+iYcB+4DQPNIAVfnSSYTO8SFKiKYN
   GgweGxuJ5xQjanC4nsFS4FsqOoIIiO2ol/o9HmihjVYnP47JNlArUGMH5
   zwmmMKH1WJZbRknfmrVhQOsrEfmAl15zPaKcwsMoDitSCYalQDtSjfx6S
   1feCMW9K02gKT6EuelGoU2jHIDBZn60K4FPraXYtkFbHQayb0stPt85pc
   FLYA0cDEraPDle1RrzZWpNAye5OUUyrcC8S3fd2cvqXPNBTrwGRsCCtbn
   Frs4R9VvLl1OTEkVHSd+4f4rz6rKU/aGBdp2S1GHaafOI1263HAC3cd6n
   A==;
X-CSE-ConnectionGUID: rD74ARxNRdKDs7SJTfy49Q==
X-CSE-MsgGUID: 5HuZaCJjSS2wL9W0UkwJFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171866146"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171866146"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AB47D2AC1
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A8188BF4A3
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 366EB2007B700
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D712E1A0002;
	Wed, 28 Aug 2024 16:25:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/46] python3-marshmallow: upgrade 3.21.3 -> 3.22.0
Date: Wed, 28 Aug 2024 16:25:05 +0800
Message-Id: <1724833525-2162-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-0.425400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwOkJQR4QWbsIkw
	FLBp6Bq1PrwjldIlnJcBznKRCq1E2QHWJZSZo7LXA9lly13c/gHVy4hHC3/gyCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0JC+
	VZi2gQEfHIptVPfAhb6jQ4aVYNwB5Inv1jxhzyVM8usG6W/bc5Up82kzTPmJTJsoLoig8iogQBA
	3yP4ejankUCAc4QJUdWEI17A1Iui/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112005

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add many Meta option to Schema so it expects a collection by default
- Refactor hooks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-marshmallow_3.21.3.bb => python3-marshmallow_3.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.21.3.bb => python3-marshmallow_3.22.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.21.3.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.22.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.21.3.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.22.0.bb
index 9c29c810d..269522dce 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.21.3.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.22.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "4f57c5e050a54d66361e826f94fba213eb10b67b2fdb02c3e0343ce207ba1662"
+SRC_URI[sha256sum] = "4972f529104a220bb8637d595aa4c9762afbe7f7a77d82dc58c1615d70c5823e"
 
 inherit python_flit_core pypi ptest
 
-- 
2.34.1


