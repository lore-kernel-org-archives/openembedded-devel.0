Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2646EC3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.42478.1744017446860559298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ro2ASMWi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017448; x=1775553448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=s4307HUCbX+vDarDhLZq8yQf3jl/Lx4p+zZzkEjWxwU=;
  b=Ro2ASMWi5iiQf33OnYBSqhmViJo8uP7TIpaX80AYMCbidvOvN3tG0INi
   igBhrn58hb+mBwOpujBdI8im64hHTBJP/yvpl5W+l5H+vklD9+1GCAwWU
   8a07KXQkvMGJmro50OrbGwpr+RlcM4ZbhmchoSYEPqsnJvvCPuWA3uzVq
   in5W/gLzoVt8O7OAt0ozbxLlPJ+IMZ046tHMw/9GS6+ZiTQVs/doIB4Ax
   i1HdXdpqYhNfcNZmYTQHVi8wwuicgNTRyxtzZR3/klgMYXl+Jm8F0LEpx
   R+ClQ8bOwAK++t+M2WITFMGB0jzN3pMn9yC802wX6rqARCI0s2unm5nqo
   A==;
X-CSE-ConnectionGUID: n3wJlSKRRWSkoWCR8daciQ==
X-CSE-MsgGUID: Gk4/OpK0R8a5ZuzCQJv1vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="184053181"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="184053181"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:25 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F3ABD943F9
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BB1C6BF49B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B1101A0071;
	Mon,  7 Apr 2025 17:17:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 07/30] libtest-deep-perl: upgrade 1.204 -> 1.205
Date: Mon,  7 Apr 2025 17:16:48 +0800
Message-Id: <1744017431-22217-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116632

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libtest-deep-perl_1.204.bb => libtest-deep-perl_1.205.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libtest/{libtest-deep-perl_1.204.bb => libtest-deep-perl_1.205.bb} (95%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.204.bb b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
similarity index 95%
rename from meta-perl/recipes-perl/libtest/libtest-deep-perl_1.204.bb
rename to meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
index d7f6166b4b..7fbddad7fc 100644
--- a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.204.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
@@ -26,7 +26,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Test/Deep.pm;beginline=1817;endline=1826;md5=d3ed382cc19bae8ead6076df35a43cbf"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Deep-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b6591f6ccdd853c7efc9ff3c5756370403211cffe46047f082b1cd1611a84e5f"
+SRC_URI[sha256sum] = "42781e9943a7a215e662c4973b9feafdc019fd16469bdb849a8537ee58956273"
 
 UPSTREAM_CHECK_REGEX = "Test\-Deep\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.43.0


