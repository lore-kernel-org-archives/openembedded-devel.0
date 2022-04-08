Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929A5C47094
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.25903.1649651026583612998
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 21:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V2jI3vjR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649651024; i=@fujitsu.com;
	bh=tW0U+I6fDbVLhOXHr5jSIr4aApJ+mYREDlE0FZWL3Dc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=V2jI3vjR1G+4AJp/w8bKGKRBwgWEiwpK45gnZ2fAjMHrRRC459eyMXfPcvvHznq8Z
	 /438wzgKJDTJ7TNvcPcXzFnHAKie0RqaVyvZ7cq+53o0AorFx87doLumCqqPNI9gVN
	 7zjVzdxEr+j85yAEv+wJx4Jnt3tMxI8jVorDlR2CULp/QThXzZ3I33csKmP5WhC3Yo
	 /gvcehvZfL6YU05D557O0FHx2xhQ7cR30lAQt9EOQ1/+580oGuzMtzVVAzNwffMwM2
	 ETpCk35rxCK5XyWlNnrybtTUhIiWxYZxIZUcwK75FQqmf6BjLXS4Af+xdhSH/uh8H5
	 9Km5bgWPTkW0Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MRohuwNjj
  J4MdaDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePx/bCCeaIVK1+9YmtgXCXcxcjFISQwm0ni
  3K7pzBDOHkaJTRMWsncxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPWI2wgIPEwbsdY
  HEWoHj/711gNq+Ak8T0FauYQGwJAQWJKQ/fg8U5BZwlvt7ZAxYXAqrZeHEWC0S9oMTJmU9YIO
  ZLSBx88YIZoldRYvblZhYIu0Ji1qw2pgmM/LOQtMxC0rKAkWkVo11SUWZ6RkluYmaOrqGBga6
  hoamuuaGuobGxXmKVbqJeaqlucmpeSVEiUFovsbxYL7W4WK+4Mjc5J0UvL7VkEyMwNFOK3Vt3
  MF7u+6l3iFGSg0lJlPd7eECSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQle+VXBSUKCRanpqRVpm
  TnAOIFJS3DwKInwBiwHSvMWFyTmFmemQ6ROMVpy7NxyeS8zx9UrV4DkDRApxJKXn5cqJc5bvh
  SoQQCkIaM0D24cLJYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmlV4DNIUnM68EbusroIO
  YgA4K3RYIclBJIkJKqoFJqulP8PGeyrV2ex4Ili/elnZ20lSZuhelx8wPPG1gy33398T0dw/n
  xSrpJUxdoreGj2XBXqtcRpOHylsUwqwnbWB5UP472XD7Dd7OpXyszRMqtSNXFKWI3Ih/ZFivq
  C8sZcTxR6F34h0//8MC6Z5HnlRei0uzND5dOu9lv9m/qgvdHKv/vl+YuiTgQnG23JXVN4Rc+R
  9tSTeR7NzY+CSr7U+y6cytqvcSo01blG9/3GbpnJKtpvAuIOnh1KeLuMNPRT2Kt9l38IPqCt+
  7207F9h6POr3YcVaYn0aT5r+pxdt7V5/707AhhNs5X6t6VVhz0l1357M/zmVczG7Kcrtl0Lxx
  alLXe8WMN2sWvKlVYinOSDTUYi4qTgQA+4TApWADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-528.messagelabs.com!1649651023!144393!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3083 invoked from network); 11 Apr 2022 04:23:44 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Apr 2022 04:23:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23B4NaLO007659
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 05:23:43 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Apr 2022 05:23:37 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hidapi: upgrade 0.10.1 -> 0.11.2
Date: Fri, 8 Apr 2022 19:20:10 +0800
Message-ID: <1649416811-29165-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649416811-29165-1-git-send-email-wangmy@fujitsu.com>
References: <1649416811-29165-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96541

Changelog:
==========
0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch
removed since it's included in 0.11.2

hidraw: hid_get_input_report implementation for kernels that supports it (#351);
windows: several improvements and bugfixes (#348, #360, #361);
libusb: fix potential crash when libusb_detach_kernel_driver fails (#363)
general: documentation improvements;

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ove-duplicate-AC_CONFIG_MACRO_DIR-22.patch | 27 -------------------
 meta-oe/recipes-support/hidapi/hidapi_git.bb  |  8 +++---
 2 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-support/hidapi/hidapi/0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch

diff --git a/meta-oe/recipes-support/hidapi/hidapi/0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch b/meta-oe/recipes-support/hidapi/hidapi/0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch
deleted file mode 100644
index f3cd1015f9..0000000000
--- a/meta-oe/recipes-support/hidapi/hidapi/0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ce3ab6ba4b8176d100ac535a39e3d5b0c517989b Mon Sep 17 00:00:00 2001
-From: Jan Palus <atler@pld-linux.org>
-Date: Fri, 15 Jan 2021 14:32:14 +0100
-Subject: [PATCH] configure.ac: remove duplicate AC_CONFIG_MACRO_DIR (#226)
-
-fixes build with autoconf 2.70
-Upstream-Status: Backport [https://github.com/libusb/hidapi/pull/226]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 220909a..77da67a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -13,7 +13,6 @@ LTLDFLAGS="-version-info ${lt_current}:${lt_revision}:${lt_age}"
- 
- AC_CONFIG_MACRO_DIR([m4])
- AM_INIT_AUTOMAKE([foreign -Wall -Werror])
--AC_CONFIG_MACRO_DIR([m4])
- 
- m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
- LT_INIT
--- 
-2.30.0
-
diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
index 1fef9789c5..1c57a1d83f 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
@@ -11,9 +11,7 @@ RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master \
-           file://0001-configure.ac-remove-duplicate-AC_CONFIG_MACRO_DIR-22.patch \
-"
-PV = "0.10.1"
-SRCREV = "f6d0073fcddbdda24549199445e844971d3c9cef"
+SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
+PV = "0.11.2"
+SRCREV = "31bde69a1f08c880ef1622f2586eea0daf3b0857"
 S = "${WORKDIR}/git"
-- 
2.25.1


