Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7852ACCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:46 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12748.1762847738628936294
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Cd0Em4LL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847739; x=1794383739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OLVvPkvzP+ZK3T4ld20BdzIcUYtuutqWJJ3+FRouyxY=;
  b=Cd0Em4LLJkNcm8Uyo4R5t6U33JbRKN207EOBFX1USv6fEDT7/l0Qk/hV
   GF6qNkfCqdtZiWu2VoCvEzXZPFTlg4ACwTV5Nj+zNjB5p4+F08sLPIrui
   WL+AIK12Fz8OmqZma7gQcyMjRXo03jmzja82kmRyVmth1s40XJjxkKRe0
   Cgxlj1ooj8cwQluG/xdDQt5g3bt8mGYNZa06YHqy/auN5SUCvrkus/+tR
   4HpRp2+iHNRfrancv3NAW5v95HBJWH46GHVPbS8WvndovmVAUp/Xc6J5r
   T9S4yquywFo3xV6un5Aox+Rjg0S11mnAUEm4sJCqagJVncP7iYBlRPDFY
   g==;
X-CSE-ConnectionGUID: F80KdLaPQi+osHuDs7Gtlg==
X-CSE-MsgGUID: 5FG0negZRkK8zAR9GkEvZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="218806834"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="218806834"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:37 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 1A8641C1C707
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:37 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C03B58D207E
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 343B31800D76;
	Tue, 11 Nov 2025 07:55:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 07/23] libdaq: upgrade 3.0.21 -> 3.0.22
Date: Tue, 11 Nov 2025 15:55:01 +0800
Message-ID: <20251111075517.1650-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121486

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 api: add drop reason in daq flow stats

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../daq/{libdaq_3.0.21.bb => libdaq_3.0.22.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.21.bb => libdaq_3.0.22.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.21.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.22.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.21.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.22.bb
index bd4ea4b8dc..e6bdd0f5a9 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.22.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "e48649648790e4e2ead7fe4ae1017f911b1cc177"
+SRCREV = "2d7241c1606e1a1b170f934bea58801f2109c8c7"
 
 
 FILES:${PN} += "${libdir}/daq/*.so"
-- 
2.43.0


