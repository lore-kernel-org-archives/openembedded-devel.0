Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web08.3265.1618467041059014751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FijURbnv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618467038; i=@fujitsu.com;
	bh=noGYDEg4zv3OhtJ8fE5U6deyudAnoRbIa9bRYEgvx28=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FijURbnvFjtAjPiJgKJqQaVHQsueXQIHoLiga9IP64/aPASDM6zocYWKNFBYiy02w
	 PKc3LWSZkzrhZhQ8fBGji0Rcsxv48T7w2mfwB+EPfgrGmUa2Ee8BCbUlPy8ShaJdXY
	 UR8MUHLDxEtcxY67m3jlXCyusVb1jK2vaeoGKyvwBMjOr5oOxFVslJaBpjgJwOPWJS
	 mfbEu0Ue6Mg3hy3F8S9yGWhat8u32N3kKaW7qc3l9VI1C1LOuLkvMwESDvm/+jRY/8
	 0Ey3hoa0zloKBJcFKo9QsU3Uqq8Fu5qi/HPH5EBjcdjulKHF0k8lI8EI51KRL6lPSS
	 jgrlUJJ7F3YaQ==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 13/3E-41911-ED8D7706; Thu, 15 Apr 2021 06:10:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRonvvRnm
  Cwf1bfBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bCC3sYC9YJVDw43sfSwHiDr4uRi0NIYDaT
  xPG+WYxdjJxAznFGiT2vc0FsNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexhQViJN5se
  8kEYrMIqEqsXgph8wo4SdyccAysXkJAQWLKw/fMEHFBiZMzn7BAzJGQOPjiBVSNosTsy80sEH
  alROf6BYwTGHlnIWmZhaRlASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NjXWNdQzNDvcQq3US91FL
  d5NS8kqJEoKxeYnmxXnFlbnJOil5easkmRmCApRQyL9zB+OP1B71DjJIcTEqivIdWlCUI8SXl
  p1RmJBZnxBeV5qQWH2KU4eBQkuBVBIaskGBRanpqRVpmDjDYYdISHDxKIrzfrgOleYsLEnOLM
  9MhUqcYFaXEeWVAEgIgiYzSPLg2WIRdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMWwMyhS
  czrwRu+iugxUxAiytWlYIsLklESEk1ME0T37zdOuHM48PSJjxX90u+vSP7yubZh5bLOi/eRb9
  tKTBIlz+5QYonsdj3IOOXRObFh5Y881oz0bNe/ZF2//ug2C2LPLb0+vwWvaknIznT7YG9RquO
  H5twe4VH5kvGm4v2Tlp8oLw2uUncaq/7vIXc3lMUGq7c9+b8KlsWZBWazuf3//N/wWcXDNb9K
  JtdYey4ROmrgJaR/hH3by5WXRfLSh83JD4pTTrBWdjv5avfdeYB84naycvXqLLJh6g6T31Tun
  JimvrHZ98XnhFc+jd244SYj5sDsuOXhDEd7GPWWWxXo5e0KuJioKlmXdfLs83fw0IuvVkvEJp
  0I7JdZIL0NdZbphcjWIMvH9a/oMRSnJFoqMVcVJwIAKNCvYMrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-232.messagelabs.com!1618467037!494819!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17146 invoked from network); 15 Apr 2021 06:10:38 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-22.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 06:10:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F6Abm1006025
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Apr 2021 07:10:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 07:10:35 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] uftrace: Fix error on aarch64 when binutils update to 2.35.1
Date: Thu, 15 Apr 2021 14:10:26 +0800
Message-ID: <1618467026-24468-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...error-on-aarch64-with-binutils2.35.1.patch | 27 +++++++++++++++++++
 .../recipes-devtools/uftrace/uftrace_0.9.4.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
new file mode 100644
index 0000000000..ac17cf433f
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
@@ -0,0 +1,27 @@
+From 0bc502989822506af308a559ac1cd52af82cac03 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 14 Apr 2021 09:35:35 +0900
+Subject: [PATCH] Fix error on aarch64 with binutils2.35.1.
+
+WARN: child terminated by signal: 11: Segmentation fault
+
+Upstream-status: Pending
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ arch/aarch64/mcount-arch.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/aarch64/mcount-arch.h b/arch/aarch64/mcount-arch.h
+index 69efe521..60c2c1ba 100644
+--- a/arch/aarch64/mcount-arch.h
++++ b/arch/aarch64/mcount-arch.h
+@@ -31,7 +31,7 @@ struct mcount_arch_context {
+ 	double d[ARCH_MAX_FLOAT_REGS];
+ };
+ 
+-#define ARCH_PLT0_SIZE  32
++#define ARCH_PLT0_SIZE  16
+ #define ARCH_PLTHOOK_ADDR_OFFSET  0
+ 
+ struct mcount_disasm_engine;
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
index a3d0602182..4b4fc831c3 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
@@ -13,6 +13,7 @@ inherit autotools
 PV .= "+git${SRCPV}"
 SRCREV = "d648bbffedef529220896283fb59e35531c13804"
 SRC_URI = "git://github.com/namhyung/${BPN} \
+           file://0001-Fix-error-on-aarch64-with-binutils2.35.1.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.25.1

