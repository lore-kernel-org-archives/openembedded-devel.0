Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5691BD44003
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.36710.1731922207111980736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R+wTNUK1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922208; x=1763458208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pgc28dVthOtqhpPevZq553nOytvlBww2WcxCTOhhS3I=;
  b=R+wTNUK1QLpZOTdEg84V60IjKlK7LLYGEgY7G/vZUWIWkuDydJboaYBN
   Q7lORSbnbrEppWA9BMN9IYHKj5QNkSfNo1gNSFvVjslvMaisGqGtqS6IT
   U121OSbSy7QRYMZe1MPsxEsgHBBPUssqp69KoGRq89f0O3ITSEls8MZ1P
   o5b/Zj5y18d1kdcqpKFvICpzdCgW/kznXTy91ok5YhdFDtXcJ1E3DKEYt
   yxwCZDt3lyAd9VIRjqgJPep1d/m2rWnwfnWQ14KPP1otpfyitpEbJD4QK
   uSo6XIrw4FPsB+qsyAvodu8+id4a4v84XDXmEe7lYPcuCk5b9Xlk3gQTe
   A==;
X-CSE-ConnectionGUID: E669aFylSeOohsJwRFy2lg==
X-CSE-MsgGUID: /t3l7mbbR0KoPXZ6kKKP1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180826427"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180826427"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:06 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 563F796741
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D8862D0900
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D63820071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1D4CF1A000B;
	Mon, 18 Nov 2024 17:30:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/32] graphviz: upgrade 12.1.2 -> 12.2.0
Date: Mon, 18 Nov 2024 17:29:26 +0800
Message-Id: <1731922195-5266-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--0.675500-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGF3vqo4Ydbl4s0T0PE+KHuUEa8g1x8eqF/Zl9pEUBjhN4nP
	T8jZv1NHi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFBc2LAf7MFbZgu9mN3AVvBvwGt
	Ue2RMGeU46YREJRUnGyGoesXOns0HaBqkEFNFq5NpYF0vOih38pv5XUE3jg1SOkgJJkZjnF+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113869

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_12.1.2.bb => graphviz_12.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_12.1.2.bb => graphviz_12.2.0.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb b/meta-oe/recipes-graphics/graphviz/graphviz_12.2.0.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_12.2.0.bb
index 36c434c51..eb1cf8c55 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_12.2.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "cf9e6de9d5949dffbc4dd46f833085ff8e7e55482ffb84641819bbf0d18c5f02"
+SRC_URI[sha256sum] = "66d4acc201536a378a28d5254deeec8cf3e98cc66d7e4cb1cbfa5fc620f86474"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


