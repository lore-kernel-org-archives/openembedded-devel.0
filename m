Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50B0C3ABA7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.35429.1745311775803059543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fTkOXm2d;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311777; x=1776847777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7n1D+0hh4b7aXZfqhE/0IPgNrLyK3qJoEH6G7kbKc6Q=;
  b=fTkOXm2dOQqFHcqFS2hdjFpguvF3Z5M6HU8FYB2Dtr2Qij+TkUYjV5k+
   TOdoex7oUlo0Nr84gUgC9Deqit4QeVtCO4eV7u+VZaVZfSelHsSXe8gKD
   0PU0daY0xbNfiEZukBe3WHuVsoRc5SWZcn7BY2QR4JrDuj6eP3vWNvdTI
   BwCQs7fVF/WZ0sMpBQhf4H8kUIrthW4/EOH6GZRsFvr1DSPGWfjFMjHZT
   DdVIhYYHjkva58COQY/bsKJzSuhczJcAt2B54pX93s646s/G4u3OytV11
   vj6ne4aXF/7bOabAGlgDkylNtGw/ZRipfOrmMlnOT68RlC4/nEIXZHxOV
   Q==;
X-CSE-ConnectionGUID: Vb2wxB2+RU2X+QAb1W4HNw==
X-CSE-MsgGUID: zOEzkn3DTDO5twlE55xf5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197342736"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197342736"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:34 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C1BEE0776
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 389D5D3F34
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC03D1A009B;
	Tue, 22 Apr 2025 16:49:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/30] python3-drgn: upgrade 0.0.30 -> 0.0.31
Date: Tue, 22 Apr 2025 16:49:05 +0800
Message-Id: <1745311761-1912-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117032

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drgn/{python3-drgn_0.0.30.bb => python3-drgn_0.0.31.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/drgn/{python3-drgn_0.0.30.bb => python3-drgn_0.0.31.bb} (96%)

diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
similarity index 96%
rename from meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb
rename to meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
index 39dcb28146..035ccd58a7 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.30.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/osandov/drgn"
 LICENSE = " LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c83d30e99508d6b790eacdd3abab846"
 
-SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main"
-SRCREV = "92023c5b5d5a1c7e1556e945b098148f0b46e608"
+SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "8209a147fb61deed38ca376d063bbff0343ca234"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


