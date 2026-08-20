Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFF2C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 13:04:22 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6403.1787231053951032709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 06:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GYWHpDUd;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3509; q=dns/txt;
  s=iport01; t=1787231054; x=1788440654;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bf8dEvZ2Jzn8E/rf5Bag9rzwOSMtJMsZKUoAeS47pkA=;
  b=GYWHpDUdOvLnkNwXv9QW+n8S306ohMa43AO4ht68tkew7WJwY34nV+7M
   0klb40oj1Ek3/TFu7vEaNPEXKlXxD+LioPngZBZDcbuUmM311LxVeMx38
   5nU/RQ+xv5aqf6KuJWYfSGzvetRkg0+5AOwGNiqyt0ZfTtLLtgD8FHPYN
   /B4lm29T8myYlx0wRpndCXJ4KbpBRGNXZAmhtMvnw0ffHHWLCiUjs6q1l
   MupVtLkk4qAhwpmfJZ+WYh1TFzmALnp+giMA3THmwOy7PT9n8h49++svl
   +KI/lBdUFz+4CiQ4iApRT29Q1nGh8oVjeXBJP5YTqffh+RzJuxGAlgmZO
   g==;
X-CSE-ConnectionGUID: 9Gw2DRU+RTGZoQUSG3G3Ng==
X-CSE-MsgGUID: 1iUZIlIzQoWXY4iRl9fN4A==
X-IPAS-Result: =?us-ascii?q?A0A5AwCk+oZq/48QJK1aglmCV3ReQ0mUKYIhA6AZDwEBA?=
 =?us-ascii?q?Q83GgQBAYUFAo1rAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDMgEYASgVHAMBAi8rIwgZgwIBgnQDwkKCLIEBgygBgVTbM?=
 =?us-ascii?q?AELFAGBOIU/iCJdGYR8JxsbgXKECHYegkMCgSeGfgSCDRV6EoFaHlCFW4snS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJX?=
 =?us-ascii?q?oErKmISF4EJggoCgnCCBgIBSUUOCRcLGA1IESw3FBkEPm4HjlEggkuBDgErU?=
 =?us-ascii?q?EtpBDOTAiUJkjehDwoog3aMIZU6GjOFW6URmQiLN5g7aIRpgX4mgVlwFYMiC?=
 =?us-ascii?q?UoZD5IjzDknMgI7AQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:pCdFlqJfTw1vSmxNFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS3j0En
 zNMWDiBb6nYM2P8f9AkPY++p0wDvZHVxt8wTwYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Qsajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0/I15sEbcludxLLlNJz
 MEjB2siNTaM0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzN3wsYDUXUrsTIJI8leuvgFH0ciZTrxSeoq9fD237nFUqieW8a4eLEjCMbZxUo3S5o
 kPUxmPGMiBGNeabmDSjrlv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:tgwKLa/7f/gdbiYbu8Fuk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:IV25zWELw0HboZ3+qmI221FONvoYMUfh40XXGnKDJj1GE5uaHAo=
X-Talos-MUID: 9a23:2p8lVAnT7kok7WIWs3uPdno7NfpawqCPGnkKrqU358i+MX1+HWu02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,233,1779148800"; 
   d="scan'208";a="813159356"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 13:04:13 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id EFB7718000116
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 13:04:12 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 95826CC1611; Thu, 20 Aug 2026 06:04:12 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][PATCH 2/2] suitesparse: avoid install rpath buildpaths QA
Date: Thu, 20 Aug 2026 06:03:58 -0700
Message-Id: <20260820130358.2402128-2-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260820130358.2402128-1-hjadon@cisco.com>
References: <20260820130358.2402128-1-hjadon@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 13:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129393

From: Himanshu Jadon <hjadon@cisco.com>

SuiteSparse adds -Wl,-rpath=$(INSTALL_LIB) while linking shared
libraries on Linux. In the OpenEmbedded build this value can resolve to
a build or install path under TMPDIR, so installed ELF files can keep an
absolute build path and fail buildpaths QA.

The packaged libraries do not need this install-tree rpath. Runtime
resolution is handled through normal package dependencies and the target
library search path. Keep the librt link and drop only the rpath entry.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
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
index f655ac17fd..a2fee6400c 100644
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
2.35.6


