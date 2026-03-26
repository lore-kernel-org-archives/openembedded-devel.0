Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D78810A1E84
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:02 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45640.1774526220215564814
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r6FMPGOK;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526218; x=1806062218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1EOPhZz4esirmSIkIdJtsHxvcY7VtRUJRRlpZxb8Yww=;
  b=r6FMPGOK5oVkk3MXRx9niug4qhPoL0hI3ur+ILMhlmw1G2Taxo1ksxOf
   v+F5V8y54H2Rg6zWOPFhNlN25U2CfYtGVu6w/POeokoAHweniRoegkzJk
   SGhoBikBA7XDEEVD9XOgr6mEvMqppRU0e9vzWX2yYrpg4G4bP56sE21Fj
   tHDkGFK3wLTOmcD76ktZFQN3ie32acj70S7thB0CJk0hwdzHi06zt7P3J
   L8vBnQLPi4mblPXcT/U89CmiKZMYEGQYvUOW2MZ7O6ovHIUOwHo9wZkTp
   3N8HD9QA66bz0+dy0V/8tGvWJXNDJcv1Cd1AjKaxLg+oxjMDBi5ScW0JW
   g==;
X-CSE-ConnectionGUID: j6X+vj8FTlafixc3B/SYxw==
X-CSE-MsgGUID: R38nQAEISxqT1fagya3TaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="239063499"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="239063499"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:57 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BF9481002815
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:58 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7BC08181AA4C
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1F88E1807148;
	Thu, 26 Mar 2026 11:56:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/63] glaze: upgrade 7.1.1 -> 7.2.1
Date: Thu, 26 Mar 2026 19:55:41 +0800
Message-ID: <20260326115634.1199-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125666

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/glaze/{glaze_7.1.1.bb => glaze_7.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.1.1.bb => glaze_7.2.1.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.1.1.bb b/meta-oe/recipes-support/glaze/glaze_7.2.1.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_7.1.1.bb
rename to meta-oe/recipes-support/glaze/glaze_7.2.1.bb
index ef1f9032b1..9750253005 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.1.1.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "a6008aa05d26ab1653bda73235fe05629f7bdad0"
+SRCREV = "527b419fecfcc19261866dcfdf62dbf6e393970c"
 
 inherit cmake
 
-- 
2.43.0


