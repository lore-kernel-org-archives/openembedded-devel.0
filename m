Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9237318D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 08:23:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0M8NKew015661
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 00:23:20 -0800 (PST)
Received: from xzhang1-OptiPlex-9020.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 22 Jan 2016 00:23:19 -0800
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Jan 2016 16:23:18 +0800
Message-ID: <1453450998-31702-1-git-send-email-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] bind: bug fix for CVE-2015-8704 CVE-2015-8705
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
X-List-Received-Date: Fri, 22 Jan 2016 08:23:21 -0000
Content-Type: text/plain

CVE-2015-8704: Specific APL RR data could cause a server to exit
due to an INSIST failure in apl_42.c when performing certain string
formatting operations. All versions since 9.3.0 are affected.

CVE-2015-8704:Printing or logging some problem EDNS0 OPT pseudo-records
or ECS options could crash named with a REQUIRE assertion or other
misbehavior. This affects 9.10.0 and newer versions.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 .../bind/bind/bind-CVE-2015-8704.patch             | 43 +++++++++++
 .../bind/bind/bind-CVE-2015-8705.patch             | 83 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.3-P2.bb   |  2 +
 3 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind-CVE-2015-8704.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/bind-CVE-2015-8705.patch

diff --git a/meta/recipes-connectivity/bind/bind/bind-CVE-2015-8704.patch b/meta/recipes-connectivity/bind/bind/bind-CVE-2015-8704.patch
new file mode 100644
index 0000000..26fca05
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/bind-CVE-2015-8704.patch
@@ -0,0 +1,43 @@
+From 690e895a5c66433803d5a36cafce83fc1775b022 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Thu, 31 Dec 2015 13:43:21 +1100
+Subject: [PATCH 1/2] bind: bug fix for CVE-2015-8704
+
+commit 1b3d21180244529f0099894fe9d29beb3f11efb3 upstream
+https://source.isc.org/git/bind9.git
+
+4285. [security] Specific APL data could trigger a INSIST. (CVE-2015-8704) [RT #41396]
+
+Upstream Status: Backport
+CVE: CVE-2015-8704
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ lib/dns/rdata/in_1/apl_42.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/dns/rdata/in_1/apl_42.c b/lib/dns/rdata/in_1/apl_42.c
+index 94133ba..f2d58bc 100644
+--- a/lib/dns/rdata/in_1/apl_42.c
++++ b/lib/dns/rdata/in_1/apl_42.c
+@@ -116,7 +116,7 @@ totext_in_apl(ARGS_TOTEXT) {
+ 	isc_uint8_t len;
+ 	isc_boolean_t neg;
+ 	unsigned char buf[16];
+-	char txt[sizeof(" !64000")];
++	char txt[sizeof(" !64000:")];
+ 	const char *sep = "";
+ 	int n;
+ 
+@@ -140,7 +140,7 @@ totext_in_apl(ARGS_TOTEXT) {
+ 		isc_region_consume(&sr, 1);
+ 		INSIST(len <= sr.length);
+ 		n = snprintf(txt, sizeof(txt), "%s%s%u:", sep,
+-			     neg ? "!": "", afi);
++			     neg ? "!" : "", afi);
+ 		INSIST(n < (int)sizeof(txt));
+ 		RETERR(str_totext(txt, target));
+ 		switch (afi) {
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/bind/bind/bind-CVE-2015-8705.patch b/meta/recipes-connectivity/bind/bind/bind-CVE-2015-8705.patch
new file mode 100644
index 0000000..1ea498d
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/bind-CVE-2015-8705.patch
@@ -0,0 +1,83 @@
+From beb1c3e568e11efb0d080351ce2694a6df576574 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Thu, 31 Dec 2015 22:17:37 +1100
+Subject: [PATCH] bind: bug fix for CVE-2015-8705
+
+commit 3e0c1603a835c678b07f1147909bf196988ee0d3 upstream
+https://source.isc.org/git/bind9.git
+
+4286. [security] render_ecs errors were mishandled when
+printing out a OPT record resulting in a assertion
+failure. (CVE-2015-8705) [RT #41397]
+
+Upstream Status: Backport
+CVE: CVE-2015-8705
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ lib/dns/message.c | 25 +++++++++++++++++--------
+ 1 file changed, 17 insertions(+), 8 deletions(-)
+
+diff --git a/lib/dns/message.c b/lib/dns/message.c
+index ea7b93a..e4456dc 100644
+--- a/lib/dns/message.c
++++ b/lib/dns/message.c
+@@ -3245,7 +3245,7 @@ dns_message_sectiontotext(dns_message_t *msg, dns_section_t section,
+ }
+ 
+ static isc_result_t
+-render_ecs(isc_buffer_t *optbuf, isc_buffer_t *target) {
++render_ecs(isc_buffer_t *ecsbuf, isc_buffer_t *target) {
+ 	int i;
+ 	char addr[16], addr_text[64];
+ 	isc_uint16_t family;
+@@ -3255,20 +3255,20 @@ render_ecs(isc_buffer_t *optbuf, isc_buffer_t *target) {
+ 	 * Note: This routine needs to handle malformed ECS options.
+ 	 */
+ 
+-	if (isc_buffer_remaininglength(optbuf) < 4)
++	if (isc_buffer_remaininglength(ecsbuf) < 4)
+ 		return (DNS_R_OPTERR);
+-	family = isc_buffer_getuint16(optbuf);
+-	addrlen = isc_buffer_getuint8(optbuf);
+-	scopelen = isc_buffer_getuint8(optbuf);
++	family = isc_buffer_getuint16(ecsbuf);
++	addrlen = isc_buffer_getuint8(ecsbuf);
++	scopelen = isc_buffer_getuint8(ecsbuf);
+ 
+ 	addrbytes = (addrlen + 7) / 8;
+-	if (isc_buffer_remaininglength(optbuf) < addrbytes)
++	if (isc_buffer_remaininglength(ecsbuf) < addrbytes)
+ 		return (DNS_R_OPTERR);
+ 
+ 	ADD_STRING(target, ": ");
+ 	memset(addr, 0, sizeof(addr));
+ 	for (i = 0; i < addrbytes; i ++)
+-		addr[i] = isc_buffer_getuint8(optbuf);
++		addr[i] = isc_buffer_getuint8(ecsbuf);
+ 
+ 	if (family == 1)
+ 		inet_ntop(AF_INET, addr, addr_text, sizeof(addr_text));
+@@ -3361,9 +3361,18 @@ dns_message_pseudosectiontotext(dns_message_t *msg,
+ 			} else if (optcode == DNS_OPT_COOKIE) {
+ 				ADD_STRING(target, "; COOKIE");
+ 			} else if (optcode == DNS_OPT_CLIENT_SUBNET) {
++				isc_buffer_t ecsbuf;
++
+ 				ADD_STRING(target, "; CLIENT-SUBNET");
+-				result = render_ecs(&optbuf, target);
++				isc_buffer_init(&ecsbuf,
++						isc_buffer_current(&optbuf),
++						optlen);
++				isc_buffer_add(&ecsbuf, optlen);
++				result = render_ecs(&ecsbuf, target);
++				if (result == ISC_R_NOSPACE)
++					return (result);
+ 				if (result == ISC_R_SUCCESS) {
++					isc_buffer_forward(&optbuf, optlen);
+ 					ADD_STRING(target, "\n");
+ 					continue;
+ 				}
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
index 875a0c8..c38efed 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
@@ -21,6 +21,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
+           file://bind-CVE-2015-8704.patch \
+           file://bind-CVE-2015-8705.patch \
            "
 
 SRC_URI[md5sum] = "672dd3c2796b12ac8440f55bcaecfa82"
-- 
1.8.5.2.233.g932f7e4


