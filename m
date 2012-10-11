Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TMELn-00050O-CK
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 10:42:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Oct 2012 01:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,570,1344236400"; d="scan'208";a="233393143"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.70])
	by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2012 01:29:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Oct 2012 09:29:22 +0100
Message-Id: <dff2c1bd5291e95b35a102c1b5fdbe78aa627c41.1349944125.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349944125.git.paul.eggleton@linux.intel.com>
References: <cover.1349944125.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349944125.git.paul.eggleton@linux.intel.com>
References: <cover.1349944125.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 1/2] apache2: work around bug in apr-1-config/apu-1-config scripts
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
X-List-Received-Date: Thu, 11 Oct 2012 08:42:39 -0000

The apr-1-config and apu-1-config scripts (installed into the sysroot
by apr and apr-util respectively) report incorrect paths with current
OE-Core - see:

  http://bugzilla.yoctoproject.org/show_bug.cgi?id=3267

Since OE-Core is frozen at the moment, work around the issue by taking
a copy of the scripts and fixing them up. Additionally we need to not
mangle the libtool name as apr installs it into the sysroot as just
'libtool'.

This fixes building apache2 with rm_work enabled.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-httpd/apache2/apache2_2.4.2.bb         |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
index 0eb5327..2c0fa6b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
@@ -6,11 +6,10 @@ DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 RDEPENDS_${PN} += "openssl libgcc"
 SECTION = "net"
 LICENSE = "Apache-2.0"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
-           file://fix-libtool-name.patch \
            file://httpd-2.4.1-corelimit.patch \
            file://httpd-2.4.1-export.patch \
            file://httpd-2.4.1-selinux.patch \
@@ -37,8 +36,8 @@ CFLAGS_prepend = "-I${STAGING_INCDIR}/openssl "
 EXTRA_OECONF = "--enable-ssl \
 		--with-ssl=${STAGING_LIBDIR}/.. \
 		--with-expat=${STAGING_LIBDIR}/.. \
-		--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
-		--with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
+		--with-apr=${WORKDIR}/apr-1-config \
+		--with-apr-util=${WORKDIR}/apu-1-config \
 		--enable-info \
 		--enable-rewrite \
 		--with-dbm=sdbm \
@@ -54,6 +53,15 @@ EXTRA_OECONF = "--enable-ssl \
 		--enable-mpms-shared \
 		ac_cv_have_threadsafe_pollset=no"
 
+do_configure_prepend() {
+	# FIXME: this hack is required to work around an issue with apr/apr-util
+	# Can be removed when fixed in OE-Core (also revert --with-* options above)
+	# see http://bugzilla.yoctoproject.org/show_bug.cgi?id=3267
+	cp ${STAGING_BINDIR_CROSS}/apr-1-config ${STAGING_BINDIR_CROSS}/apu-1-config ${WORKDIR}
+	sed -i -e 's:location=source:location=installed:' ${WORKDIR}/apr-1-config
+	sed -i -e 's:location=source:location=installed:' ${WORKDIR}/apu-1-config
+}
+
 do_install_append() {
 	install -d ${D}/${sysconfdir}/init.d
 	cat ${WORKDIR}/init | \
-- 
1.7.9.5



