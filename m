Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2A49275F18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 05:50:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98663912"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Jul 2015 13:54:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6L5mVte026043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 13:48:31 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 21 Jul 2015 13:50:19 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jul 2015 13:49:36 +0800
Message-ID: <1437457780-15226-5-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437457780-15226-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1437457780-15226-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH v2 4/8] konkretcmpi: add new recipe for openlmi
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
X-List-Received-Date: Tue, 21 Jul 2015 05:50:25 -0000
Content-Type: text/plain

Konkretcmpi is dependence of openlmi.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../konkretcmpi/konkretcmpi-native_0.9.2.bb        | 27 +++++++++++++++
 ...-0.9.2-fix-returning-instance-from-method.patch | 38 ++++++++++++++++++++++
 .../konkretcmpi/konkretcmpi_0.9.2.bb               | 32 ++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-method.patch
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb

diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
new file mode 100644
index 0000000..b4b8147
--- /dev/null
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Tool for rapid CMPI providers development"
+DESCRIPTION = "\
+KonkretCMPI makes CMPI provider development easier by generating type-safe \
+concrete CIM interfaces from MOF definitions and by providing default \
+implementations for many of the provider operations."
+HOMEPAGE = "https://github.com/rnovacek/konkretcmpi"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f673270bfc350d9ce1efc8724c6c1873"
+DEPENDS = "cmake-native cmpi-bindings-native"
+
+SRC_URI = "https://github.com/rnovacek/${BPN}/archive/${PV}/${BP}.tar.gz \
+           file://konkretcmpi-0.9.2-fix-returning-instance-from-method.patch"
+SRC_URI[md5sum] = "7e8ed4f47d1a9e5cbed4208920f89d64"
+SRC_URI[sha256sum] = "2ac52fc374e46d68317194bbd6b44e0b2f934df24b201efb395d3eccf0fed634"
+
+inherit native cmake
+LDFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
+EXTRA_OECMAKE = "-DWITH_PYTHON=ON"
+
+do_install_append() {
+    if [ -d ${D}${prefix}/lib64 ]; then
+        mv ${D}${prefix}/lib64 ${D}${libdir}
+    fi
+
+    rm -rf ${D}${datadir}
+}
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-method.patch b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-method.patch
new file mode 100644
index 0000000..b54d091
--- /dev/null
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-method.patch
@@ -0,0 +1,38 @@
+Port from Fedora20
+
+    | commit aca6c7f910ffe9930b5789969f0adfadd668bb46
+    | Author: Michal Minar <miminar@redhat.com>
+    | Date:   Fri Jun 20 10:50:45 2014 +0200
+    | 
+    |     Fix returning instance as an output argument from method
+    |     
+    |     Submitted By: Radek Novacek <rnovacek@redhat.com>
+
+Upstream-Status: Pending
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+
+diff --git a/src/program/main.cpp b/src/program/main.cpp
+index 885dc12..9e7108a 100644
+--- a/src/program/main.cpp
++++ b/src/program/main.cpp
+@@ -506,7 +506,11 @@ static void gen_feature_decls(
+ 
+             // Add sig entry [type][length][name][zero-terminator]
+ 
+-            KTag tag = _ktag(pd->data_type, pd->array_index, key, false, false);
++            KTag tag;
++            if (pd->qualifiers->has_key("EmbeddedInstance"))
++                tag = _ktag(TOK_INSTANCE, pd->array_index, key, false, false);
++            else
++                tag = _ktag(pd->data_type, pd->array_index, key, false, false);
+             pack_tag(sig, tag);
+             pack_name(sig, pd->name);
+             count++;
+@@ -640,6 +644,7 @@ static void gen_param(FILE* os, MOF_Parameter* p, vector<unsigned char>& sig)
+         const char* ktn = _ktype_name(p->data_type);
+ 
+         if (p->qualifiers->has_key("EmbeddedInstance")) {
++            tag = _ktag(TOK_INSTANCE, p->array_index, false, in, out);
+             if (p->array_index)
+                 put(os, "    KInstanceA $0;\n", p->name, NULL);
+             else
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
new file mode 100644
index 0000000..5924c35
--- /dev/null
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Tool for rapid CMPI providers development"
+DESCRIPTION = "\
+KonkretCMPI makes CMPI provider development easier by generating type-safe \
+concrete CIM interfaces from MOF definitions and by providing default \
+implementations for many of the provider operations."
+HOMEPAGE = "https://github.com/rnovacek/konkretcmpi"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f673270bfc350d9ce1efc8724c6c1873"
+DEPENDS = "swig sblim-cmpi-devel python cmake-native"
+
+SRC_URI = "https://github.com/rnovacek/${BPN}/archive/${PV}/${BP}.tar.gz \
+           file://konkretcmpi-0.9.2-fix-returning-instance-from-method.patch"
+SRC_URI[md5sum] = "7e8ed4f47d1a9e5cbed4208920f89d64"
+SRC_URI[sha256sum] = "2ac52fc374e46d68317194bbd6b44e0b2f934df24b201efb395d3eccf0fed634"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DWITH_PYTHON=ON"
+
+do_install_append() {
+    if [ -d ${D}${prefix}/lib64 ]; then
+        mv ${D}${prefix}/lib64 ${D}${libdir}
+    fi
+
+    rm -rf ${D}${datadir}
+}
+
+PACKAGES =+ "${PN}-python ${PN}-python-dbg"
+
+FILES_${PN}-python = "${libdir}/python2.7/site-packages/konkretmof.py* ${libdir}/python2.7/site-packages/_konkretmof.so"
+FILES_${PN}-python-dbg = "${libdir}/python2.7/site-packages/.debug/*"
+
-- 
1.8.4.2


