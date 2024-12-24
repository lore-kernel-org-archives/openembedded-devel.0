Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D2CE77196
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.30366.1735032446391206408
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YlZq1AOx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032448; x=1766568448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=odD4bKJiXztHjsHEWJ4kdaWcT7fRpLCtGgMS88K+ajA=;
  b=YlZq1AOx3YqyoAFAyKY9RAh6qo9BStryMj/FjVozQsusN3EhlwvQuscx
   sevHi6HApOTPTVA7Fl0EN3PShghBq76SJZx4DAt9A8jBWo48yXhyk9tg/
   8lCv1H1DDjletb55ozaEMFOLFpn+X5wsMjuZ0LiJOsyBNYrwD6rcwPvqT
   PLB5jRCqM10QR+AB+DcjtDSjBOoUelR+DTlw6Rx1FUz1nbkhFORE3B1eu
   sBb+TMxICUun0MhW9QeaM2vOupqfbjn/t1NIrR4fz2lDep80cnBHK/SHe
   etIG7KCGFPpkE26jW3VW+PoELZP0ujLmYW8mYlXtDtY1rkIXDsucMNzPZ
   A==;
X-CSE-ConnectionGUID: 24/R8jRCTTO7/i1HFGD9dw==
X-CSE-MsgGUID: 6jMtcmmER8SvWWUNawaprg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="173157109"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="173157109"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:26 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6804696741
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BE20CF7EB
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CB4296B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7428B1A006C;
	Tue, 24 Dec 2024 17:27:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/67] python3-pdm: upgrade 2.22.0 -> 2.22.1
Date: Tue, 24 Dec 2024 17:26:37 +0800
Message-Id: <1735032421-13513-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--4.488900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svL+bd
	9j4+b6jIJA0LSyxFYBF8F13ArqHEjl28GEACdAmK3IFFT9wqfr3YUDvAr2Y/1/+aPQT1cxlG2CM
	TQA2pstzb0b11xsLH6Zssmx0NeBl3/625ZdmTyUgD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpienmD2BglYMt4HMSQIKmdGZ4CIKY/Hg3AaZGo0EeYG95UMLUJu4leYyq2r
	l3dzGQ1l1pw2HyeObsR+WWqD6Rbs8w/jgujQZkf32f2UuQbF3fG7jszkGxI7KDHNYbMmZeMtdr/
	/r0CJbtivotWsi/SzOaB4wMiJND56OAxkjgonfRTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114514

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix zsh hanging issue by removing PyPI package completion.
- Write dev dependencies to dependency-groups section when importing project
  from other package managers.
- Show a warning when resolving against cross-platform targets under uv mode.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.22.0.bb => python3-pdm_2.22.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.22.0.bb => python3-pdm_2.22.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.22.0.bb b/meta-python/recipes-devtools/python/python3-pdm_2.22.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pdm_2.22.0.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.22.1.bb
index e65e0e459b..b089307aac 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.22.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "61b4f0f8238bf99ba59ffae3db524604417379df917e081d61b1e257bfc20e43"
+SRC_URI[sha256sum] = "6d3276ed8efc7d118a1667a871570b50d84025b2ad461598b7a2558610999330"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


