Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44084CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:19:58 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.11087.1760433587759665531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BDIAWoy9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433591; x=1791969591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OWEn4z3aGokN6Fk5HvN+qPB2HP4yle2n/E0fdUjzj2g=;
  b=BDIAWoy9lVOUqk2cAVR3G/RivUECQMqEf6dfDLMo4klLmsOlW6eYUZWf
   aqOaimLyeAZqdV2/r6dt00Tm0tGyg/gDnv5v/CVdzzJXVfDGOMQdRHNVe
   zFHzcig4VKCnm/G1nKrctTrfAn2kDJd5xeuqV1t1DHUS5JnsgAa2bJYLZ
   56IcdpFv3BU1vIE2dX2bn/YxsjIL9Uw6va714gQFjp0He1aiVCaeg9Mrz
   bXScK7ocHXqxzq4PXFwdzOywP5Bc8UWC9yayNcjqtTMLzeM3w+DewHalA
   3ISO+pyew+F9K0Hfbn0SpS7nlDHCnJNB6LHHq0HuPIV5EkVRtYnc7+gUq
   w==;
X-CSE-ConnectionGUID: qScoYXj9THOnOEPxj3JJoA==
X-CSE-MsgGUID: mujAsSp5S3+vnL3lki/UZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215886615"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215886615"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:50 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 7AC802BB7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:49 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 32E7C1C0029C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B977B101BB7F;
	Tue, 14 Oct 2025 09:19:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/44] jsoncons: upgrade 1.4.1 -> 1.4.3
Date: Tue, 14 Oct 2025 17:18:52 +0800
Message-ID: <20251014091927.493-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120563

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.4.1.bb => jsoncons_1.4.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.4.1.bb => jsoncons_1.4.3.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.4.1.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.4.3.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.4.1.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.4.3.bb
index da288a9cf6..f5e19e4191 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.4.1.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.4.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "64abcff1f6a828f854e54650b106326dc328fab6"
+SRCREV = "6170b71ee6f2cd64958fc7a14e6f04b36f523d90"
 
 
 inherit cmake
-- 
2.43.0


