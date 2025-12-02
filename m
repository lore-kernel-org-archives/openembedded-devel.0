Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B601D11700
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:51:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4463.1764669102817664285
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GkIYaF14;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669104; x=1796205104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1jpGP7JDTajTEzEXTfQP+4n2e0tHWyygp9DH8SZKs9k=;
  b=GkIYaF14AlwKppFa7nx+20wWiiZ/vyQFgwJwpeSA3mRhFxSflZtRPssz
   fVIREneK0cJDqn600giuzSchXXsqqHeOFcb2WA+X9PCmfkNbeoVawhYRG
   EHux2WIFDG7mZcGS5k9SkTfZnGeZHmaO1nxgz0AM5AMbVd0gJ/F2bhC/w
   E4dq406hdYAzY20mks8igCt6cdTI4tixdn4wgVMyW+y5v47lKXEr6Lfho
   kttyltr0p3mRzbEuXi2iRjG6kfoR/9M7CSrZcAzhhCEX3s0UdISk/Tw8E
   2qWDkdfVvhdC6SL/YdgQXgqW49bCapG2eNCn5QBR47Zvaicsnph2Xp5G9
   w==;
X-CSE-ConnectionGUID: KFg8l4gkQ2yzNTtgcv08vA==
X-CSE-MsgGUID: +c9dgInnQ1GDffuVfegyFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200140645"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200140645"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:51:43 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5213342A31F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:43 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0B70CC01286
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 95E8A101A430;
	Tue,  2 Dec 2025 09:51:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 03/25] libdaq: upgrade 3.0.22 -> 3.0.23
Date: Tue,  2 Dec 2025 17:51:10 +0800
Message-ID: <20251202095132.652-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122236

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 api: add tcp flag in DAQ flow stats

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../daq/{libdaq_3.0.22.bb => libdaq_3.0.23.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.22.bb => libdaq_3.0.23.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.22.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.23.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.22.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.23.bb
index e6bdd0f5a9..8e1d707174 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.22.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.23.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "2d7241c1606e1a1b170f934bea58801f2109c8c7"
+SRCREV = "f14981a2f83a57c86d125ad926b9c7788737f52d"
 
 
 FILES:${PN} += "${libdir}/daq/*.so"
-- 
2.43.0


