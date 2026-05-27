Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB55CD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16948.1779875347795737941
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OBcmXgui;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875348; x=1811411348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LsoUEHcVT8Y8pSRwIKiA4BpUbkYPWuoW2uftDj59nE8=;
  b=OBcmXgui/S3wOVOsByi95eWKhNcQHV80CJz2bTK6/IFXwd3iFq9DkMqK
   SW9Qo1H59Tga7Y+eXYQ6hVEmMvydiW2PiqA61ZLYDK7HiVEtZ2MGpTRIB
   U/Ri+WoTHxhYW4iNv/z7DrYNfc0GGQkp/0DcEe731Qfvv1ld+KJJNHyj0
   kawZP1QKzvHhSNfd5WMHK8GZ0sMvPu1a4yUfp75nLWiB1JE9o5mUfBlCg
   nIK1nr6oeJ1BIaREB3lVNRKYqvdZNw5jTt4tNExfHSuET84L8pgs0nD9w
   lL4vz0XdUIZnlDgjCmn0/nFbKg+gp0rkFFmnUlIRo5j5+KyVsPxVGllxS
   Q==;
X-CSE-ConnectionGUID: gKQO9zxQTjiaEfen7dpVcQ==
X-CSE-MsgGUID: okvX/dEoS+mtQtDKBT3pGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="245264212"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="245264212"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:06 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 555CEC00213
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:06 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0E1BE8319EB
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1338A82A2D5;
	Wed, 27 May 2026 09:49:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/56] python3-greenlet: upgrade 3.5.0 -> 3.5.1
Date: Wed, 27 May 2026 17:47:38 +0800
Message-ID: <20260527094805.2039-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127236

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add preliminary support for Python 3.15b1.
- Fix the discrepancy in the way the two getcurrent APIs behave during greenlet teardown.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.5.0.bb => python3-greenlet_3.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.5.0.bb => python3-greenlet_3.5.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.5.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.5.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.5.1.bb
index a68ae74ded..133d80331a 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.5.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "d419647372241bc68e957bf38d5c1f98852155e4146bd1e4121adea81f4f01e4"
+SRC_URI[sha256sum] = "5a56aeb7d5d9cc4b3a735efb5095bd4b4f6f0e4f93e5ca876d0e2315137b7829"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


