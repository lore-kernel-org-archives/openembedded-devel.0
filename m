Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0E3C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 06:36:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5270.1740638214381231584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 22:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4153b328b7=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R5UgHP006603
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 22:36:53 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmhs36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 22:36:53 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 26 Feb 2025 22:36:52 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 26 Feb 2025 22:36:51 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] abseil-cpp: fix CVE-2025-0838
Date: Thu, 27 Feb 2025 14:36:50 +0800
Message-ID: <20250227063650.2696429-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JYfKaTp07Z7zP7l3TGiTQEsnln6N9D9Z
X-Authority-Analysis: v=2.4 cv=TuEchCXh c=1 sm=1 tr=0 ts=67c00805 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=zZnWiLf__wFqp9Gw25MA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JYfKaTp07Z7zP7l3TGiTQEsnln6N9D9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_03,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502270049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 06:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115686

From: Changqing Li <changqing.li@windriver.com>

Backport a patch to fix CVE-2025-0838

CVE-2025-0838:
There exists a heap buffer overflow vulnerable in Abseil-cpp. The sized
constructors, reserve(), and rehash() methods of
absl::{flat,node}hash{set,map} did not impose an upper bound on their
size argument. As a result, it was possible for a caller to pass a very
large size that would cause an integer overflow when computing the size
of the container's backing store, and a subsequent out-of-bounds memory
write. Subsequent accesses to the container might also access
out-of-bounds memory. We recommend upgrading past commit
5a0e2cb5e3958dd90bb8569a2766622cb74d90c1

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-0838

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../abseil-cpp/abseil-cpp/CVE-2025-0838.patch | 114 ++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/CVE-2025-0838.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/CVE-2025-0838.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/CVE-2025-0838.patch
new file mode 100644
index 0000000000..c8d5cd1f0a
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/CVE-2025-0838.patch
@@ -0,0 +1,114 @@
+From bdbad523d92cd2308139086226bfc36fc2068267 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 27 Feb 2025 12:05:11 +0800
+Subject: [PATCH] Fix potential integer overflow in hash container
+ create/resize (#1813)
+
+The sized constructors, reserve(), and rehash() methods of
+absl::{flat,node}_hash_{set,map} did not impose an upper bound on
+their size argument. As a result, it was possible for a caller to pass
+a very large size that would cause an integer overflow when computing
+the size of the container's backing store. Subsequent accesses to the
+container might then access out-of-bounds memory.
+
+The fix is in two parts:
+
+1) Update max_size() to return the maximum number of items that can be
+stored in the container
+
+2) Validate the size arguments to the constructors, reserve(), and
+rehash() methods, and abort the program when the argument is invalid
+
+We've looked at uses of these containers in Google codebases like
+Chrome, and determined this vulnerability is likely to be difficult to
+exploit. This is primarily because container sizes are rarely
+attacker-controlled.
+
+The bug was discovered by Dmitry Vyukov <dvyukov@google.com>.
+
+CVE: CVE-2025-0838
+Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/caa7bb4457bfcafcd55a940204ef78c1bf1f417d]
+This patch is backported from 20230802.3
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ absl/container/internal/raw_hash_set.h       | 15 ++++++++++++++-
+ absl/container/internal/raw_hash_set_test.cc |  8 ++++++++
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/absl/container/internal/raw_hash_set.h b/absl/container/internal/raw_hash_set.h
+index 046a6939..ecea25b4 100644
+--- a/absl/container/internal/raw_hash_set.h
++++ b/absl/container/internal/raw_hash_set.h
+@@ -662,6 +662,12 @@ inline size_t NormalizeCapacity(size_t n) {
+   return n ? ~size_t{} >> countl_zero(n) : 1;
+ }
+ 
++template <size_t kSlotSize>
++size_t MaxValidCapacity() {
++  return NormalizeCapacity((std::numeric_limits<size_t>::max)() / 4 /
++                           kSlotSize);
++}
++
+ // General notes on capacity/growth methods below:
+ // - We use 7/8th as maximum load factor. For 16-wide groups, that gives an
+ //   average of two empty slots per group.
+@@ -1065,6 +1071,8 @@ class raw_hash_set {
+       : ctrl_(EmptyGroup()),
+         settings_(0, HashtablezInfoHandle(), hash, eq, alloc) {
+     if (bucket_count) {
++      ABSL_RAW_CHECK(bucket_count <= MaxValidCapacity<sizeof(slot_type)>(),
++                     "Hash table size overflow");
+       capacity_ = NormalizeCapacity(bucket_count);
+       initialize_slots();
+     }
+@@ -1258,7 +1266,9 @@ class raw_hash_set {
+   bool empty() const { return !size(); }
+   size_t size() const { return size_; }
+   size_t capacity() const { return capacity_; }
+-  size_t max_size() const { return (std::numeric_limits<size_t>::max)(); }
++  size_t max_size() const {
++    return CapacityToGrowth(MaxValidCapacity<sizeof(slot_type)>());
++  }
+ 
+   ABSL_ATTRIBUTE_REINITIALIZES void clear() {
+     // Iterating over this container is O(bucket_count()). When bucket_count()
+@@ -1595,6 +1605,8 @@ class raw_hash_set {
+     auto m = NormalizeCapacity(n | GrowthToLowerboundCapacity(size()));
+     // n == 0 unconditionally rehashes as per the standard.
+     if (n == 0 || m > capacity_) {
++      ABSL_RAW_CHECK(m <= MaxValidCapacity<sizeof(slot_type)>(),
++                     "Hash table size overflow");
+       resize(m);
+ 
+       // This is after resize, to ensure that we have completed the allocation
+@@ -1605,6 +1617,7 @@ class raw_hash_set {
+ 
+   void reserve(size_t n) {
+     if (n > size() + growth_left()) {
++      ABSL_RAW_CHECK(n <= max_size(), "Hash table size overflow");
+       size_t m = GrowthToLowerboundCapacity(n);
+       resize(NormalizeCapacity(m));
+ 
+diff --git a/absl/container/internal/raw_hash_set_test.cc b/absl/container/internal/raw_hash_set_test.cc
+index 9cd88a28..81a5c866 100644
+--- a/absl/container/internal/raw_hash_set_test.cc
++++ b/absl/container/internal/raw_hash_set_test.cc
+@@ -2176,6 +2176,14 @@ TEST(Table, AlignOne) {
+   }
+ }
+ 
++TEST(Table, MaxSizeOverflow) {
++  size_t overflow = (std::numeric_limits<size_t>::max)();
++  EXPECT_DEATH_IF_SUPPORTED(IntTable t(overflow), "Hash table size overflow");
++  IntTable t;
++  EXPECT_DEATH_IF_SUPPORTED(t.reserve(overflow), "Hash table size overflow");
++  EXPECT_DEATH_IF_SUPPORTED(t.rehash(overflow), "Hash table size overflow");
++}
++
+ }  // namespace
+ }  // namespace container_internal
+ ABSL_NAMESPACE_END
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 30eef75ffb..dd63aedab9 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-absl-strings-internal-str_format-extension.h-add-mis.patch \
+           file://CVE-2025-0838.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


