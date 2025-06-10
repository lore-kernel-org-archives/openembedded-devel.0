Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E116C71150
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.77947.1749526420542438253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Heg9YnpI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526423; x=1781062423;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C4uw2GhVZgJ2ewA3SNDasTCqypQNSQLjSyroT3Qw8M0=;
  b=Heg9YnpIXgx5uHyKuo9yrFdaUxZl/lJ82UfkEVsbGq5BBTH4ec2tEJom
   kV4TdssseBYJgrvHOvNV0AxbTyGXh1rwTsuXt25uo8X8SF4PBdROnEQDc
   l/woXo7irsjMA6eDa092uV5oqeiPhRgm61u7DviX9djC6mqQxuG2hKcHH
   +SohhyDTocWMw6LX3WU6KJ1XDG8u26QdE1Ko1fJ+EeXyqrPQAaAEUnYqJ
   6eqpiTteu8N2h3o8fj+xIWByzI+Aj8Qbw7RTP/E1bSkRREAjOma+biDar
   GgBEbPriy4W8OMBE7CuaPPSCd+G7ID0Ip5n2QJoNZw1PcXpgBo+WPlEzG
   A==;
X-CSE-ConnectionGUID: loVoWFoFRPGwhuFhfJYHJQ==
X-CSE-MsgGUID: 8UB2bo2vRnGuoD/Exn3syA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202196162"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202196162"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:42 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A9C90E0ABE
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B3DDD7624
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:38 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C626C1A009A;
	Tue, 10 Jun 2025 11:33:37 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/64] icewm: upgrade 3.7.4 -> 3.7.5
Date: Tue, 10 Jun 2025 11:32:37 +0800
Message-ID: <20250610033330.924-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117802

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_3.7.4.bb => icewm_3.7.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.7.4.bb => icewm_3.7.5.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_3.7.4.bb b/meta-oe/recipes-extended/icewm/icewm_3.7.5.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_3.7.4.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.7.5.bb
index fa76f2e34e..cb792dad4b 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.7.4.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.7.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "e248e299616f417f5051423ea65a15668b71c1fdc9b5e477b47b1e80db3a7724"
+SRC_URI[sha256sum] = "7457ec08fa74a101b077f391d60f901a77919dcc83a2940992f1f88cd7ec840a"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


