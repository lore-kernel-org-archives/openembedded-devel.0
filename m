Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79151CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:11:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.142.1778645494977554388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ESPDRcCQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645495; x=1810181495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=unkZU2NXb46ekbG6H/XDHgBEHrgaiB2+pDAmXlBidbM=;
  b=ESPDRcCQQpdBg9uD9WpUJcOQqq093NIKeRA20NhxhqxDta4IypH++mMw
   chLlZMj7ZY8/gJcjcYirYbccwsIPxbmOztr8OZmebOzCHFy2BRqmpV41f
   SSwGbdG9v6nG8T8PUk5B3M5Z1MBee7LE/QZO/UMcIcY7I6gvK+PAJk01o
   tii+hbKwiorsALu2KAdVRooiA/t7DwYIQKq1acfl00w6442bDtTMecSaX
   fpK1UeItu9AwEeTV+XSG1iX8J+7CwTaCkziXpnJy3rpvo+WHRjQsxgVxV
   kEdITIFYs8BdeC8KGqY4N7vSQuVW5qctGJRbw914nbcWcw8RpDIJ90sjb
   Q==;
X-CSE-ConnectionGUID: J9GnFL2UTWKny0E1EX6hsQ==
X-CSE-MsgGUID: 2CB4RH4eSqiiOIv2t9pbZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228214303"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228214303"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:11:33 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6087B100034F
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:33 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 11F171C0095E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8EA95140024F;
	Wed, 13 May 2026 04:10:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/56] python3-google-auth-oauthlib: upgrade 1.3.1 -> 1.4.0
Date: Wed, 13 May 2026 12:05:25 +0800
Message-ID: <20260513040555.377-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126918

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Drop support for Python 3.9
- replace deprecated utcfromtimestamp in google-auth-oauthlib

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-oauthlib_1.3.1.bb => python3-google-auth-oauthlib_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth-oauthlib_1.3.1.bb => python3-google-auth-oauthlib_1.4.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.1.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.0.bb
index 7f9435d475..3f56b5b45d 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.4.0.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI += "file://0001-python3-google-auth-oauthlib-Skip-failing-3PI-creden.patch"
-SRC_URI[sha256sum] = "14c22c7b3dd3d06dbe44264144409039465effdd1eef94f7ce3710e486cc4bfa"
+SRC_URI[sha256sum] = "18b5e28880eb8eba9065c436becdc0ee8e4b59117a73a510679c82f70cd363d2"
 
 inherit pypi setuptools3 ptest
 PYPI_PACKAGE = "google_auth_oauthlib"
-- 
2.43.0


