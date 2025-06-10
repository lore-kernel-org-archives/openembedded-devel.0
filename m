Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAD7C71148
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.77947.1749526420542438253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EValVYSF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526425; x=1781062425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ITM/u1j/hqRwVTAB2UKhL9zr6XUIvkcFOBsUJHIEd4E=;
  b=EValVYSF/WpkAO3II45B7y3LM3UiT428kgive3RszkShRdm4DNd9e9/Q
   frLHaM7XuNQd0iPo275l8uxvxfIXGDiP/MrZkioNYfyv75MTpCT5Ug2Lc
   eEkOrn/1oaalPl/D/3FExTIVcoS8YrFyeDIo/0ZiTJ/1+a7CG/GetsM+w
   9J7Kg+Rxv/kbE8z/vJDbpb6WZZ7y75t47Dfr3zx28c5pNSiIb37k9iP6h
   16fPsBt4ejpy+DkdphaDQlrPJyBBEuyWXU12YopeC8za8pt2kyMUqOfIX
   Llgi360tHNibuhYDwKxUuHfbPN4uwmKFLz+WX45JZOuF1Fu38QwkCQ07G
   A==;
X-CSE-ConnectionGUID: PDlAZyOJRWqTK5M831z93w==
X-CSE-MsgGUID: 5ae/cJzWSsCUxEhIVjspDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202196170"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202196170"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 86463D5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D664D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:40 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AA6B41A009B;
	Tue, 10 Jun 2025 11:33:39 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/64] libmbim: upgrade 1.32.0 -> 1.33.1
Date: Tue, 10 Jun 2025 11:32:42 +0800
Message-ID: <20250610033330.924-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117806

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmbim/{libmbim_1.32.0.bb => libmbim_1.33.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.32.0.bb => libmbim_1.33.1.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.32.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.32.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
index 5cc4f804ba..a4174e06e3 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.32.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
@@ -11,8 +11,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 
 inherit meson pkgconfig bash-completion gobject-introspection upstream-version-is-even
 
-SRCREV = "2bc1080292aae30000e808ec77d7a99b87eb3553"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=mbim-1-32"
+SRCREV = "e10df4b6b3edfe6a46d93f7f5f5cab31c29a7091"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


