Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0A7C369CB
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 10:24:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.36638.1745317491974068760
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 03:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QBOhHVsT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745317493; x=1776853493;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fGc96c3y/asW7e/Y+uKwZXIy+6Cmsf0mYsvyT/Js7f8=;
  b=QBOhHVsTH5r8yhU9PFsHiJMw2aOci/vv8kvVtLzungWL3fVSjaEhBiED
   zvv8y/vfeCae6rDGgALbYaO7I7nTh0dwijDs0AWnCSGYibtc6iNZu52V3
   mboIaWQ76k+rDxZeXxty4rvv60rd+up3B2/kyxvhVCfTsbm6nstjV0rYI
   qxSUw6BQ62kxlHm+2zw+84NSko4keH08XrrgauPcagus8W3wtg+FmhHUr
   +0FYzrsSz15EVn1YO/vcQNaUHPBF45xWm9Ykl0YKejFbDa7ooumP5hh4V
   Tcd24vIX4x3hGW0X3scYb2mUzvP0l4VieT0F9rTQ4BQFYZmlb7s7jZtls
   g==;
X-CSE-ConnectionGUID: ETdfNCbhTr6Ah4V+Gmg48g==
X-CSE-MsgGUID: fnGKjG8xTWqeMEmdpbrpkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="200141928"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="200141928"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 19:24:50 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A554D6EA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 19:24:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F960144EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 19:24:47 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 629401A0078;
	Tue, 22 Apr 2025 18:24:46 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-oe] [PATCH v2] mozjs-128: INSANE_SKIP 32bit-time QA issue
Date: Tue, 22 Apr 2025 18:24:43 +0800
Message-Id: <20250422102443.843-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 10:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117054

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
index 4b56a17f84..6bcbb13501 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
@@ -99,6 +99,7 @@ do_install:append() {
     rm -f ${D}${libdir}/libjs_static.ajs
 }
 
+INSANE_SKIP += "32bit-time"
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 PACKAGES =+ "lib${BPN}"
 FILES:lib${BPN} += "${libdir}/lib*"
-- 
2.43.0


