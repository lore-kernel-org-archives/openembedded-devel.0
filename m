Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47FAC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 09:01:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.3641.1655110864450429960
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 02:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qI75oxaQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655110862; i=@fujitsu.com;
	bh=+ULf1ETjymIrY6u8/fKoLnrldQPyW1ToN7ijgoSomV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qI75oxaQPDnLAyTyAheENUqPN+GKPYb/79Qu+z1i0JzQGSnyGV2RF0lSOyhcUiFMW
	 tmd2hxSI7zoexz/i3N7/VfsisEVlKz60Id5nDdnM7Q23fy5L4OVMulA7e4NrU1Vuej
	 IlHF92U3qYDGA6cQMc8v6UaL56AnzgI4UhUeCDFXYNcoIoGkd39e5WUHl01XsKG4C4
	 o5Hc6Seq/SeF0ig2+Xfw3c0UOxk7vaW4BF+BP+O4uV+sqjY3R8EhGepvevxxQQmIIz
	 xOaxJKRNZ2op9Wlc0aFivpBdPJp9/s1LDfuWMkh2alslQrz3CN2v/ywiNoAyrjA8lG
	 acr0hlB8AOfWg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRWlGSWpSXmKPExsViZ8ORpHv2z7I
  kg/7z7BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a0CxkFvcoVl2dNY25gnCzfxcjFISTwkFHi
  4c8vbBDOWSaJtl8f2CGcPYwSS95vZuxi5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBR4vOZ82A2i4CqxPy/24B6OTh4BZwk1h4WBglLCChITHn4HqyVU8BZ4ur21WwgthBQyf
  +7O1hAbF4BQYmTM5+wQIyXkDj44gUzRK+ixOzLzSwQdoXEjBnb2CBsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXWNjXXNTfQSq3QT9VJLdctTi0t0jfQSy4v1UouL
  9Yorc5NzUvTyUks2MQJDOKVY0WsH46sVP/UOMUpyMCmJ8u79sixJiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgSvwy+gnGBRanpqRVpmDjCeYNISHDxKIrzHfgOleYsLEnOLM9MhUqcYXTmuXrmyl5
  lj6ux/+5k5loPJmV/bDjBzbNrXdYBZiCUvPy9VSpx3HUizAEhzRmke3GhYKrjEKCslzMvIwMA
  gxFOQWpSbWYIq/4pRnINRSZh3OsgUnsy8ErgLXgEdxwR03MaTS0COK0lESEk1MPGFLJ769fpO
  Nj3pfV9Wrk43vnj7E5/bk2pRkxtPDcW8jzMtimG+VLLjIy/bxUdsAmlxogdvRFquvWQw39Py9
  LyMZcvWfev2yM1hOp0g+b1Oz2Zecei/TPHyzaKXuCbu0f+VwPdgxv59J5uvThL32RLU/IQxvD
  RsQlp1eO+9fSukt27KO3u79BCv/fvmc5aqGber7BMTig+Ll9tP6ZtyVGr3v9uBs0N46l4nrev
  apXxl3j9Djufdrmt2+th5vPA3qb+mPOHDoy2qE+46+63c46ztfXuKum+O9wTbxqebT51yXuDL
  MvXnpXVhkUGqsd1vIxQvPp3vserP9ayl90NjdXhYD/5lef5TdKnN24UHWP8osRRnJBpqMRcVJ
  wIA26/CCIADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1655110860!119558!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6518 invoked from network); 13 Jun 2022 09:01:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jun 2022 09:01:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9CCF21A0
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 10:01:00 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7CDD51B1
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 10:01:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 13 Jun 2022 10:00:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] musl-nscd: upgrade 1.0.2 -> 1.1.0
Date: Mon, 13 Jun 2022 17:00:19 +0800
Message-ID: <1655110819-25250-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655110819-25250-1-git-send-email-wangmy@fujitsu.com>
References: <1655110819-25250-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 09:01:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97487

License-Update: Copyright year updated to 2021.

0001-Fix-build-under-GCC-fno-common.patch
0001-configure-Check-for-flex-if-lex-is-not-found.patch
removed since they're included in 1.1.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-build-under-GCC-fno-common.patch | 43 -------------------
 ...e-Check-for-flex-if-lex-is-not-found.patch | 29 -------------
 .../recipes-devtools/musl/musl-nscd_git.bb    |  8 ++--
 3 files changed, 3 insertions(+), 77 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/musl/musl-nscd/0001-Fix-build-under-GCC-fno-common.patch
 delete mode 100644 meta-oe/recipes-devtools/musl/musl-nscd/0001-configure-Check-for-flex-if-lex-is-not-found.patch

diff --git a/meta-oe/recipes-devtools/musl/musl-nscd/0001-Fix-build-under-GCC-fno-common.patch b/meta-oe/recipes-devtools/musl/musl-nscd/0001-Fix-build-under-GCC-fno-common.patch
deleted file mode 100644
index 6fee0526d..000000000
--- a/meta-oe/recipes-devtools/musl/musl-nscd/0001-Fix-build-under-GCC-fno-common.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 8c0e4b7907eb577b1e5214f9a7bc75d5c3263b0a Mon Sep 17 00:00:00 2001
-From: Ariadne Conill <ariadne@dereferenced.org>
-Date: Sat, 14 Nov 2020 22:55:30 -0700
-Subject: [PATCH] Fix build under GCC -fno-common.
-
-Upstream-Status: Submitted [https://github.com/pikhq/musl-nscd/pull/11]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/modules.h | 4 ++--
- src/main.c        | 3 +++
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/include/modules.h b/include/modules.h
-index 70c1960..e77ec58 100644
---- a/include/modules.h
-+++ b/include/modules.h
-@@ -28,7 +28,7 @@ struct mod_passwd {
- 	link_t link;
- };
- 
--list_t passwd_mods;
--list_t group_mods;
-+extern list_t passwd_mods;
-+extern list_t group_mods;
- 
- #endif
-diff --git a/src/main.c b/src/main.c
-index c1a78bb..808ef74 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -18,6 +18,9 @@
- #include "parse.h"
- #include "util.h"
- 
-+list_t passwd_mods;
-+list_t group_mods;
-+
- static void *get_dll(const char *service)
- {
- 	char *path;
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-devtools/musl/musl-nscd/0001-configure-Check-for-flex-if-lex-is-not-found.patch b/meta-oe/recipes-devtools/musl/musl-nscd/0001-configure-Check-for-flex-if-lex-is-not-found.patch
deleted file mode 100644
index 691aa3d2a..000000000
--- a/meta-oe/recipes-devtools/musl/musl-nscd/0001-configure-Check-for-flex-if-lex-is-not-found.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4d09032741475c4e9d3de62c8187597f3f72f934 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 22 Nov 2020 12:32:01 -0800
-Subject: [PATCH] configure: Check for flex if lex is not found
-
-lex is already checked by this time, therefore check should be to find
-flex
-Upstream-Status: Submitted [https://github.com/pikhq/musl-nscd/pull/12]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 256824a..4c94568 100755
---- a/configure
-+++ b/configure
-@@ -249,7 +249,7 @@ printf "checking for lex... "
- trylex ${CROSS_COMPILE}lex
- trylex lex
- trylex ${CROSS_COMPILE}flex
--trylex lex
-+trylex flex
- printf "%s\n" "$LEX"
- test -n "$LEX" || echo "$0: cannot find lex. Will try to use pre-provided source."
- 
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
index ac2b5a266..82e5c3bc5 100644
--- a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
+++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
@@ -4,17 +4,15 @@
 DESCRIPTION = "Musl-nscd is an implementation of the NSCD protocol, suitable for use with musl and with standard NSS modules"
 HOMEPAGE = "https://github.com/pikhq/musl-nscd"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9bf479a145bcaff8489e743da58afeee"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fff9baeb9a392879d7fb25ba3a2696e4"
 SECTION = "utils"
 
 DEPENDS += "flex-native bison-native flex bison"
 
-PV = "1.0.2"
+PV = "1.1.0"
 
-SRCREV = "af581482a3e1059458f3c8b20a56f82807ca3bd4"
+SRCREV = "cddd6be6c629ca96f2d2e74ee52daf12bbef1f83"
 SRC_URI = "git://github.com/pikhq/musl-nscd;branch=master;protocol=https \
-           file://0001-Fix-build-under-GCC-fno-common.patch \
-           file://0001-configure-Check-for-flex-if-lex-is-not-found.patch \
            file://0001-nsswitch.y-Replace-empty-bison-extension.patch \
           "
 
-- 
2.25.1


