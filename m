Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7183CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:08 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.11126.1760433667648406110
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dUZMqLDk;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433667; x=1791969667;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N/AY5jpqc+oG1q+rBhH5pvIpHXRJdS6kPa5Lu3JM2a8=;
  b=dUZMqLDkh/OO5BYT7mRsmuc7b3ui5I66Cdof8oZXUl7kzgZtPDSdvB0N
   0YftiooTsujyKOGymTeATGQLuk/c4H/Lf4J1VPXHq1QnUUU4JuILEJ8sc
   ikRJ44p7DI02i8E1dsnLiJH4eXXhm/PGm8hN/U9Ix+ZZ0Mh8Ur4BFAJpv
   ZLAHuBmisJi0WtJgZIEbTWkYpko5wtwxXhIjsq6ltgt661dBrJ9wyYrM2
   92iL3FcThKTI8C5SuOFP80V02D68jcUfqS2JQ6XWjUUdz/vrLLMBeA+RF
   QatJWnkYMe5uKl5QK+H5UT1gpYbTFsgi1KzzAfPzJHmvpp4+hnaUqnOAB
   A==;
X-CSE-ConnectionGUID: 8m4gxOZuTguwYai/ZAxOmw==
X-CSE-MsgGUID: QRYfZKWqTZa/B8rPaHeVJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="203275761"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="203275761"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:06 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 434511C000A2
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:06 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id F26E918009F7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6A6D2101BB7E;
	Tue, 14 Oct 2025 09:21:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/44] python3-rich: upgrade 14.1.0 -> 14.2.0
Date: Tue, 14 Oct 2025 17:19:19 +0800
Message-ID: <20251014091927.493-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120593

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_14.1.0.bb => python3-rich_14.2.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_14.1.0.bb => python3-rich_14.2.0.bb} (88%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_14.1.0.bb b/meta-python/recipes-extended/python-rich/python3-rich_14.2.0.bb
similarity index 88%
rename from meta-python/recipes-extended/python-rich/python3-rich_14.1.0.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_14.2.0.bb
index e68f280c82..c51d55c633 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_14.1.0.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_14.2.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "e497a48b844b0320d45007cdebfeaeed8db2a4f4bcf49f15e455cfc4af11eaa8"
+SRC_URI[sha256sum] = "73ff50c7c0c1c77c8243079283f4edb376f0f6442433aecb8ce7e6d0b92d1fe4"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


