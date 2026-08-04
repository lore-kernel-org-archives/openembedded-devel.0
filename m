Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86CDC55843
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10175.1785820774801618119
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MnLp6ZtF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820775; x=1817356775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TMrjbNP2Xl5KRsvTVlAq7a4bWKm4tkNq1uSSrtQn8uI=;
  b=MnLp6ZtF5QH49L0/cOlckd+dSeiSgfpEjlz4awyBYwkTfQahcYzVc+EE
   AmiYplu2cOvqRyaDi+eH5LYlQV7BurI+2GZEgp38wERJZe0OES+95bIms
   gYxlIubn5KPyMyQqqPdYZ2s2U+xMRFYcDLkbobTETFd4B6UutY+iNJke+
   /UiGvkmQBavPYfSa9ItnuELQ/wB86TA7o4EKEaTn3nkUPBfwzy96rEiQ8
   fNpo5rOIXDkusGBgUpS+kkJZuRuNIilOXdQewEpWd8oZI+gsky/vBkKDA
   B35413ClK3JLq57xaeiJBMYYyxX/5KmpV9e3L2OrU4TwRuCuBhUcMNZ2Q
   Q==;
X-CSE-ConnectionGUID: SqaKSk0mSBC38SIrR81gpw==
X-CSE-MsgGUID: kWO70P+MSj+BOYJSDnDQhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249616371"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249616371"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:33 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 23F078204D2
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:33 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id CD533C08A62
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D174F1800122;
	Tue,  4 Aug 2026 05:19:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/28] python3-virtualenv: upgrade 21.7.0 -> 21.7.1
Date: Tue,  4 Aug 2026 13:17:23 +0800
Message-ID: <20260804051726.1489-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128730

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- docs(branding): clarify official logo vs favicon
- Upgrade embedded pip/setuptools/wheel

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-virtualenv_21.7.0.bb => python3-virtualenv_21.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.7.0.bb => python3-virtualenv_21.7.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.7.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.7.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.7.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.7.1.bb
index 56963b22ef..366e0087bb 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.7.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "7f9519b9432ff11b6e1a3e94061664efc2ff99ea21780e3cf4f6bd0a5da8b37c"
+SRC_URI[sha256sum] = "d0dbfaa5483487baea28d7210ef8d24c9d1bd0f10f449eeb215568825a9b334e"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


