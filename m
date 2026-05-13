Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F93CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:07:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75.1778645226283010450
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=keRz9LPD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645227; x=1810181227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IA1/v50BL3fKGiV4D9S443MHqRxlD7rRKB5t0/YNSGI=;
  b=keRz9LPDnqj8wzJhqhClYHNWA6aq4dqGIiqc/GJTkJ8oOWxgXTRnnydY
   i4mjVB+rv4SueVjwes+op3YpTOsJnsQIQFFHAEr78wrZ76BhusyKP0kY+
   ugy89Z+a1dyx706ygsYSx7OJHk1ZSg0C1VWWu3PvAUj0ZwzZ47axTSMRz
   /2G+CzjgIc/reBbukcgIuLuWppCOxBJx9aw2zWZCR3MLoAZyjbwBXb9fR
   jOBh8rDYA1Lu69am3oAM9mEngpA9U7/0qmR8L4Htec/z51Cl0wFiWyXGr
   JHVARceDdzuhTIhAWfQY9IccT05mrPR6xcEeFnwTpGsB1690Hef/lHewa
   A==;
X-CSE-ConnectionGUID: +o3cnkv4SOqYFu+imaDBlQ==
X-CSE-MsgGUID: RchbGqwGRXGLDLkTd+v72w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240256431"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240256431"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:07:05 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9E6201002B83
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:06:04 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5B9391401213
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:06:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id EA120140008F;
	Wed, 13 May 2026 04:06:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/56] btop: upgrade 1.4.6 -> 1.4.7
Date: Wed, 13 May 2026 12:05:01 +0800
Message-ID: <20260513040555.377-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126888

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/btop/{btop_1.4.6.bb => btop_1.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/btop/{btop_1.4.6.bb => btop_1.4.7.bb} (93%)

diff --git a/meta-oe/recipes-support/btop/btop_1.4.6.bb b/meta-oe/recipes-support/btop/btop_1.4.7.bb
similarity index 93%
rename from meta-oe/recipes-support/btop/btop_1.4.6.bb
rename to meta-oe/recipes-support/btop/btop_1.4.7.bb
index 29072522df..79e9a31e88 100644
--- a/meta-oe/recipes-support/btop/btop_1.4.6.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.7.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 
 SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "975e3951daa7d3114112d2cd4ee689cf5ee38745"
+SRCREV = "6e39144aaf5a6bc01b9f795010b0914431067183"
 
 inherit cmake
 
-- 
2.43.0


