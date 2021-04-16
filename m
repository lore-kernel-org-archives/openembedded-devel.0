Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3288.1618535981326503651
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 18:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: g6kTGlttwAfmFFP/o+XQhFhV3Qs0WY+fMAWOuJZBeUZ+it4QsdWyZT52OxAUPy4IsUZd2+fAQF
 zwrHsEcBH/Dw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="258931573"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="258931573"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 18:19:41 -0700
IronPort-SDR: joj+AIIuCqSVgHfRmf4byT71PyCj1KEGpCUsdE1Go/u7cFgeaxTai59j7FVUmrmp4ZTfuB+Eq9
 b84Jnkq5kH+w==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="421869445"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 18:19:40 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][hardknott][PATCH 2/3] tbb: Fix build with musl
Date: Fri, 16 Apr 2021 09:31:36 +0800
Message-Id: <20210416013137.19613-2-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210416013137.19613-1-naveen.kumar.saini@intel.com>
References: <20210416013137.19613-1-naveen.kumar.saini@intel.com>

From: Khem Raj <raj.khem@gmail.com>

Need to link libucontext on musl
Additionally, mips also needs libatomic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index d0e231140..b05a59dc7 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -6,6 +6,9 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
 HOMEPAGE = "https://software.intel.com/en-us/tbb"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327"
+
+DEPENDS_append_libc-musl = " libucontext"
+
 BRANCH = "onetbb_2021"
 SRCREV = "2dba2072869a189b9fdab3ffa431d3ea49059a19"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
@@ -33,3 +36,10 @@ EXTRA_OECMAKE += " \
 # ...
 # | make[1]: *** [concurrent_queue.o] Error 1
 ARM_INSTRUCTION_SET = "arm"
+
+ASNEEDED = ""
+
+LDFLAGS_append_mips = " -latomic"
+LDFLAGS_append_mipsel = " -latomic"
+
+LDFLAGS_append_libc-musl = " -lucontext"
-- 
2.17.1

