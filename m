Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bgamari.foss@gmail.com>) id 1PXbst-0006KH-4K
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 16:55:39 +0100
Received: by qyk36 with SMTP id 36so9196370qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Dec 2010 07:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=hmUcPj5jeegdYuBKLCg/kLH0woAE8QsL4p9PWkmEU34=;
	b=RjJiyHYpADMwMLY/QWlzvLdmAQD0zfnN8tGGLo7lngc/Au+Skvo+V/h9D6fUATWTid
	p/G0sT94WaQXLx27vh56UqpfXM5uc7c03aVixB82J6lV1qhpRYQgM3EdQGovJTLJV9xB
	fX5llC+6eUm/n1G+fo6tchUfWUCtG+4wvnew0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=utlJA/RZsgXLmMMNh09PiwmVRkp9CI2WmqwoLhMKW5D2gDSkaoSSuHboXVYTOoVEgc
	TYwAp8zsPgeBZyQ21JDbJUtykyC8qZ264L6FwMWC7b82LvtWwWDzE8KurGKhRdWQYUe9
	nExMKbxDTjacnmRWLqqOceUjuRqm6JgqWJnFU=
Received: by 10.224.185.129 with SMTP id co1mr12850945qab.232.1293547784556;
	Tue, 28 Dec 2010 06:49:44 -0800 (PST)
Received: from ben-laptop (c-24-61-223-13.hsd1.nh.comcast.net [24.61.223.13])
	by mx.google.com with ESMTPS id
	e29sm7681766qck.15.2010.12.28.06.49.43
	(version=SSLv3 cipher=RC4-MD5); Tue, 28 Dec 2010 06:49:43 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Dec 2010 09:49:22 -0500
Message-Id: <1293547762-30837-1-git-send-email-bgamari.foss@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <AANLkTin-A9NjN_heXGtk1k=9WTrKPoaAa0i=bP5B41zU@mail.gmail.com>
References: <AANLkTin-A9NjN_heXGtk1k=9WTrKPoaAa0i=bP5B41zU@mail.gmail.com>
Subject: [PATCH] boost: Initial commit of 1.45.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Dec 2010 15:55:39 -0000

---
 .../01-fix-default-python-config.patch             |   29 ++++
 recipes/boost/boost-with-bjam.inc                  |  164 ++++++++++++++++++++
 recipes/boost/boost_1.45.0.bb                      |   15 ++
 3 files changed, 208 insertions(+), 0 deletions(-)
 create mode 100644 recipes/boost/boost-1.45.0/01-fix-default-python-config.patch
 create mode 100644 recipes/boost/boost-with-bjam.inc
 create mode 100644 recipes/boost/boost_1.45.0.bb

diff --git a/recipes/boost/boost-1.45.0/01-fix-default-python-config.patch b/recipes/boost/boost-1.45.0/01-fix-default-python-config.patch
new file mode 100644
index 0000000..de7ff36
--- /dev/null
+++ b/recipes/boost/boost-1.45.0/01-fix-default-python-config.patch
@@ -0,0 +1,29 @@
+Index: boost_1_45_0/tools/build/v2/tools/python.jam
+===================================================================
+--- boost_1_45_0.orig/tools/build/v2/tools/python.jam	2010-12-27 16:10:56.340207790 -0500
++++ boost_1_45_0/tools/build/v2/tools/python.jam	2010-12-27 16:11:53.751709203 -0500
+@@ -806,11 +806,7 @@
+     }
+ 
+     # Anything left to compute?
+-    if $(includes) && $(libraries)
+-    {
+-        .configured = true ;
+-    }
+-    else
++    if ! $(includes) || ! $(libraries)
+     {
+         version ?= $(fallback-version) ;
+         version ?= 2.5 ;
+@@ -818,6 +814,11 @@
+         compute-default-paths $(target-os) : $(version) : $(prefix:E=) ;
+     }
+ 
++    if $(includes) && $(libraries)
++    {
++        .configured = true ;
++    }
++
+     if ! $(interpreter-cmd)
+     {
+         fallback-cmd ?= python ;
diff --git a/recipes/boost/boost-with-bjam.inc b/recipes/boost/boost-with-bjam.inc
new file mode 100644
index 0000000..ac6f485
--- /dev/null
+++ b/recipes/boost/boost-with-bjam.inc
@@ -0,0 +1,164 @@
+# The Boost web site provides free peer-reviewed portable
+# C++ source libraries. The emphasis is on libraries which
+# work well with the C++ Standard Library. The libraries are
+# intended to be widely useful, and are in regular use by
+# thousands of programmers across a broad spectrum of applications.
+
+# This recipe is for building Boost versions > 1.45, where bjam has been merged
+# into the Boost tree.
+
+DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
+HOMEPAGE = "http://www.boost.org/"
+SECTION = "libs"
+DEPENDS = "zlib icu"
+PRIORITY = "optional"
+LICENSE = "Boost Software License"
+INC_PR = "r9"
+
+BOOST_VER = "${@"_".join(bb.data.getVar("PV",d,1).split("."))}"
+BOOST_MAJ = "${@"_".join(bb.data.getVar("PV",d,1).split(".")[0:2])}"
+BOOST_P = "boost_${BOOST_VER}"
+
+S = "${WORKDIR}/${BOOST_P}"
+
+# Make a package for each library, plus -dev and -python
+PACKAGES = "${PN}-dbg"
+BOOSTLIBS = ""
+
+PACKAGES += "boost-date-time"
+FILES_boost-date-time = "${libdir}/libboost_date_time.so.${PV}"
+
+BOOSTLIBS += "boost-filesystem"
+FILES_boost-filesystem = "${libdir}/libboost_filesystem.so.${PV}"
+
+BOOSTLIBS += "boost-prg-exec-monitor"
+FILES_boost-prg-exec-monitor = "${libdir}/libboost_prg_exec_monitor.so.${PV}"
+
+BOOSTLIBS += "boost-program-options"
+FILES_boost-program-options = "${libdir}/libboost_program_options.so.${PV}"
+
+BOOSTLIBS += "boost-regex"
+FILES_boost-regex = "${libdir}/libboost_regex.so.${PV}"
+
+BOOSTLIBS += "boost-signals"
+FILES_boost-signals = "${libdir}/libboost_signals.so.${PV}"
+
+BOOSTLIBS += "boost-test-exec-monitor"
+FILES_boost-test-exec-monitor = "${libdir}/libboost_test_exec_monitor.so.${PV}"
+
+BOOSTLIBS += "boost-thread-mt"
+FILES_boost-thread-mt = "${libdir}/libboost_thread-mt.so.${PV}"
+
+BOOSTLIBS += "boost-unit-test-framework"
+FILES_boost-unit-test-framework = "${libdir}/libboost_unit_test_framework.so.${PV}"
+
+BOOSTLIBS += "boost-iostreams"
+FILES_boost-iostreams = "${libdir}/libboost_iostreams.so.${PV}"
+
+BOOSTLIBS += "boost-serialization"
+FILES_boost-serialization = "${libdir}/libboost_serialization.so.${PV}"
+
+BOOSTLIBS += "boost-wserialization"
+FILES_boost-wserialization = "${libdir}/libboost_wserialization.so.${PV}"
+
+# Python - remove this and set:
+#PYTHON_ROOT = "/dev/null"
+# to remove the python build
+DEPENDS += "python"
+PYTHON_ROOT = "${STAGING_DIR_HOST}/${layout_prefix}"
+PYTHON_VERSION = "2.6"
+
+BOOSTLIBS += "boost-python"
+FILES_boost-python = "${libdir}/libboost_python.so.${PV}"
+
+PACKAGES += "${BOOSTLIBS}"
+
+# -dev last to pick up the remaining stuff
+PACKAGES += "${PN}-dev"
+FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so ${libdir}/libboost_*.a"
+
+# "boost" is a metapackage which pulls in all boost librabries
+PACKAGES += "${PN}"
+RRECOMMENDS_${PN} += "${BOOSTLIBS}"
+
+# to avoid GNU_HASH QA errors added LDFLAGS to ARCH; a little bit dirty but at least it works
+TARGET_CC_ARCH += " ${LDFLAGS}" 
+
+# Oh yippee, a new build system, it's sooo cooool I could eat my own
+# foot.  inlining=on lets the compiler choose, I think.  At least this
+# stuff is documented...
+# NOTE: if you leave <debug-symbols>on then in a debug build the build sys
+# objcopy will be invoked, and that won't work.  Building debug apparently
+# requires hacking gcc-tools.jam
+#
+# Sometimes I wake up screaming.  Famous figures are gathered in the nightmare,
+# Steve Bourne, Larry Wall, the whole of the ANSI C committee.  They're just
+# standing there, waiting, but the truely terrifying thing is what they carry
+# in their hands.  At first sight each seems to bear the same thing, but it is
+# not so for the forms in their grasp are ever so slightly different one from
+# the other.  Each is twisted in some grotesque way from the other to make each
+# an unspeakable perversion impossible to perceive without the onset of madness.
+# True insanity awaits anyone who perceives all of these horrors together.
+#
+# Quotation marks, there might be an easier way to do this, but I can't find
+# it.  The problem is that the user.hpp configuration file must receive a
+# pre-processor macro defined as the appropriate string - complete with "'s
+# around it.  (<> is a possibility here but the danger to that is that the
+# failure case interprets the < and > as shell redirections, creating
+# random files in the source tree.)
+#
+#bjam: '-DBOOST_PLATFORM_CONFIG=\"config\"'
+#do_compile: '-sGCC=... '"'-DBOOST_PLATFORM_CONFIG=\"config\"'"
+SQD = '"'
+EQD = '\"'
+#boost.bb:   "...  '-sGCC=... '${SQD}'-DBOOST_PLATFORM_CONFIG=${EQD}config${EQD}'${SQD} ..."
+BJAM_CONF = "${SQD}'-DBOOST_PLATFORM_CONFIG=${EQD}boost/config/platform/${TARGET_OS}.hpp${EQD}'${SQD}"
+
+BJAM_TOOLS   = "--layout=system \
+                --toolset=gcc-target \
+                -sICU_PATH=${STAGING_DIR_TARGET} \
+		'-sGCC_INCLUDE_DIRECTORY=${STAGING_INCDIR}' \
+		'-sGCC_STDLIB_DIRECTORY=${STAGING_LIBDIR}' \
+                "
+
+BJAM_OPTS    = '${BJAM_TOOLS} \
+		--builddir=${S}/${TARGET_SYS} \
+		${BJAM_EXTRA} \
+                ${PARALLEL_MAKE}'
+
+
+do_configure_prepend() {
+	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
+        echo "using gcc : host : ${HOST_CXX} : <cxxflags>${HOST_CFLAGS} ${HOST_CXXFLAGS} <linkflags>${HOST_LDFLAGS} ;" >> tools/build/v2/user-config.jam
+        echo "using gcc : target : ${CXX} : <cxxflags>${CFLAGS} ${CXXFLAGS} <linkflags>${LDFLAGS} ;" >> tools/build/v2/user-config.jam
+        echo "using python : ${PYTHON_VERSION} : : ${STAGING_INCDIR}/python${PYTHON_VERSION} ;" >> tools/build/v2/user-config.jam
+
+        CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-toolset=gcc
+        sed -i '/^using python/d' project-config.jam
+}
+
+do_compile() {
+	set -ex
+	./bjam -d2 ${BJAM_OPTS} --prefix=${prefix} \
+		--exec-prefix=${exec_prefix} \
+		--libdir=${libdir} \
+		--includedir=${includedir} \
+                --include=${STAGING_INCDIR} \
+                --debug-configuration
+}
+
+do_stage() {
+	set -ex
+	./bjam ${BJAM_OPTS} \
+		--libdir=${STAGING_LIBDIR} \
+		--includedir=${STAGING_INCDIR} \
+		install
+}
+
+do_install() {
+	set -ex
+	./bjam ${BJAM_OPTS} \
+		--libdir=${D}${libdir} \
+		--includedir=${D}${includedir} \
+		install
+}
diff --git a/recipes/boost/boost_1.45.0.bb b/recipes/boost/boost_1.45.0.bb
new file mode 100644
index 0000000..ab4200a
--- /dev/null
+++ b/recipes/boost/boost_1.45.0.bb
@@ -0,0 +1,15 @@
+require boost-with-bjam.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI = " \
+  http://downloads.sourceforge.net/project/boost/boost/1.45.0/boost_1_45_0.tar.gz \
+  file://01-fix-default-python-config.patch \
+"
+S = "${WORKDIR}/boost_1_45_0"
+
+SRC_URI[md5sum] = "739792c98fafb95e7a6b5da23a30062c"
+SRC_URI[sha256sum] = "7cd7a327ebe0f43db829eccce024b7f3b0d9d4d382422d59dc710793d55c6a12"
+
+DEPENDS += " icu "
+
-- 
1.7.0.4



