Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D516CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.15420.1758015723034496813
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mvaMVYFE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015730; x=1789551730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sy8zrZrdIdBmiZGBy0XGB0yppdcWzsbYIprkiENNY+M=;
  b=mvaMVYFE70BxzKrWVyIH+CIsJn80COvxaIHyETMmpVsb7F6fDp9pDndq
   5glE7yXBVZa1Q1OipyqRO4UvOBi3Jw1VlhiU5UlQkeicZHFtwemw0rHut
   cizAVmqAFkQCLDUyzbsq2mJMTxXAJUY/M1zBn0cSH6ty3I1qKrwXf6kpf
   hAyY7M3qUhVvgRn5ZWbBSbbhJX55U/B+iP8rxiN/geJ+g1iA4bTnFTlIB
   0q0+odCyANcBa9NbStcULnv2EGfVQsV+XSjHBR58+1Bwh6IOMj3blf8L2
   vFt9LmAQ29ymaPXSLSL8Louhex7UYC+D50zM4PVzv98J40tMjG3f67PlR
   Q==;
X-CSE-ConnectionGUID: 5kB60kxzQCCGE//yPX7JBw==
X-CSE-MsgGUID: 6lHQEcSNSJiDhjE9o48cMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="212934961"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="212934961"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:10 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 7C4E21002B87
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:09 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3407418000E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id A7FE54029B6;
	Tue, 16 Sep 2025 09:42:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 435D21A0086;
	Tue, 16 Sep 2025 17:42:04 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/42] python3-pycares: upgrade 4.10.0 -> 4.11.0
Date: Tue, 16 Sep 2025 17:41:37 +0800
Message-ID: <20250916094152.1479-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119447

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycares_4.10.0.bb => python3-pycares_4.11.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.10.0.bb => python3-pycares_4.11.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.10.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.11.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pycares_4.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pycares_4.11.0.bb
index 1b0b003dfc..974f4f3ed6 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.11.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "9df70dce6e05afa5d477f48959170e569485e20dad1a089c4cf3b2d7ffbd8bf9"
+SRC_URI[sha256sum] = "c863d9003ca0ce7df26429007859afd2a621d3276ed9fef154a9123db9252557"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.43.0


