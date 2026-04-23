Return-Path: <zeming.liu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE6BFAD3EE
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 01:56:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3607.1776909410490530791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 18:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lAmBTo2x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8573a18790=zeming.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N1j8p41676516
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 18:56:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=s2mStgzNKBrw2UxKAmbr
	o/WKnZXKRrj+pMoNX9XdjW8=; b=lAmBTo2xsOWCk4vkYB5693jLLys+Zejod4lM
	fA/wXdcWOu5bdXv7UoY0NVRrtRJzt2yHZ1059NlgjOPJ6Jcx6R1umULs9yxjV7bq
	4h/eJER6lC5lOXG/6gzlV+VIEai44cOqn15dxyiGFgzwISZ3T4pTwypB/HBYKOBy
	mmPP8i5V4WvPegGnInpNSCliZU8vGpkbvWbJED0QZP2sSJrGM+mCFCKfvX4NkL9a
	C5u28yWzOCQEp3cB5igpDhUBy9WHtYvM4I9wwqre9wsmk48QnS6SHGV0iDVZLvH/
	8/bmk2/+rrC0+GZuCrIYAS79tU2LtMS5zyFl7AXP/bfiS9U4ZQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8sr023f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 18:56:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 22 Apr 2026 18:56:49 -0700
Received: from pek-lpgtest20.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 22 Apr 2026 18:56:49 -0700
From: Zeming LIU <zeming.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH v3] tbb: add ptest support
Date: Thu, 23 Apr 2026 09:56:48 +0800
Message-ID: <20260423015648.2098875-1-zeming.liu@windriver.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAxNyBTYWx0ZWRfX6HKCnCB46zAQ
 Ngp13wieDC9yzTwG9q4dGd/NlV362KghBnEzbxbdmX7oEdnYKNNkjb+VHsZN17ms4BlENZXeF4N
 wP7naUccHnRWupBXO4Glfzx9kPpg3Xve8VncPRK1wYCWpHyX7khn59ihoUe46P9MBgfuwZ+AekK
 iBuvFedla9tPHlyTVbQHq+43I1a+jWCuDLvqhp+7eS5rAAeOmTvAQFD3rDKOTTOkDEvSe4pMpls
 ONETYz+QBi4mH6zeL/8no9cRUvOmCe6SQbsjM/ioRWCTEfYKQj6SA67W15uadvxfrx7zbnIZdGY
 aNJ7l8gOwIveQJiWt4O93lz5q8E/68WK8JGN+EdJKTBIXvl11Juj4al/rAOVzYbgfFavCGwW6cr
 xkBI8xMjaV1573x5k4nr5ncI4NgypCdNYONelLIgp2ml8KjvjJLgaKSFQ5jJjteupyy5Ux/akdc
 NfH87etIBMiTub8S0hA==
X-Proofpoint-GUID: R1cpbRrmAHJF-ujPho-GHMUuEGs7IrCp
X-Authority-Analysis: v=2.4 cv=PfPPQChd c=1 sm=1 tr=0 ts=69e97c62 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=u8UIyg_hj7ifO_k5u60A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: R1cpbRrmAHJF-ujPho-GHMUuEGs7IrCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 01:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126566

Test result:
root@qemux86-64:/usr/lib/tbb/ptest# ptest-runner tbb
START: ptest-runner
2026-04-23T01:21
BEGIN: /usr/lib/tbb/ptest
PASS: test_tick_count
PASS: test_allocators
PASS: test_arena_priorities
PASS: test_dynamic_link
PASS: test_collaborative_call_once
PASS: test_concurrent_lru_cache
PASS: test_concurrent_unordered_map
PASS: test_concurrent_unordered_set
PASS: test_concurrent_map
PASS: test_concurrent_set
PASS: test_concurrent_priority_queue
PASS: test_partitioner
PASS: test_parallel_for
PASS: test_parallel_for_each
PASS: test_parallel_reduce
PASS: test_parallel_sort
PASS: test_parallel_invoke
PASS: test_parallel_scan
PASS: test_parallel_pipeline
PASS: test_eh_algorithms
PASS: test_blocked_range
PASS: test_concurrent_vector
PASS: test_task_group
PASS: test_concurrent_hash_map
PASS: test_task_arena
PASS: test_parallel_phase
PASS: test_enumerable_thread_specific
PASS: test_concurrent_queue
PASS: test_resumable_tasks
PASS: test_mutex
PASS: test_function_node
PASS: test_multifunction_node
PASS: test_broadcast_node
PASS: test_buffer_node
PASS: test_composite_node
PASS: test_continue_node
PASS: test_eh_flow_graph
PASS: test_flow_graph
PASS: test_flow_graph_priorities
PASS: test_flow_graph_whitebox
PASS: test_indexer_node
PASS: test_join_node
PASS: test_join_node_key_matching
PASS: test_join_node_key_matching_n_args
PASS: test_join_node_msg_key_matching
PASS: test_join_node_msg_key_matching_n_args
PASS: test_join_node_preview
PASS: test_limiter_node
PASS: test_priority_queue_node
PASS: test_queue_node
PASS: test_sequencer_node
PASS: test_split_node
PASS: test_tagged_msg
PASS: test_overwrite_node
PASS: test_write_once_node
PASS: test_async_node
PASS: test_input_node
PASS: test_profiling
PASS: test_concurrent_queue_whitebox
PASS: test_intrusive_list
PASS: test_semaphore
PASS: test_environment_whitebox
PASS: test_hw_concurrency
PASS: test_eh_thread
PASS: test_tbb_version
PASS: test_global_control
PASS: test_task
PASS: test_concurrent_monitor
PASS: test_scheduler_mix
PASS: test_handle_perror
PASS: test_arena_constraints
PASS: test_tbbbind
PASS: test_tbb_fork
PASS: test_tbb_header
PASS: test_openmp
PASS: conformance_tick_count
PASS: conformance_allocators
PASS: conformance_mutex
PASS: conformance_task_group
PASS: conformance_task_group_context
PASS: conformance_task_arena
PASS: conformance_collaborative_call_once
PASS: conformance_concurrent_lru_cache
PASS: conformance_concurrent_unordered_map
PASS: conformance_concurrent_unordered_set
PASS: conformance_concurrent_map
PASS: conformance_concurrent_set
PASS: conformance_concurrent_priority_queue
PASS: conformance_parallel_for
PASS: conformance_parallel_for_each
PASS: conformance_parallel_reduce
PASS: conformance_parallel_scan
PASS: conformance_parallel_sort
PASS: conformance_parallel_pipeline
PASS: conformance_parallel_invoke
PASS: conformance_blocked_range
PASS: conformance_blocked_range2d
PASS: conformance_blocked_range3d
PASS: conformance_blocked_nd_range
PASS: conformance_concurrent_vector
PASS: conformance_global_control
PASS: conformance_concurrent_hash_map
PASS: conformance_enumerable_thread_specific
PASS: conformance_combinable
PASS: conformance_concurrent_queue
PASS: conformance_resumable_tasks
PASS: conformance_version
PASS: conformance_function_node
PASS: conformance_multifunction_node
PASS: conformance_input_node
PASS: conformance_continue_node
PASS: conformance_async_node
PASS: conformance_overwrite_node
PASS: conformance_write_once_node
PASS: conformance_buffer_node
PASS: conformance_queue_node
PASS: conformance_priority_queue_node
PASS: conformance_sequencer_node
PASS: conformance_limiter_node
PASS: conformance_broadcast_node
PASS: conformance_composite_node
PASS: conformance_indexer_node
PASS: conformance_split_node
PASS: conformance_join_node
PASS: conformance_graph
PASS: conformance_arena_constraints
PASS: test_scalable_allocator
PASS: test_malloc_pools
PASS: test_malloc_init_shutdown
PASS: test_malloc_regression
PASS: test_malloc_shutdown_hang
PASS: test_malloc_compliance
PASS: test_malloc_used_by_lib
PASS: test_malloc_lib_unload
PASS: test_malloc_pure_c
PASS: test_malloc_whitebox
PASS: test_malloc_atexit
PASS: test_malloc_overload
PASS: test_malloc_overload_disable
PASS: test_malloc_new_handler
DURATION: 153
END: /usr/lib/tbb/ptest
2026-04-23T01:23
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Note:
The test will fail/timeout if executed on qemu target without kvm enabled.

Signed-off-by: Zeming LIU <zeming.liu@windriver.com>
---
Changes in v3:
Override do_install_ptest per toolchain used

 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../images/meta-oe-image-ptest.bb             |  1 +
 meta-oe/recipes-support/tbb/files/run-ptest   |  3 +++
 meta-oe/recipes-support/tbb/tbb_2022.3.0.bb   | 26 +++++++++++++++++--
 4 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100755 meta-oe/recipes-support/tbb/files/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index b764d5dd58..528ce16191 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -80,6 +80,7 @@ PTESTS_SLOW_META_OE = "\
     postgresql \
     re2 \
     rocksdb \
+    tbb \
 "
 PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
 PTESTS_SLOW_META_OE:append:x86-64 = " kernel-selftest"
diff --git a/meta-oe/recipes-core/images/meta-oe-image-ptest.bb b/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
index 6361562de4..c9aa334d39 100644
--- a/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
+++ b/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
@@ -28,6 +28,7 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-poco = "1024288"
 QB_MEM = "-m 1024"
 # If a particular ptest needs more memory, it can be customized:
 #QB_MEM:virtclass-mcextend-<pn> = "-m 4096"
+QB_MEM:virtclass-mcextend-tbb = "-m 2048"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
diff --git a/meta-oe/recipes-support/tbb/files/run-ptest b/meta-oe/recipes-support/tbb/files/run-ptest
new file mode 100755
index 0000000000..da46c68550
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+ctest | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
diff --git a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
index 440b6e0f46..33741a7ac1 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
@@ -15,20 +15,23 @@ PE = "1"
 BRANCH = "onetbb_2022"
 SRCREV = "f1862f38f83568d96e814e469ab61f88336cc595"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
+           file://run-ptest \
           "
 
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig ptest
 
 # test build fails, error: 'mallinfo mallinfo()' is deprecated
 EXTRA_OECMAKE += " \
-                    -DTBB_TEST=OFF \
+                    -DTBB_TEST=${@bb.utils.contains('PTEST_ENABLED', '1', 'ON', 'OFF', d)} \
                     -DCMAKE_BUILD_TYPE=Release \
                     -DTBB_STRICT=OFF \
                     -DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=OFF \
                 "
 
+RDEPENDS:${PN}-ptest += "cmake"
+
 # Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)
 # tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: /tmp/lto-llvm-264bc2.o: can't link soft-float modules with double-float modules
 # tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: failed to merge target specific data of file /tmp/lto-llvm-264bc2.o
@@ -60,5 +63,24 @@ do_install:append:class-target() {
     sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/TBB/TBBTargets.cmake
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    install ${B}/test/CTestTestfile.cmake ${D}${PTEST_PATH}/
+    sed -i -e s#${S}#${PTEST_PATH}#g \
+           -e s#${B}#${PTEST_PATH}#g \
+            ${D}${PTEST_PATH}/CTestTestfile.cmake
+}
+
+do_install_ptest:append:toolchain-gcc() {
+    cp -rf ${B}/gnu* ${D}${PTEST_PATH}
+    rm -rf ${D}${PTEST_PATH}/gnu*/libtbb*
+    rm -rf ${D}${PTEST_PATH}/gnu*/*.sh
+}
+
+do_install_ptest:append:toolchain-clang() {
+    cp -rf ${B}/clang* ${D}${PTEST_PATH}
+    rm -rf ${D}${PTEST_PATH}/clang*/libtbb*
+    rm -rf ${D}${PTEST_PATH}/clang*/*.sh
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.51.2


