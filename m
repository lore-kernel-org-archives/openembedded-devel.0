Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8081ECD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:22 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76252.1781001017125201583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jfimKSp1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001020; x=1812537020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BXBXvriGhVvnWb0FrDX8gQgkistVGSll0MGD6d4TQh0=;
  b=jfimKSp1fVsCReK/td4PkoO7CdbIdN12Ww59vTGUBYphEHjdtOgu2q5O
   wFsPpzvzD7lLrv2et/c4Ft8CcEPITosqR02q/hmO80eQzk5co/1rxGfPa
   iHVkM5c7CUcQikFe5JA6b8z2mrmu1UdnOeKBHvhZlkqXOt7jtITXS18Tp
   DfB0xNf7MdZdYcGhcM95lstwk4/QA6Nhswj29ieZHTyVsepi0b5pXf+RU
   EghwD4C2tnzNNjBy7iJBwL+87qYA23uyapEQ06EO9WhvrF0NzVrHHwjJU
   c65VA4NMf8kwBJJbGSTnfVXbIF2c1KAwwEdxZqs55zG4S4aJi3KARF4cQ
   w==;
X-CSE-ConnectionGUID: Ylh+ovtJTZysmFJbTuGpBQ==
X-CSE-MsgGUID: YRjLwX0iT4aKBejfyaD0tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="222420355"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="222420355"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:20 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4E6B51C000CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:20 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 041A61846182
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 138FA10003CE;
	Tue,  9 Jun 2026 10:30:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 30/30] spectre-meltdown-checker: upgrade 26.33.0420460 -> 26.36.0602723
Date: Tue,  9 Jun 2026 18:29:13 +0800
Message-ID: <20260609102913.2204-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127484

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ....33.0420460.bb => spectre-meltdown-checker_26.36.0602723.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/spectre-meltdown-checker/{spectre-meltdown-checker_26.33.0420460.bb => spectre-meltdown-checker_26.36.0602723.bb} (95%)

diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.33.0420460.bb b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.36.0602723.bb
similarity index 95%
rename from meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.33.0420460.bb
rename to meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.36.0602723.bb
index a86869e752..2472c5b5cb 100644
--- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.33.0420460.bb
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.36.0602723.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://spectre-meltdown-checker.sh;beginline=2;endline=2;md5=3ae5399e70af7be9b93f72568069e2f4"
 
 SRC_URI = "git://github.com/speed47/spectre-meltdown-checker;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "1c067add59115190e8d87313ff5899b29bff0ff3"
+SRCREV = "d6624c30aff42f96f8b53570c583f472b19f680e"
 
 # binutils: readelf,objdump might be used for deeper analysis
 # coreutils: dd with iflag=skip_bytes oflag=seek_bytes in some cases
-- 
2.43.0


