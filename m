Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F08C02190
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.30504.1735032439941691626
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S2dlYC+D;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032442; x=1766568442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=e8VKoudlueH4G/KXdaYh5KOGUoGPcLA5mTa9xdRomto=;
  b=S2dlYC+DsUxC0+coefuI0aE+EnCWWof7d3Sr8sb9EZR+vyvutneO1Rmc
   7Or6GWhYS/Pz6K13SJZJskYQ/1AhGRqC2xgJKSvFCHNiLa9wix8LIjAAA
   KOdw+DEZ1vN6crYfKp9e2ooOPQO20E2RKWO7D8Li4yvaQh1C+8lZPJdAV
   y/RoyZDENIdz262XaJwgd+0Qh1ydDxaU5rhm1xeq6rBcPeo+jxwhNwrVY
   taz8/cYVNPz1OintPO2tomirxRwo6A7OXt7yY05cgesqf4GNHkg6yE8fy
   laAsRKj6wyQWyBt8O2R+Ca0XKxEFKEk2TePLd8xo3ih0bK1UfEAZySiyD
   A==;
X-CSE-ConnectionGUID: 83HbQ0plQxST44eFMLQQQw==
X-CSE-MsgGUID: B8qsspa4TEGgGcWf3yptkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184809905"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184809905"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:20 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C86B9D4807
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 98063D5B43
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FB286BB6B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E99781A0071;
	Tue, 24 Dec 2024 17:27:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/67] python3-coverage: upgrade 7.6.2 -> 7.6.9
Date: Tue, 24 Dec 2024 17:26:10 +0800
Message-Id: <1735032421-13513-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.197300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr03xBnOuzTcxSdNfkgQaogDnG
	P45Axioi4aVNadEQBHMNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7U9a
	6zfLFA1bss9r//dw7twYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2i5u
	/VvsFaHcqocGTBR9IVsZHAbiQL3F0ZhXRRzozz+A26S5hrHHy9kwOaKHvAxZCzG+475luwDIr+N
	7p/jhyaalmMOQEI/RJYmVT38f1TMvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114488

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix: Tomas Uribe fixed a performance problem in the XML report.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.6.2.bb => python3-coverage_7.6.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.6.2.bb => python3-coverage_7.6.9.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.6.2.bb b/meta-python/recipes-devtools/python/python3-coverage_7.6.9.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.6.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.6.9.bb
index c87cfdd164..c5ad72b5bf 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.6.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "a5f81e68aa62bc0cfca04f7b19eaa8f9c826b53fc82ab9e2121976dc74f131f3"
+SRC_URI[sha256sum] = "4a8d8977b0c6ef5aeadcb644da9e69ae0dcfe66ec7f368c89c72e058bd71164d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


