Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673E1EFD22D
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42050.1772012299201559288
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bQ5D8lGw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012302; x=1803548302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=olLi/G6/U/K96V4Ti7QrsmznHwQN19WZiCUt/BbMGFc=;
  b=bQ5D8lGwyJAGbGeWpMK5ozb3Ml8OpJoi7XZdp5Z62F39dOIVPfVioQez
   FIv7uAFEOhsoaWQeiUb+jCFtIrt8SAhr/8HWuf1y4OVSfjJghoRBDXoj9
   UO6qqwuzJNdhRbz6SVrI2Kbd+Lk1l+nTkU9GIobIAldme9MA9lCVR0eIQ
   wjZt3Dy9Lseuu6EhO85zUyI2esT50wgM8Mzo9QTtOcTwJ0wg+KHVOcvUc
   IQT0aVrtFmziXNTVmdlolto2AQfNNDFi+vccLvH5BlGQw0gNgtSdJ+lXi
   2KyIBYMiiXxOgKBFY5JVV62MP9JZKDPJ/WB2Xf8pTH/USRH5D1WaWltBK
   Q==;
X-CSE-ConnectionGUID: u+tal5l7QByGQEYmE8HZNQ==
X-CSE-MsgGUID: bTnGxBPcR6mv/yOzrMbwxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="230948682"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="230948682"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 1DB35ADBA
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:22 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id BBCCB140060C
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id D3E5E101BB6B;
	Wed, 25 Feb 2026 09:38:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/33] mstpd: upgrade 0.1.0 -> 0.1.1
Date: Wed, 25 Feb 2026 17:37:17 +0800
Message-ID: <20260225093727.1284-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124635

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- mstpctl: add showportparams cmd
- bridge-stp.in: use short-hand arguments for logger command
- bridge-stp.in: support different versions of pidof
- mstpctl-utils-functions.sh: fix shellcheck warnings
- Update bridge_track.c
- netif_utils: fix speeds > 65G
- ifupdown.sh.in: fix new shellcheck warnings
- libnetlink: fix socket file descriptor leak on error paths
- fix compilation for with GCC 15 / C23
- do not leak stack memory via struct holes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../networking/{mstpd_git.bb => mstpd_0.1.1.bb}             | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/networking/{mstpd_git.bb => mstpd_0.1.1.bb} (85%)

diff --git a/meta-oe/recipes-extended/networking/mstpd_git.bb b/meta-oe/recipes-extended/networking/mstpd_0.1.1.bb
similarity index 85%
rename from meta-oe/recipes-extended/networking/mstpd_git.bb
rename to meta-oe/recipes-extended/networking/mstpd_0.1.1.bb
index b003b52d25..3ac4d5b1fe 100644
--- a/meta-oe/recipes-extended/networking/mstpd_git.bb
+++ b/meta-oe/recipes-extended/networking/mstpd_0.1.1.bb
@@ -1,14 +1,12 @@
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4"
 
-PV = "0.1.0+git"
-
 SRC_URI = " \
-    git://github.com/mstpd/mstpd;branch=master;protocol=https \
+    git://github.com/mstpd/mstpd;branch=master;protocol=https;tag=${PV} \
     file://bridge-stp \
     file://mstpd.service \
 "
-SRCREV = "181c453fc1a00573e19f14960dcc54ad84beea7c"
+SRCREV = "d7dd987b101f277bfef8ac71de7c1d962a424e8e"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+){2,})"
 
-- 
2.43.0


