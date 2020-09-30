Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.12288.1601461183671089595
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 03:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: PXGhIF25o2mkU1baw+SgtoacIcQ2PGrUvxskKcqcyctYuwpmcItO+rRirQZ/0P2EnM+bNssFzY
 P6r81+7hg0LA==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="159800099"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="159800099"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 03:19:42 -0700
IronPort-SDR: e5oTgx12MG64WKDFx0vPpZEgMQjpBvMypbhzCCapnf5EAON6snAkCRBEo/h5c80422jyt25Y+0
 BoSOI2xZS2Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="345585768"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2020 03:19:41 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-oe] tbb: improve reproducibility
Date: Wed, 30 Sep 2020 18:19:40 +0800
Message-Id: <20200930101940.69000-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

remove WORKDIR from generated version_string.ver and
use SOURCE_DATE_EPOCH as DATETIME wherever possible to
improve reproducibility

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../tbb/tbb/improve-reproducibility.patch     | 30 +++++++++++++++++++
 meta-oe/recipes-support/tbb/tbb_2020.3.bb     |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch

diff --git a/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch b/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
new file mode 100644
index 0000000000..91d10cb7ab
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
@@ -0,0 +1,30 @@
+From f56eeb18a07df139864a99e1967d450cc5c8c0bb Mon Sep 17 00:00:00 2001
+From: Lee Chee Yang <chee.yang.lee@intel.com>
+Date: Wed, 30 Sep 2020 16:18:35 +0800
+Subject: [PATCH] improve reproducibility
+
+remove the WORKDIR info from BUILD_COMMAND to improve reproducibility.
+also use SOURCE_DATE_EPOCH as DATETIME wherever possible.
+
+Upstream-Status: Inappropriate [sed WORKDIR does not applies to upstream]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ build/version_info_linux.sh | 4 +-
+ 1 file changed, 2 insertion(+), 2 deletion(-)
+
+diff --git a/build/version_info_linux.sh b/build/version_info_linux.sh
+index 793cad11..ed6f4b2a 100644
+--- a/build/version_info_linux.sh
++++ b/build/version_info_linux.sh
+@@ -25,6 +25,6 @@ echo '#N": BUILD_GCC'"\t\t"`g++ --version </dev/null 2>&1 | grep 'g++'`'" ENDL \
+ echo '#N": BUILD_LIBC'"\t"`getconf GNU_LIBC_VERSION | grep glibc | sed -e 's/^glibc //'`'" ENDL \'
+ echo '#N": BUILD_LD'"\t\t"`ld -v 2>&1 | grep 'version'`'" ENDL \'
+ echo '#N": BUILD_TARGET'"\t$arch on $runtime"'" ENDL \'
+-echo '#N": BUILD_COMMAND'"\t"$*'" ENDL \'
++echo '#N": BUILD_COMMAND'"\t"$(echo $* | sed 's#'$WORKDIR'#/workdir#g')'" ENDL \'
+ echo ""
+-echo "#define __TBB_DATETIME \""`date -u`"\""
++echo "#define __TBB_DATETIME \""`$(date -u -d "@$SOURCE_DATE_EPOCH"  2>/dev/null || date -u -r "$SOURCE_DATE_EPOCH"  2>/dev/null || date -u )`"\""
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/tbb/tbb_2020.3.bb b/meta-oe/recipes-support/tbb/tbb_2020.3.bb
index e66d23f0b8..8e0094b318 100644
--- a/meta-oe/recipes-support/tbb/tbb_2020.3.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2020.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH
            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
            file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
            file://tbb.pc \
+           file://improve-reproducibility.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1

