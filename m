Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809D3CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11098.1760433607121321706
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WWybJVZU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433609; x=1791969609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5avTWBTmEtX1hHimndw7VGgHzbuX4RX91WlnSYhfyFU=;
  b=WWybJVZUwS12QRX3mu2WNxOqMe5OwUsqtzwm5YdZdpR85BegWzHLdkzQ
   W0nCb01W3OL7GwwPRstngcF0hqvKgDPBwROolFUKCZCCRQVog+UCKKCi+
   TVfIoUDRtLiFJVnjl2RGX7+UWwa+VeX08XU4r1Tbyqz9c5SqPL+VHBnBJ
   0t4MhoyOzo0NNylutYJdPCQNs5bclLmktyqMEc6OVbeegc12tDIESDi/d
   1s9SGrNxLhQE8/qL6+kbE8r+AaBTB96SxuyehPlgDVfZiEWPRvBRcWzkc
   0YOWwvO7L7QhR3btBKjkFD2A441+565vdSgXAFilt3x6rW7SRUFwI1GgV
   g==;
X-CSE-ConnectionGUID: S7b5p7PzQ+S2Fup9sQQt7A==
X-CSE-MsgGUID: x48XsYk5SaiMdzPmQYHwUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="204394471"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="204394471"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:09 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 04EB242A31F
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:09 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AE8081C002F9
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 905D0101BB78;
	Tue, 14 Oct 2025 09:20:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/44] python3-cantools: upgrade 40.7.0 -> 40.7.1
Date: Tue, 14 Oct 2025 17:19:03 +0800
Message-ID: <20251014091927.493-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120577

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add typing to bus.py
- fix(database): broken caching when loading dbc file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_40.7.0.bb => python3-cantools_40.7.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_40.7.0.bb => python3-cantools_40.7.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_40.7.0.bb b/meta-python/recipes-devtools/python/python3-cantools_40.7.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_40.7.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_40.7.1.bb
index df6bbb45ff..92b6c1ca09 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_40.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_40.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "5779113b068ab043140ea9441ad77d44ad4d382eed88de16678fb320e32146ec"
+SRC_URI[sha256sum] = "467e04cc86e076307375ae9bcd83707108e998e3ea6019bf968773580b9aa95f"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


