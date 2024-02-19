Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF0DC5479F
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.37318.1708333362255109373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A2EsBKLg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333363; x=1739869363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=h4aKmE3ry5HIQ1vZvWTpITcwvoNWW9IacdAuelMzVv0=;
  b=A2EsBKLgnD6pt8uEvF/AftQZb424A/LMA6Aj5yeR1lleyPweo1CR6oto
   5h2Mwt5A1pB2+zuCd/aBFYpcp6cGqUdRNswZ75T5Z4ZEHw23Lt1DtulM5
   GTqLBF9jeIWbLE4ct/ylq/IMr5FfR6Y2KPF5GcN2ulSoqFIiOhigK4sYX
   u9/CukQyaZ3Etiig3JfjTW1qYZZtBVbPBtvGFTdLqEl922NlmV8dbl1kt
   67+qNjeAn7b2ifSEoU+m20OKzOwe5JGqqnBAdfcHpLbopHni/ZIPfYRNa
   NgyBkFw9s8Bi2ePuq2X2WIYKJEIPGlMzG0EbZ3clkbwkNvRCXZvn4872N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="149230091"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="149230091"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A3F68D4181
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E37B8D9682
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 721A71E9CA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 216901A006B;
	Mon, 19 Feb 2024 17:02:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 04/23] gjs: upgrade 1.78.3 -> 1.78.4
Date: Mon, 19 Feb 2024 17:02:07 +0800
Message-Id: <1708333346-17704-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--4.877900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrC//1TMV5chOysPB8dBBorYIP
	FubbBVyAoTssFGSH7W3mn3xyPJAJoh2P280ZiGmR0NA+DE6YXwQEa8g1x8eqF/uzwJAEkzruvoJ
	CvQiX3/Ismgs5IfYoxu7Ycd2lqkT2KvpeBUgcW98dZEkR8Y/meVXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZL0ZNjkAQjnXZLSjVgKk8MmT7h7d26nqiB1AsGlG22ET5AXy
	TJrYkmBypA81DzQHw5SVJCXzj/t1TbZqY408SquGgFaHl18xLRLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108849

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 package: Specify GIRepository version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.78.3.bb => gjs_1.78.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.78.3.bb => gjs_1.78.4.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.3.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.78.4.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.78.3.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.78.4.bb
index 59d0a7b87..c1d1948d6 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.3.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.4.bb
@@ -7,7 +7,7 @@ DEPENDS = "mozjs-115 cairo"
 
 inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "42d50364caa5d792c76734fe5bbcc4b9dbb48819da20a4060061e8b9526134a4"
+SRC_URI[archive.sha256sum] = "9aec7ab872c2050404907ae94f0ae7abec8a54bd9c894ddb5c2d0f51e932b9a1"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.34.1


