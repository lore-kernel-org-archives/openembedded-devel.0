Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84111EDE9A8
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:32 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.18596.1725959011361026159
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F0EUwy8r;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959012; x=1757495012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a/2JIKSH0hU4gSdsI2IKr1A3d0ZWIMLpESADRn6nIyg=;
  b=F0EUwy8riLbxSUQEehcZeejRLb5baksQajcVU5+OSnQPNoK/i+GzQUmq
   JxW8A8EWpUvMyK9LN1PDVd1FZ+16gRUup+mn/1LvXFmvY+ixr4bdBNMKN
   BSW1kKQ5klmrjnfxX1bpy7McKmZoHwmGHwwXAuwJbc9ByTy3GiIs0caGN
   HS5BcT97bMMMwL1enM3AeyH/K6+oS16NQx7Krx/LIb6qDXeswOFl/P1uT
   C8WiLIWXM9ilPFvABqTCRkf3bunVPnAnTo/wuYNr6n5o01QHq9jl1C7Zo
   LybuLTSzyXBuf94e6wex+1AkdbvGkKkKyyx9HiAR9LoNNSEGqLSXw3MBi
   w==;
X-CSE-ConnectionGUID: s4n9cAguSnazC7sAs+5TWw==
X-CSE-MsgGUID: VugCW4xwQP2Py6eaY0xPSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="175314520"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="175314520"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 992A316B904
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E5DF0D3F07
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 77BC76BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2C06C1A000B;
	Tue, 10 Sep 2024 17:03:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/42] python3-executing: upgrade 2.0.1 -> 2.1.0
Date: Tue, 10 Sep 2024 17:02:46 +0800
Message-Id: <1725958990-5719-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-2.170900-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzXXbamj/TU5+LS
	dVP2tZn5Oc76VMz8CR97soXzkOVjzKXUs7kD79U2EhGH3CRdKUVkVbjOYX5AQownGKAoIKJLAQP
	+5JV1VlpZC4TREkQ9IvQGbqNR6w+D8VPT7FT7X/xtN2GsBybzwjgN1uze3QYJk2HKxx03ay+k86
	uMB98iNn3Qrrs0OwwY82tm/1wVYZ89yaX9R6Z4NWvOwg12ikVSNpy6NoTePCGU8ftiyKjZrdMjj
	wb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIqxB3
	2o9eGcn5nEK1i0sFvilb8yR9gyqsQHXEu7YToDKlanwjG/tMzUeq42F+/hmLQ0NUGrL2z8ldBug
	zg9wDb8kjE9v6X7/zUQcL/T/RJk02h621xUWo2/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112207

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- add 3.13 to setup.cfg classifiers
- test: optimized test preformance by moving deadcode check to the end (#89)
- Catch exception if node is in unexpected statement (#84)
- Merge pull request #80 from alexmojaki/3.13
- doc: review changes
- fix: removed unused verification
- fix: handle __firstlineno__
- refactor: review changes
- test: skip module tests for now
- test(3.13): added sample_results
- fix: skip files with raise an recursion error in 3.13, because the recursion limit has no effect
- fix: allow to LOAD_FAST variables for TypeVars
- test: fixed tests for 3.13.0b1
- test(3.13): handle optimization of not not x
- fix(3.13): a type variable can also have nonlocal variables
- fix(3.13): COMPARE_OP maps always to ast.Compare
- fix(3.13): a async function can also have nonlocal variables
- fix(3.13): a lambda can also have nonlocal variables
- fix(3.13): handle CALL_KW like method calls which are only located by the end position
- fix(3.13): loading of __class__ is mapped to the last element of the class
- fix(3.13): handle STORE_FAST_STORE_FAST and similar instructions as known issues
- fix(3.13): fixed typing errors
- build(3.13): added 3.13 to ci workflow
- fix(3.13): added new rules to the verification
- fix(3.13): show_caches is deprecated
- fix: backward compatibility fix for changed source positions in 3.12.5 (#82) (#83)
- Add many_calls tests to EXECUTING_SLOW_TESTS (#78)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-executing_2.0.1.bb => python3-executing_2.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-executing_2.0.1.bb => python3-executing_2.1.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-executing_2.0.1.bb b/meta-python/recipes-devtools/python/python3-executing_2.1.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-executing_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-executing_2.1.0.bb
index 3ee1e66f9..4df84e638 100644
--- a/meta-python/recipes-devtools/python/python3-executing_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-executing_2.1.0.bb
@@ -6,4 +6,4 @@ DEPENDS = "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "35afe2ce3affba8ee97f2d69927fa823b08b472b7b994e36a52a964b93d16147"
+SRC_URI[sha256sum] = "8ea27ddd260da8150fa5a708269c4a10e76161e2496ec3e587da9e3c0fe4b9ab"
-- 
2.34.1


