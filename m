Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F95E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.58742.1735543848832504524
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f/nJujah;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543849; x=1767079849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kGlIvYgWPQEllZX0MBN7Fps/1hBND4nnZzvMS45RKzc=;
  b=f/nJujahSU+G5jIOEG5Om5Aomo2XBBjfAhDOm6OJoryXQVIOK8wt5yNm
   h7vL93C8B2n7fSJpPiaIpD+f84llM3Uagy38h4u6JmddiaFsoY5mdn28q
   iLT2cP59rst+4xYsW2gIM6iZ7LzuW/UfMwbkLGYFDGQcc0OYgdRt0/vWo
   9xhWQ+Q5e5m7hmj7HXqjDtLYLCGcqLRiD+vA64d+Hntk3roB6jGWPF7tD
   6YZ0bnrpY5kdJh5TVbz1SGi94juKBroBT6DqHB4L78X3W64Ro9u+k3Taf
   +DlqfVkjhP6VKPE02BQjpQrD3ZNIsMz36JU5dxqY4lFtP9N89s2TYrBC3
   A==;
X-CSE-ConnectionGUID: Ge+Vt1llTGmRlzzDLBLbng==
X-CSE-MsgGUID: PtUZ0NNrQF6ScD0AhEGO1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="164216971"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="164216971"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:46 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 84FB4D5011
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 518A0CFB96
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E01DD20074EB1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:43 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8CF0F1A006C;
	Mon, 30 Dec 2024 15:30:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/18] python3-kiwisolver: upgrade 1.4.7 -> 1.4.8
Date: Mon, 30 Dec 2024 15:30:29 +0800
Message-Id: <1735543836-2512-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrX40+5NlxyAwdv+ydygFTDQ9kkjNB+N0emvTf5qm6/1moMoxz6K+fZ8QsS
	ZzcBZE3ph3oFNbVqepofN6O8s4Yhx/Fa4pwNaobh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114590

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-kiwisolver_1.4.7.bb => python3-kiwisolver_1.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.4.7.bb => python3-kiwisolver_1.4.8.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.7.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.8.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.4.7.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.4.8.bb
index 9c422490ef..d3044a65c8 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5f7ce5ba663b186ce35b78df96a2eb0a"
 
-SRC_URI[sha256sum] = "9893ff81bd7107f7b685d3017cc6583daadb4fc26e4a888350df530e41980a60"
+SRC_URI[sha256sum] = "23d5f023bdc8c7e54eb65f03ca5d5bb25b601eac4d7f1a042888a1f45237987e"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


