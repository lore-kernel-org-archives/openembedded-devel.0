Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC61D68BD5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 01:43:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72430.1766367828065821962
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Dec 2025 17:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eC8jV9h/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766367827; x=1797903827;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EOg9lY2TnElg57BhXgM8HCD3EwYeMSqKHY0Ks/G+igs=;
  b=eC8jV9h/SDsTNkVDxabJ++2qrIe4H1COb3rOi9llnmhLWb1sv9k3ULk1
   1Q0Py87om4hJG274cSI/YjHrb+277rUJRukzYDxrH6FVTSkCfVJrOHE/5
   h2wpmd/HQV0lMwmzMMNIg4uLRHu/tIWMcwQs1tbmNC/6b1zmzEIeSVVFZ
   cZqjdyTJigFFJdAP0GIUBwhADqaizZxPBPFn6cyWl2czcRCVXngXOOZC9
   o1ZknKDApp3fT9ol8TUuMIbQvgInipxhwCI8I5/20eVnad+eTuAploB+V
   9Al77yykHKdQl2+v5rT3U/Q2Wyop6CD7YAQ28LUghwtrqMhtCezRWGBuB
   Q==;
X-CSE-ConnectionGUID: hgOOiYagTISQTbzzIMAwrw==
X-CSE-MsgGUID: o991aV9JTJCFx5G91qAvDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="211363970"
X-IronPort-AV: E=Sophos;i="6.21,167,1763391600"; 
   d="scan'208";a="211363970"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:43:45 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 174B41000349
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 01:43:46 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BF0711C00292
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 01:43:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 11C4A14000CD;
	Mon, 22 Dec 2025 01:43:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH V2] fluentbit: upgrade 4.2.0 -> 4.2.1
Date: Mon, 22 Dec 2025 09:43:39 +0800
Message-ID: <20251222014339.933-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 01:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122782

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fluentbit/{fluentbit_4.2.0.bb => fluentbit_4.2.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_4.2.0.bb => fluentbit_4.2.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
index 2c9b874e50..4ca8c5ed77 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
@@ -17,9 +17,9 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "6bc014390c5485b96521c56b98369b44b9faa08b"
+SRCREV = "909b1a917b4f46c40657a73821541fa03581a823"
 SRC_URI = "\
-    git://github.com/fluent/fluent-bit.git;branch=master;protocol=https \
+    git://github.com/fluent/fluent-bit.git;branch=master;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
     file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
-- 
2.43.0


