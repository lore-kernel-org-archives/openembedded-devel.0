Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D48DC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:55:23 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.3034.1657180517980427071
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Lk3lTL7+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657180516; i=@fujitsu.com;
	bh=Fn6CvqXVcA7lPbGaaJfH7za4uS4OLmxBsVa9qk77a8Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Lk3lTL7+lz4pFO0yurEuU2rvh3bCtK1iuyOU2Jc+frRXxySZeUGQlmlMmCDa2GPmj
	 xZUxjoI7VxEwYBe9Fxbr4xOWG6j6pUA/0Tv3V8shFDzxNvTJXgqd16UrrnStJqhM3t
	 SgBQDesJDuQMB5bRl/8OcnXe9NgvBDMntU5ghwyT/YCb4h9wrm8WmqSp24CUGejW1u
	 wV8HD6XKbq0lumpfU6PFEw6BBAL8wknbimyGkCKrcmKKmes4iHw/0cFdC1mwG1p3Ph
	 cNNLuRbucxlX6/5CqGdLCZiN9E+8CER5+1iDEdgUU9PH3TrWcicEY7AO0Ejvt+uyYG
	 BHAZnWVlE66DQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8ORpJs88Vi
  SwbvXfBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aCJT8ZC9ZJV9ydc5G1gXGReBcjF4eQwANG
  iTd/HzFBOFeYJB79PcYI4exnlHjwZQJ7FyMnB5uArsSLH4tZQGwRAX2JpbP3MIPYwgJBEqcuL
  wGq4eBgEVCR+LHdCcTkFfCQmPdIHqRCQkBBYsrD92DVvAKCEidnPgGbwiwgIXHwxQtmkHIJAU
  WJ2dOhyiskXh++xAxhq0lcPbeJeQIj3ywk3bOQdC9gZFrFaJ1UlJmeUZKbmJmja2hgoGtoaKp
  raa5raaKXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokRGHopxYlxOxgf7vul
  d4hRkoNJSZR3dc+xJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvIf7gHKCRanpqRVpmTnAOIBJS
  3DwKInwLgFp5S0uSMwtzkyHSJ1iVJQS55XvB0oIgCQySvPg2mCxd4lRVkqYl5GBgUGIpyC1KD
  ezBFX+FaM4B6OSMG8TyBSezLwSuOmvgBYzAS1eln8EZHFJIkJKqoHJ+Il7O9M2VwnvT4fOaeW
  ePNxeuehz3oW2mecYeYt2ekxmZpmYvIZZIf+4VPnkG/rzwqc1yLSL3/G1e8oge4xlqcL8eX9O
  3p6m+OF+4fvEdW8/3Njqt/NTnvWfQh8/NwVNxqw/MhXP+OTfncxZ1XxM07Kn6/jqhn2GRXtOd
  yz12WfzImLbmz38vmu2FFqLfb98Yenru3/WsX2bwu67xMjAcdHGJE3D3JZtB+p8opj2J//lnh
  5p+d7f6GSXkHnjLZOjv1jm27/qbp1kcF/up/iWfj7lJKP+wywyT6OX1X07xXf70yNT1UWe5y9
  kJpYxfFRNfO21yV1Myl/+Wf2z3WtP7yvfIVTh5Nk9Oej735q9SizFGYmGWsxFxYkAJy9A2TgD
  AAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-728.messagelabs.com!1657180514!87338!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23062 invoked from network); 7 Jul 2022 07:55:15 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:55:15 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 99E397C
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:55:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8EEB51B2
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:55:14 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:55:13 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.46.3 ->
 1.47.0
Date: Thu, 7 Jul 2022 15:55:05 +0800
Message-ID: <1657180505-23874-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:55:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97751

0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
refreshed for new version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...tup.py-Do-not-mix-C-and-C-compiler-options.patch | 13 +++++++++----
 ...ols_1.46.3.bb => python3-grpcio-tools_1.47.0.bb} |  2 +-
 2 files changed, 10 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.46.3.bb => python3-grpcio-tools_1.47.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 4713da174..4aa11bd57 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -26,6 +26,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  setup.py | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)
 
+diff --git a/setup.py b/setup.py
+index cc53e79..be3bc78 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -87,8 +87,11 @@ def check_linker_need_libatomic():
@@ -33,12 +35,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      code_test = (b'#include <atomic>\n' +
                   b'int main() { return std::atomic<int64_t>{}; }')
 -    cxx = os.environ.get('CXX', 'c++')
--    cpp_test = subprocess.Popen([cxx, '-x', 'c++', '-std=c++11', '-'],
+-    cpp_test = subprocess.Popen([cxx, '-x', 'c++', '-std=c++14', '-'],
 +    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
 +    if not cxx_args:
 +      cxx_args = "-g"
 +
-+    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++11', '-'],
++    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++14', '-'],
                                  stdin=PIPE,
                                  stdout=PIPE,
                                  stderr=PIPE)
@@ -46,8 +48,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      # Double-check to see if -latomic actually can solve the problem.
      # https://github.com/grpc/grpc/issues/22491
      cpp_test = subprocess.Popen(
--        [cxx, '-x', 'c++', '-std=c++11', '-', '-latomic'],
-+        [cxx, cxx_args, '-x', 'c++', '-std=c++11', '-', '-latomic'],
+-        [cxx, '-x', 'c++', '-std=c++14', '-', '-latomic'],
++        [cxx, cxx_args, '-x', 'c++', '-std=c++14', '-', '-latomic'],
          stdin=PIPE,
          stdout=PIPE,
          stderr=PIPE)
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.3.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.47.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.3.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.47.0.bb
index 221a05ef1..90c8efeec 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.3.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.47.0.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
-SRC_URI[sha256sum] = "31fee436ace5b3bd950cc3a8e68d6b84de1d6dc755959db7badc3470cdf22f70"
+SRC_URI[sha256sum] = "f64b5378484be1d6ce59311f86174be29c8ff98d8d90f589e1c56d5acae67d3c"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


