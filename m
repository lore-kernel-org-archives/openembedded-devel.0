Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAC6CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19312.1779190793042212446
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iQgLs6m2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190793; x=1810726793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G+z7KN/8vaA+PBJdJqlLZ+5YIzG5s+65UK0FLyrhzcY=;
  b=iQgLs6m2ne014ESciieFmitk6oveigxid5d/OJx071V/IVGfj/xn8AfG
   tYnCHdXDS36s/ML3zfCbcPMK69/MCTGLnL9oaBsPf7sc0Bf5kOPcy1Cd4
   BnWuZI7avT02MakyjUqqH/X61MR2ikvXnhZVZw1dc+kqR0tL0PG+3ABql
   RdZ1T10r1izDr5lgUKLHa8gcyCCJxsvhn7MZzq/nppuCe3Qg4I7PBAuwS
   t3UUIsQ8bwm2Wqdo1vmvCcIBoA2C0eapjeMnZQAVfbfs8Rn1iio/gfls5
   lO3Dmd1Z1n7pnOQIzTcX94SFUzvcYQXklU4QY7yC6wdbeDwXCaI9mhbgH
   g==;
X-CSE-ConnectionGUID: W22Lrjx2Qc+FeFPxoNeYmw==
X-CSE-MsgGUID: 3h7jUyozTriRDEaLxOwTfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="240515035"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="240515035"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:51 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5BA9E8200B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:51 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1308984F48D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id B559F4066DE;
	Tue, 19 May 2026 11:39:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 12/38] lldpd: upgrade 1.0.21 -> 1.0.22
Date: Tue, 19 May 2026 19:38:55 +0800
Message-ID: <20260519113921.655-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127074

From: Wang Mingyu <wangmy@fujitsu.com>

 * Fix:
   + Fix out-of-bound read access when removing VLAN tag (CVE-2026-46433, #787)
   + Reject 0-length management address in LLDP
   + Fix race condition when creating the control socket
   + Fix FDP MAC address
   + Fix memory leak in the BSD bridge query path
   + Fix duplicate management addresses when merging EDP VLAN frames

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.21.bb => lldpd_1.0.22.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.21.bb => lldpd_1.0.22.bb} (96%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.21.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.22.bb
similarity index 96%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.21.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.22.bb
index 73f7ac68a3..635d54931d 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.21.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.22.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://run-ptest \
     "
 
-SRC_URI[sha256sum] = "5b1b0106079a0785b55e1be45cec40b66b41779f3ee6f1a8d2dbd75d389df091"
+SRC_URI[sha256sum] = "9587940ed2314a86774c5499f3dfb13a8eb86232a62d243a83a1f09886848e03"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 
-- 
2.43.0


