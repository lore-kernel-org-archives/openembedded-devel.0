Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39BEE77FFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 09:43:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4O9he45026373
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 02:43:40 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 24 May 2017 02:43:40 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 May 2017 17:38:53 +0800
Message-ID: <20170524093853.12828-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170524093853.12828-1-kai.kang@windriver.com>
References: <20170524093853.12828-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH] snort: enable static daq
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
X-List-Received-Date: Wed, 24 May 2017 09:43:40 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When start snort, it shows error and quit:

|         --== Initializing Snort ==--
| Initializing Output Plugins!
| ERROR: Can't find pcap DAQ!
| Fatal Error, Quitting..

Fix by enable static daq for snort and enable static build for daq. snort calls
command daq-modules-config which is from daq-native to get required daq static
libraries and library path. Add package daq-native and add patch for snort to
filter library path out to avoid host contamination issue.

Add daq-native's dependency libnet-native too. And daq-native also depends on
libpcap-native from layer oe-core.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-connectivity/daq/daq_2.0.6.bb           |  4 ++++
 .../recipes-connectivity/libdnet/libdnet_1.12.bb    |  1 +
 ...-host-contamination-when-enable-static-daq.patch | 21 +++++++++++++++++++++
 .../recipes-connectivity/snort/snort_2.9.7.5.bb     |  5 +++--
 4 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/fix-host-contamination-when-enable-static-daq.patch

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
index 47cb163..ec35175 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
@@ -29,3 +29,7 @@ SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
 SRC_URI[sha256sum] = "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
 
 inherit autotools
+
+DISABLE_STATIC = ""
+
+BBCLASSEXTEND = "native"
diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
index f48b655..e579de5 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
@@ -13,3 +13,4 @@ inherit autotools
 
 acpaths = "-I ./config/"
 
+BBCLASSEXTEND = "native"
diff --git a/meta-networking/recipes-connectivity/snort/snort/fix-host-contamination-when-enable-static-daq.patch b/meta-networking/recipes-connectivity/snort/snort/fix-host-contamination-when-enable-static-daq.patch
new file mode 100644
index 0000000..2becc06
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/fix-host-contamination-when-enable-static-daq.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+When enable static daq for snort, it calls to daq-modules-config to get link
+library and library path. Library path is useless for oe and cause host
+contamination issue. So filter it.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/configure.in b/configure.in
+index fded45b..a247bb9 100644
+--- a/configure.in
++++ b/configure.in
+@@ -658,7 +658,7 @@ fi
+ 
+ if test "x$enable_static_daq" = "xyes"; then
+     LDAQ=""
+-    LIBS="${LIBS} `daq-modules-config --static --libs`"
++    LIBS="${LIBS} `daq-modules-config --static --libs | sed 's#-L[^ ]*##g'`"
+     AC_CHECK_LIB([daq_static], [daq_load_modules],
+         [LIBS="-ldaq_static ${LIBS}"], [LDAQ="no"], [ ])
+ 
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
index 57a04f2..e189b0f 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
-DEPENDS = "xz libpcap libpcre daq libdnet util-linux"
+DEPENDS = "xz libpcap libpcre daq libdnet util-linux daq-native"
 DEPENDS_append_libc-musl = " libtirpc"
 
 SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
@@ -15,6 +15,7 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
     file://disable-daq-verdict-retry.patch \
     file://0001-libpcap-search-sysroot-for-headers.patch \
     file://0001-fix-do_package-failed-since-snort-2.9.7.0.patch \
+    file://fix-host-contamination-when-enable-static-daq.patch \
 "
 
 SRC_URI[tarball.md5sum] = "fd271788c0f8876be87a858a9142f202"
@@ -31,7 +32,7 @@ EXTRA_OECONF = " \
     --enable-reload \
     --enable-reload-error-restart \
     --enable-targetbased \
-    --disable-static-daq \
+    --enable-static-daq \
     --with-dnet-includes=${STAGING_INCDIR} \
     --with-dnet-libraries=${STAGING_LIBDIR} \
     --with-libpcre-includes=${STAGING_INCDIR} \
-- 
2.10.1


