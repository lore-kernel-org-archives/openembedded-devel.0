Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B5CC61DBC
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 08:37:58 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17093.1787647073493176317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 01:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MxZgZ9lc;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3684; q=dns/txt;
  s=iport01; t=1787647073; x=1788856673;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VSu5Og4PmNQwt24W3oMceyMZRCIhDFSRDAnQI8IMmbQ=;
  b=MxZgZ9lcM1yfxUIwEROtKW21sH8dVJSOWGBB7iDeqwZVXVQ8ZmXMbPYa
   4wt5Oox5WmzYzH7f1bVlqcIiMH/ePy/cAgfbb8D3yA3XfkF7MOxxVGjyV
   qXhaGB4yNJd93J0ywcLtBdEEdJ7+LSFTuIbiAtewymDeRV0zVPimBn0Ge
   ZCvJkZ4foYwtCjrfcko4fvcEOhb+rbQUb43DhEDUBzNjjBx+eOslgriaB
   4LiVJAyT6vDTXfJpJ6x3t1ff8BNW3hdA5kOK78P/+fQ5RZdKId29MVGGV
   F73jJGoN3zZ0IriBQbOTO0flP6e6IzrwItypPmkYxWJ4Nz9ZEEOHUbtbe
   Q==;
X-CSE-ConnectionGUID: OFXZnW+BTDKYk0EuLhPwsg==
X-CSE-MsgGUID: W2pBHczsSv+MIglWSsDerg==
X-IPAS-Result: =?us-ascii?q?A0BIAgAmU41q/5L/Ja1aglmCV3RfQkmUKYIhA54bgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMyARgBKBUcAwECLysjCBEIgwIBgnQDvwGCLIEBgygBg?=
 =?us-ascii?q?VTbMAELFAGBOIU/iCJdGYR8JxsbgXKECHYegkMCgSeGfgSCDRV6EoFaHlCFP?=
 =?us-ascii?q?4tOSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2f?=
 =?us-ascii?q?IEJXoErKWESF4EJggcCglqCBQIBSUMOB0ciCxgNSBEsNxQZBD5uB45dH4JMg?=
 =?us-ascii?q?Q4BK1BLaQQzkwIlCZI0oRIKKIN2jCKVOhozhVulEZkIizeYO2iEaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+SI8whPDUCOwEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:zJWheK5AXwJIhKoiz9DhQAxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 jRKWjvUPf2CY2HwKoonPNmwoEpXvZ7Wm9FhS1c4pCA2Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJOtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eGqMoyOBIQkty2
 d8pK2ggczSDv/2tz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkERUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIePI4LXGZ0Fwy50o
 Er5pXzTIhoIL+eBih+k/XaTvfTjkDn0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cH3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:gWVgSaz4FZIC8219S6A7KrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3A1hcEpGuXunHXr0rI0vOokOzM6IsCXE3vykiTCXO?=
 =?us-ascii?q?UKldqEJCIbV+o57hrxp8=3D?=
X-Talos-MUID: 9a23:I9MfQQQKQXHefVA4RXTT3ilIFMx6+J+wS2UsnpE5gNKoODZ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,242,1779148800"; 
   d="scan'208";a="521654085"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Aug 2026 08:37:52 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 50A88180005B5
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 08:37:52 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 6ED5DCC037D; Tue, 25 Aug 2026 14:07:50 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 2/2] suitesparse: avoid install rpath buildpaths QA
Date: Tue, 25 Aug 2026 14:07:21 +0530
Message-Id: <20260825083721.3369187-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260825083721.3369187-1-deeratho@cisco.com>
References: <20260825083721.3369187-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 08:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129470

From: Himanshu Jadon <hjadon@cisco.com>

SuiteSparse adds -Wl,-rpath=$(INSTALL_LIB) while linking shared
libraries on Linux. In the OpenEmbedded build this value can resolve to
a build or install path under TMPDIR, so installed ELF files can keep an
absolute build path and fail buildpaths QA.

The packaged libraries do not need this install-tree rpath. Runtime
resolution is handled through normal package dependencies and the target
library search path. Keep the librt link and drop only the rpath entry.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 47037e87d5b5e78e774a52ed1e36250dd4c70b9f)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 ...dd-install-rpath-to-shared-libraries.patch | 37 +++++++++++++++++++
 .../suitesparse/suitesparse_5.10.1.bb         |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-rpath-to-shared-libraries.patch

diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-rpath-to-shared-libraries.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-rpath-to-shared-libraries.patch
new file mode 100644
index 0000000000..a6105f73f8
--- /dev/null
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-rpath-to-shared-libraries.patch
@@ -0,0 +1,37 @@
+From f8be0a727c506d25450386c370a846e66b3f3297 Mon Sep 17 00:00:00 2001
+From: Deepak Rathore <deeratho@cisco.com>
+Date: Wed, 5 Aug 2026 00:00:00 -0700
+Subject: [PATCH] Do not add install rpath to shared libraries
+
+SuiteSparse adds the install library directory to Linux shared library
+links through -Wl,-rpath=$(INSTALL_LIB). In Yocto builds INSTALL_LIB
+resolves to a build or install path under TMPDIR, so the final ELF files
+keep an absolute TMPDIR path in .dynstr even after chrpath removes the
+dynamic rpath tag.
+
+Yocto stages dependent SuiteSparse libraries through normal sysroot and
+package runtime dependencies. The install-tree rpath is not required for
+packaged target libraries, and it makes buildpaths QA fail.
+
+Upstream-Status: Inappropriate [oe-specific: build/install path triggers buildpaths QA]
+
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ SuiteSparse_config/SuiteSparse_config.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/SuiteSparse_config/SuiteSparse_config.mk b/SuiteSparse_config/SuiteSparse_config.mk
+index 8309c5142..807323c4c 100644
+--- a/SuiteSparse_config/SuiteSparse_config.mk
++++ b/SuiteSparse_config/SuiteSparse_config.mk
+@@ -358,7 +358,7 @@ SUITESPARSE_VERSION = 5.10.1
+ 
+     ifeq ($(UNAME),Linux)
+         # add the realtime library, librt, and SuiteSparse/lib
+-        LDLIBS += -lrt -Wl,-rpath=$(INSTALL_LIB)
++        LDLIBS += -lrt
+     endif
+ 
+     #---------------------------------------------------------------------------
+-- 
+2.43.0
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index d6b45f007e..3aa5b5af7c 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branc
            file://0003-Add-version-information-to-libmetis.patch \
            file://makefile-quoting.patch \
            file://0004-Allow-build-with-CMake-4.patch \
+           file://0005-Do-not-add-install-rpath-to-shared-libraries.patch \
            "
 SRCREV = "538273cfd53720a10e34a3d80d3779b607e1ac26"
 
-- 
2.43.7


