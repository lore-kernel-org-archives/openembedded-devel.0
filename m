Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web12.4056.1622012254649152797
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 23:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZnY81dli;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622012247; i=@fujitsu.com;
	bh=yN0qKl4k/Opr1KlsKk9e/WQerQeWDCt/UtBPAjdWvis=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZnY81dlipKmZRvO7H6xYebfYb6JbkjB1mNCo5QIEK1hh4u9i9/3tNkdOAUEdbuv7d
	 pUVykjpKw67OxyffN6b7cCiLOh291brkTqYK/G+OCp3tW5rYUKAc2mW0rCZICsbwEc
	 On2mi2z9OT122PcS+wh/BzSlMePO/+/G6NeXK9HBoJSYpdgCbPVopXiLSdv5G/yLPM
	 0Ae3av/q5e7nkKPFbn/d3Fy2WKlifB6UmBvXQizoRZxuzwuLIQp0eMTUe4+hA9xCCr
	 1peiasNvaZjfR9HsxawgVr31LTuzph2ViVm/dmg354qp+d7cpIA1Cu5rP7/ZO4EPd0
	 sFo3A2T0L1voA==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id C2/8A-38619-751FDA06; Wed, 26 May 2021 06:57:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRohv2cW2
  CwdajhhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aBiwdYCxZLVJy//p+tgXGDaBcjF4eQwGwm
  ibV/G9khnBOMEh3f/jB3MXJysAmoSUy/dYMVxBYR0JdYOnsPWJxZQEXixe8eoAYODmEBO4mHX
  6VBTBYBVYn2FUkgFbwCjhJ99+aCVUsIKEhMefieGSIuKHFy5hMWiCkSEgdfvICqUZSYfbmZBc
  KukHh9+BLzBEbeWUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MBA19DQWNdE18jAVC+xSjdJL7V
  UNzk1r6QoESirl1herFdcmZuck6KXl1qyiREYXimFLGd3MH55/UHvEKMkB5OSKK+U/+oEIb6k
  /JTKjMTijPii0pzU4kOMMhwcShK8Ez6sTRASLEpNT61Iy8wBhjpMWoKDR0mEt+I9UJq3uCAxt
  zgzHSJ1ilGX4/zbT5uZhVjy8vNSpcR5xUBmCIAUZZTmwY2Axd0lRlkpYV5GBgYGIZ6C1KLczB
  JU+VeM4hyMSsK8t0BW8WTmlcBtegV0BBPQEUk5q0COKElESEk1MDn+m3ap4UvgitAPPyZ1/bn
  +60l0BNdNPsfZm44wt73gunerO9FE56Dlymh/hr7Xgl7bO/7PZru54INk8EuXRaKunl66v92Y
  aoXE2bxPLpLRNimycNdMOSF/9Nh3UVv+1F3C+csK2N8X5Nfc/P9vUfi8tYJcCz8uftI9f4e9V
  MM06U9eKysMW44KstS4XA3XZyg+8clg2hKraZoVb9O4fpVU3tI9XaMdplMRdPrZr8L3v20PKJ
  zasYdL6MWakuotM40CVLdNP7QruPcdd4ngcbfw3jPfa0OtZnf2/X0iN3WO3RLHxFaRuDSm3cI
  mchWf37w5mXGW65+Nwn0Oxb/eT+a8vVveIMckdOeU5fKSbiWW4oxEQy3mouJEAAOnUFk2AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-248.messagelabs.com!1622012246!518799!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5129 invoked from network); 26 May 2021 06:57:26 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 May 2021 06:57:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14Q6vKQH025304
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 07:57:26 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 26 May 2021 07:57:18 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] uftrace: upgrade 0.9.4 -> 0.10
Date: Wed, 26 May 2021 14:57:07 +0800
Message-ID: <1622012227-4442-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch
removed since it is removed in 0.10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thook-crash-on-aarch64-with-binutils.patch | 47 -------------------
 .../{uftrace_0.9.4.bb => uftrace_0.10.bb}     |  3 +-
 2 files changed, 1 insertion(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.9.4.bb => uftrace_0.10.bb} (89%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch
deleted file mode 100644
index bf997d6e4..000000000
--- a/meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0851278471472c6be69a936cc3698aa50a646ffd Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Wed, 12 May 2021 17:06:31 +0900
-Subject: [PATCH] aarch64: Fix a plthook crash on aarch64 with binutils2.35.1
- and later versions
-
-plthook is always crashed in Ubuntu 20.10 aarch64, which uses binutils 2.35.1.
-Since the `plt_entsize` is not automatically set in this version, we have to
-explicitly set the value.
-
-This patch fixes the following problem.
-
-  $ uname -m
-  aarch64
-
-  $ cat /etc/os-release | grep PRETTY_NAME
-  PRETTY_NAME="Ubuntu 20.10"
-
-  $ gcc -pg tests/s-abc.c
-
-  $ uftrace record a.out
-  WARN: child terminated by signal: 7: Bus error
-
-Fixed: #1254
-
-Upstream-status: submitted [Sent to https://github.com/namhyung/uftrace/pull/1248]
-
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
----
- utils/symbol.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/symbol.c b/utils/symbol.c
-index 29a1d295..01e52dab 100644
---- a/utils/symbol.c
-+++ b/utils/symbol.c
-@@ -560,6 +560,7 @@ int load_elf_dynsymtab(struct symtab *dsymtab, struct uftrace_elf_data *elf,
- 	}
- 	else if (elf->ehdr.e_machine == EM_AARCH64) {
- 		plt_addr += 16;    /* AARCH64 PLT0 size is 32 */
-+		plt_entsize = 16;
- 	}
- 	else if (elf->ehdr.e_machine == EM_386) {
- 		plt_entsize += 12;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.10.bb
similarity index 89%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.10.bb
index a04fccca7..828c21cf9 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.10.bb
@@ -11,9 +11,8 @@ DEPENDS_append_libc-musl = " argp-standalone"
 inherit autotools
 
 PV .= "+git${SRCPV}"
-SRCREV = "d648bbffedef529220896283fb59e35531c13804"
+SRCREV = "a5e5a51d32bdfe59af8b453ca08d78cbdf0b3c61"
 SRC_URI = "git://github.com/namhyung/${BPN} \
-           file://0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.25.1

