Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B5CCA0FE6
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.4722.1755766811378409643
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H+ovuZnH;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766817; x=1787302817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HnNux6sKPz6qb8howZwGrIZahb+xNhvudjEIF05CnJ8=;
  b=H+ovuZnHfypcq57LtMJiKzz80ou5Hb5mCB2S3KF60998oFsn2U+guLpk
   68PJ8n6VaePEHIeicB4p+XvpJ2z1050SGk+c0AqJZjIlAp1cHFoJ69nBb
   EySFChZuwBU3/vhnQbpZr+YVQ2/cnGg1v0ZV6Q6CWeueF6Wv3MK/AYNNF
   tdtxmbva+2YDuuM25IUwR8a3Jqpy89WyybKd8FW2pmA3ksUMcDO7DnhhP
   ukKCxqFXlBOwUA4ZD/cqiaLCk8FfySlswDAAT5k1VMGcRV0pC5pTiH81h
   GambFUbZPRDSqVt8tHKFX8QEP0Hkm5r7TS5BxTvZwKlnEC6xHE4/O+kYe
   w==;
X-CSE-ConnectionGUID: SGCGJhu3Q62kI8/xEgKnkg==
X-CSE-MsgGUID: Gan2bXUlSoqTiyOyLWAeqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="197565136"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="197565136"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:16 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 6894A1000353
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:16 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2CA5E180CCED
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:16 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id E7A961802E2F
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DDDD41A0086;
	Thu, 21 Aug 2025 17:00:09 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/21] python3-sqlalchemy: upgrade 2.0.42 -> 2.0.43
Date: Thu, 21 Aug 2025 16:59:50 +0800
Message-ID: <20250821085954.2056-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119064

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.42.bb => python3-sqlalchemy_2.0.43.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.42.bb => python3-sqlalchemy_2.0.43.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.42.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.43.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.42.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.43.bb
index 2859b3483d..692bbd7712 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.42.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.43.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
 
-SRC_URI[sha256sum] = "160bedd8a5c28765bd5be4dec2d881e109e33b34922e50a3b881a7681773ac5f"
+SRC_URI[sha256sum] = "788bfcef6787a7764169cfe9859fe425bf44559619e1d9f56f5bddf2ebf6f417"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


