Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231B8CA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8060.1756890231178671326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HvW0O7Wy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890232; x=1788426232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xSO8LsTEu76X5RSVRWXPc5dOLKHSUaDXPHy/8F145Jc=;
  b=HvW0O7WyCH80sTBBKu9KNee5NSLelz/rSEHY4wgSon5+PuzjmjjdmfA1
   chU8uOSmErKHPcmuyP3O0Nex/RnT7k4WlZyv69GC6V3wLE6mFsi1BoWEo
   Lgq61z1PJTwcLZCQKrvgQoXNEevaR56NxHQUQmZxUDYJ+pDHOYsqF/yKv
   tPBFGgxVFYEa4m8RYdyhPeuN09CkU6W2vkUAVLCtujfHcVd9syTk7mHM8
   DjXXu97ZLnHBieFA0581aYmTCboXNn3ADdw8ihQatLd2Ex5UOKBOWEjgV
   v7IzEva2xilUCWct4WZ8RNs/Loj2C0xxrJ2BLfLM5KnoZUrU0wP+32pcr
   w==;
X-CSE-ConnectionGUID: ZcLldXrERdi/7vL/JFE2Dg==
X-CSE-MsgGUID: AL4o2q9YTMG3B1QLHqW8dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="210834796"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="210834796"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:50 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A40B1C0036F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 60C62182FD7C
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 462C720017F7
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0090C1A008A;
	Wed,  3 Sep 2025 17:03:43 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/56] python3-coverage: upgrade 7.10.4 -> 7.10.6
Date: Wed,  3 Sep 2025 17:02:46 +0800
Message-ID: <20250903090317.2002-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119224

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.10.4.bb => python3-coverage_7.10.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.10.4.bb => python3-coverage_7.10.6.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.10.4.bb b/meta-python/recipes-devtools/python/python3-coverage_7.10.6.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.10.4.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.10.6.bb
index d54d218326..6593ecd2da 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.10.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "25f5130af6c8e7297fd14634955ba9e1697f47143f289e2a23284177c0061d27"
+SRC_URI[sha256sum] = "f644a3ae5933a552a29dbb9aa2f90c677a875f80ebea028e5a52a4f429044b90"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


