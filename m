Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BC6C02184
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.16529.1736240519297393131
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gcc3S7Xy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240520; x=1767776520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2H0US8VQAK3Vrf0LHL58ZwlJJpzgRYdjzl8HUS019pE=;
  b=gcc3S7XyCXNAyvxn+vhPU/zqJTdyfy03vMr55OhFzu8vsOuEGejA/V8q
   GwwC+5VW0llcULrkfQurTHNXkt0/HIVfwhmLTgdt5FfNbpOutcGWh+qWG
   zOyLJvwVFN14sJJAGL7vFApmjN7NfMNSYDeIopD+jvzzzwNT/mqmRVlc/
   V8g/1PBeJJWChTqBIC3jenI6mcOyxAZ0kI9QMPYbjNJ7pOaY0Mc7ccO1v
   B3WWovidjOUuHbFmMgKDW2X1pOoMKH3Xsp4Gn4KoHe7bikPSsXn7r2wVY
   jOkLcVqjUylKq7CiE1xDfZ5YrJ+rYTdD1ulGKq7h27a8zMEfWTNmPW6eH
   A==;
X-CSE-ConnectionGUID: 4APpS6NrREqlZtkBbvDhow==
X-CSE-MsgGUID: kXsHuAUNQJaxlRJs7rUnWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="185841847"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="185841847"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A752D6EA5
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 69BAED3F12
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D87052235EE
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 818ED1A0073;
	Tue,  7 Jan 2025 17:01:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/18] composefs: upgrade 1.0.5 -> 1.0.8
Date: Tue,  7 Jan 2025 17:01:32 +0800
Message-Id: <1736240504-5315-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-0.440500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/ybcPsR57JkIzp+wtGYBuRS6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN194/5X9VfCzkwFzTzcgzhCDGLLbElle9cwh
	qloOj04qaThZNi5MBhALdToiFbgF6RY1tl9vG/AY7Cl8sx4HBG4LsLasl5ROhP6dilEe0WVOjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2bwxltKG7ptN1u7Ms28YkZpTJ0XNOAwg2b/w7WY8oKk1iUy
	Iwoh5UzHYJO1Uh0ZkwIwWov9hmK0TPRXhdYRbi0Fw+JcCBsQLYdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114684

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Relicense most code under GPL-2.0-or-later OR Apache-2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{composefs_1.0.5.bb => composefs_1.0.8.bb}       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/composefs/{composefs_1.0.5.bb => composefs_1.0.8.bb} (64%)

diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.5.bb b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
similarity index 64%
rename from meta-oe/recipes-support/composefs/composefs_1.0.5.bb
rename to meta-oe/recipes-support/composefs/composefs_1.0.8.bb
index 14133fdcb6..c1df5dce03 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.5.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
@@ -3,17 +3,17 @@ DESCRIPTION = "The composefs project combines several underlying Linux \
 features to provide a very flexible mechanism to support read-only mountable \
 filesystem trees, stacking on top of an underlying "lower" Linux filesystem."
 HOMEPAGE = "https://github.com/containers/composefs"
-LICENSE = "GPL-3.0-or-later & LGPL-2.0-or-later & Apache-2.0"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & Apache-2.0"
 LIC_FILES_CHKSUM = "\
     file://BSD-2-Clause.txt;md5=121c8a0a8fa5961a26b7863034ebcce8 \
-    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-    file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
-    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://COPYING;md5=5cbca48090f7fe0169186a551a5bf78c \
+    file://COPYING.GPL-2.0-only;md5=94fa01670a2a8f2d3ab2de15004e0848 \
+    file://COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
     file://LICENSE.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
-SRCREV = "098d985a1b9a15ac828d7b2382297a6955e31e40"
+SRCREV = "858ce1b38e1534c2602eb431124b5dca706bc746"
 SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


