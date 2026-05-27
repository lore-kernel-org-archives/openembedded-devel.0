Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A758CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16910.1779875292896179250
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PdKMn/o0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875293; x=1811411293;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dOCkkednqHV8SeP/AHomdS/GDPTbIo85kuGp2C14i/M=;
  b=PdKMn/o05jdWF6/LBNfEE2H9p1lqqyWoZbZQBhrApPStGi6BkXGkuJTo
   OPh9/TlOYmWi2ziCS/Vbw+edd804F79NiiaoZUMalgh5l/bFpJyZ6QZpl
   DZcINNreNeVq+b9GaueFnadsS3RaE6hkH77xEb0VaTBaqe5o1hCH/QVMt
   0mdKhdOW0puhkyWLgipS31yuvX3A/BL6txvY9OzyvzRhpZcaC4Z96MNBD
   0gI0fysbKY4AAbcBmlNeKM2q+BonBkuUt4iymSW+u9YD+h2hcZgZJQIYJ
   2nF35oFs6KrgfOm2QT4U6nNMx8VJshskXgTuJFZLZAHEHeJpTCj8wawdL
   A==;
X-CSE-ConnectionGUID: j9CGo+98TKWZymyXJXAJ3w==
X-CSE-MsgGUID: YotsbfUaTyu+G1J6XXPnMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="242050268"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="242050268"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:11 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 17BD28204C4
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:11 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C316214003C3
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id C0AF782A2C9;
	Wed, 27 May 2026 09:48:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/56] ctags: upgrade 6.2.20260510.0 -> 6.2.20260524.0
Date: Wed, 27 May 2026 17:47:10 +0800
Message-ID: <20260527094805.2039-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127208

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260510.0.bb => ctags_6.2.20260524.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260510.0.bb => ctags_6.2.20260524.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260510.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260524.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260510.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260524.0.bb
index 19f4fd3480..93f63526db 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260510.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260524.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "76e4cc275815e0440afbf45a30d692e62729d851"
+SRCREV = "4a77f4e9fdbea8350b8d7b145780e2d9027bd083"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


