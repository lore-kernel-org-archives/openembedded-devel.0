Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9293C369D1
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 03:28:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.31977.1745292508505476495
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 20:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NRfcegdY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745292508; x=1776828508;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gpEFSsSoylrDE0IVUVXcJLi4ErFu6kAfLvu9WK2PsjA=;
  b=NRfcegdY+DC8nVJ7seE1MUHkFueD61LSGGVsX2qQVJt8iJHSMmGte4GR
   kG27Dzdm2qYoFmCpPusnd/Z6tuu9yyG7Bm7UZey96LasCIOs0zRSKPEoC
   tuF8elR9BALB6UfDUOMdjnxk90k1lHtBVmhvsf6LIkY+KHZ19sz5OIgRW
   3gmQbr/ASiy9po2/JU67Gftz9AYrgpeVRU7zQf3pYZdoDhmXoIa/p30gK
   7AMe06dDNjuvYrCl/Z1ScwH1i7sGlr7eXknYmF6QynEJls3leZEYH7N7G
   gw83p/oOhDj5CEZO9BPC/tq3Z5xsbvMFBtXs3FieDEVTZxhC106hCbvCQ
   w==;
X-CSE-ConnectionGUID: 5VEzcFFATEWZgej9p/MAWA==
X-CSE-MsgGUID: qldK/QMySVW67ggup03+WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197238883"
X-IronPort-AV: E=Sophos;i="6.15,229,1739804400"; 
   d="scan'208";a="197238883"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 12:28:26 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E610D6EA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 12:28:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C2422D3F1C
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 12:28:23 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B5B031A009A;
	Tue, 22 Apr 2025 11:28:22 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-oe] [PATCH] mozjs-128: INSANE_SKIP 32bit-time QA issue
Date: Tue, 22 Apr 2025 11:28:15 +0800
Message-Id: <20250422032816.785-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 03:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117015

|WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: /usr/lib/libmozjs-128.so uses 32-bit api 'stat64' [32bit-time]
|WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: /usr/lib/libmozjs-128.so uses 32-bit api 'fstat64' [32bit-time]
|WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: Suppress with INSANE_SKIP = "32bit-time" [32bit-time]
|WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: /usr/bin/js128 uses 32-bit api 'stat64' [32bit-time]
|WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: /usr/bin/js128 uses 32-bit api 'fstat64' [32bit-time]
|WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: Suppress with INSANE_SKIP = "32bit-time" [32bit-time]

It's a false positive warning that I have checked the compiling log,
"-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64" are really being passed to compiler

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
index 4b56a17f84..488bb0eccc 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
@@ -99,6 +99,7 @@ do_install:append() {
     rm -f ${D}${libdir}/libjs_static.ajs
 }
 
+INSANE_SKIP = "32bit-time"
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 PACKAGES =+ "lib${BPN}"
 FILES:lib${BPN} += "${libdir}/lib*"
-- 
2.43.0


