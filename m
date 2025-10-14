Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEDDCCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.11128.1760433673572161194
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q8d8ZaMb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433675; x=1791969675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0uKi+1QyQiknKXYhekBEvQsiVUE1mnyu3KCt1sy1VP0=;
  b=Q8d8ZaMbZHdzr2lFG/jFW5uzLJDn53vZDvxNOsASLWASFvH/7FIIxfU9
   gCF+r5vsnpxo9yVK1RnoGXutfNZP1ME9VoXSK4mWMmFMH815jJR6SdRlI
   zhGr4udldioxXBTg4qIZOeB79RojUet8Nr0168kfmKzUluWk1UjUia/de
   RUioXkShRtpulquEtvJr/WWsYFRK4R9/YaUtcE8cFKWXHJT+OMR7KpiIj
   aUn9JtADlzFwsDHVKp8g6fq6gsaU1Xvd9GRtbFkEHIc/8/tv8+StD4uhl
   Ok/RyDaszuzPE1RV765hC/ILO6Rcf+sfbNJeZyliQIj2WTKfiCu+9Exo1
   g==;
X-CSE-ConnectionGUID: iRHPMIeFS+Sx44+ALIZ23g==
X-CSE-MsgGUID: f7UqSWCVT9uqaZ1Osf1Nsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215886729"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215886729"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:13 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 06D8A1002B9C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:12 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B300D18000C0
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2BEAC101C3C0;
	Tue, 14 Oct 2025 09:21:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/44] python3-virtualenv: upgrade 20.34.0 -> 20.35.3
Date: Tue, 14 Oct 2025 17:19:22 +0800
Message-ID: <20251014091927.493-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120596

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.34.0.bb => python3-virtualenv_20.35.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.34.0.bb => python3-virtualenv_20.35.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.34.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.35.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.34.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.35.3.bb
index fff81b2fc2..3d9b6a097f 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.35.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "44815b2c9dee7ed86e387b842a84f20b93f7f417f95886ca1996a72a4138eb1a"
+SRC_URI[sha256sum] = "4f1a845d131133bdff10590489610c98c168ff99dc75d6c96853801f7f67af44"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


