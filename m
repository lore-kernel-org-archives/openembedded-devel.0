Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200EA103E309
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:36 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18738.1773312750110677663
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=af+TaQBq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312753; x=1804848753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hNbLx0JpCCfLhwziNY8MlUsr9G9Bg2KKaUbAYVWw7oM=;
  b=af+TaQBqupGF0uVEpV8N8UF6Z4FdcL65jvzom9SZUwXC6B2hdEEV4qzI
   HOOAXDpOVYuQ99eA6iFZIgck2bvDtXwVTFDNevxV9OEIaE/M5K2/DC/Pe
   txurpsJKk2+fQuKMVlGnOHawQc/BkYhV9vZD3KxqDRjFdPI+xEuXBANKg
   Jte1i4LYD6Q7tpoVTEt9Ye2RIn/EDm5lUgMgSxsEbns4kxcAlvXsEWH+U
   ABNF70QnrFbw+fqJjulKH2oAKWkIy1/unlBQcmQp85mTuc1o42CG9+Frf
   UPxcJ5qVeGE5AfpxscGmkGFhXW9MkkOlsFmjDRa4nUDnTmT5Neoo+DBVW
   g==;
X-CSE-ConnectionGUID: ywuBFJrUQxiT4G/b81Un6A==
X-CSE-MsgGUID: DFxa7lABRuCndczBc7eT9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="233687958"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="233687958"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:32 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B9A7EC036B5
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:32 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6E3181809C28
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7ADE918029A5;
	Thu, 12 Mar 2026 10:52:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/64] driverctl: upgrade 0.115 -> 0.121
Date: Thu, 12 Mar 2026 18:51:19 +0800
Message-ID: <20260312105220.1856-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125103

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../driverctl/{driverctl_0.115.bb => driverctl_0.121.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/driverctl/{driverctl_0.115.bb => driverctl_0.121.bb} (86%)

diff --git a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb b/meta-oe/recipes-support/driverctl/driverctl_0.121.bb
similarity index 86%
rename from meta-oe/recipes-support/driverctl/driverctl_0.115.bb
rename to meta-oe/recipes-support/driverctl/driverctl_0.121.bb
index 578a2b8d3b..026e9f2897 100644
--- a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
+++ b/meta-oe/recipes-support/driverctl/driverctl_0.121.bb
@@ -7,8 +7,8 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 DEPENDS = "systemd"
 RDEPENDS:${PN} += "bash bash-completion"
 
-SRC_URI = "git://gitlab.com/driverctl/driverctl.git;branch=master;protocol=https"
-SRCREV = "2ba60536eb20ca0a6a751bd8b6501dba84ec45d3"
+SRC_URI = "git://gitlab.com/driverctl/driverctl.git;branch=master;protocol=https;tag=${PV}"
+SRCREV = "0a72c5b1091d87e839ff083f686477f9eff5fb97"
 
 
 inherit pkgconfig systemd features_check
-- 
2.43.0


