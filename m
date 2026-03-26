Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6483C10A3D72
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45658.1774526264727324418
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A6YZe0BW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526268; x=1806062268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+/TKmF+wTwLDlTFch+aNPkB7JM54tEVQdcuJp7bYIEk=;
  b=A6YZe0BWpIuB9V8A51fDVNUfBbAmEQl1EcAFXSPdqCqTyNSEmn7jrhcU
   1+T0ytSqCUQLyulQSyShGSTXyyx+5qE84Gs0HfpbvBluOs9ka4y35kwFT
   s84zch01R91dsWqqBiv9ElrMQUNVMFfQiUcIQZ374xkPH8u34zrZSZimV
   tkOgkzaBXd8saUilrBTY/W7mWUMWCrGHVNf+5bvCmnm/LWHOmU0aZdbMG
   Yxv5F0b7Kgs3TQUFzi6whswjKJ2Dzbx2qP2m3735Ol8AjlZa8kkIyLJn0
   NEy+pn2jOyza8neM+xDAhJX2D0I1OmRcNkKn+JxeJG9aTNlKP7R32sP4y
   g==;
X-CSE-ConnectionGUID: +ND4O9aoRoym7K2xRgUisg==
X-CSE-MsgGUID: W/QluNwyReK43tmclLLfWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213717112"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213717112"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:48 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id F1226C00423
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:47 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id AAF4714003CC
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 54CBA1807149;
	Thu, 26 Mar 2026 11:57:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/63] python3-mpmath: upgrade 1.4.0 -> 1.4.1
Date: Thu, 26 Mar 2026 19:56:12 +0800
Message-ID: <20260326115634.1199-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125697

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix test_hexadecimal_with_libc_bulk()
- Keep available deprecated aliases for mpc/mpf_log()
- Use version_file option of setuptools-scm to keep version info
- Add workaround for test on s390x

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mpmath_1.4.0.bb => python3-mpmath_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mpmath_1.4.0.bb => python3-mpmath_1.4.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.4.0.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.4.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mpmath_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-mpmath_1.4.1.bb
index 12ded173e9..7f237afb38 100644
--- a/meta-python/recipes-devtools/python/python3-mpmath_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.4.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/mpmath/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6607bd72611b702183473dfb4e6198b"
 
-SRC_URI[sha256sum] = "d272b40c031ba0ee385e7e5fc735b48560d9838a0d7fbca109919efd23580a22"
+SRC_URI[sha256sum] = "efd6d1b75f09d69524a67609949812668b28e81ecbfe0ab449ced8c13e92642e"
 
 CVE_PRODUCT = "mpmath"
 
-- 
2.43.0


