Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BE2105A56A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:58 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18772.1773312824760925638
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l9JCbW3w;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312834; x=1804848834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ChhU+UEpE/1hJ/d/rkjJr249yLW1UdatfWH+kdrBDzw=;
  b=l9JCbW3wq3PMpxszzEM+1z47c2bv4DFdRgSQ8Ip4BHi38sCvbnlsFiND
   /T4+JovwfR+oTSzq+kPkl/gb4FZcwbNltcpo9RM00lQF9GyDzgcUOGuDF
   oOub+RaLWcjsQIvouwErA7a7/dyAPYrPQOri0+u3pX1/Os1FD/3uZ7qEB
   7ciPvteNAwDlhFrVQcxm4ekyujIIs4IvDd32SNgp9VA0AIzY2jjiNDpoW
   4Lug+bRTjJAo+QuDTb7WmVaqj6zGzgopltFdQlrYldpYPSCsyJ6c5zIgN
   DQacsSeyXLnC1csknKntmA0iCzbshUCli3jgTtwyNEjl40tMmFRKzrrjx
   w==;
X-CSE-ConnectionGUID: yeyGX3o2S8uWVvp6yzMd2g==
X-CSE-MsgGUID: 87+uoj0iTseNIRsvtH3D+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220449438"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220449438"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:54 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0072AC03F83
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:54 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id A83C614042C9
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BA37018005B4;
	Thu, 12 Mar 2026 10:53:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/64] python3-mmh3: upgrade 5.2.0 -> 5.2.1
Date: Thu, 12 Mar 2026 18:51:57 +0800
Message-ID: <20260312105220.1856-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125141

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mmh3_5.2.0.bb => python3-mmh3_5.2.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mmh3_5.2.0.bb => python3-mmh3_5.2.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-mmh3_5.2.0.bb b/meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-mmh3_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb
index c719762885..5d4030f46e 100644
--- a/meta-python/recipes-devtools/python/python3-mmh3_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb
@@ -2,10 +2,10 @@ SUMMARY = "Python extension for MurmurHash (MurmurHash3), a set of fast and \
            robust hash functions"
 HOMEPAGE = "https://github.com/hajimes/mmh3"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2edf2352bb2cd3d7787f05247781b314"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=53366c60f8214cfc1d3622ebacd141fb"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1efc8fec8478e9243a78bb993422cf79f8ff85cb4cf6b79647480a31e0d950a8"
+SRC_URI[sha256sum] = "bbea5b775f0ac84945191fb83f845a6fd9a21a03ea7f2e187defac7e401616ad"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


