Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179CDC43217
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:10:17 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.1852.1666055410241597346
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iEQokY6I;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055408; i=@fujitsu.com;
	bh=Q+w21cVfkFfCpMzseXg3tj+h0c3CYsKZNKdGBbaqj88=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iEQokY6IZSvFpSvuuLXRDr9ShdhbDDHPxSVhFJ1Tdq3ttoZnfRTmRGgXah3ABcXOo
	 x7WSqwucUYEKzwsKylgCDVS8dcxZXHDfJ2+KAqTvhOX3jF7xwEfBdOC7TORO59AhaI
	 2joUk8duC6WXKeyBBLDE+isg88/Jl2CObxdCoIHi29FgOLh/Qqtuu6aEE3Xp+uGSGH
	 nplxKFE872JI+lSGKus7am9pv225PO1FHtsqx5dldPGUMnVnX7d0GE+58cZeDyWG+k
	 OqROGSskatEwvyc9yYsAHEcsK8eK2bvKaHkkqnZacdwSOlSIpoEFgl0LJiRd/3AaO4
	 Y4mu+JCABhm7g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8MxSff9H99
  kg/2NghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ay1kMsBf2iFasuH2JuYPwv1MXIxSEk8IRR
  4tvuh+wQznUmidaZ29kgnD2MEh/fHQJyODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCU+Nz6iwXEZhFQlbjWt4gRxOYFirfv2QtmSwgoSEx5+B6sl1PASWLR7yNgM4WAap4/Wc
  gOUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itGsOLWoLLVI11gvqSgzPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0Uv
  L7VkEyMwfFOK09fvYHy39I/eIUZJDiYlUd6OGb7JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4O
  34A5QSLUtNTK9Iyc4CxBJOW4OBREuGNOgOU5i0uSMwtzkyHSJ1itOe4euXKXmaOqbP/7WfmWA
  4mZ35tO8AsxJKXn5cqJc57+jdQmwBIW0ZpHtxQWOxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7
  BqCTMm/oLaApPZl4J3O5XQGcxAZ2Vsd8L5KySRISUVANT7Y//VVUiVaYm15+c+e8jvXO/n/vk
  Sx5b/Zdyi/dXLJ/zubWw5fDSpdKrl5106Q2Ib5Dv8bAvKPkSn6KQwu9dw/klJqHIl2GK3pK5L
  /Pr217E7Jk1eePdqOyIzWUl9QzXD3+N3rsq3VLdSEnO88lmrZ6Yhmc7gi3MNqc1dBqXsKyMPT
  3ZKmFDWPh6hWj1ub+9tnU4nK7ZYBunxdURcuVBGu9FnbbeKaezs7h1YxOmNQm8n/xN4Xq6w7G
  YVvfscyeefT+3XP343jNqz99VRv3tzPTIMTN4HR945QS716qX5gr/lDdoF91tUVCzOWQ6R3vW
  Dl2LZ7OEU3wZsyXNShYHyi6S+Xf0x3T2neoiNUosxRmJhlrMRcWJAIrdgat4AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1666055406!50623!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25011 invoked from network); 18 Oct 2022 01:10:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:10:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A8737100078
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:10:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9BF001000CC
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:10:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:10:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tesseract: upgrade 4.1.3 -> 5.2.0
Date: Tue, 18 Oct 2022 09:09:44 +0800
Message-ID: <1666055387-8084-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055387-8084-1-git-send-email-wangmy@fujitsu.com>
References: <1666055387-8084-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99218

0001-include-sys-time.h.patch
removed since it's not available in new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tesseract/0001-include-sys-time.h.patch   | 34 -------------------
 ...{tesseract_4.1.3.bb => tesseract_5.2.0.bb} |  6 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/0001-include-sys-time.h.patch
 rename meta-oe/recipes-graphics/tesseract/{tesseract_4.1.3.bb => tesseract_5.2.0.bb} (71%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/0001-include-sys-time.h.patch b/meta-oe/recipes-graphics/tesseract/tesseract/0001-include-sys-time.h.patch
deleted file mode 100644
index de1fa75b7c..0000000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract/0001-include-sys-time.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b47fa9532a7090d76521603dbc818bdec100085f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Sep 2020 17:04:27 -0700
-Subject: [PATCH] include sys/time.h
-
-This provides missing definitions of timeval stuct
-
-Fixes
-| ../../../git/src/ccutil/ocrclass.h:154:7: error: member access into
-incomplete type 'struct timeval'
-|     tv->tv_usec = (millisecs.count() % 1000) * 1000;
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/ccutil/ocrclass.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/ccutil/ocrclass.h b/src/ccutil/ocrclass.h
-index d39a6dd6..96395c9b 100644
---- a/src/ccutil/ocrclass.h
-+++ b/src/ccutil/ocrclass.h
-@@ -28,6 +28,8 @@
- 
- #include <chrono>
- #include <ctime>
-+#include <sys/time.h>
-+
- #ifdef _WIN32
- #include <winsock2.h> // for timeval
- #endif
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_4.1.3.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.2.0.bb
similarity index 71%
rename from meta-oe/recipes-graphics/tesseract/tesseract_4.1.3.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_5.2.0.bb
index 6f92679682..8eb2073563 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_4.1.3.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.2.0.bb
@@ -5,10 +5,8 @@ BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-BRANCH = "4.1"
-SRCREV = "f38e7a7ba850b668d4505dd4c712238d7ec63ca8"
-SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=${BRANCH};protocol=https \
-           file://0001-include-sys-time.h.patch \
+SRCREV = "5ad5325a0aa8effc47ca033625b6a51682f82767"
+SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https \
           "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


