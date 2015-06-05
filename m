Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56F74757F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 05:29:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t555TiXF019894
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Jun 2015 22:29:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 4 Jun 2015 22:29:44 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jun 2015 13:23:28 +0800
Message-ID: <1433481808-3205-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] ipsec-tools: Security Advisory - CVE-2015-4047
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
X-List-Received-Date: Fri, 05 Jun 2015 05:29:48 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

This fixed the CVE-2015-4047:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-4047

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../ipsec-tools/fix-CVE-2015-4047.patch            | 36 ++++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch
new file mode 100644
index 0000000..5286376
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch
@@ -0,0 +1,36 @@
+[PATCH] fix CVE-2015-4047
+
+Upstream-Status: Backport
+
+http://www.openwall.com/lists/oss-security/2015/05/20/1
+
+racoon/gssapi.c in IPsec-Tools 0.8.2 allows remote attackers to cause
+a denial of service (NULL pointer dereference and IKE daemon crash) via
+a series of crafted UDP requests.
+
+https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-4047
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ src/racoon/gssapi.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/racoon/gssapi.c b/src/racoon/gssapi.c
+index e64b201..1ad3b42 100644
+--- a/src/racoon/gssapi.c
++++ b/src/racoon/gssapi.c
+@@ -192,6 +192,11 @@ gssapi_init(struct ph1handle *iph1)
+ 	gss_name_t princ, canon_princ;
+ 	OM_uint32 maj_stat, min_stat;
+ 
++	if (iph1->rmconf == NULL) {
++	        plog(LLV_ERROR, LOCATION, NULL, "no remote config\n");
++	        return -1;
++	}
++
+ 	gps = racoon_calloc(1, sizeof (struct gssapi_ph1_state));
+ 	if (gps == NULL) {
+ 		plog(LLV_ERROR, LOCATION, NULL, "racoon_calloc failed\n");
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 67b70d0..bb6fe84 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV
            file://racoon.conf.sample \
            file://racoon.conf \
            file://racoon.service \
+           file://fix-CVE-2015-4047.patch \
           "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
-- 
1.9.1


