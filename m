Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58851CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76497.1781000966146332942
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LvJIRlkN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000966; x=1812536966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nCFP5rFm41iLtHKnhk3GiGEyzfklpjmgphUdnnpb9Iw=;
  b=LvJIRlkNQdGtwRPtEM74Mpbu2DXdSAIWdEOFHLDgKEQDIRCI6Tk+GFlj
   ioBBOWPqDu3uXBhzS8ACW+N6k+Ec+3hLrI05XZjUQr64R2beXdWC5e8BY
   BAG7NjmGjNHHz993u35M8QrO3R5X73310ZuZRvqYRS39/h9H/MHz61AG5
   46w+Ukq+mjGQpxuIq6kruwGUcYl3wN8q7vneqbkxf/y2bpOCxl0zRHCpC
   9U4pYoX3/pHY33teDrvnSEuFFmZ65hlegZ6Cb5TWG6jSPXIf8jr30bb7c
   70XuqMXn3MaQxTgRiBKZ/O4RaqMWWEPoNdiJ72OPAQ9cT9Z0wYQ2BkW1Q
   A==;
X-CSE-ConnectionGUID: NzOfuB6iSk6Auzp5Dpq5tg==
X-CSE-MsgGUID: tyH4XQmPSpSsfrcEicJ8dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="231500919"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="231500919"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:24 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 483B61000340
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:24 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id EC8721C0094C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0347110003C5;
	Tue,  9 Jun 2026 10:29:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/30] ctags: upgrade 6.2.20260531.0 -> 6.2.20260607.0
Date: Tue,  9 Jun 2026 18:28:45 +0800
Message-ID: <20260609102913.2204-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127456

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260531.0.bb => ctags_6.2.20260607.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260531.0.bb => ctags_6.2.20260607.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260531.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260607.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260531.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260607.0.bb
index 195b8b850e..0d0604239a 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260531.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260607.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "5a1b5c54579fb749e96918be009a3f5c611d6d03"
+SRCREV = "0361a1da51a9cb680732451ab0c35c41bc914bda"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


