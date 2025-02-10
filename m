Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26001C021A5
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.46466.1739178122227882996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SR7yRDgG;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178124; x=1770714124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jMmsajKUoxnjWpssKAejMHwq0XiNJOAiPm1I0QyH8m4=;
  b=SR7yRDgGU/pJ2Wz9eb8xQQz8X/EAbE6kBFyy3ccLS8lM5nqsja/ln6pn
   563TberaVcz9dR4aPh9ecbvdiuYySJEeAnyvDdJ/5ndtHjUEtISo0PdqD
   7gjHbj6UaTHsCpcBa5y8aRSNFovC1G3kKk9JyoKOLxWm8SKDyHW1foIQ4
   fxp9PRMhUPl1ywZmntVFaC767tgHmnra4kUjDYYWlEjIOz0t8m5gAXIb2
   Cv8mc8MXWgAjc0IynhU24Bk8DGoZy0bHw5R51NVtV38Xo4Sk2B7Pakgw9
   EKP28wH4BIuG/u0T8jIernFUHUU7a/3ZB5CvlWkE0d84jot9yS0hepbJJ
   w==;
X-CSE-ConnectionGUID: VPaGVIT7Tp+/6d8Z/qDWhA==
X-CSE-MsgGUID: MmMjkZXJSMiYd0+zBG2sDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168346362"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168346362"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:02 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C72D1D480D
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A01ABF499
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2FCD11A000B;
	Mon, 10 Feb 2025 17:02:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/66] python3-grpcio-tools: upgrade 1.69.0 -> 1.70.0
Date: Mon, 10 Feb 2025 17:01:09 +0800
Message-Id: <1739178095-26432-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115368

From: Wang Mingyu <wangmy@fujitsu.com>

0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
refreshed for 1.70.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tup.py-Do-not-mix-C-and-C-compiler-options.patch | 13 ++++++++-----
 ...ols_1.69.0.bb => python3-grpcio-tools_1.70.0.bb} |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.69.0.bb => python3-grpcio-tools_1.70.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 5366a1e1cf..439b337bda 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -27,7 +27,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 5e19b63..61b30d8 100644
+index 1a997df..86e3ad1 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -90,9 +90,11 @@ def check_linker_need_libatomic():
@@ -36,12 +36,12 @@ index 5e19b63..61b30d8 100644
      )
 -    cxx = os.environ.get("CXX", "c++")
 -    cpp_test = subprocess.Popen(
--        [cxx, "-x", "c++", "-std=c++14", "-"],
+-        [cxx, "-x", "c++", "-std=c++17", "-"],
 +    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
 +    if not cxx_args:
 +      cxx_args = "-g"
 +
-+    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++14', '-'],
++    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++17', '-'],
          stdin=PIPE,
          stdout=PIPE,
          stderr=PIPE,
@@ -49,8 +49,11 @@ index 5e19b63..61b30d8 100644
      # Double-check to see if -latomic actually can solve the problem.
      # https://github.com/grpc/grpc/issues/22491
      cpp_test = subprocess.Popen(
--        [cxx, "-x", "c++", "-std=c++14", "-", "-latomic"],
-+        [cxx, cxx_args, '-x', 'c++', '-std=c++14', '-', '-latomic'],
+-        [cxx, "-x", "c++", "-std=c++17", "-", "-latomic"],
++        [cxx, cxx_args, '-x', 'c++', '-std=c++17', '-', '-latomic'],
          stdin=PIPE,
          stdout=PIPE,
          stderr=PIPE,
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.69.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
index 76f5739f95..e295e0329e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "3e1a98f4d9decb84979e1ddd3deb09c0a33a84b6e3c0776d5bde4097e3ab66dd"
+SRC_URI[sha256sum] = "e578fee7c1c213c8e471750d92631d00f178a15479fb2cb3b939a07fc125ccd3"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


