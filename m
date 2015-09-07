Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0474736B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 07:00:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8770FJr013937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Sep 2015 00:00:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 7 Sep 2015 00:00:14 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Sep 2015 14:55:01 +0800
Message-ID: <1441608901-27606-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441608901-27606-1-git-send-email-rongqing.li@windriver.com>
References: <1441608901-27606-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] conntrack-tools: upgrade to 1.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Sep 2015 07:00:16 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. upgrade to 1.4.2
2. backport a patch to fix CVE-2015-6496:
   http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-6496

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...ack-tools_1.4.0.bb => conntrack-tools_1.4.2.bb} |  5 +-
 ...build-fix-crash-when-optional-kernel-modu.patch | 85 ++++++++++++++++++++++
 2 files changed, 88 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/conntrack-tools/{conntrack-tools_1.4.0.bb => conntrack-tools_1.4.2.bb} (87%)
 create mode 100644 meta-networking/recipes-filter/conntrack-tools/files/0001-conntrackd-build-fix-crash-when-optional-kernel-modu.patch

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.2.bb
similarity index 87%
rename from meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
rename to meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.2.bb
index 57fe21c..7b11d20 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.2.bb
@@ -9,9 +9,10 @@ SRC_URI = " \
     http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar \
     file://conntrack-failover \
     file://init \
+    file://0001-conntrackd-build-fix-crash-when-optional-kernel-modu.patch \
 "
-SRC_URI[tar.md5sum] = "ee737c774e01349f75e935228a2d851b"
-SRC_URI[tar.sha256sum] = "036b032a5c4d180aad686df21399d74506b9b3d3000794eb13ac313482e24896"
+SRC_URI[tar.md5sum] = "b1f9d006e7bf000a77395ff7cd3fac16"
+SRC_URI[tar.sha256sum] = "e5c423dc077f9ca8767eaa6cf40446943905711c6a8fe27f9cc1977d4d6aa11e"
 
 inherit autotools-brokensep update-rc.d pkgconfig
 
diff --git a/meta-networking/recipes-filter/conntrack-tools/files/0001-conntrackd-build-fix-crash-when-optional-kernel-modu.patch b/meta-networking/recipes-filter/conntrack-tools/files/0001-conntrackd-build-fix-crash-when-optional-kernel-modu.patch
new file mode 100644
index 0000000..49c7772
--- /dev/null
+++ b/meta-networking/recipes-filter/conntrack-tools/files/0001-conntrackd-build-fix-crash-when-optional-kernel-modu.patch
@@ -0,0 +1,85 @@
+From c392c159605956c7bd4a264ab4490e2b2704c0cd Mon Sep 17 00:00:00 2001
+From: Pablo Neira Ayuso <pablo@netfilter.org>
+Date: Fri, 13 Jun 2014 12:53:17 +0200
+Subject: [PATCH] conntrackd: build: fix crash when optional kernel modules are
+ not loaded
+
+Upstream-Status: Backport 
+
+Fix a possible crash if conntrackd sees DCCP, SCTP and ICMPv6 traffic
+and the corresponding kernel modules that track this traffic are not
+available.
+
+Fixes: http://bugzilla.netfilter.org/show_bug.cgi?id=910
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+---
+ src/build.c | 22 +++++++++++++---------
+ 1 file changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/src/build.c b/src/build.c
+index 5799b51..9ba8b57 100644
+--- a/src/build.c
++++ b/src/build.c
+@@ -105,14 +105,14 @@ static enum nf_conntrack_attr nat_type[] =
+ 	  ATTR_ORIG_NAT_SEQ_OFFSET_AFTER, ATTR_REPL_NAT_SEQ_CORRECTION_POS,
+ 	  ATTR_REPL_NAT_SEQ_OFFSET_BEFORE, ATTR_REPL_NAT_SEQ_OFFSET_AFTER };
+ 
++/* ICMP, UDP and TCP are always loaded with nf_conntrack_ipv4 */
+ static void build_l4proto_tcp(const struct nf_conntrack *ct, struct nethdr *n)
+ {
+-	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
+-		      sizeof(struct nfct_attr_grp_port));
+-
+ 	if (!nfct_attr_is_set(ct, ATTR_TCP_STATE))
+ 		return;
+ 
++	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
++		      sizeof(struct nfct_attr_grp_port));
+ 	ct_build_u8(ct, ATTR_TCP_STATE, n, NTA_TCP_STATE);
+ 	if (CONFIG(sync).tcp_window_tracking) {
+ 		ct_build_u8(ct, ATTR_TCP_WSCALE_ORIG, n, NTA_TCP_WSCALE_ORIG);
+@@ -122,12 +122,12 @@ static void build_l4proto_tcp(const struct nf_conntrack *ct, struct nethdr *n)
+ 
+ static void build_l4proto_sctp(const struct nf_conntrack *ct, struct nethdr *n)
+ {
+-	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
+-		      sizeof(struct nfct_attr_grp_port));
+-
++	/* SCTP is optional, make sure nf_conntrack_sctp is loaded */
+ 	if (!nfct_attr_is_set(ct, ATTR_SCTP_STATE))
+ 		return;
+ 
++	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
++		      sizeof(struct nfct_attr_grp_port));
+ 	ct_build_u8(ct, ATTR_SCTP_STATE, n, NTA_SCTP_STATE);
+ 	ct_build_u32(ct, ATTR_SCTP_VTAG_ORIG, n, NTA_SCTP_VTAG_ORIG);
+ 	ct_build_u32(ct, ATTR_SCTP_VTAG_REPL, n, NTA_SCTP_VTAG_REPL);
+@@ -135,18 +135,22 @@ static void build_l4proto_sctp(const struct nf_conntrack *ct, struct nethdr *n)
+ 
+ static void build_l4proto_dccp(const struct nf_conntrack *ct, struct nethdr *n)
+ {
+-	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
+-		      sizeof(struct nfct_attr_grp_port));
+-
++	/* DCCP is optional, make sure nf_conntrack_dccp is loaded */
+ 	if (!nfct_attr_is_set(ct, ATTR_DCCP_STATE))
+ 		return;
+ 
++	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
++		      sizeof(struct nfct_attr_grp_port));
+ 	ct_build_u8(ct, ATTR_DCCP_STATE, n, NTA_DCCP_STATE);
+ 	ct_build_u8(ct, ATTR_DCCP_ROLE, n, NTA_DCCP_ROLE);
+ }
+ 
+ static void build_l4proto_icmp(const struct nf_conntrack *ct, struct nethdr *n)
+ {
++	/* This is also used by ICMPv6 and nf_conntrack_ipv6 is optional */
++	if (!nfct_attr_is_set(ct, ATTR_ICMP_TYPE))
++		return;
++
+ 	ct_build_u8(ct, ATTR_ICMP_TYPE, n, NTA_ICMP_TYPE);
+ 	ct_build_u8(ct, ATTR_ICMP_CODE, n, NTA_ICMP_CODE);
+ 	ct_build_u16(ct, ATTR_ICMP_ID, n, NTA_ICMP_ID);
+-- 
+1.9.1
+
-- 
1.9.1


