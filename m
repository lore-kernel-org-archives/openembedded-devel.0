Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09927CD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11266.1781686715732472523
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LTrSYXMF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686716; x=1813222716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BYkHaYE1QEP7UFTS5LtaaHDgMl72UUSb9o8+BriXYEw=;
  b=LTrSYXMFp6IIxvtJcBtUFvg6QWAGbMzYuIMs6UTvAh+FmVwRnqGC6XEZ
   9pY3sT/O01AN+wLP+8MqmQ6Y6W/JDQmycN0TD9IgI20D5fg13qSZ/lO9/
   46edJN//PEZrkHopuAYRiyBovWdrVA7QcYvmEYrtenqwbYGIOyHbcowNl
   kyHAgeeP6ZUKFRnQTnO/bApnf67wfsuBxibTm5k6usrVPUeJUA0Ymcxsp
   mKkx/oKKhFxluV+RpJ/+kk4yGArSRiEwOtq1ePA12uqQYhohMSY0lFSvE
   6uXnmrcN2stT/j51ll0qlffH7QZXaqJximraww6TDV/PW+eeaJeAh/PNr
   w==;
X-CSE-ConnectionGUID: G9Gufg15QRCfwtpLyhxzzw==
X-CSE-MsgGUID: /bWTqiPeR5+CtwUMipsEnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="223301150"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="223301150"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:35 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 96FCA820725
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:35 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 53177149D8E8
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 7E0971000A45;
	Wed, 17 Jun 2026 08:58:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/17] python3-pylint: upgrade 4.0.5 -> 4.0.6
Date: Wed, 17 Jun 2026 16:58:03 +0800
Message-ID: <20260617085807.542-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127650

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pylint_4.0.5.bb => python3-pylint_4.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_4.0.5.bb => python3-pylint_4.0.6.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_4.0.5.bb b/meta-python/recipes-devtools/python/python3-pylint_4.0.6.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pylint_4.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pylint_4.0.6.bb
index 15d8c14806..a2d229d578 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_4.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_4.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "88e1ab7545a4af4aea15c305a154c164a95ab842"
+SRCREV = "8a396357098337ba8be714fffdf2d00947a9778c"
 SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https;tag=v${PV} \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
-- 
2.43.0


