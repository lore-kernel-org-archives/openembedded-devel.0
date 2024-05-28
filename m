Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE95C41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:59 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.12883.1716861045012542126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V14+Qnl3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861049; x=1748397049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DnGzssTQJhUNicLcaWISA9y9ofG3vsRymDxgH9CUBqg=;
  b=V14+Qnl3zEpqBI7wlFazTmIuuRikWSo97eDc3tei4nO/iXIVSZVj/2nu
   xv1D9FifndCU3O3gaPmrHydxov+6ZL2u25RM6yl10dYXi7EHStLIj6F8u
   HunhgZ81FuaF4cm0XstDiOPqpcD0R2I/WVQWSjlPQENm0FNSkPLXi4QkQ
   W72xndR1ISNLBM1+DtVhHk6WEd2VlfXh4CvaiT7wE8r/1l8o7StB1qamD
   GKCixjZGWsaRpLpNkqHEuVZWZLzVCs5KttG2Wo+jHKXNwJ0Ydpx2uaCRG
   g4NS8PLXC7YpMGptRNOgMMRQBPmJGhwGyd5ltOVugLlC1HZZM1KitqhgA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="159728630"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="159728630"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:48 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E5BE8DB3AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 31A19CFA59
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 918572008FF88
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3FCC21A000A;
	Tue, 28 May 2024 09:50:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/40] python3-virtualenv: upgrade 20.26.1 -> 20.26.2
Date: Tue, 28 May 2024 09:48:14 +0800
Message-Id: <1716860901-863-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-2.183700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9fzNEMTfB0V2w8a
	TIJcWnGP4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2mZ3
	96Gt5HhTlIxyQXnBFZyhv4mp4f32dna1YRf8hA1sQFzqkdO9XuKNrXycySKw0fscNZGz5/y7CdH
	gczZquDcoQTQp4A9J50OoKcl+vm0vIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110566

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- virtualenv.pyz no longer fails when zipapp path contains a symlink
- Fix bad return code from activate.sh if hashing is disabled

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.26.1.bb => python3-virtualenv_20.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.26.1.bb => python3-virtualenv_20.26.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.26.1.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.26.2.bb
index ceb5f30ab..c7c7d4898 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "604bfdceaeece392802e6ae48e69cec49168b9c5f4a44e483963f9242eb0e78b"
+SRC_URI[sha256sum] = "82bf0f4eebbb78d36ddaee0283d43fe5736b53880b8a8cdcd37390a07ac3741c"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


