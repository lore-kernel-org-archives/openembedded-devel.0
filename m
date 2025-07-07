Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4ECC83F12
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.55568.1751879234028344688
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WH6a6RmB;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879241; x=1783415241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VgQjvtysUlme4yrkgLzGm9gW0BvRjRa/4SZLGRXB2UU=;
  b=WH6a6RmBf9ZfkAt3LyOMdTJS6Xywq7f9tuLGEkQNq2V6bwEE9GZZb1Nm
   W6fycsZkxdurjwM+u01PjtBk/7tZf8K/KJDZgV+PrvE0lSTbGT4LBL1TG
   vwN8wTzu4NXgwrbHhyiCwH1P07lQa3GGJHd9XiBYM0o7ySExiqg/0WM63
   zXCw55h3Ltn9+kT2cXdzyfupql3SrJ/13cwymLXKYfEGdXX2eL8fanMVZ
   lVpxwpfjosU3NEN5X9AUyDcSO3vskE+77FL4Q1qwIOkuqt6ddr7GPAD68
   10vlXXp2t3pJibFYtcJmRwtSAjhOX3Y9sOkTj0rDtCm8D4yWvCSv6oBPj
   g==;
X-CSE-ConnectionGUID: gNanDb+WRgC5NPgIt9rVYQ==
X-CSE-MsgGUID: vI5/G+3PSfqkbVohxkecBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="193452751"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="193452751"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:20 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 10A371000352
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:21 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id 8458F10001D8
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CF133BF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:19 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6554F1A0074;
	Mon,  7 Jul 2025 17:07:19 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 34/35] tk: upgrade 9.0.1 -> 9.0.2
Date: Mon,  7 Jul 2025 17:06:54 +0800
Message-ID: <20250707090656.1216-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118279

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/tcltk/{tk_9.0.1.bb => tk_9.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/tcltk/{tk_9.0.1.bb => tk_9.0.2.bb} (97%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb b/meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
similarity index 97%
rename from meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
rename to meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
index 504b40927e..fc2dde497f 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
@@ -20,7 +20,7 @@ DEPENDS = "tcl virtual/libx11 libxt zip-native"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
 "
-SRC_URI[sha256sum] = "d6f01a4d598bfc6398be9584e1bab828c907b0758db4bbb351a1429106aec527"
+SRC_URI[sha256sum] = "76fb852b2f167592fe8b41aa6549ce4e486dbf3b259a269646600e3894517c76"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"
-- 
2.43.0


