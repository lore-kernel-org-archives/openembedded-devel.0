Return-Path: <phong@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35F257EC40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 21:28:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8DLRpSx010141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:28:01 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 13 Sep 2019 14:27:40 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21010)	id 2DF6F20512;
	Fri, 13 Sep 2019 17:27:40 -0400 (EDT)
From: Peiran Hong <peiran.hong@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Sep 2019 17:27:29 -0400
Message-ID: <20190913212729.9448-1-peiran.hong@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] tcpdump: Fix CVE-2017-16808
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2019 21:28:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport selected parts of three upstream commits to fix
CVE-2017-16808 where tcpdump 4.9.2 has a heap-based buffer over-read.

Upstream-Status: Backport
[ several ]

Upstream commits fully backported:
46aead6  [CVE-2017-16808/AoE: Add a missing bounds check]

Upstream commits partially backported:
7068209  [Use nd_ types in 802.x and FDDI headers.]
84ef17a  [Replace ND_TTEST2()/ND_TCHECK2() macros by macros using
pointers (1/n)]

46aead6 fixes the vulnerability and requires two macros defined in
7068209 and 84ef17a, which are committed after the release of 4.9.2.
Only the definition of the macros are taken from the two commits
as they impact a wide range of code and are difficult to integrate.

CVE: CVE-2017-16808

Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
---
 ...16808-AoE-Add-a-missing-bounds-check.patch | 61 +++++++++++++++++++
 .../recipes-support/tcpdump/tcpdump_4.9.2.bb  |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
new file mode 100644
index 000000000..919f2b009
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
@@ -0,0 +1,61 @@
+From c45443a0d3e16b92622bea6b589e5930e8f0d815 Mon Sep 17 00:00:00 2001
+From: Peiran Hong <peiran.hong@windriver.com>
+Date: Fri, 13 Sep 2019 17:02:57 -0400
+Subject: [PATCH] CVE-2017-16808/AoE: Add a missing bounds check.
+
+---
+ netdissect.h | 12 ++++++++++++
+ print-aoe.c  |  1 +
+ 2 files changed, 13 insertions(+)
+
+diff --git a/netdissect.h b/netdissect.h
+index 089b0406..cd05fdb9 100644
+--- a/netdissect.h
++++ b/netdissect.h
+@@ -69,6 +69,11 @@ typedef struct {
+ typedef unsigned char nd_uint8_t;
+ typedef signed char nd_int8_t;
+ 
++/*
++ * Use this for MAC addresses.
++ */
++#define MAC_ADDR_LEN    6               /* length of MAC addresses */
++
+ /* snprintf et al */
+ 
+ #include <stdarg.h>
+@@ -309,12 +314,19 @@ struct netdissect_options {
+ 	((uintptr_t)ndo->ndo_snapend - (l) <= (uintptr_t)ndo->ndo_snapend && \
+          (uintptr_t)&(var) <= (uintptr_t)ndo->ndo_snapend - (l)))
+ 
++#define ND_TTEST_LEN(p, l) \
++  (IS_NOT_NEGATIVE(l) && \
++        ((uintptr_t)ndo->ndo_snapend - (l) <= (uintptr_t)ndo->ndo_snapend && \
++         (uintptr_t)(p) <= (uintptr_t)ndo->ndo_snapend - (l)))
++
+ /* True if "var" was captured */
+ #define ND_TTEST(var) ND_TTEST2(var, sizeof(var))
+ 
+ /* Bail if "l" bytes of "var" were not captured */
+ #define ND_TCHECK2(var, l) if (!ND_TTEST2(var, l)) goto trunc
+ 
++#define ND_TCHECK_LEN(p, l) if (!ND_TTEST_LEN(p, l)) goto trunc
++
+ /* Bail if "var" was not captured */
+ #define ND_TCHECK(var) ND_TCHECK2(var, sizeof(var))
+ 
+diff --git a/print-aoe.c b/print-aoe.c
+index 97e93df2..ac097a04 100644
+--- a/print-aoe.c
++++ b/print-aoe.c
+@@ -325,6 +325,7 @@ aoev1_reserve_print(netdissect_options *ndo,
+ 		goto invalid;
+ 	/* addresses */
+ 	for (i = 0; i < nmacs; i++) {
++		ND_TCHECK_LEN(cp, MAC_ADDR_LEN);
+ 		ND_PRINT((ndo, "\n\tEthernet Address %u: %s", i, etheraddr_string(ndo, cp)));
+ 		cp += ETHER_ADDR_LEN;
+ 	}
+-- 
+2.21.0
+
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
index 038c1617f..9bd861cd4 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://avoid-absolute-path-when-searching-for-libdlpi.patch \
     file://add-ptest.patch \
     file://run-ptest \
+    file://0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch \
 "
 
 SRC_URI[md5sum] = "9bbc1ee33dab61302411b02dd0515576"
-- 
2.21.0


