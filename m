Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5166D3A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 07:46:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1Q7iTSA006285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 23:46:00 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Mon, 25 Feb 2019 23:45:53 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Feb 2019 15:45:51 +0800
Message-ID: <1551167151-192268-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] net-snmp: fix compile error with --disable-des
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
X-List-Received-Date: Tue, 26 Feb 2019 07:46:10 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

| scapi.c: In function 'sc_encrypt':
| scapi.c:1256:5: error: 'pad_size' undeclared (first use in this function); did you mean 'dysize'?
|      pad_size = pai->pad_size;
|      ^~~~~~~~
|      dysize

pad_size is defined only without --disable-des
[snip]
    int             pad, plast, pad_size = 0;

but used when disable-des
[snip]
        QUITFUN(SNMPERR_GENERR, sc_encrypt_quit);
    }
    pad_size = pai->pad_size;

    memset(my_iv, 0, sizeof(my_iv));

    if (USM_CREATE_USER_PRIV_DES == (pai->type & USM_PRIV_MASK_ALG)) {

        /*

fix by move it into #ifndef NETSNMP_DISABLE_DES

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...01-net-snmp-fix-compile-error-disable-des.patch | 62 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.8.bb     |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch
new file mode 100644
index 0000000..7e686ce
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-net-snmp-fix-compile-error-disable-des.patch
@@ -0,0 +1,62 @@
+From e38c508ef401593b1d4fe42b62e42a49cfec82af Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 26 Feb 2019 14:26:07 +0800
+Subject: [PATCH] net-snmp: fix compile error with --disable-des
+
+| scapi.c: In function 'sc_encrypt':
+| scapi.c:1256:5: error: 'pad_size' undeclared (first use in this function); did you mean 'dysize'?
+|      pad_size = pai->pad_size;
+|      ^~~~~~~~
+|      dysize
+
+pad_size is defined only without --disable-des
+[snip]
+#ifndef NETSNMP_DISABLE_DES
+    int             pad, plast, pad_size = 0; 
+
+but used when disable-des,
+[snip]
+        QUITFUN(SNMPERR_GENERR, sc_encrypt_quit);
+    }    
+    pad_size = pai->pad_size;
+
+    memset(my_iv, 0, sizeof(my_iv));
+
+#ifndef NETSNMP_DISABLE_DES
+    if (USM_CREATE_USER_PRIV_DES == (pai->type & USM_PRIV_MASK_ALG)) {
+
+        /*
+
+fix by move it into #ifndef NETSNMP_DISABLE_DES
+
+Upstream-Status: Submitted [https://sourceforge.net/p/net-snmp/bugs/2927/]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ snmplib/scapi.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/snmplib/scapi.c b/snmplib/scapi.c
+index 43caddf..c09deb0 100644
+--- a/snmplib/scapi.c
++++ b/snmplib/scapi.c
+@@ -1253,7 +1253,6 @@ sc_encrypt(const oid * privtype, size_t privtypelen,
+ 
+         QUITFUN(SNMPERR_GENERR, sc_encrypt_quit);
+     }
+-    pad_size = pai->pad_size;
+ 
+     memset(my_iv, 0, sizeof(my_iv));
+ 
+@@ -1263,6 +1262,8 @@ sc_encrypt(const oid * privtype, size_t privtypelen,
+         /*
+          * now calculate the padding needed 
+          */
++
++       pad_size = pai->pad_size;
+         pad = pad_size - (ptlen % pad_size);
+         plast = (int) ptlen - (pad_size - pad);
+         if (pad == pad_size)
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index e1c780b..1e87fd0 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://net-snmp-fix-for-disable-des.patch \
            file://reproducibility-have-printcap.patch \
            file://reproducibility-accept-configure-options-from-env.patch \
+           file://0001-net-snmp-fix-compile-error-disable-des.patch \
            "
 SRC_URI[md5sum] = "6aae5948df7efde626613d6a4b3cd9d4"
 SRC_URI[sha256sum] = "c6291385b8ed84f05890fe4197005daf7e7ee7b082c2e390fa114a9477a56042"
-- 
2.7.4


