Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570EACCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:01:53 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.3099.1657180909924846719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VFAcz6N2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657180907; i=@fujitsu.com;
	bh=j2M5KM01vwJSr0vuOEj8we83dRS8eqBASj33D/YcVR8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VFAcz6N2TRVpYHQjAGxF9/jImh6GxDGZ0U6JrffsTa9G0+0YrJDLmmSZjujUfRjlw
	 07UeRqN/qHJ6E6grapbmCvY6BMFbSeRMbE/WwTGfq0xbB8i3fVKGpOd170JM3BKjpL
	 DBWp/z74AInQwPpMteWC5z3stK0BWFVn6PCqCHvAb0ahyLAvZ5F7NGM0/FdWcsMVZE
	 323pA6tsJ9Npo7bdGM/5RiDGQB71Djl1XDyruOyhZkoW5m8YPWSyRz9oQb765h+3sH
	 GKe0L+puJopS2pxJVR0dqHrBqGas60xHfhfVNN3izLKN9XORveVacWhOwNiJFAFde9
	 X8x3DKP4FW3sQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8ORpPts0rE
  kgy3flS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxjh2cyF1yUrnjZx9vAeEC8i5GLQ0jgIaNE
  85E9TBDOFSaJ9xc2s0I4Jxglzi/ewd7FyMnBJqAu8fjma0YQW0RAX2Lp7D3MIDazgKpE98U1Y
  DXCAkESpy4vAbNZBFQkXi5/DmbzCrhL/Hg0C6xXQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0
  SNksSJFR+ZIOwKideHL0HF1SSuntvEPIGRfxaS9llI2hcwMq1itEkqykzPKMlNzMzRNTQw0DU
  0NNW1NNM1NDbUS6zSTdRLLdXNyy8qydAF8suL9VKLi/WKK3OTc1L08lJLNjECAzOlOKF5B+O9
  fb/0DjFKcjApifKu7jmWJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV3oiUE6wKDU9tSItMwcYJ
  TBpCQ4eJRHeJSCtvMUFibnFmekQqVOMilLivB9B+gRAEhmleXBtsMi8xCgrJczLyMDAIMRTkF
  qUm1mCKv+KUZyDUUmYdz7IFJ7MvBK46a+AFjMBLV6WfwRkcUkiQkqqgcm/xbJawsTw+rFYq4B
  lnk+zPJ4sMmaP2XL1aVjs30b9Dxa3Nsper9L9fXrPwVWd/rlX+1yljy4q2XBbr03y/xQtnpc/
  ah1jSq91zLbO/RJ+qLXkdgzP7uN+zzTetbtK2AY9fnj/VHCNdkJkt8KHvwnrX0d1nJvcP/X+O
  fvdCc+Ei8oXnplzKvZIRnpu8d6t5srWHRErpyRdnB7hfPmDccPzjl8i088VXOpcO3fP7FcOfy
  IesPL+MpiVrff3iInqtjWSKVr3JIVEHrrbvFzH+JSpY31hYd/870+qGU2SQ3OiVF0vXVn2LGb
  6jP8ZFbMmlHz4J8fy6y73HvV0m6KzwQolewuPi9YrB/eqX9l3S0yJpTgj0VCLuag4EQBlRvRL
  RwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-732.messagelabs.com!1657180902!66204!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2133 invoked from network); 7 Jul 2022 08:01:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 08:01:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DD4D31B6
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 09:01:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D1DF81B1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 09:01:41 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 09:01:26 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.46.3 ->
 1.47.0
Date: Thu, 7 Jul 2022 16:01:11 +0800
Message-ID: <1657180875-31986-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 08:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97757

From: Xu Huan <xuhuan.fnst@fujitsu.com>

0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
refreshed for new version.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
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


