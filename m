Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E541AEFD21C
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:37:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41944.1772012260775219448
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rQBiZI8S;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012261; x=1803548261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dpnXg27s6mV97IHhqepgSqrtnLuVu3pnGyfcT+ZLzdU=;
  b=rQBiZI8S9qAzkuu8FQcqGv1nKlW14UgXeevS3U+JPp4WCro1TVYVdK6Y
   z7q+vomoD7Xr1PqQwEEC5MiZ1E0E7I1nwGXBKk7rHCMt7ZpEWGAbfKDeW
   18SB7zsH6tU8/sR4gat8SHRA9d7EO2aIHK1+bBSQzfYzFG4pWD0ZXvt3S
   5Vm/w4JtzREmnSQX5M+hAUEC+XwFfVFSUb8foIKU5tKI6C7Httoas/Fcb
   utLqI0cildCo3VOLd4G9bSholmZN8rihfBzCCPTxmom4/xtsZ7R6O9Wkv
   Amd55LoYhVvcyLI6AI58Hdh0HF9WBEAvdax/ThyH7S4mfzufckiLbvFBO
   A==;
X-CSE-ConnectionGUID: unkvb0KOS7ePGKQhBF6AWA==
X-CSE-MsgGUID: d3j7DB5uQpGgyK8F+Q6GOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="209984544"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="209984544"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 29CBE100036A
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:39 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BFADA8D2067
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E2B00101BB42;
	Wed, 25 Feb 2026 09:37:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/33] bdwgc: upgrade 8.2.10 -> 8.2.12
Date: Wed, 25 Feb 2026 17:36:57 +0800
Message-ID: <20260225093727.1284-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124615

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bdwgc/{bdwgc_8.2.10.bb => bdwgc_8.2.12.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/bdwgc/{bdwgc_8.2.10.bb => bdwgc_8.2.12.bb} (91%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.10.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.12.bb
similarity index 91%
rename from meta-oe/recipes-support/bdwgc/bdwgc_8.2.10.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_8.2.12.bb
index e611ffb006..2175c8c56d 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.10.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.12.bb
@@ -19,11 +19,11 @@ DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
 HOMEPAGE = "https://www.hboehm.info/gc/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.QUICK;md5=dd27361ad00943bb27bc3e0589037075"
+LIC_FILES_CHKSUM = "file://README.QUICK;md5=6cff3e88a9b200e8fc98595dc7419dcf"
 
 DEPENDS = "libatomic-ops"
 
-SRCREV = "2955e33aba7467d4777aa985637620f909cc2a14"
+SRCREV = "4fab5386df64466b2b61fc7209bef033cad1e6cc"
 SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_2;protocol=https;tag=v${PV}"
 
 
-- 
2.43.0


