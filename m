Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEF1E83F05
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:16:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14304.1770268610103494850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jYEq5d14;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268610; x=1801804610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gKONn6mhiZtSnytRhvCXbfjp95o75oX6EwLqR5Est+A=;
  b=jYEq5d144JNjfaVN3UTNV+r10bBkOW10RbweuNE93i31NcCU3RG+RQhQ
   lFzTxEn9TQodIas1mwpk6EhpjUiHPCgSFzM52BwzSmjzs+92NkWv5WT0u
   RZ0QvW//IOrTiFTuEsKbfAZwr4NEUGRo9lLm+R/1hjsXkcuJ2G8ZLEzJL
   e/AxecpwjNWPd6vS7454B4E/WQwRsiOd8ETKbZqYJJ+T8/6+vaXqDLwK/
   2V9S6QyPaqe9kFvqA7ugA7snWCQokgKj6aQXE8hOZ1EIj7q9E+WSj2nqJ
   rMKUPOqSM4o70WJB6PuGaem9ThyugNW4r36cHalWHc9lB3vcUxfCbndk/
   g==;
X-CSE-ConnectionGUID: +Lnc6oHIQQitGetqCqtKwQ==
X-CSE-MsgGUID: DwhhhGW/RR22ARsMONcqrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="216543971"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="216543971"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:16:48 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 81A871000373
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:16:48 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 37DA1C00404
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:16:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 871A520000C1;
	Thu,  5 Feb 2026 05:16:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/24] python3-types-psutil: upgrade 7.2.1.20260116 -> 7.2.2.20260130
Date: Thu,  5 Feb 2026 13:14:32 +0800
Message-ID: <20260205051435.1366-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124174

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...7.2.1.20260116.bb => python3-types-psutil_7.2.2.20260130.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.2.1.20260116.bb => python3-types-psutil_7.2.2.20260130.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20260116.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260130.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20260116.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260130.bb
index b9724695a2..78e96b3122 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.1.20260116.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260130.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4661be5d5d7acd5d8afb02a92d05160a6cbb2ce74723245b51f7ba7dfdb9f981"
+SRC_URI[sha256sum] = "15b0ab69c52841cf9ce3c383e8480c620a4d13d6a8e22b16978ebddac5590950"
 
 BBCLASSEXTEND = "native"
 
-- 
2.43.0


