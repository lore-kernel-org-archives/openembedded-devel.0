Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.10230.1620892567325290168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 00:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OeJUTKmp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620892564; i=@fujitsu.com;
	bh=WKSsXCLdQX95oTGtAtpNcq44pZrC5N0p5cPvG94nPng=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OeJUTKmpCULgtzjUW52FT+zic3iWKLW4yW5O/Hm+nKu56yOYHhwfPSbwBUG3PCi5C
	 zXhJpO2XyIq1s+R0vpsFFq1Kdx5uelCnXst5bcgI9GbiMeIxHPS4ZOBfbNff3Zy4VA
	 hfoFpuFX+nwpBv4IE75bHVMpotHL3st7u7VdwoUaNPsVHxhJzVxGpXx2y9pV45yLMH
	 sIlG/YSAv1U7Snk7gGLIjCXJcu3YbaXZgnzcW28AygoGJ3WyoaniWsy2h34DbQwh4P
	 BEfNf0d+5t6EFE6MMYvfa7HUzOIFXY8SY376DdXKY/+AaltPKQ2TCqEqA4z1mLcSlD
	 gbxtBQrkH/hqQ==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 5F/93-63525-49BDC906; Thu, 13 May 2021 07:56:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVXfK7Tk
  JBhO+cllcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBnLn+oV7FCo6Nzm2cB4V6aLkYtDSGA2k8T9
  CfMZIZzjjBI/v71l7WLk5GATUJOYfusGmC0ioC+xdPYeZhCbWUBF4sXvHnYQW1igSqLv91kWE
  JtFQFViRd8KJhCbV8BR4tbDuWC2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZogaRYnZl5tZIO
  wKideHLzFPYOSdhaRlFpKWBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdQ11TQ31Eqt0E/VSS3W
  TU/NKihKBknqJ5cV6xZW5yTkpenmpJZsYgcGVUshovIPx4OsPeocYJTmYlER5T3rOThDiS8pP
  qcxILM6ILyrNSS0+xCjDwaEkwWt/a06CkGBRanpqRVpmDjDQYdISHDxKIrxCV4DSvMUFibnFm
  ekQqVOMilLivBtB+gRAEhmleXBtsOi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtwNkCk
  9mXgnc9FdAi5mAFt+YPgtkcUkiQkqqgUkp4dRpW6t/C465JZQ4yn3dqLgjQ88xJ9TwfNdjrqD
  3f9++n7/hmjzPUd2CgJJlj+7cN+i0bPA6pCbZ/Fv9Y/SNC95xi3J+ZBv/bFaKTzjP05je1XaZ
  bR+rro/ky+Vp75zieyPET/eaSvhPurdLK8bfa8Yfk9eK+94dfbFf6bchS5/2JoFGngC7GZ+qi
  mWVf6Zm7XY/dWARQ/1D575txY/NrsfqPvfedkTdIf+exrxqaTfDSVPM3+rlfbG5v27qVO/u/T
  97gw/F2asf/LZrNt9ZKeU/RkofnufNtNn6bvuDhYHflZU045xTHhfe1Wk4oCu7KuLJR/fPM5d
  InShr2JM88SkT5+KmrKjkeVcr3ymxFGckGmoxFxUnAgBZ70D4KQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-226.messagelabs.com!1620892563!97462!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6149 invoked from network); 13 May 2021 07:56:04 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-19.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 May 2021 07:56:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14D7ttxb024012
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 May 2021 08:56:03 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 13 May 2021 08:55:53 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] uftrace: Fix a plthook crash on aarch64 with binutils2.35.1 and later versions on aarch64
Date: Thu, 13 May 2021 15:55:43 +0800
Message-ID: <1620892543-2068-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...error-on-aarch64-with-binutils2.35.1.patch | 27 -----------
 ...thook-crash-on-aarch64-with-binutils.patch | 47 +++++++++++++++++++
 .../recipes-devtools/uftrace/uftrace_0.9.4.bb |  2 +-
 3 files changed, 48 insertions(+), 28 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
deleted file mode 100644
index ac17cf433..000000000
--- a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 0bc502989822506af308a559ac1cd52af82cac03 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Wed, 14 Apr 2021 09:35:35 +0900
-Subject: [PATCH] Fix error on aarch64 with binutils2.35.1.
-
-WARN: child terminated by signal: 11: Segmentation fault
-
-Upstream-status: Pending
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- arch/aarch64/mcount-arch.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/aarch64/mcount-arch.h b/arch/aarch64/mcount-arch.h
-index 69efe521..60c2c1ba 100644
---- a/arch/aarch64/mcount-arch.h
-+++ b/arch/aarch64/mcount-arch.h
-@@ -31,7 +31,7 @@ struct mcount_arch_context {
- 	double d[ARCH_MAX_FLOAT_REGS];
- };
- 
--#define ARCH_PLT0_SIZE  32
-+#define ARCH_PLT0_SIZE  16
- #define ARCH_PLTHOOK_ADDR_OFFSET  0
- 
- struct mcount_disasm_engine;
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch
new file mode 100644
index 000000000..bf997d6e4
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch
@@ -0,0 +1,47 @@
+From 0851278471472c6be69a936cc3698aa50a646ffd Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 12 May 2021 17:06:31 +0900
+Subject: [PATCH] aarch64: Fix a plthook crash on aarch64 with binutils2.35.1
+ and later versions
+
+plthook is always crashed in Ubuntu 20.10 aarch64, which uses binutils 2.35.1.
+Since the `plt_entsize` is not automatically set in this version, we have to
+explicitly set the value.
+
+This patch fixes the following problem.
+
+  $ uname -m
+  aarch64
+
+  $ cat /etc/os-release | grep PRETTY_NAME
+  PRETTY_NAME="Ubuntu 20.10"
+
+  $ gcc -pg tests/s-abc.c
+
+  $ uftrace record a.out
+  WARN: child terminated by signal: 7: Bus error
+
+Fixed: #1254
+
+Upstream-status: submitted [Sent to https://github.com/namhyung/uftrace/pull/1248]
+
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ utils/symbol.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/symbol.c b/utils/symbol.c
+index 29a1d295..01e52dab 100644
+--- a/utils/symbol.c
++++ b/utils/symbol.c
+@@ -560,6 +560,7 @@ int load_elf_dynsymtab(struct symtab *dsymtab, struct uftrace_elf_data *elf,
+ 	}
+ 	else if (elf->ehdr.e_machine == EM_AARCH64) {
+ 		plt_addr += 16;    /* AARCH64 PLT0 size is 32 */
++		plt_entsize = 16;
+ 	}
+ 	else if (elf->ehdr.e_machine == EM_386) {
+ 		plt_entsize += 12;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
index 4b4fc831c..a04fccca7 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
@@ -13,7 +13,7 @@ inherit autotools
 PV .= "+git${SRCPV}"
 SRCREV = "d648bbffedef529220896283fb59e35531c13804"
 SRC_URI = "git://github.com/namhyung/${BPN} \
-           file://0001-Fix-error-on-aarch64-with-binutils2.35.1.patch \
+           file://0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.25.1

