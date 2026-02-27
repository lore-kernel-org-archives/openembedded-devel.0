Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F01FD531D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:23:19 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91781.1772184197943912409
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rjTc11Tx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772184198; x=1803720198;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Su/YoRlW3741S8EHqpi3GbAP/rqlh449aQlTtuxdH0o=;
  b=rjTc11TxCA7heoy1hd0/0G1vsHDU28ixKUqZ8tnT71ad7dy0WLKwM5Xt
   2WO0By3/8f9Oj0B6a36DuGSYR5cRBnyPhUo5C8RMUlY9x9kgoirM6oROY
   6l9mGleCW8Lj7FTHCE4TAYiDlpVJG4FaNnmTjEZIyEUsEjV6mIaLWirGV
   Tv0xDcMwQqKUymi0q5pbDrGuZV2OSqhSZtSVyoerug9+HDLTDPS9s2tWB
   JFOMrF2wGqk5equSGAkrCz2JFYhCwmQR5INq5i3UMHpikWn6bi6TbYzFW
   zvoqY+21X3TPXsUeoH/OUxXgDfmil2AeJ6pIzHixKxZ/JmXo8iPbDLWWJ
   w==;
X-CSE-ConnectionGUID: A9rLbM7dRq66kntppwlpPg==
X-CSE-MsgGUID: HyIRGGbzSyuiDeChfiscWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="235518435"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="235518435"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2DFFA1000341
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:16 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D0FB6180416E
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:15 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 7F49110071AF
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:13 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] brotli: upgrade 1.1.0 -> 1.2.0
Date: Fri, 27 Feb 2026 17:23:07 +0800
Message-ID: <20260227092309.1381-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227092309.1381-1-liuyd.fnst@fujitsu.com>
References: <20260227092309.1381-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124696

Changelog:
  https://github.com/google/brotli/releases/tag/v1.2.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../brotli/{brotli_1.1.0.bb => brotli_1.2.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.1.0.bb => brotli_1.2.0.bb} (90%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
similarity index 90%
rename from meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
index 411f8a7610..2a49003323 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
@@ -6,8 +6,8 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
-SRCREV = "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
+SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "028fb5a23661f123017c060daa546b55cf4bde29"
 
 
 inherit cmake lib_package
-- 
2.43.0


