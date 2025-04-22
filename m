Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F35C3ABA1
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.35401.1745311778032268725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DiqJYxH3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311778; x=1776847778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bTS8hWdVP2WzBqS4nb35RW4mRIjBst0oyzsPyYvZ0x8=;
  b=DiqJYxH35V1/x7ZJro2vInP0ZI7FK/epXrQ/2e6Qpk9u0wDAEckoe37u
   0mYxWcby6a13DYGxU0T+erWz3WuBPGkUw3k57lhDybD6PWj3jjR1DBvW1
   Y1PrgCx+dehHbTWz6VOYjHyOqAno7soJybEwb63Qqho3vrUl8ufSd1L5b
   Y5Z/2sqmMgn4e3w5s5mJVrrwNu8AfB3K4/HpGwCZ9B7ETWX5BOjp+/qzl
   hsTktmzd5XVseMVrPikcsjcGAN7QiMJW2rMoENCpnjyqaZJBj3g1rohXt
   /CxO6hx9w4idFsW6vtgBY0R8SEQUMrbOKg3YVb/PSm8qqKTOl03zHpphz
   Q==;
X-CSE-ConnectionGUID: jCdK/pMNQMqkMd5krQwCRw==
X-CSE-MsgGUID: 5cUmxVmiTJuJkvACnCGfHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="196484803"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="196484803"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:36 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D4AFBDB61A
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 949B7D8B3B
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:33 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B2C81A009B;
	Tue, 22 Apr 2025 16:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/30] python3-nanobind: upgrade 2.6.1 -> 2.7.0
Date: Tue, 22 Apr 2025 16:49:14 +0800
Message-Id: <1745311761-1912-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117038

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nanobind_2.6.1.bb => python3-nanobind_2.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.6.1.bb => python3-nanobind_2.7.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.6.1.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.7.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_2.7.0.bb
index a48c17c57c..3cb75cba09 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.7.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "e05c6816a844aa699e46408add3bff8c743af9fd3d38eafa307a73633fddf94e"
+SRC_URI[sha256sum] = "f9f1b160580c50dcf37b6495a0fd5ec61dc0d95dae5f8004f87dd9ad7eb46b34"
 
 inherit pypi python_setuptools_build_meta cmake lib_package
 
-- 
2.43.0


