Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0CCFA0C3C
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 07:19:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13395.1776237550201889868
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 00:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dWsxITai;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776237550; x=1807773550;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+yw4ApPYjIajH70p50fO4HHO3+3YQze+EeK77CBO+jw=;
  b=dWsxITaiwPz0lhF081OoPMN1yJidJlINkD6ksWwXLXoFCVKC5MlLE3zW
   sb0rDi0ZywSSgEQlr6yt8EvcdFIX4rEnHU6JnLpz64ZeXvZ8At9oN/awN
   pJNHR7qtfQ9RTahCuZTuiXJMqGKctA2lgJcn0ja5orzgEDI0GUigakhrs
   8nTYN1Ww+uc7FTXTMiTaLWGQgzNdKm0E9Wll1jGR8WMj6sl2i4dhiYChG
   KhDNYqyOhYE2tFtO1jCIecStwZm7SsQNIoa/UhE0GHcqpvb9XjI+26IM3
   Z69JU4dVRTrDKQ4vKpojBJ6FcinHwCML5jwGgVFx+1r65nGtDAYTYpazh
   A==;
X-CSE-ConnectionGUID: vPDsNiClQxOQ3eeEbHuAiQ==
X-CSE-MsgGUID: PmRqpYoMRJu5BPknIG7xAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="224502234"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="224502234"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 16:19:08 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8E4651000374
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:08 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 420A01000457
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:08 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0AC3D1800B1C
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:05 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] iperf3: upgrade 3.20 -> 3.21
Date: Wed, 15 Apr 2026 15:18:57 +0800
Message-ID: <20260415071900.6767-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
References: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126347

1.ChangeLog:
  https://github.com/esnet/iperf/releases/tag/3.21

2.LIC_FILES_CHKSUM Changed as Copyright Year change from 2025 to 2026.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../iperf3/{iperf3_3.20.bb => iperf3_3.21.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.20.bb => iperf3_3.21.bb} (87%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.20.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.21.bb
similarity index 87%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.20.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.21.bb
index 7d4d6beeb8..de266551ae 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.20.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.21.bb
@@ -10,14 +10,14 @@ SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b51332d7f45357a9410daa9a14a3655f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f2eb355b6d3b9d63b6b7a861cdc62440"
 
-SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https;tag=${PV} \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
           "
 
-SRCREV = "0711330bacfaf1c2a804be66e7ecc26f481ede5d"
+SRCREV = "d39cf41526626b4e5a130f115d931cd6cbdffc19"
 
 RDEPENDS:${PN} = "libgcc"
 
-- 
2.43.0


