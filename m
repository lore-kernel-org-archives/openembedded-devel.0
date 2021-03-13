Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.4511.1615671281886005841
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 13:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12DLYOs9026220
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 13:34:32 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 13 Mar 2021 13:34:16 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Sat, 13 Mar 2021 13:34:15 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/2] zstd: upgrade 1.4.8 -> 1.4.9
Date: Sat, 13 Mar 2021 16:34:14 -0500
Message-ID: <20210313213415.396489-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Drop backported patch.

CHANGELOG:

v1.4.9  (Mar 1, 2021)
bug: Use `umask()` to Constrain Created File Permissions (#2495, @felixhandte)
bug: Make Simple Single-Pass Functions Ignore Advanced Parameters (#2498, @terrelln)
api: Add (De)Compression Tracing Functionality (#2482, @terrelln)
api: Support References to Multiple DDicts (#2446, @senhuang42)
api: Add Function to Generate Skippable Frame (#2439, @senhuang42)
perf: New Algorithms for the Long Distance Matcher (#2483, @mpu)
perf: Performance Improvements for Long Distance Matcher (#2464, @mpu)
perf: Don't Shrink Window Log when Streaming with a Dictionary (#2451, @terrelln)
cli: Fix `--output-dir-mirror`'s Rejection of `..`-Containing Paths (#2512, @felixhandte)
cli: Allow Input From Console When `-f`/`--force` is Passed (#2466, @felixhandte)
cli: Improve Help Message (#2500, @senhuang42)
tests: Remove Flaky Tests (#2455, #2486, #2445, @Cyan4973)
tests: Correctly Invoke md5 Utility on NetBSD (#2492, @niacat)
tests: Avoid Using `stat -c` on NetBSD (#2513, @felixhandte)
build: Zstd CLI Can Now be Linked to Dynamic `libzstd` (#2457, #2454 @Cyan4973)
build: Hide and Avoid Using Static-Only Symbols (#2501, #2504, @skitt)
build: CMake: Enable Only C for lib/ and programs/ Projects (#2498, @concatime)
build: CMake: Use `configure_file()` to Create the `.pc` File (#2462, @lazka)
build: Fix Fuzzer Compiler Detection & Update UBSAN Flags (#2503, @terrelln)
build: Add Guards for `_LARGEFILE_SOURCE` and `_LARGEFILE64_SOURCE` (#2444, @indygreg)
build: Improve `zlibwrapper` Makefile (#2437, @Cyan4973)
contrib: Add `recover_directory` Program (#2473, @terrelln)
doc: Change License Year to 2021 (#2452 & #2465, @terrelln & @senhuang42)
doc: Fix Typos (#2459, @ThomasWaldmann)

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-extended/zstd/{zstd_1.4.5.bb => zstd_1.4.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/zstd/{zstd_1.4.5.bb => zstd_1.4.9.bb} (91%)

diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.9.bb
similarity index 91%
rename from meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
rename to meta-oe/recipes-extended/zstd/zstd_1.4.9.bb
index d0cc625aa..0063a31be 100644
--- a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
+++ b/meta-oe/recipes-extended/zstd/zstd_1.4.9.bb
@@ -12,10 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
 inherit lib_package
 
 SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1 \
-           file://0001-Fix-legacy-build-after-2103.patch \
            "
 
-SRCREV = "b706286adbba780006a47ef92df0ad7a785666b6"
+SRCREV = "e4558ffd1dc49399faf4ee5d85abed4386b4dcf5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.27.0

