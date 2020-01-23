Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 35A629156E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 03:21:10 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x6so824105pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 19:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=x7cjuPw/HiP74+0eOKyaeBv54HDa3M8EpdcDD4luaaY=;
	b=tTOLtUOL6QYHgsZ85imZUSgXzb/3k8+A1+F7km+DVD5rwIfbTKz7MrMD4m7Y3/baSI
	Fc6miqnkG8XwAIQuBoDG3+OJeqtTsq0RjFGUMGA/qBnAxM5ib8WkkRS+W0KEm//9gDcZ
	Pw//uA5co1eZdpKa6cxtFyw/Y3Jas7elhYrM1ACM3CCKpgoXrUlKNKwrK++3L6NcDPYX
	kvjqgToGqXGMXCeqHCweUqWLjnnRIfzJgi09hmMUTZQut/K3IBPXwsTt22YEby+a8Lts
	sWnpf6T7ZxdzmYyz8A+AFrZ9JWrUK8BNbNxVcI3hgaj7F7SNdofIYkNLaWUgPCp1nj3h
	2QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x7cjuPw/HiP74+0eOKyaeBv54HDa3M8EpdcDD4luaaY=;
	b=p0XxLSbnbcKkLUJpCEKoqGqdHbnhrt1BSzHtQMTuZ5WS5Q8q/tAOxCQiij20lVjoDm
	54YYFFfeIqmmnzNcT5AetNOiXueLMKHxV4ix1DBh9RyptC1FfG6eW+SjOPy5Gfram3iZ
	MiR4VeJKu9PwtkN8TzsLFBtsirdjAfTsEpFRXgm+QVbb4H0UJ7UteguhAS/crRJTNJTV
	vhVCwArN8zslI6dYLuPZqq3t8Wt19tzUkDgOfJg5qtXiUJMwucomvTrtxdCi7Ue0yaDE
	mxdWQICwITZfWIBz3YZcqI6Ps0MWXtqR59AiPv8k74agxzmk4r86eBLXyxzTocaF9FFd
	s5Uw==
X-Gm-Message-State: APjAAAWUUBXMjC5Z2CwD7anvKgY2DuxOEk1WeVSI4FhH23u3hVAskjgi
	XgRKfEm8yx+58X8I3hUpX3z2RexP8f4=
X-Google-Smtp-Source: APXvYqxbDvjvx5s6QgW0VaeK4YgwUFpFXJb1CkYXxRrYUotRbGcIOi/cxsIRB3Oy4n6Q7s9h0NwvQg==
X-Received: by 2002:a62:6d01:: with SMTP id i1mr5455313pfc.94.1579749671028;
	Wed, 22 Jan 2020 19:21:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id s21sm350059pfe.20.2020.01.22.19.21.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 19:21:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 19:21:10 -0800
Message-Id: <20200123032110.2360603-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200123032110.2360603-1-raj.khem@gmail.com>
References: <20200123032110.2360603-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] recipes: Replace using BBPATH with BBFILE_COLLECTIONS for meta-python2 check
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
X-List-Received-Date: Thu, 23 Jan 2020 03:21:11 -0000
Content-Transfer-Encoding: 8bit

BBPATH check actually does not work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../telepathy/telepathy-idle_0.2.0.bb                  |  2 +-
 .../recipes-core/packagegroups/packagegroup-meta-oe.bb | 10 +++++-----
 meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb        |  2 +-
 meta-oe/recipes-devtools/guider/guider_3.9.6.bb        |  2 +-
 meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb      |  2 +-
 meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb         |  2 +-
 .../recipes-extended/openlmi/openlmi-tools_0.10.5.bb   |  2 +-
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb     |  2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
index ec45653012..7cb25b6775 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "92a2de5198284cbd3c430b0d1a971a86"
 SRC_URI[sha256sum] = "3013ad4b38d14ee630b8cc8ada5e95ccaa849b9a6fe15d2eaf6d0717d76f2fab"
 
-inherit autotools pkgconfig ${@bb.utils.contains("BBPATH", "meta-python2", "pythonnative", "", d)}
+inherit autotools pkgconfig ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "pythonnative", "", d)}
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e5001c3974..865cbb0bfc 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -70,7 +70,7 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-server", "", d)} \
     libmikmod \
     obexftp openobex libnet \
-    ${@bb.utils.contains("BBPATH", "meta-python2", "telepathy-idle", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "telepathy-idle", "", d)} \
     "
 RDEPENDS_packagegroup-meta-oe-connectivity_append_libc-glibc = " wvstreams wvdial"
 
@@ -103,7 +103,7 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
     leveldb libdbi mariadb mariadb-native \
     postgresql psqlodbc rocksdb soci \
     sqlite \
-    ${@bb.utils.contains("BBPATH", "meta-python2", "mysql-python", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mysql-python", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-oe-devtools ="\
@@ -120,7 +120,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     rapidjson serialcheck sip3 tclap uftrace uw-imap valijson \
     xmlrpc-c yajl yasm \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
-    ${@bb.utils.contains("BBPATH", "meta-python2", "nodejs", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "nodejs", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-oe-devtools_remove_armv5 = "uftrace nodejs"
@@ -156,7 +156,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-auth openwsman sblim-sfcb ", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit polkit-group-rule-datetime ", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-network ", "", d)} \
-    ${@bb.utils.contains("BBPATH", "meta-python2", "openlmi-tools", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "openlmi-tools", "", d)} \
     "
 RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa"
@@ -263,7 +263,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     procmail \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "udisks2 upower", "", d)} \
     ${NE10} \
-    ${@bb.utils.contains("BBPATH", "meta-python2", "lio-utils", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "lio-utils", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
index e125ae4447..4617da8e1b 100644
--- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
+++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit ${@bb.utils.contains("BBPATH", "meta-python2", "setuptools", "", d)}
+inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setuptools", "", d)}
 
 python() {
     if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
index 1fd7e111a7..f059002161 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
@@ -16,7 +16,7 @@ SRCREV = "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
 S = "${WORKDIR}/git"
 R = "${RECIPE_SYSROOT}"
 
-inherit ${@bb.utils.contains("BBPATH", "meta-python2", "distutils", "", d)}
+inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "distutils", "", d)}
 
 GUIDER_OBJ = "guider.pyc"
 GUIDER_SCRIPT = "guider"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
index 5d7ed4410d..35abb8f1f0 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=be4d5107c64dc3d7c57e3797e1a0674b"
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
 
-inherit pkgconfig ${@bb.utils.contains("BBPATH", "meta-python2", "pythonnative", "", d)}
+inherit pkgconfig ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "pythonnative", "", d)}
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
index f648332b43..ef42ad2f2c 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] = "9f453c8cc5669e46e38f977764d49a36295bf0d023619d9aac782e6bb3
 
 S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
 
-inherit autotools pkgconfig perlnative ${@bb.utils.contains("BBPATH", "meta-python2", "pythonnative", "", d)}
+inherit autotools pkgconfig perlnative ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "pythonnative", "", d)}
 
 inherit features_check
 CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index 4a1b6bba69..04f82d2bcd 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=75859989545e37968a99b631ef42722e"
 SECTION = "System/Management"
 
-inherit ${@bb.utils.contains("BBPATH", "meta-python2", "setuptools", "", d)}
+inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setuptools", "", d)}
 
 DEPENDS = "python-native python-pywbem-native python-m2crypto python-pywbem"
 
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
index 8895a9e158..0fb4a6e516 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/Datera/lio-utils.git \
 SRCREV = "0ac9091c1ff7a52d5435a4f4449e82637142e06e"
 S = "${WORKDIR}/git"
 
-inherit ${@bb.utils.contains("BBPATH", "meta-python2", "distutils", "", d)}
+inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "distutils", "", d)}
 
 EXTRA_OEMAKE += "DESTDIR=${D}"
 
-- 
2.25.0


