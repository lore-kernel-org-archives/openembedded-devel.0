Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAF3105A56B
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:54:08 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18779.1773312841706058474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SAba7gL+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312841; x=1804848841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C0JReOZiHExdyGAKbAqY1GEcrpfLJ7S31eUO8b3OnWY=;
  b=SAba7gL+FPqJ48dSG8+74dzjFIpbblW7u3AhWnMHBPcQAmvOzzkCCzeQ
   4ziikJTKFAPPzU+VoN0I8L8XzjTc1PMjEQNAAUj2XjeHn3e4B3lwMkoUU
   j/qSgdvfrWwoUwLQCsClNzwAAYNfQFmfovKOtENo8Ft0qit0mfLbUjWqO
   ZAMC5Vk7aCre+PmOb3uNmwuriw7gn27TS/epJbgWph62Ysa4MIlRbblRa
   iNMfgFeQk8dnhTOUmtQwO39DogY3fnWwYBEkXSc9G17itFW6xzDlnxDcl
   9CzrIg3xQgdrXPuMwnJWpX0ZXHZu4M5boulmmKyazOU5loxK763tVf5U2
   Q==;
X-CSE-ConnectionGUID: l09/HwcASgihYh8FJPdGKA==
X-CSE-MsgGUID: BD+QwcarSLGOy859djpRFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="237281291"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="237281291"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:54:00 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 59BF61000A12
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:00 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id F3BEA1C0CAF9
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2545918005BE;
	Thu, 12 Mar 2026 10:53:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/64] python3-pkgconfig: upgrade 1.5.5 -> 1.6.0
Date: Thu, 12 Mar 2026 18:52:00 +0800
Message-ID: <20260312105220.1856-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125144

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Drop support for Python < 3.9, support 3.9 .. 3.14.
- README: clarify pkg-config and pkgconf, #75
- Switch CI from Travis to GitHub Actions; test on all supported Python versions.
- Use src/ layout for project, fixes #36. Also move tests and test data to tests/.
- Replace deprecated distutils with setuptools to make tests work on Python 3.12; fixes #64.
- Fix configure_extension for empty cflags or libs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pkgconfig_1.5.5.bb => python3-pkgconfig_1.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pkgconfig_1.5.5.bb => python3-pkgconfig_1.6.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.6.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
rename to meta-python/recipes-devtools/python/python3-pkgconfig_1.6.0.bb
index 8f65d3d4c5..e872c7a314 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc"
 
-SRC_URI[sha256sum] = "deb4163ef11f75b520d822d9505c1f462761b4309b1bb713d08689759ea8b899"
+SRC_URI[sha256sum] = "4a5a6631ce937fafac457104a40d558785a658bbdca5c49b6295bc3fd651907f"
 
 RDEPENDS:${PN} = "pkgconfig \
                  python3-shell \
-- 
2.43.0


