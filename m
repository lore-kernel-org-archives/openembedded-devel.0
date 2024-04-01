Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C72CD1298
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.39473.1711983094575666180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SaxPdaUx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983102; x=1743519102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=odJ5dKqVP54tgP/VFHJ6KrC5dQPiDn5zAovDvGnSEI0=;
  b=SaxPdaUx/lNk4rAnRtyo8xm2wWrhKfk++qFaQ/peIcVp647FLOWJMT9M
   kQu1ODGPguyub/lKG/znaHjerL+c5w70EyJ86tND7kpsUrw6eK9Nlr/5m
   ZQy+DSt7tD5kVP1BrS6dMEyl0TsGB4ZZGZzpcz8xSx/h1ubZEXRDed+1c
   clxstg7rGr6d5WZovWKXOI1Qm5OXgNrrR7iO6vmttEt+VOnoyP1gi870G
   NDpMpAybqOUTM/WxtX2H7SbKysGrtCiYsroBsX1Wr70s8fchhgtI5azrN
   TfOeqphkH0gtLFPXQrA2Pg/Ef/i1TQFpo/vukwGZltMG9wt8kJag1u5vF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="153710764"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="153710764"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 733C2D3EAC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B441AD5602
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D3C721EEEF
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B7B931A000A;
	Mon,  1 Apr 2024 22:51:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/47] python3-pdm: upgrade 2.12.4 -> 2.13.2
Date: Mon,  1 Apr 2024 22:50:58 +0800
Message-Id: <1711983079-16849-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-4.812800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xLGsuYyb68ajIdy
	9x5D78Kl4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPABR2u2t/epNmrUVi9dM2dIqppmrDrZKUVXxV/qL3DGn8fV0zaEFBBMjpelxOlp1gSJJaz
	O3NvHvn5/eAIZTomBOgvr8bHQdvA/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109742

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
https://pdm-project.org/latest/dev/changelog/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.12.4.bb => python3-pdm_2.13.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.12.4.bb => python3-pdm_2.13.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.12.4.bb b/meta-python/recipes-devtools/python/python3-pdm_2.13.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.12.4.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.13.2.bb
index ace3d38b0..387f14b0e 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.12.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.13.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "d04877362f95cf9ffc1d2c38b851f693706e4928840e48986ae576dad5741496"
+SRC_URI[sha256sum] = "e282bf1caf0a083fc0fb5e89ad6f79d7c579ff52c7bb58ee8587ea3d5bb9e14a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


