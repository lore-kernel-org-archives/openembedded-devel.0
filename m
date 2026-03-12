Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585D3105A57B
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:00:19 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18638.1773313207346057228
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Am68fRyF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313213; x=1804849213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SSsfbr0hwq+Filf5iROKGmVuBvUXV06mxcxQiZi1w8A=;
  b=Am68fRyFA3G3wMAFANXsMsGW64+tf0vCZEChjOrDv3bKUA0GPe/jEBbX
   5kc+0R76MS0zx/TJ8GU5vAV36MVnao0IGeUH/ZpmXexAKJ08EJYqMN0zZ
   3SmzedAuJ2TVXJJzZBoXfHq6P8NW8gvNE8iCmyaoeGLBkjBkXQkI46a2R
   dSI1deJ5xLDGUcD5IyVMGj1h5kOioKQNU/uuvDEcXdr+QEX3AKMDWCjyJ
   OPeqq1jqKac5O7fE2zaOf3Nh4ZEK8WCW1HvUYIuPQAB2wVONW9eYMZ9Xv
   QBmQm5GlUDNY2jm/mj7KuQXWGCrRA2ieR2G/3/6QijgC0E9KaTf+xGow7
   g==;
X-CSE-ConnectionGUID: A0c+eXtaRLeX0nthbZcxnA==
X-CSE-MsgGUID: ndX2vPJTT0SIfhx4hAuswg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232426047"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232426047"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 20:00:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6CA941C166D9
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:12 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 20459861263
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2AE748288EE;
	Thu, 12 Mar 2026 11:00:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 63/64] uftrace: upgrade 0.18.1 -> 0.19
Date: Thu, 12 Mar 2026 18:59:39 +0800
Message-ID: <20260312105940.1900-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125162

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uftrace/{uftrace_0.18.1.bb => uftrace_0.19.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.18.1.bb => uftrace_0.19.bb} (96%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.18.1.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.19.bb
similarity index 96%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.18.1.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.19.bb
index c84b992af8..cfef1851a5 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.18.1.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.19.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "elfutils"
 DEPENDS:append:libc-musl = " argp-standalone"
 
-SRCREV = "6d006b71ac32e28b7829cc21ccc7bb9c10add964"
+SRCREV = "de15d0cf2730eedae1685d214f54b352530d1aa4"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https;tag=v${PV} \
            file://0001-include-libgen.h-for-basename.patch \
            "
-- 
2.43.0


