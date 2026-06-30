Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BD3C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:19 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17221.1782811333475985752
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SjEbGQIH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811333; x=1814347333;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TddD3D7B/5lLBo0U88FobPuKDFrkpsi9waLUco8NuII=;
  b=SjEbGQIHOmsU4kJj9bReyE6HV1Lz4cizizVrRAWUwhkNf91+bnKyXI2j
   efvEBvltQp4LAuh8XKuVFohFO1b53t2Q+cBYIzYivnfg7YkvJPLjU1gDI
   7GkqwbviR72mTJXexhmsM5pAdOpfYRY0s36R1ZIq1xFHOjOvax00XJXGu
   /cA3v8MrdhifWniZEzb4NrC0KHyUWQ0eTAK7CUKI9YYeXXLNGmUBnKBAk
   E3dNV+WpqOgk4balx9/J26xneebQUXZKpJgNEoEDgDuT0fWpDbJrPp9eJ
   +Iqy5Qi1IkUQWDahXWCPaZW5xAZuS60p3U0zLIxsLs82+Djd1TnXASO6A
   g==;
X-CSE-ConnectionGUID: eJaLp7vUSMCLh46NPb3+Kw==
X-CSE-MsgGUID: odyspc4gSnGUj6UtTTLYdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245748177"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245748177"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 65DA21C1C739
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:11 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1CCF98412FA
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 281C4826FFD;
	Tue, 30 Jun 2026 09:22:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/37] 7zip: upgrade 26.01 -> 26.02
Date: Tue, 30 Jun 2026 17:21:29 +0800
Message-ID: <20260630092206.322-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127943

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.01.bb => 7zip_26.02.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.01.bb => 7zip_26.02.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.01.bb b/meta-oe/recipes-extended/7zip/7zip_26.02.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.01.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.02.bb
index 61be89c7ba..8037bfe039 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.01.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.02.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "8c63d71ff886bda90c86db28466287f977374237"
+SRCREV = "f9d78aff31a5f2521ae7ddbdc97c4a8855808959"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
-- 
2.43.0


