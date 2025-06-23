Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A7DC83027
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13875.1750662713507588128
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kn5CqbHe;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662713; x=1782198713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u4WkC2tI6bmLNwn+7cl0aSifXHifm85bQ85hVULhPjw=;
  b=Kn5CqbHeDZ04Wyz9DXQXL2evh9VsepQ9OKQeqk6kgvXdlYKRKbd3oh15
   uHhToIiEepQ0GlLEhELNf/baSBIrj+ZEvG5p9JTqNTs1Y08Bojm4pwlvp
   JHWSjNXwA53+Wrd+uoaKKjyJmSJD+Bf8+8zYhhhbVnGl9kVDGSxsbihfr
   9BsiJAMuXu6WketoNtw52fm4EUyNqQSDw+ccdm9Ph+nMM519iyMdYYc00
   fpVv8VGwsnL9CC6WVAS+mzRz92+brTiVrmkQejP6sfOL0hlW/Mmqp5UMN
   qplnVXS3oQGnrZLPpilzIQFNx/42zgg1+wLKRQq15f6QB2xpGXjYKo405
   Q==;
X-CSE-ConnectionGUID: cWmY5JyeTEibxlZtIE9z+Q==
X-CSE-MsgGUID: TsIjtcHIR9eBz9RVsx2Pqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="191575214"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="191575214"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:50 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CF27C9987
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 56DD7D5E22
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:48 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 08E361A0073;
	Mon, 23 Jun 2025 15:11:47 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/30] mm-common: upgrade 1.0.6 -> 1.0.7
Date: Mon, 23 Jun 2025 15:11:14 +0800
Message-ID: <20250623071138.402-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118037

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 - signature "Ty Coon" changed to "Moe Ghoul"
 - modify the whitespace

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mm-common/{mm-common_1.0.6.bb => mm-common_1.0.7.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.6.bb => mm-common_1.0.7.bb} (78%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.7.bb
similarity index 78%
rename from meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
rename to meta-oe/recipes-core/mm-common/mm-common_1.0.7.bb
index a252a6b48e..cb1b710954 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Common GNOME build files for C++ bindings"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
 
 
 inherit gnomebase
@@ -8,7 +8,7 @@ inherit gnomebase
 # All the recipe does is stage python and shell script, some autotools files; nothing is compiled.
 inherit allarch
 
-SRC_URI[archive.sha256sum] = "b55c46037dbcdabc5cee3b389ea11cc3910adb68ebe883e9477847aa660862e7"
+SRC_URI[archive.sha256sum] = "494abfce781418259b1e9d8888c73af4de4b6f3be36cc75d9baa8baa0f2a7a39"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


