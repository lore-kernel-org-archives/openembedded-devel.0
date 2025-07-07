Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C30C83F19
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.56131.1751879232558217974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mMZvr3sM;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879232; x=1783415232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/SqqUwQZan/XPa1L+p5MuDGDwPSZa6nVUNbrzvkrGwI=;
  b=mMZvr3sMyd1Hmmb/GKAwzKi42dm3NFGsal3LD6Rjp/u/fkGvnZeCe89r
   W6rK10sgoBbtn4GH8X/9GbW+gPIIDtXIa4tK1KqbqS7KtphdpVEK/diHH
   4ptM1o/8ZO42B+rP7Egkx8wZPGDkdu76NrYHjqiQekLrsDfE9hbtyEZNr
   WGD/KN5Bdrbk3s1WlBYvIgclrAmr7iNdbd2jen9UKIHZoUX/PPKMpUttb
   eEYZGIEb5XnGLcxxKceSFRxAif8C/kZT7QNZ/eri3SsjHVYxQ8Obgx3WE
   XMG2A0ZBbdpaN4BETWoA2/EwCwcQcqrLSOE6DUiobqBdq55kQy+vd+IS4
   Q==;
X-CSE-ConnectionGUID: vtek2h16SP21ULBpmfqeWw==
X-CSE-MsgGUID: rQ9mAQPwS8C770CyfUV97g==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="184424231"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="184424231"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:11 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id ECDBC1851
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:10 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id 6DA881000107
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD139BF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:08 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F15631A000B;
	Mon,  7 Jul 2025 17:07:07 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/35] icewm: upgrade 3.7.5 -> 3.8.0
Date: Mon,  7 Jul 2025 17:06:27 +0800
Message-ID: <20250707090656.1216-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118252

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_3.7.5.bb => icewm_3.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.7.5.bb => icewm_3.8.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_3.7.5.bb b/meta-oe/recipes-extended/icewm/icewm_3.8.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_3.7.5.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.8.0.bb
index cb792dad4b..1ce1114dfa 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.7.5.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.8.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "7457ec08fa74a101b077f391d60f901a77919dcc83a2940992f1f88cd7ec840a"
+SRC_URI[sha256sum] = "525df5fc9d328bd3ead25f2e262d2a15bdfa8fe7828d98f111a064dd169ac18f"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


