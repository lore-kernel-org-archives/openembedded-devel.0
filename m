Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9ECED7BBC
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:50 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15868.1776163242240617593
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DsjHNg7Z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163243; x=1807699243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/bhtZTfAhK5aF0+zA2c/iRaPcapJcWrx20xjuudil+M=;
  b=DsjHNg7ZKVqA27sUeKJpJ5Go8x9IHc4qhsGKDRhtlq4Sz5cB3Oal6pX0
   k1oUCmTfZuNx+q9WwT9I1BXTbqQDtx/D5V/ko7rkY0h/O+dKlIazEF/vn
   sO8Hi+UUAuwZQT7o9MhIrQUf+iwmb0XtmxkvowtmdvPWZfEmKNRIpACXo
   89J7OYDlaUXU+8ewXj5YQZzfBNJRqfrzNCeHKMuxfCOvCivKymSaf3Ibs
   qKmo6gWZV4cVXnn3fuqnpqrL6+AeRn1ByrlTJqkdtZ9wgY/V0RYqENdzn
   cqjZjJikrAVTdkJGl+1QhZLyAl5kOR+0kPXoTonGM37mjAfRE9ty1C/uO
   w==;
X-CSE-ConnectionGUID: +juZ4lTIQBu2bSPF2IkhuA==
X-CSE-MsgGUID: rdWcjzZ4TSGHBpZHdEsZ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236867109"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236867109"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:41 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B876B1000344
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:40 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 61D75C00D79
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B87E014000EC;
	Tue, 14 Apr 2026 10:40:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/32] python3-soundcard: upgrade 0.4.5 -> 0.4.6
Date: Tue, 14 Apr 2026 18:38:40 +0800
Message-ID: <20260414103845.1728-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126331

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-soundcard_0.4.5.bb => python3-soundcard_0.4.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soundcard_0.4.5.bb => python3-soundcard_0.4.6.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb b/meta-python/recipes-devtools/python/python3-soundcard_0.4.6.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
rename to meta-python/recipes-devtools/python/python3-soundcard_0.4.6.bb
index 5116892dad..17308a8965 100644
--- a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.6.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e39df1540c06c17ca310ce87c36b042c"
 
-SRC_URI[sha256sum] = "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08f54b832a56946aa"
+SRC_URI[sha256sum] = "9b46d64a26f97cd7d88bcfc385c97c069f97c5ec3404e4e7c23771598a8cf47b"
 
 inherit pypi setuptools3 features_check
 
-- 
2.43.0


