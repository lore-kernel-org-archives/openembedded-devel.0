Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECADCCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17471.1777546261645951050
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kw86sxBJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546261; x=1809082261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nr9Vq+pycL3s1STB11Jv6PAHAnW+sVyiIf4CIRzfp7I=;
  b=kw86sxBJ0pgBd8T9PvujAsaG24wikF4tskWysxQYfRfh72eFhqiIe6ar
   e35GeyCvmnXwvswCBEqEF0oCp8+B4CKmeJVFOqnt50t0qV3waLkqdlLZx
   C6j+VnHeY5QnALcot62Qt0D+pJjXHTGiulyXxd3UleGuIzdYlnG3WymP9
   d6q/S+aaxDWthgYjjQyuTRxmDC4x7vTWBquOuqHRcqcrUEgn7vuBR0RxW
   WOHXq+8I+nX/wey4+K4t9UcIiap7ugEtSFusOw/Op1QYp1SQdnh/cwZv+
   JWDwikIAD+FxI4isCAJpq7cHdIEbehCZUB9AN8Koa6pcmG8ip64UP37TP
   w==;
X-CSE-ConnectionGUID: RzmActTmRPatgvbi0PNQ3w==
X-CSE-MsgGUID: B0BreDMURU26uC8UJyLqRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="243116273"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="243116273"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:51:00 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 41FA81C00093
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:00 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E5754C00D59
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6D8CE180113C;
	Thu, 30 Apr 2026 10:50:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 57/64] spectre-meltdown-checker: upgrade 26.26.0404682 -> 26.33.0420460
Date: Thu, 30 Apr 2026 18:49:16 +0800
Message-ID: <20260430104924.1106-57-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126727

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ....26.0404682.bb => spectre-meltdown-checker_26.33.0420460.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/spectre-meltdown-checker/{spectre-meltdown-checker_26.26.0404682.bb => spectre-meltdown-checker_26.33.0420460.bb} (95%)

diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.26.0404682.bb b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.33.0420460.bb
similarity index 95%
rename from meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.26.0404682.bb
rename to meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.33.0420460.bb
index 454e702e66..a86869e752 100644
--- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.26.0404682.bb
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.33.0420460.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://spectre-meltdown-checker.sh;beginline=2;endline=2;md5=3ae5399e70af7be9b93f72568069e2f4"
 
 SRC_URI = "git://github.com/speed47/spectre-meltdown-checker;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "8a6f9d5d638c601d2a875669015a6cb217e40f49"
+SRCREV = "1c067add59115190e8d87313ff5899b29bff0ff3"
 
 # binutils: readelf,objdump might be used for deeper analysis
 # coreutils: dd with iflag=skip_bytes oflag=seek_bytes in some cases
-- 
2.43.0


