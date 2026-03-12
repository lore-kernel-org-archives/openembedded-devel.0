Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02765105A57A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:59:59 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18857.1773313194688994604
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wzia+I/C;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313194; x=1804849194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TjNPYeB7yfa1f4CcOe6wF/tXnuuMSRpr+hzjYV0L4Vg=;
  b=Wzia+I/C1Pb9D+Uq5Mg9ZPHpGPRPK/x9rU7UQdseNY5mNkKOjo2I3bI3
   iJ2n2Sczy5KoRLYXhYUS5kG+qrTYPoT6MPp4c4t4e+2qblHrxmxLstUIe
   gW0qlWu7L8y+kOOltMbqxHdjtg/kG1qyI74eD37Z+Oufw7Qsxurn19CLQ
   p9WFlyNAKhonq1umnPY15EANiwvehYp56bEfbK7w45u1E+ij8guLzAKom
   AsoiIMkeeElUFX53Uzb+XI4FX2S9DWJeFhs/1g7YxqBp9SPY/XrssCqya
   JLgbw4pldaegvOu6Ik1PZHmBGVgRNVlyyytBMqByd9nq+iEzx0A9I14Xn
   w==;
X-CSE-ConnectionGUID: JoVdMbntS4CQsOif8w1MZg==
X-CSE-MsgGUID: C5keV1D+QFaqbYUm0/faKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220449802"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220449802"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:59:53 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 53BF31000089
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:53 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id F252A18041B1
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 21D4A8288EC;
	Thu, 12 Mar 2026 10:59:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 54/64] python3-sqlalchemy: upgrade 2.0.46 -> 2.0.48
Date: Thu, 12 Mar 2026 18:59:30 +0800
Message-ID: <20260312105940.1900-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125154

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.sqlalchemy.org/en/21/changelog/changelog_20.html#change-2.0.48

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.46.bb => python3-sqlalchemy_2.0.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.46.bb => python3-sqlalchemy_2.0.48.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.48.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.48.bb
index e7a831557a..6681792f01 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.48.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=53a9111717b305b0fae0d704a24925c3"
 
-SRC_URI[sha256sum] = "cf36851ee7219c170bb0793dbc3da3e80c582e04a5437bc601bfe8c85c9216d7"
+SRC_URI[sha256sum] = "5ca74f37f3369b45e1f6b7b06afb182af1fd5dde009e4ffd831830d98cbe5fe7"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


