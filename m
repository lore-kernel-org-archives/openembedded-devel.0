Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03A9103E314
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18517.1773312779900226109
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d2kh+aAN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312778; x=1804848778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zfDtXgLAeuGbcMlfzGu1AnfbcVDFVMDtDxVNPeE94TU=;
  b=d2kh+aAN9kDuXoGVt6fbD3/v5/G9KevQUpEJ/9fDW0Dzm9mJufzcyvrN
   ricuDfRlDNrXPpaForZdD46MJYLkCKl06OML5Kk9XsAv3PYnzlY2rQeby
   C7rn8X2w7Vh6/s/1hZiqEVqSsENkFKeB3/uoYzNxJTdgnVy+uDxWusgIi
   hIbPw6ifh8jhjfXrGop4e0A7A9VhX7MI/rVjHu6Q1aZMYN3YbSKNn5oRF
   mTCE3ChsAa/mSfddRw7TnNjlcvu04nQuVyxMlTt3C6a5SU6ypOPFKjYdl
   JU6nRYeT0u7ETY6t4nGDHfBRx2kTB+YWoRIwP7HUrVIKjc2SgWY76ubUq
   g==;
X-CSE-ConnectionGUID: 2ICMQxd5TMONpKKNZDM2SQ==
X-CSE-MsgGUID: VeVCF+UxTDGTDgSmE3aupQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220950458"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220950458"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:56 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7047F1C000B7
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:58 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1A0301C10085
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2ED6C18005B4;
	Thu, 12 Mar 2026 10:52:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 15/64] libdaq: upgrade 3.0.23 -> 3.0.25
Date: Thu, 12 Mar 2026 18:51:31 +0800
Message-ID: <20260312105220.1856-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125115

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  api: update dioctl daqSnort latency common changes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../daq/{libdaq_3.0.23.bb => libdaq_3.0.25.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.23.bb => libdaq_3.0.25.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.23.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.25.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.23.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.25.bb
index 8e1d707174..b999f385a6 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.23.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.25.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "f14981a2f83a57c86d125ad926b9c7788737f52d"
+SRCREV = "7baba902b3fee7a81be663bfb71418402411c24a"
 
 
 FILES:${PN} += "${libdir}/daq/*.so"
-- 
2.43.0


