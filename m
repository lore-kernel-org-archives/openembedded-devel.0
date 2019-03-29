Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE877964F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 17:54:54 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id r15so1391285pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=pA5HLebQHv0ONWNbgpx+bY7njiEVUmLHHAa9Mswfkh4=;
	b=quxnppiEcGACBV+50JN7rVESfxmbPeOfOJJtYGX2jDjIkvj7nxczjCGRvCZ6wF0PP+
	16CUZM6xq8joFzY5/jJbkefFcgN83EfbQ02bs3fVQnqKpUb4xoFVZHnEEhoR/E+lQ/+L
	K/F0pzF2r8F/YAbNM3+O52Hm42s+6Jhr842IryqM4zKC00Uf60va2cIZcf7LE4EShVeX
	dtunn+mIG+y7OmEuG/B4K4vSF9XC3raISqOV0uWR8nfIrgXsFf9yCqXyl2uMy/YKvlgl
	e1Qy+LYLkAjSrPv6OIA034jZQMFWT+SxQkE7k2qrcbuSsj9VaaHWH8dKxss5wcQZKkhJ
	X5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pA5HLebQHv0ONWNbgpx+bY7njiEVUmLHHAa9Mswfkh4=;
	b=iVoByQ5CJ2RcKhJTXooqQQSYpW31gtZLH16u4ruPEPDOKmZBvyM/BP8J5JlbQ6PEYb
	C3vXOuoK0hSfdukfDeg+HWwVktnuAZS1TgjFZyFcUQRXftI3M04JgGLxXaWoUWaUrWNS
	0A+9XeIU3caZ590PRgI1VRiqSiLPZbX+q32SN1truRsm7DWVGE5HzYiGeRQrhcDEUpu7
	GtzW/mIbCRN8ban6+FNsI5hxIhLBCP21I6buZSuw4CSXZMdguM4UT/YM0jynpJCxzvEd
	LnFPbWLw3aSbUxuO4wFN+HcRZx4IuL2g4CzDW0cRlqmJ4CoQncUZC8jKYzKdjC5NRWSP
	D4Yw==
X-Gm-Message-State: APjAAAXI4F/bLwd3VVK6ZqT81xooCkHCGVaSr/oMDQw6nUxYcPih5Nuv
	W1Vdl/Fq/Awa4g2zf7A/OCOfxAEo
X-Google-Smtp-Source: APXvYqyof13z8Q9wdjeT6hqiLuh424zZLGYyyGIX4yTRK4fMtuqR3DTCh9aM2upw9Z03NTcVWeIJ3g==
X-Received: by 2002:a65:4181:: with SMTP id a1mr47123010pgq.100.1553882094923; 
	Fri, 29 Mar 2019 10:54:54 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	g67sm4815607pfg.94.2019.03.29.10.54.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Mar 2019 10:54:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2019 10:54:53 -0700
Message-Id: <20190329175453.28137-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] libldb: allow python pkg to be excluded
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
X-List-Received-Date: Fri, 29 Mar 2019 17:54:54 -0000

There are conflicts with the samba python package
so disable the python pkg by default to fix:

The pyldb has an RDEPENDS on samba which is causing issues with other
packages.

ERROR: The file /usr/lib/python2.7/site-packages/_ldb_text.py is installed by both libldb and samba, aborting

Also cleanup per style guide

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/libldb/libldb_1.4.1.bb    | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
index 3c7e5455e9..c3865152e1 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
 HOMEPAGE = "http://ldb.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
-
-DEPENDS += "libtdb libtalloc libtevent popt"
-RDEPENDS_pyldb += "python samba"
+LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
+                    file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
+                    file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch \
@@ -12,34 +12,32 @@ SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://0001-libldb-fix-config-error.patch \
            file://libldb-fix-musl-libc-unkown-type-error.patch \
            file://libldb-fix-musl-libc-conflict-type-error.patch \
-          "
+           ${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
+
+SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
+SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
+
+DEPENDS += "libtdb libtalloc libtevent popt"
+
+S = "${WORKDIR}/ldb-${PV}"
+
+inherit waf-samba distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
 
-PACKAGECONFIG ??= "\
+PACKAGECONFIG ?= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
+
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
 PACKAGECONFIG[ldap] = ",,openldap"
 PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
 PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
 PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
+PACKAGECONFIG[python] = ",--disable-python, , python"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
 
-SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
-
-LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
-                    file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
-                    file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
-
-SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
-SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
-
-inherit waf-samba distro_features_check
-REQUIRED_DISTRO_FEATURES = "pam"
-
-S = "${WORKDIR}/ldb-${PV}"
-
 EXTRA_OECONF += "--disable-rpath \
                  --disable-rpath-install \
                  --bundled-libraries=cmocka \
@@ -50,7 +48,7 @@ EXTRA_OECONF += "--disable-rpath \
                  --without-ldb-lmdb \
                 "
 
-PACKAGES =+ "pyldb pyldb-dbg pyldb-dev"
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'pyldb pyldb-dbg pyldb-dev', '', d)}"
 
 NOAUTOPACKAGEDEBUG = "1"
 
@@ -66,3 +64,5 @@ FILES_pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
 FILES_pyldb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
                    ${libdir}/.debug/libpyldb-util.so.*"
 FILES_pyldb-dev = "${libdir}/libpyldb-util.so"
+
+RDEPENDS_pyldb += "samba"
-- 
2.17.1


