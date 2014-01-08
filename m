Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46AD56D0A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2014 09:32:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s089WmW3001967
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jan 2014 01:32:48 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 8 Jan 2014 01:32:48 -0800
From: <wenzong.fan@windriver.com>
To: <xin.ouyang@windriver.com>, <mark.hatle@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2014 04:32:28 -0500
Message-ID: <c882733739bd923fac2d5939b158b064b031b4be.1389171235.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389171235.git.wenzong.fan@windriver.com>
References: <cover.1389171235.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [meta-selinux][PATCH 08/10] libsemanage: add audit dependency
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
X-List-Received-Date: Wed, 08 Jan 2014 09:32:47 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Building libsemanage 2.2 need the header libaudit.h.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 recipes-security/audit/audit_2.3.2.bb    |    8 +++++++-
 recipes-security/selinux/libsemanage.inc |    2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes-security/audit/audit_2.3.2.bb b/recipes-security/audit/audit_2.3.2.bb
index bd7b4eb..b546297 100644
--- a/recipes-security/audit/audit_2.3.2.bb
+++ b/recipes-security/audit/audit_2.3.2.bb
@@ -26,6 +26,7 @@ SRC_URI[md5sum] = "4e8d065b5cc16b77b9b61e93a9ed160e"
 SRC_URI[sha256sum] = "8872e0b5392888789061db8034164305ef0e1b34543e1e7004d275f039081d29"
 
 DEPENDS += "python tcp-wrappers libcap-ng linux-libc-headers (>= 2.6.30)"
+DEPENDS_class-native = ""
 
 EXTRA_OECONF += "--without-prelude \
 	--with-libwrap \
@@ -37,6 +38,9 @@ EXTRA_OECONF += "--without-prelude \
 	--sbindir=${base_sbindir} \
 	"
 
+# Remove extra configs for native build
+EXTRA_OECONF_class-native = "--with-python=no"
+
 EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' \
 	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
 	pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
@@ -62,7 +66,7 @@ FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
 FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
 FILES_${PN}-dev += "${base_libdir}/*.so ${base_libdir}/*.la"
 
-do_install_append() {
+do_install_append_class-target() {
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la
 
@@ -75,3 +79,5 @@ do_install_append() {
 	install -D -m 0755 ${S}/../auditd ${D}/etc/init.d/auditd
 	rm -rf ${D}/etc/rc.d
 }
+
+BBCLASSEXTEND = "native"
diff --git a/recipes-security/selinux/libsemanage.inc b/recipes-security/selinux/libsemanage.inc
index dfc3006..a978c75 100644
--- a/recipes-security/selinux/libsemanage.inc
+++ b/recipes-security/selinux/libsemanage.inc
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1+"
 
 inherit lib_package
 
-DEPENDS += "libsepol libselinux ustr bzip2 python bison-native flex-native"
+DEPENDS += "libsepol libselinux ustr bzip2 python audit bison-native flex-native"
 
 PACKAGES += "${PN}-python"
 FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
-- 
1.7.9.5


