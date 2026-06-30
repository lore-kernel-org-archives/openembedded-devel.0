Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4071C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16840.1782811335036781679
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UcsHH1+X;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811335; x=1814347335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tRwcHgyf7yKjaQVjmNucK9979OFjy6O282BLeAdnmqU=;
  b=UcsHH1+XuQgLgDo2evmqv0QQDXMe1C9QAjJagQp4qR4QlnULvUg9JIxY
   hYIyS3U/+IDMc4yrfb9uGAn7AaLUUNcX82sCFzigL0nWEB0iZQH13Wf47
   NQaWTMjmtH6H18YQIwwtXpUO30ftjZycX9giI551AEgA06+dv6ILmMeza
   vBGN/lIOcmS9tHdlduHU7MGrAZ2/gR+NXSo25ZzNfm4eD2qfwUIP3VC/x
   f9w0tmFvvOGt18RdNfRaOqOzDUUJySW1T9bt47aLsOCmXQG0Y04W4+b5R
   w1Jcvf/S0/gaFmnXhtpgxvajY1rvXbL8Get9ihBM3W2JeJVXgEz5y3v9x
   Q==;
X-CSE-ConnectionGUID: JT7AdzRkQXS6KydfHbjoJQ==
X-CSE-MsgGUID: l4x3oQtiQtG6BySwAmTvhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233776202"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233776202"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:13 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id EA81B82009D
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:12 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id A2E53C252F4
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B262C826FFA;
	Tue, 30 Jun 2026 09:22:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/37] ctags: upgrade 6.2.20260621.0 -> 6.2.20260628.0
Date: Tue, 30 Jun 2026 17:21:30 +0800
Message-ID: <20260630092206.322-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127944

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260621.0.bb => ctags_6.2.20260628.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260621.0.bb => ctags_6.2.20260628.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260621.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260628.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260621.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260628.0.bb
index 208e3e6ac4..16ba447c69 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260621.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260628.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "7cef08003487e3c87cb727f112c5bff793751ef8"
+SRCREV = "a6d973bf0994da42763b02f8b9b99be794e2149d"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


