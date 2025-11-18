Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91103CCD19A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:08:58 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8419.1763456937352390531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Av5hAO+e;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456938; x=1794992938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yyKD3nNVeqUcTG9GeL5mUVGo+G272OF8ew2QX2mZ8U0=;
  b=Av5hAO+edd6PofdhpaXOxhesQm0HpvrMkf3bREYTANGbcxi1tS6gAC/s
   +f0+8GlFsCL7Vg3djrSsEqfeIc2NJyrZMXA72MawaNsJXhFKD9iy/tEza
   d7elMrJiaiaPegXlDal/AYSr/eh+ODOYBha+S9STwAOqvF/c6KCUhEiTK
   n5FdC3xwk/3lRJ4QDXzYuMPY22yi0cekZl6EDpPRlU/6BziaPXQkV2lm7
   hsho+At9E18D+RJsBegK/L9zmrIaq4QkYD5rs2z7ogVFHEn76M1g2tKbw
   D/QmNBwy3USBtOUjvPwxOTkcjPYKfd3C/uoHzPfzHhOuP/OawQMd+cpu7
   w==;
X-CSE-ConnectionGUID: /1T2oSG0RuyLdDhibUqMlg==
X-CSE-MsgGUID: MaIBGWvXRUqUdswqPZf7pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219006552"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219006552"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:08:56 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 7ECCC82008F
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:08:55 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3705F140037B
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:08:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id C693014002EE;
	Tue, 18 Nov 2025 09:08:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/29] ctags: upgrade 6.2.20251109.0 -> 6.2.20251116.0
Date: Tue, 18 Nov 2025 17:08:19 +0800
Message-ID: <20251118090846.1484-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121813

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20251109.0.bb => ctags_6.2.20251116.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20251109.0.bb => ctags_6.2.20251116.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20251109.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251116.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20251109.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20251116.0.bb
index bd6f5bbfc0..c0a4c58779 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20251109.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251116.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "d8622b79321eee26e91ea8db12d97e0f1a406670"
+SRCREV = "6a5177de1cef89ad03469387b188b74d0acf4a02"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


