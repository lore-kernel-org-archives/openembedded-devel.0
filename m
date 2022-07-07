Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F79CCCA47F
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:01:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.3077.1657180904610110046
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RNegdgE5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657180902; i=@fujitsu.com;
	bh=fsD0qP9281EPfdVRBedlmufBQhISVhtkxAQIJlLsJq0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RNegdgE5N5aXJYbTsGiXABoKonlbqZHzZ8CjfZCzahyuNpRixMa1+WON2QWa7XU61
	 ja1E13CRkLlogJsgZ6BYdsZsRPfJsFeDcD0oju9D1cumPzdqW+szAAA9K0mXWea/Hw
	 aLxuNypcb6CjxSDi8PCe0VmQF5dT85s+R5q1l0OVJYT526Zp/+45ZlkFE2JYxQ2zd3
	 1iNScuAGkDpxCQ1/Jk5oTtreJJx+4CktZhndS9J6/kJn0p6uTIdjFW7uxXYVUXBJ3D
	 VQpdCAjQThxARnUUa6iiml+6k/6czTzhT4dEHklLzKjZH20/1q+spMwy63uxIP/Fav
	 b04BCT5zeuwGQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8ORpPts0rE
  kg+3fBS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owt2w4yFrSqVfSeXs7ewDhBrouRk0NI4CGj
  xIzTZhD2FSaJz+0CXYxcQPYJRomnSzYzgiTYBNQlHt98DWaLCOhLLJ29hxnEZhZQlei+uIYdx
  BYW8JFYfu05C4jNIqAisXvnPzCbV8BdYu29v0wgtoSAgsSUh+/BejkFPCT27LrACLHYXeLIy0
  usEPWCEidnPmGBmC8hcfDFC2aIXiWJEys+Qs2pkHh9+BJUXE3i6rlNzBMYBWchaZ+FpH0BI9M
  qRsukosz0jJLcxMwcXUMDA11DQ1NdY10LM73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OSc
  FL281JJNjMAATilmDtvB+Kf3p94hRkkOJiVR3tU9x5KE+JLyUyozEosz4otKc1KLDzHKcHAoS
  fBKTwTKCRalpqdWpGXmAKMJJi3BwaMkwrsEpJW3uCAxtzgzHSJ1itGSY+rsf/uZOZaDyZlf2w
  4wC7Hk5eelSonzfgSZJwDSkFGaBzcOFvGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzzge
  ZwpOZVwK39RXQQUxABy3LPwJyUEkiQkqqgalVzmPx+6In+43v1K7cvqXB303x7Ur28IxH9/PP
  /OdcmuayvLpw4uv4oDbrY7NYbpzitDz9SmT+50shGekzTxX6JSx+zLkrKqfsiOXJV/Ja6fWtW
  lZn9D+FHjw1Pd75udTtr2J/dikubLz5NIItJPHMOonZ52p3KN9hVzZxs44waLP4PeX3O+Yuo6
  6ybwc6kj7eiW3e5Gz68OyfG1rea8SWBP9busL04ZvXVjMWqPBoq/OyKa3l33Pn3N9ThXOUeuK
  WcWx2vF5RKvpPzuIDw+sUnx1zbt3SlDX/bzqlXNRixWyrdcbH+bJW7fRP8NgWmWaY1Bgxa6H/
  Bt6EvdaZ5/xiDuz5v0Wvi4n9PVd+hpwSS3FGoqEWc1FxIgA4FQSncwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1657180902!4077!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1478 invoked from network); 7 Jul 2022 08:01:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 08:01:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DEB851B9
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 09:01:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D34081B2
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 09:01:41 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 09:01:28 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.45.0 -> 1.47.0
Date: Thu, 7 Jul 2022 16:01:12 +0800
Message-ID: <1657180875-31986-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657180875-31986-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1657180875-31986-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97755

From: Xu Huan <xuhuan.fnst@fujitsu.com>

0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
refreshed for new version.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...-Do-not-mix-C-and-C-compiler-options.patch | 25 ++++++++++++-------
 ...cio_1.45.0.bb => python3-grpcio_1.47.0.bb} |  2 +-
 2 files changed, 17 insertions(+), 10 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.45.0.bb => python3-grpcio_1.47.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index febe6c4c8..f416ca272 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -28,42 +28,49 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  src/python/grpcio/commands.py | 5 ++++-
  2 files changed, 10 insertions(+), 4 deletions(-)
 
+diff --git a/setup.py b/setup.py
+index ec27fe4..b2d2d1a 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -199,8 +199,11 @@ def check_linker_need_libatomic():
+@@ -206,8 +206,11 @@ def check_linker_need_libatomic():
      """Test if linker on system needs libatomic."""
      code_test = (b'#include <atomic>\n' +
                   b'int main() { return std::atomic<int64_t>{}; }')
--    cxx = os.environ.get('CXX', 'c++')
--    cpp_test = subprocess.Popen([cxx, '-x', 'c++', '-std=c++11', '-'],
+-    cxx = shlex.split(os.environ.get('CXX', 'c++'))
+-    cpp_test = subprocess.Popen(cxx + ['-x', 'c++', '-std=c++14', '-'],
 +    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
 +    if not cxx_args:
 +      cxx_args = "-g"
 +
-+    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++11', '-'],
++    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++14', '-'],
                                  stdin=PIPE,
                                  stdout=PIPE,
                                  stderr=PIPE)
-@@ -210,7 +213,7 @@ def check_linker_need_libatomic():
+@@ -217,7 +220,7 @@ def check_linker_need_libatomic():
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
+diff --git a/src/python/grpcio/commands.py b/src/python/grpcio/commands.py
+index d93b6c7..a8c4a51 100644
 --- a/src/python/grpcio/commands.py
 +++ b/src/python/grpcio/commands.py
 @@ -228,7 +228,10 @@ class BuildExt(build_ext.build_ext):
              """
              try:
                  # TODO(lidiz) Remove the generated a.out for success tests.
--                cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++11', '-'],
+-                cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++14', '-'],
 +                cc_test, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
 +                if not cc_args:
 +                    cc_args = "-g"
-+                cc_test = subprocess.Popen([cc_test, cc_args, '-x', 'c', '-std=c++11', '-'],
++                cc_test = subprocess.Popen([cc_test, cc_args, '-x', 'c', '-std=c++14', '-'],
                                             stdin=subprocess.PIPE,
                                             stdout=subprocess.PIPE,
                                             stderr=subprocess.PIPE)
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb
index ca55a7f09..24c6e5344 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://0001-absl-always-use-asm-sgidefs.h.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
 "
-SRC_URI[sha256sum] = "ff2c8b965b0fc25cf281961aa46619c10900543effe3f806ef818231c40aaff3"
+SRC_URI[sha256sum] = "5dbba95fab9b35957b4977b8904fc1fa56b302f9051eff4d7716ebb0c087f801"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1


