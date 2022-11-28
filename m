Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345BEC4167D
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:10:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.111334.1669615813290210118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D/FDxbN0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615811; i=@fujitsu.com;
	bh=k3UzK4/lZjmkMQ0vAloH0Uqfx/bnEPbT1GkRk5D5B18=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=D/FDxbN0Eow9cLGXYgJZ/4sngKq49mxgohpPbm4hVaMw2vPvLlVLYYTezu6edk8mU
	 APF1cR/XRMmqz/wL5RTw9SHGOC7LO0gxj+fJHIDoffTeClYrFVN9pAlJ2/nl62KMqp
	 q/rngBeYMHI2wAf21iwnBVXZR3cAUF8W5rTX5hgLVE0pN8Jh7mzDeQgS2OeAxIL4vZ
	 fB2aU/vfAsySARkk67PCLCaUEU/iY1bK1EtdVkmG7rgFerR4IdwzBINhTMST/vyWwA
	 od/tnkEGOhUCGc3cw1E6slXpfKVdx+NeB4M/Pb8AT6TqzKSImy3WefidZ1HJ0qR17l
	 xtFNmuFLTa+sg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWfdwQEu
  ywfltjBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aNu29YCxYrVTy+NJe1gfG+XBcjF4eQwANG
  ic1LVzJCOFeYJH40zQVyOIGcPYwSV75HgthsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC9hJ7GvsBYpzcLAIqEo8+5sFEuYVcJK4OGM/WLmEgILElIfvmSHighInZz5hgRgjIXHwxQ
  uoGkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxjNi1OLylKLdA2N9ZKKMtM
  zSnITM3P0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitzk3NS9PJSSzYxAoMxpThVYgdjw/I/
  eocYJTmYlER5F15qShbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwbvesyVZSLAoNT21Ii0zBxgZM
  GkJDh4lEd7F9kBp3uKCxNzizHSI1ClGV46rV67sZeaYOvvffmaO5WBy5te2A8wcm/Z1HWAWYs
  nLz0uVEud19AdqFgBpzijNgxsNi+pLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5Bf2ApvB
  k5pXAXfAK6DgmoOM2KTaBHFeSiJCSamBK6Pl0U0Y4eZni7bkci/QZE/rkQ18WLJjmKHLhZq/f
  jF2bpT8F+ShManjN135zfvLm15Or1ucodga6HlvCF/xa/dnUDdwXFk7jVz1zyDemftJ0wyU7N
  6Qtibnx8Hmb7NFPX3QWcD1YOUFSRVf+ycXdPtM+apxcc8uqoGfbuuXnpx2aUaXy22F5+Mwry6
  e0TvvFEX5A80d+t/5v520dfMsvX/A9tT98wRsjxRzBHdYVdm8XXjSftnOZnMLddos5zokxjoW
  HXi3ZND+2LnCZ/5TqM0dy3TQNWXt0Fbg7P757LPZn3Xn5nfO8bis0rtkjbNbK7XCwxa/g3upJ
  s7hOOBcF7Tp3uvVWTpXA/sz/047MmK3EUpyRaKjFXFScCACLijQlZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-728.messagelabs.com!1669615810!10006!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17520 invoked from network); 28 Nov 2022 06:10:10 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:10:10 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 790487B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6C12E150
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:10:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.5.2 -> 2.6.1
Date: Mon, 28 Nov 2022 14:09:42 +0800
Message-ID: <1669615786-13094-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99791

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure-Check-for-request_init-API-when-probing-fo.patch
0001-tools-gensiot-Fix-build-with-musl.patch
removed since they're included in 2.6.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...for-request_init-API-when-probing-fo.patch | 31 -------------------
 ...01-tools-gensiot-Fix-build-with-musl.patch | 29 -----------------
 .../{gensio_2.5.2.bb => gensio_2.6.1.bb}      |  7 ++---
 3 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/gensio/files/0001-configure-Check-for-request_init-API-when-probing-fo.patch
 delete mode 100644 meta-oe/recipes-connectivity/gensio/files/0001-tools-gensiot-Fix-build-with-musl.patch
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.5.2.bb => gensio_2.6.1.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/gensio/files/0001-configure-Check-for-request_init-API-when-probing-fo.patch b/meta-oe/recipes-connectivity/gensio/files/0001-configure-Check-for-request_init-API-when-probing-fo.patch
deleted file mode 100644
index 3b4caa221..000000000
--- a/meta-oe/recipes-connectivity/gensio/files/0001-configure-Check-for-request_init-API-when-probing-fo.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f56e59712d8708c74a4cf66d24b5703fc16b22ae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Sep 2022 11:31:48 -0700
-Subject: [PATCH] configure: Check for request_init API when probing for
- libwrap
-
-checking for main() is not right check, since this function is not part
-of libwrap but the app. Newer autocof and toolchain may fail
-
-Upstream-Status: Submitted [https://github.com/cminyard/gensio/pull/48]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 90cfcb6b..1c06d918 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -109,7 +109,7 @@ AC_ARG_WITH(tcp-wrappers,
- if test "$tcp_wrappers" != "no"
- then
-   AC_CHECK_HEADERS([tcpd.h])
--  AC_CHECK_LIB(wrap,main)
-+  AC_CHECK_LIB(wrap,request_init)
- fi
- 
- AC_ARG_ENABLE([doc],
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-connectivity/gensio/files/0001-tools-gensiot-Fix-build-with-musl.patch b/meta-oe/recipes-connectivity/gensio/files/0001-tools-gensiot-Fix-build-with-musl.patch
deleted file mode 100644
index 93831c380..000000000
--- a/meta-oe/recipes-connectivity/gensio/files/0001-tools-gensiot-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 823b6754a4d7655480b6e8576a9d0037f842d653 Mon Sep 17 00:00:00 2001
-From: Jan Luebbe <jlu@pengutronix.de>
-Date: Thu, 25 Aug 2022 12:19:16 +0200
-Subject: [PATCH] tools:gensiot: Fix build with musl
-
-According to POSIX getpid() is available in unistd.h, not sys/unistd.h.
-
-Upstream-Status: Submitted [https://github.com/cminyard/gensio/pull/47]
-Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
----
- tools/gensiotool.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/gensiotool.c b/tools/gensiotool.c
-index cac531bb4b74..ab0bb9583f9f 100644
---- a/tools/gensiotool.c
-+++ b/tools/gensiotool.c
-@@ -44,7 +44,7 @@
- #include <signal.h>
- #include <errno.h>
- #include <sys/types.h>
--#include <sys/unistd.h>
-+#include <unistd.h>
- #include <syslog.h>
- #endif
- 
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.6.1.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.6.1.bb
index d6b5f1987..91450e2c7 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.6.1.bb
@@ -5,12 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "b6cd354afe6d5f63bc859c94fd3a455a3cdf0449"
+SRCREV = "d512218c4fa5667d4fe15977d3f15f05591f1f1a"
 
-SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master \
-           file://0001-tools-gensiot-Fix-build-with-musl.patch \
-           file://0001-configure-Check-for-request_init-API-when-probing-fo.patch \
-"
+SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


