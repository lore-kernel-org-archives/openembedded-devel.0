Return-Path: <Catalin.Enache@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13F3F60116
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 15:56:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3KFuEhV028039
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:56:15 -0700
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 20 Apr 2016 08:56:13 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Apr 2016 18:59:16 +0300
Message-ID: <1461167956-24972-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] squid: CVE-2016-3947
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
X-List-Received-Date: Wed, 20 Apr 2016 15:56:15 -0000
Content-Type: text/plain

Heap-based buffer overflow in the Icmp6::Recv function in
icmp/Icmp6.cc in the pinger in Squid before 3.5.16 and 4.x
before 4.0.8 allows remote servers to cause a denial of
service (performance degradation or transition failures)
or write sensitive information to log files via an ICMPv6
packet.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3947

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../squid/files/CVE-2016-3947.patch                | 48 ++++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch
new file mode 100644
index 0000000..c83e6ab
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch
@@ -0,0 +1,48 @@
+From 0fe108ecb2bbdf684f159950eaa55d22f07c4008 Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Wed, 20 Apr 2016 15:17:18 +0300
+Subject: [PATCH] pinger: Fix buffer overflow in Icmp6::Recv
+
+Upstream-Status: Backport
+CVE: CVE-2016-3947
+
+Author: Yuriy M. Kaminskiy <yumkam@gmail.com>
+Committer: Amos Jeffries <squid3@treenet.co.nz
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/icmp/Icmp6.cc | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/icmp/Icmp6.cc b/src/icmp/Icmp6.cc
+index 794a51a..ee84b80 100644
+--- a/src/icmp/Icmp6.cc
++++ b/src/icmp/Icmp6.cc
+@@ -256,7 +256,7 @@ Icmp6::Recv(void)
+     #define ip6_hops    // HOPS!!!  (can it be true??)
+ 
+         ip = (struct ip6_hdr *) pkt;
+-        pkt += sizeof(ip6_hdr);
++        NP: echo size needs to +sizeof(ip6_hdr);
+ 
+     debugs(42, DBG_CRITICAL, HERE << "ip6_nxt=" << ip->ip6_nxt <<
+             ", ip6_plen=" << ip->ip6_plen <<
+@@ -267,7 +267,6 @@ Icmp6::Recv(void)
+     */
+ 
+     icmp6header = (struct icmp6_hdr *) pkt;
+-    pkt += sizeof(icmp6_hdr);
+ 
+     if (icmp6header->icmp6_type != ICMP6_ECHO_REPLY) {
+ 
+@@ -292,7 +291,7 @@ Icmp6::Recv(void)
+         return;
+     }
+ 
+-    echo = (icmpEchoData *) pkt;
++    echo = (icmpEchoData *) (pkt + sizeof(icmp6_hdr));
+ 
+     preply.opcode = echo->opcode;
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index a94fed7..e35aad7 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://volatiles.03_squid \
+           file://CVE-2016-3947.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-- 
2.7.4


