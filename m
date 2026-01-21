Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09384C44509
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:30:01 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9439.1768994986905885337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K3Xvl5WR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994993; x=1800530993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b7o37FeDPtobDoGT2OI7T60hm+lsTzjLG3E1oIQfAAk=;
  b=K3Xvl5WRZgk7d9lhiFZ9AWpQEVhQOL+1LCqmIsA88FdJ4azd91zzcofY
   OPD6IF2Q1/2tjQlr4R4FGEneZsRAfpf7s4a+YCp5b+XTIXH9vQ5o2ViPf
   Q1dBpc/K1dAErkBDOPviPscnH50oB8mC0K+cdTmvCRFgXxSEbxa9FFaxl
   2/M4Ka+n6/Q4zyJirDQQD80fJao51cnD53YU3M1e0hEYMezB0LyDhzIpz
   970uoLWXQZ6aGz7IU7paG19130aXsM34Dwkrrfj7KjMtWCzd3QRIe865l
   KR+rcRsSxZ11aSaC0weDHVtg8hg/sZXB1DdbuutL5YwxI+jzhLugWVxS7
   Q==;
X-CSE-ConnectionGUID: 0Dt14lycQy2MZsA3JH+v5A==
X-CSE-MsgGUID: y84o0qlAS6itHo0+qMqnqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="226551728"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="226551728"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:52 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C6DD8100034E
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:51 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7A1CD1802AEB
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E4E521404867;
	Wed, 21 Jan 2026 11:29:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/30] python3-identify: upgrade 2.6.15 -> 2.6.16
Date: Wed, 21 Jan 2026 19:29:00 +0800
Message-ID: <20260121112921.857-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123700

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-identify_2.6.15.bb => python3-identify_2.6.16.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-identify_2.6.15.bb => python3-identify_2.6.16.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-identify_2.6.15.bb b/meta-python/recipes-devtools/python/python3-identify_2.6.16.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-identify_2.6.15.bb
rename to meta-python/recipes-devtools/python/python3-identify_2.6.16.bb
index c5498cf294..ef33b3d6cd 100644
--- a/meta-python/recipes-devtools/python/python3-identify_2.6.15.bb
+++ b/meta-python/recipes-devtools/python/python3-identify_2.6.16.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bbdc006359f3157660173ec7f133a80e"
 PYPI_PACKAGE = "identify"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "e4f4864b96c6557ef2a1e1c951771838f4edc9df3a72ec7118b338801b11c7bf"
+SRC_URI[sha256sum] = "846857203b5511bbe94d5a352a48ef2359532bc8f6727b5544077a0dcfb24980"
 
 RDEPENDS:${PN} = " \
 	python3-ukkonen \
-- 
2.43.0


