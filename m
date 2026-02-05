Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C1CEA797B
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:37 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14217.1770268530274946219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gcY84Mlf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268531; x=1801804531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2bFgHR8/2j6AH2H2bzqEExmtMeErj2eJkcxwYJzBgP0=;
  b=gcY84MlfOfjC0c1StdeynYNdgN5tZ0RxAl0IMRrd9HXx/VRbwE7+sdJT
   Jyf4XBglScbxxadGGSts493TrvMPSZ5JZIgwbxQQwW4WWUNIekBxNG64a
   6IK5kdU8ZZBUzgW5SEdygihGEIMxofRDEoj0T3yBWyPVAt7nWKGAq/XRs
   5ugkf9N1BYxpOf7LidCW7fMeAy8iPpQmaTkvyRiIx7dX0kp0U4EvBcox4
   7i0epBaimeDeGFYzhgqDPsvBXc1d4/ZO3M2LvxQExDhI3Jak06Y5mUJ+x
   uaSpjyR6E917Uh+9XLHl/bdYs7PiHTbxzqxzeAu3CvftxJ7kkMTmrFWNU
   Q==;
X-CSE-ConnectionGUID: Ft0F6LioRz2M6q01DrUfSA==
X-CSE-MsgGUID: PdITdDs9R3CLgeIox/t55w==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228614889"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228614889"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:31 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 59AA94DD1
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:32 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id F0B31C0182C
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 53F7520000C6;
	Thu,  5 Feb 2026 05:15:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/24] python3-aiohue: upgrade 4.8.0 -> 4.8.1
Date: Thu,  5 Feb 2026 13:14:24 +0800
Message-ID: <20260205051435.1366-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124166

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiohue_4.8.0.bb => python3-aiohue_4.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.8.0.bb => python3-aiohue_4.8.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.8.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.8.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.8.1.bb
index ac20dcb1c1..d5adf6e0af 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.8.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "78c5af843c916affd8cd7efeddccfc6edd0cca288fe9909c21186fef03606cd0"
+SRC_URI[sha256sum] = "7fddc328add07715001bd3d75a37c730a5befcb4348b120c5259583fb9fa34bb"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


