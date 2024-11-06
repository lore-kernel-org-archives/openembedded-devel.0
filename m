Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C691AD29F92
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.40026.1730874675772138845
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nsSps07P;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874682; x=1762410682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4E3Zkv2fDyKGqOyX4syusoqmT+aCwMZ8k6AUc3tnnt0=;
  b=nsSps07PNNiReZkmE/uENy3Fdi6KbKgEnkqh4EYq31fu+gDfR6w66LKI
   349pprjPsYOmt9x/7W+IityJ0D/gx9aNJY+W1Y40qMbxtO0ZEIztlgtXL
   3dHENf0pjHBu+WdiaAjrnvsr2Srh27LGBkFU1G7wM0FDZMnZmeTKl006m
   VTgNXZZWmV5Y34RfguYDsgKGM5eU80C8F1OkLnwuIBKjsAnCX1lLmHY3J
   5wv3u+lYiGWfxy9Y2jol7wpoV9XxrkQBpajSp7E5cDKdUsFUn8To/IqKW
   zC8Z4IqmKOyPXFvh+mnQuesWckN8wOuO77QC2ugouFjlt+l7BipMjFBLK
   g==;
X-CSE-ConnectionGUID: zvhTZYCyQR+I8z4yzlXLlw==
X-CSE-MsgGUID: xnfnzKvARKix2CQQFBxjqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179274370"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179274370"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:20 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 14C1DD9223
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C89CD5B3F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD60D6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C35A1A000A;
	Wed,  6 Nov 2024 14:31:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/46] python3-cantools: upgrade 39.4.9 -> 39.4.11
Date: Wed,  6 Nov 2024 14:30:31 +0800
Message-Id: <1730874660-2364-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-1.988100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvQ7/SkjInfUXt9
	w3NN+CM84CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzyjwifoe7yGgEXI
	0Hh5GSkWoEeBh07iIrrkKB4baxh55+Ha3TT0HQMeNM4xJugILvhI8wkp7lxf/xLTA58+GfiATmc
	M7vLJj5iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113704

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Cleanup and fix mypy
- fix some typo
- ARXML parsing: scientific and hexadecimal numbers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_39.4.9.bb => python3-cantools_39.4.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.4.9.bb => python3-cantools_39.4.11.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.9.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.11.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_39.4.9.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.4.11.bb
index bf1b4867c..08047e4d5 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "5559da0a9b7a0f9e68eb8010b27615f7960be19656f4217374c76993c71f9167"
+SRC_URI[sha256sum] = "0b7bd88a236bb2ddfd7da5dd713058e97b749185e9d1257413b27bd4cfe7d82a"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.34.1


