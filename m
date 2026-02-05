Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10D6EA7977
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:37 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14217.1770268530274946219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MSPPDLNA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268529; x=1801804529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+SQeIoyoe8hySPE3LTQk3GWt5IQk80kTrLf+tTK+RYE=;
  b=MSPPDLNAKrfjXQ1QlTQ5LXzXoc7dXAmqa7qtDrY5i4AOsfqBxqi8m8Qw
   UwNYUosNnlySiaMr99U3HEYuiZk0KuXVDymQBn2vvp17o22FnV/ssjQUR
   yCEFtbmifB3vs9mL2pjoS7w6vNZGjNVVQvDpmCV19gz60cAKxErU61KD0
   zmGCHdPXwBRIxu8IloGXu3nLR9+K0Qemfv0nDKYFvNxHM/QlncQ6xUJxg
   JfgpOyhcdLNDBJVJrQEVmiNDOTBJXxKL2+Ssiyi1as24k/xdUP1jqwZbv
   B0s5D1ixik0kw+bgajh+xUh9swMMsvMUW5YR1Zz5l3VaYMHFBgpuNDfxF
   A==;
X-CSE-ConnectionGUID: VkIxDD9GSsWUU+iC/InutA==
X-CSE-MsgGUID: XsEHzQM2TTq8nJnDU0pxfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228614881"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228614881"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:27 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id AE9E942A305
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:28 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 62231C02C46
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id C85ED20000CB;
	Thu,  5 Feb 2026 05:15:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 12/24] nbdkit: upgrade 1.47.1 -> 1.47.3
Date: Thu,  5 Feb 2026 13:14:22 +0800
Message-ID: <20260205051435.1366-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124164

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.47.1.bb => nbdkit_1.47.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.47.1.bb => nbdkit_1.47.3.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.1.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.3.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.47.1.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.47.3.bb
index 61390ebde6..e1da2d3288 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.1.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "1f9447313193723a626ba39e7b54d1c7c1a1ffd8"
+SRCREV = "49a3178b52509a8a8fd0e5a1c49846bba24e3eac"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


