Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEB761883
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 16:23:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r71GNQvH017400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Aug 2013 09:23:26 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 1 Aug 2013 09:23:24 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Aug 2013 09:23:24 -0700
Message-ID: <1375374204-5632-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-selinux][PATCH 1/1] audit: Fixed swig host contamination issue
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
X-List-Received-Date: Thu, 01 Aug 2013 16:23:25 -0000
Content-Type: text/plain

From: Anders Hedlund <anders.hedlund@windriver.com>

CQID: 428272

The audit build uses swig to generate a python wrapper.
Unfortunately, the swig info file references host include
directories.  Some of these were previously noticed and
eliminated, but the one fixed here was not.

Signed-off-by: Anders Hedlund <anders.hedlund@windriver.com>
Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../audit/audit/fix-swig-host-contamination.patch  |   48 ++++++++++++++++++++
 recipes-security/audit/audit_2.1.3.bb              |    7 ++-
 recipes-security/audit/audit_2.2.1.bb              |    6 ++-
 3 files changed, 56 insertions(+), 5 deletions(-)
 create mode 100644 recipes-security/audit/audit/fix-swig-host-contamination.patch

diff --git a/recipes-security/audit/audit/fix-swig-host-contamination.patch b/recipes-security/audit/audit/fix-swig-host-contamination.patch
new file mode 100644
index 0000000..16bb173
--- /dev/null
+++ b/recipes-security/audit/audit/fix-swig-host-contamination.patch
@@ -0,0 +1,48 @@
+audit: Fixed swig host contamination issue
+
+The audit build uses swig to generate a python wrapper.
+Unfortunately, the swig info file references host include
+directories.  Some of these were previously noticed and
+eliminated, but the one fixed here was not.
+
+Upstream Status:  pending
+
+Signed-off-by: Anders Hedlund <anders.hedlund@windriver.com>
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+Index: audit-2.2.1/swig/Makefile.am
+===================================================================
+--- audit-2.2.1.orig/swig/Makefile.am
++++ audit-2.2.1/swig/Makefile.am
+@@ -25,6 +25,7 @@ AM_CFLAGS = -fPIC -DPIC -fno-strict-alia
+ PYLIBVER ?= python$(PYTHON_VERSION)
+ PYINC ?= /usr/include/$(PYLIBVER)
+ INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib -I$(PYINC)
++STDINC ?= /usr/include
+ LIBS = $(top_builddir)/lib/libaudit.la
+ pyexec_PYTHON = audit.py
+ pyexec_LTLIBRARIES = _audit.la
+@@ -34,7 +35,7 @@ _audit_la_HEADERS: $(top_builddir)/confi
+ _audit_la_DEPENDENCIES =${top_srcdir}/lib/libaudit.h ${top_builddir}/lib/libaudit.la
+ nodist__audit_la_SOURCES  = audit_wrap.c
+ audit.py audit_wrap.c: ${srcdir}/auditswig.i 
+-	swig -o audit_wrap.c -python ${INCLUDES} ${srcdir}/auditswig.i 
++	swig -o audit_wrap.c -python ${INCLUDES} -I$(STDINC) ${srcdir}/auditswig.i
+ 
+ CLEANFILES = audit.py* audit_wrap.c *~
+ 
+Index: audit-2.2.1/swig/auditswig.i
+===================================================================
+--- audit-2.2.1.orig/swig/auditswig.i
++++ audit-2.2.1/swig/auditswig.i
+@@ -37,8 +37,8 @@ signed
+ #define __attribute(X) /*nothing*/
+ typedef unsigned __u32;
+ typedef unsigned uid_t;
+-%include "/usr/include/linux/audit.h"
++%include "linux/audit.h"
+ #define __extension__ /*nothing*/
+-%include "/usr/include/stdint.h"
++%include "stdint.h"
+ %include "../lib/libaudit.h"
+ 
diff --git a/recipes-security/audit/audit_2.1.3.bb b/recipes-security/audit/audit_2.1.3.bb
index 8c82918..4cd7554 100644
--- a/recipes-security/audit/audit_2.1.3.bb
+++ b/recipes-security/audit/audit_2.1.3.bb
@@ -4,7 +4,7 @@ storing and searching the audit records generated by the audit subsystem \
 in the Linux kernel."
 HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
 SECTION = "base"
-PR = "r1"
+PR = "r2"
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
@@ -12,7 +12,8 @@ SRC_URI = "http://people.redhat.com/sgrubb/audit/audit-2.1.3.tar.gz \
 	   file://disable-ldap.patch \
 	   file://audit-python.patch"
 
-SRC_URI += "file://audit-for-cross-compiling.patch"
+SRC_URI += "file://audit-for-cross-compiling.patch \
+	    file://fix-swig-host-contamination.patch"
 
 inherit autotools pythonnative
 
@@ -23,7 +24,7 @@ DEPENDS += "python tcp-wrappers libcap-ng linux-libc-headers (>= 2.6.30)"
 
 EXTRA_OECONF += "--without-prelude --with-libwrap --enable-gssapi-krb5=no --disable-ldap --with-libcap-ng=yes"
 
-EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' PYINC='${STAGING_INCDIR}/$(PYLIBVER)'"
+EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' PYINC='${STAGING_INCDIR}/$(PYLIBVER)' STDINC='${STAGING_INCDIR}'"
 
 SUMMARY_audispd-plugins = "Plugins for the audit event dispatcher"
 DESCRIPTION_audispd-plugins = "The audispd-plugins package provides plugins for the real-time \
diff --git a/recipes-security/audit/audit_2.2.1.bb b/recipes-security/audit/audit_2.2.1.bb
index a58b9e1..e0b86e2 100644
--- a/recipes-security/audit/audit_2.2.1.bb
+++ b/recipes-security/audit/audit_2.2.1.bb
@@ -4,7 +4,7 @@ storing and searching the audit records generated by the audit subsystem \
 in the Linux kernel."
 HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
 SECTION = "base"
-PR = "r6"
+PR = "r7"
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
@@ -15,7 +15,8 @@ SRC_URI = "http://people.redhat.com/sgrubb/audit/audit-${PV}.tar.gz \
 SRC_URI += "\
 	   file://audit-python-configure.patch \
 	   file://audit-cross-compiling.patch \
-	   file://auditd"
+	   file://auditd \
+	   file://fix-swig-host-contamination.patch"
 
 inherit autotools pythonnative update-rc.d
 
@@ -41,6 +42,7 @@ EXTRA_OECONF += "--without-prelude \
 EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' \
 	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
 	pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
+	STDINC='${STAGING_INCDIR}' \
 	"
 
 SUMMARY_audispd-plugins = "Plugins for the audit event dispatcher"
-- 
1.7.3.4


