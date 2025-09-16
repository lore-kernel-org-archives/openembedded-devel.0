Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22D5CAC5B1
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.15420.1758015723034496813
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YLX9TMvq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015723; x=1789551723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5MPHMXxxHV4YXz2RcXyyz1YlUF0rkD6caD1ptpztGYk=;
  b=YLX9TMvqIZqzL+4ImPEyb2DMv9bPdg8TwinkrDbhf3KHfnOeBXvQEiSh
   a0Ij/sJvDej69Nu+zyNK3ltGr8IzzxstJPVYSe8YiO1S5RIeerJUu3kSA
   Gbgm/eRzExUd9YjDbM1f40fBEiAoOCkvpMo3zlSAnZFPp3kqGPY1NBKC2
   W2sn81EWgMZ3mV/afGEOeyBPc3pdIa0n9qkhW2yxkXLCAV7H9+mRa5XKD
   ge8zoicHYjR4e2TrJldEQoWUHFHhJb4a5JhVxkmE9c0qnVQEhx///RitK
   3DJoUnzjjtEpqRDts3zJnVoBmhp5h1xSYvFW5LdDoOxFILexDnvxlufli
   w==;
X-CSE-ConnectionGUID: rAEeXG7ORDK8IzuGIoBmRg==
X-CSE-MsgGUID: GyWBHFztSeuwQ5FPonzohA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="212934941"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="212934941"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:01 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3A22B1000344
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:01 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E8D2B100038E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 3EB3D1003119;
	Tue, 16 Sep 2025 09:41:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CA2321A008A;
	Tue, 16 Sep 2025 17:41:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/42] ctags: upgrade 6.2.20250831.0 -> 6.2.20250907.0
Date: Tue, 16 Sep 2025 17:41:13 +0800
Message-ID: <20250916094152.1479-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119424

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20250831.0.bb => ctags_6.2.20250907.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20250831.0.bb => ctags_6.2.20250907.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250831.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250907.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20250831.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20250907.0.bb
index 98bae15975..d2f7afa160 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250831.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250907.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "df6a390df3d96b1a0cb30edebdf8e4fcabd17cdb"
+SRCREV = "46d78a217f883e9d4e4110b496f47ed765bfc1f1"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


