Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9F81877E79
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:21 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id c198so33251759pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eMnBqqC3ptGOOKI9HjBR3FuhsmYNZZhi9Sd3Zw4ggzs=;
	b=FbzPo8q4PTnpH4a7PjVgG56BU6jdeWhQR9yfLOOSjMWLQ4HXpR0c+kRrcPYoeJu4hZ
	QozPCU7sZ9ZIK87VyJQMgwjVzKom6peV5SH4+8dIsR2GifmNoZEea1yLKPZ6U7Zr7cV6
	pw3xbGbqk1haamb/qPsJeZUdPiz+88xU0l1sDQtoVfUXfWjgAtrwU6MT94rEnLaXSycV
	SolEhuHXO4eWqrYLU7GEM4sTPCYN4vy0GpTKyYzXediyjbA5blquxAE0BQAJrlQEdRo+
	dmbaDw5Cqct3F0Hg2Nxw+GNC7Kqc2qluUr6H2y/5IG4V/a+uoKXXBFi659cELro5mPVr
	4WZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eMnBqqC3ptGOOKI9HjBR3FuhsmYNZZhi9Sd3Zw4ggzs=;
	b=IgbBxRh22j8zwkEiLT2yr4vTU96/CEvKUFkNhi5F2LKB1lCMP0FWTWp9HqZGrehjaZ
	ziMIg6FVs+P5WPHq15AiXylE5i3qiuVi4G7xLOucszkbnsCxOMRRsnSvMTFnJdfedp66
	ORpMEVTYDnKV93qlS7BOHrAddSUu6035Zn4zpj3xHnxrOziDyKse3D3N7e7FMJPz9kqf
	0riF2c2Srtf+oQxPzH2A5tdiJV2mX0dc8onlwLNAiA1yAUIJ/TCV1Fy6AowjKMQKKgnS
	6qZp0+6tbzB2mPtXs+chOxgAUR1G+fv3txpzP5Ijfa62Jfo8f3OvZPK0Gk6QK+J9Nc48
	KLRg==
X-Gm-Message-State: AN3rC/7/FfQSelz/vUxaVL4uuO5cCBiyFePy2eVQ5GN+iqOBFXCWCeGI
	zK+q8YqnNhqz3g==
X-Received: by 10.84.135.3 with SMTP id 3mr5304372pli.65.1492116082595;
	Thu, 13 Apr 2017 13:41:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:41 -0700
Message-Id: <20170413204106.30679-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-networking][ 04/29] conntrack-tools: Upgrade to 1.4.4
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ack-tools_1.4.2.bb => conntrack-tools_1.4.4.bb} | 17 +++--
 ...build-fix-crash-when-optional-kernel-modu.patch | 85 ----------------------
 2 files changed, 10 insertions(+), 92 deletions(-)
 rename meta-networking/recipes-filter/conntrack-tools/{conntrack-tools_1.4.2.bb => conntrack-tools_1.4.4.bb} (70%)
 delete mode 100644 meta-networking/recipes-filter/conntrack-tools/files/0001-conntrackd-build-fix-crash-when-optional-kernel-modu.patch

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.2.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.4.bb
similarity index 70%
rename from meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.2.bb
rename to meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.4.bb
index 7b11d206c..8b3490d7c 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.2.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.4.bb
@@ -2,26 +2,29 @@ SUMMARY = "Connection tracking userspace tools for Linux"
 SECTION = "net"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
 DEPENDS = "libnfnetlink libnetfilter-conntrack libnetfilter-cttimeout \
            libnetfilter-cthelper libnetfilter-queue bison-native"
 
-SRC_URI = " \
-    http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar \
+DEPENDS_append_libc-musl = " libtirpc"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+LDFLAGS_append_libc-musl = " -ltirpc"
+
+SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar \
     file://conntrack-failover \
     file://init \
-    file://0001-conntrackd-build-fix-crash-when-optional-kernel-modu.patch \
 "
-SRC_URI[tar.md5sum] = "b1f9d006e7bf000a77395ff7cd3fac16"
-SRC_URI[tar.sha256sum] = "e5c423dc077f9ca8767eaa6cf40446943905711c6a8fe27f9cc1977d4d6aa11e"
+SRC_URI[tar.md5sum] = "acd9e0b27cf16ae3092ba900e4d7560e"
+SRC_URI[tar.sha256sum] = "b7caf4fcc4c03575df57d25e5216584d597fd916c891f191dac616ce68bdba6c"
 
-inherit autotools-brokensep update-rc.d pkgconfig
+inherit autotools update-rc.d pkgconfig
 
 INITSCRIPT_NAME = "conntrackd"
 
 do_install_append() {
     install -d ${D}/${sysconfdir}/conntrackd
     install -d ${D}/${sysconfdir}/init.d
-    install -m 0644 doc/sync/ftfw/conntrackd.conf ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
+    install -m 0644 ${S}/doc/sync/ftfw/conntrackd.conf ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
     install -m 0755 ${WORKDIR}/conntrack-failover ${D}/${sysconfdir}/init.d/conntrack-failover
     install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/conntrackd
 
diff --git a/meta-networking/recipes-filter/conntrack-tools/files/0001-conntrackd-build-fix-crash-when-optional-kernel-modu.patch b/meta-networking/recipes-filter/conntrack-tools/files/0001-conntrackd-build-fix-crash-when-optional-kernel-modu.patch
deleted file mode 100644
index a7ab6d687..000000000
--- a/meta-networking/recipes-filter/conntrack-tools/files/0001-conntrackd-build-fix-crash-when-optional-kernel-modu.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From c392c159605956c7bd4a264ab4490e2b2704c0cd Mon Sep 17 00:00:00 2001
-From: Pablo Neira Ayuso <pablo@netfilter.org>
-Date: Fri, 13 Jun 2014 12:53:17 +0200
-Subject: [PATCH] conntrackd: build: fix crash when optional kernel modules are
- not loaded
-
-Upstream-Status: Backport
-
-Fix a possible crash if conntrackd sees DCCP, SCTP and ICMPv6 traffic
-and the corresponding kernel modules that track this traffic are not
-available.
-
-Fixes: http://bugzilla.netfilter.org/show_bug.cgi?id=910
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- src/build.c | 22 +++++++++++++---------
- 1 file changed, 13 insertions(+), 9 deletions(-)
-
-diff --git a/src/build.c b/src/build.c
-index 5799b51..9ba8b57 100644
---- a/src/build.c
-+++ b/src/build.c
-@@ -105,14 +105,14 @@ static enum nf_conntrack_attr nat_type[] =
- 	  ATTR_ORIG_NAT_SEQ_OFFSET_AFTER, ATTR_REPL_NAT_SEQ_CORRECTION_POS,
- 	  ATTR_REPL_NAT_SEQ_OFFSET_BEFORE, ATTR_REPL_NAT_SEQ_OFFSET_AFTER };
- 
-+/* ICMP, UDP and TCP are always loaded with nf_conntrack_ipv4 */
- static void build_l4proto_tcp(const struct nf_conntrack *ct, struct nethdr *n)
- {
--	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
--		      sizeof(struct nfct_attr_grp_port));
--
- 	if (!nfct_attr_is_set(ct, ATTR_TCP_STATE))
- 		return;
- 
-+	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
-+		      sizeof(struct nfct_attr_grp_port));
- 	ct_build_u8(ct, ATTR_TCP_STATE, n, NTA_TCP_STATE);
- 	if (CONFIG(sync).tcp_window_tracking) {
- 		ct_build_u8(ct, ATTR_TCP_WSCALE_ORIG, n, NTA_TCP_WSCALE_ORIG);
-@@ -122,12 +122,12 @@ static void build_l4proto_tcp(const struct nf_conntrack *ct, struct nethdr *n)
- 
- static void build_l4proto_sctp(const struct nf_conntrack *ct, struct nethdr *n)
- {
--	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
--		      sizeof(struct nfct_attr_grp_port));
--
-+	/* SCTP is optional, make sure nf_conntrack_sctp is loaded */
- 	if (!nfct_attr_is_set(ct, ATTR_SCTP_STATE))
- 		return;
- 
-+	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
-+		      sizeof(struct nfct_attr_grp_port));
- 	ct_build_u8(ct, ATTR_SCTP_STATE, n, NTA_SCTP_STATE);
- 	ct_build_u32(ct, ATTR_SCTP_VTAG_ORIG, n, NTA_SCTP_VTAG_ORIG);
- 	ct_build_u32(ct, ATTR_SCTP_VTAG_REPL, n, NTA_SCTP_VTAG_REPL);
-@@ -135,18 +135,22 @@ static void build_l4proto_sctp(const struct nf_conntrack *ct, struct nethdr *n)
- 
- static void build_l4proto_dccp(const struct nf_conntrack *ct, struct nethdr *n)
- {
--	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
--		      sizeof(struct nfct_attr_grp_port));
--
-+	/* DCCP is optional, make sure nf_conntrack_dccp is loaded */
- 	if (!nfct_attr_is_set(ct, ATTR_DCCP_STATE))
- 		return;
- 
-+	ct_build_group(ct, ATTR_GRP_ORIG_PORT, n, NTA_PORT,
-+		      sizeof(struct nfct_attr_grp_port));
- 	ct_build_u8(ct, ATTR_DCCP_STATE, n, NTA_DCCP_STATE);
- 	ct_build_u8(ct, ATTR_DCCP_ROLE, n, NTA_DCCP_ROLE);
- }
- 
- static void build_l4proto_icmp(const struct nf_conntrack *ct, struct nethdr *n)
- {
-+	/* This is also used by ICMPv6 and nf_conntrack_ipv6 is optional */
-+	if (!nfct_attr_is_set(ct, ATTR_ICMP_TYPE))
-+		return;
-+
- 	ct_build_u8(ct, ATTR_ICMP_TYPE, n, NTA_ICMP_TYPE);
- 	ct_build_u8(ct, ATTR_ICMP_CODE, n, NTA_ICMP_CODE);
- 	ct_build_u16(ct, ATTR_ICMP_ID, n, NTA_ICMP_ID);
--- 
-1.9.1
-
-- 
2.12.2


