Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6CDCD6E69
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:09:05 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21500.1780394937534018718
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jh404THN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394938; x=1811930938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qQaxGwbHTG7zy0rd6DBXKh+0jf54kAO12zRc43KEgoM=;
  b=Jh404THN1lvZ4+15YkdSiIkltDeyvnDaoNryUpfTqLcMjstY8IB0AFxr
   6yAoAdwwj7Ib7rtqdVpG4wrEdv27jNpEZ3dq3k6BsNBOFVYC7D6T+/lS3
   ij3ROvyaqKwxCjMJVkKFEDtSdNUdbh6vAqBEEiuf2KnpSPLc1YsWewKAf
   gF8nq9l7cGXTCphflVWFauW26lzw2ehLk6pVliUdOEbr78mCXXTt49aMd
   xeI+wV/Zds9elr4h5DuQJ2ZL5l2qd0UXI9SFhRDYwWMpnW6qacS9aWy8S
   UFi9NJSOWPEAMg4poDxnzoIbDE1fLNCfrCPWpn2DtLsMI6gaBr5Qrl+qb
   Q==;
X-CSE-ConnectionGUID: uB6fccEDRQ65WRBEI3zG4A==
X-CSE-MsgGUID: 9Ct10hfuRrSIJ2UmVF3Q4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="230084947"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="230084947"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:56 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0A27B1002B84
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:56 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B62C7181AA54
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id B7BD8180051C;
	Tue,  2 Jun 2026 10:08:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/38] python3-tornado: upgrade 6.5.5 -> 6.5.6
Date: Tue,  2 Jun 2026 18:07:47 +0800
Message-ID: <20260602100755.2117-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127353

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tornado_6.5.5.bb => python3-tornado_6.5.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.5.bb => python3-tornado_6.5.6.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb
index fb9067c90e..bb363fe1c1 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "192b8f3ea91bd7f1f50c06955416ed76c6b72f96779b962f07f911b91e8d30e9"
+SRC_URI[sha256sum] = "9a365179fe8ff6b8766f602c0f67c185d778193e9bdd828b19f0b6ed7764177d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


