Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64F2C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:32:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.40279.1681115545961037632
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jg06AlxW;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115544; i=@fujitsu.com;
	bh=FZsyNBXq98Xp3geShnnWEimeYGy6K/a+/NvQkM0z2k4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jg06AlxWt7HC5FNgWx3BbhueOSt4SS32ChoAcpQLpZFDNgpPAWk4nAEOfYIf18pWh
	 vl6diQtVLKK77IH/WQEv8PItLoSK0IFJBKJfo1PVTagup+4Tsnzq5UxHP73z7sAoUT
	 4zmlcjyWmhxMNQNBAQZ1BYKtz4TJPX42x6Yrxp2jGQOF7vx+oZpcVS/NROK+TrJYua
	 Ti5DJhW6e91sAkE+LYv1oInI/Vhf8KWJktJyrZ1ry/+xLYAOuhm+cwhKlsx1MdKVtg
	 BffjwG7hFw0W3uf3AI4KJ7bWSVxgYd9c9GcfmxAuri98uop5kwBB4Vaf6J3aMOGhZP
	 fZ1Z5V+QuzgMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8OxWXfGSeM
  Ug3dtjBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bJA8EF3yQrPl58zdbAuFS8i5GTQ0jgIaPE
  z4lpXYxcQPYVJolrrTdYIZw9jBLrj01iAaliE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBRYvrsQ0wgNouAqsSBF4/AenkFnCQOrpwCZksIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25Gaq+QqJxOsRMCQE1iavnNjFPYOSfhaR9FpL2BYxMqxjNilOLylKLdI0M9JKKMtM
  zSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECQzGlWO3lDsaJfX/1
  DjFKcjApifJ2cRmnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgXXgAKCdYlJqeWpGWmQOMC5i0B
  AePkghvxTGgNG9xQWJucWY6ROoUoy7Hpn1dB5iFWPLy81KlxHlbTwAVCYAUZZTmwY2AxeglRl
  kpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK82w4DTeHJzCuB2/QK6AgmoCO4XAxAjihJREhJNTD
  xyRXeLrsRHpi6fNWR6/f8dTivJHQv3uG27p9n9rzaeGPPWOanm187Ppj0IuWi6VyRj8I9961l
  P5seMWe8bLKjrFO4Xd/pmGUcu/xGO4dJ4iJhUbkzPv9uvi9x5piJkfP/aAY+j+TpXokhRz9O2
  Phu8/FLle1fH61aGxQ7fWtX1q6/h3Wl9Fs6V5uEBL4OnSsgH3o7gPGa1l+N9Sqlh4qePO5duz
  aOpemJfHKPaZi2lOrzDMf7mu4Hb9vtX+qUo7z9heX8ox9XCS/64lEtMTsrvPJLd4+4l2VIjMW
  kFOc7Fmp75n57GC0mUZp1rixAW3Bnl4v3jJ65l7cveL5h23n9Sb5f1JlXbmN79LCxSEWJpTgj
  0VCLuag4EQDCKpDKTAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-565.messagelabs.com!1681115543!289444!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3567 invoked from network); 10 Apr 2023 08:32:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:32:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B746D15F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:32:23 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id AB087155
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:32:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:32:22 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tesseract: upgrade 5.3.0 -> 5.3.1
Date: Mon, 10 Apr 2023 16:32:08 +0800
Message-ID: <1681115532-24518-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102024

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-build-with-gcc-13-by-including-cstdint.patch
removed since it's included in 5.3.1

Changelog:
==========
 Update README.md by @seupedro in #3992
 Fix FP division by zero (issue #3995)
 Fix linkage of icu and pango
 Fix build with gcc 13 by including
 msvc debug: fix wrong lib name in generated pkgconfig file
 Fix libdir in tesseract.pc from CMake
 Replace 'can not' by 'cannot'
 Readme: Link to list of supported languages
 Improve the DebugDump output by slightly adjusting the format.
 Fix issue #4010

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ild-with-gcc-13-by-including-cstdint.patch | 32 -------------------
 ...{tesseract_5.3.0.bb => tesseract_5.3.1.bb} |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/0001-Fix-build-with-gcc-13-by-including-cstdint.patch
 rename meta-oe/recipes-graphics/tesseract/{tesseract_5.3.0.bb => tesseract_5.3.1.bb} (79%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/0001-Fix-build-with-gcc-13-by-including-cstdint.patch b/meta-oe/recipes-graphics/tesseract/tesseract/0001-Fix-build-with-gcc-13-by-including-cstdint.patch
deleted file mode 100644
index 2978080c9..000000000
--- a/meta-oe/recipes-graphics/tesseract/tesseract/0001-Fix-build-with-gcc-13-by-including-cstdint.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2025b53de6b3d97285d7c5f80497493007c586c3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 30 Jan 2023 11:27:07 -0800
-Subject: [PATCH] Fix build with gcc 13 by including <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is
-no longer transitively included [1]. Explicitly include it for
-int32_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://github.com/tesseract-ocr/tesseract/pull/4009]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/ccutil/params.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ccutil/params.h b/src/ccutil/params.h
-index f514d870..0f3f8743 100644
---- a/src/ccutil/params.h
-+++ b/src/ccutil/params.h
-@@ -21,6 +21,7 @@
- 
- #include <tesseract/export.h> // for TESS_API
- 
-+#include <cstdint>
- #include <cstdio>
- #include <cstring>
- #include <string>
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.3.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.3.1.bb
similarity index 79%
rename from meta-oe/recipes-graphics/tesseract/tesseract_5.3.0.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_5.3.1.bb
index 057a7cd85..8e54a2791 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.3.0.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.3.1.bb
@@ -5,9 +5,8 @@ BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "080da83cc51c4ef8b324a7e03146fe0bd7e0944b"
-SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https \
-           file://0001-Fix-build-with-gcc-13-by-including-cstdint.patch"
+SRCREV = "71af4542990adae6d9f31d6657068bc0139c6ec4"
+SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


