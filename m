Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E7BCDE002
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7234.1782378129427242070
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q5OkEyxz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378131; x=1813914131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RMAQfGMxi+6mX/OMk1QOWlK+ebmiVlSainRwlaR4X6s=;
  b=Q5OkEyxzys/swO6kKNdttAUEmkBde1eQm+q+Xn5wvLtjQRtfDHBpwdIG
   dDrJitm0MscUb5eKXeNNZ/YaWjHUN2k6m6+AwPc1xxlKsTw1EUt3YbmCE
   dWqyZTUm5z+vlPJEFxZfBpr2xxNX6aMD2xaaLZQObEf98xW4w3k2AO9Oi
   8Yfpz5bWfvF4fnV3FNP0Zp6fS2WO6O/H7lvqHqeO3j4U+1WK1RXQufhyV
   lYxdfwUT7GWD4VtKSrF/4pjVza7lFFQYWszKgpAI+MuGVOS+AoNM7hUQH
   Yld8X4wU7qEB7gO+33FcavC6zbh3jdB73jvzVnZum+7aX5+ZTPq/wdd5s
   Q==;
X-CSE-ConnectionGUID: rxRcjmSOQI6pggEXNrnhdQ==
X-CSE-MsgGUID: SBbbYEjORSmEZ+b+Ng+PZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="231468221"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="231468221"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:09 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CEDC01002B87
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:07 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 89963849386
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 8B9211017329;
	Thu, 25 Jun 2026 09:02:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/47] python3-fsspec: upgrade 2026.4.0 -> 2026.6.0
Date: Thu, 25 Jun 2026 17:01:03 +0800
Message-ID: <20260625090127.1563-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127755

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fsspec_2026.4.0.bb => python3-fsspec_2026.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2026.4.0.bb => python3-fsspec_2026.6.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2026.4.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2026.6.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2026.4.0.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2026.6.0.bb
index 794d7d9be5..94e0e43c09 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2026.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2026.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "301d8ac70ae90ef3ad05dcf94d6c3754a097f9b5fe4667d2787aa359ec7df7e4"
+SRC_URI[sha256sum] = "f5bac145310fe30e16e1471bd6840b2d990d609e872251d7e674241822abf01a"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


