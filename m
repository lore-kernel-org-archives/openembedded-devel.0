Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B2EC86121F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 07:07:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3M77Y0t008608
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 00:07:34 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Apr 2014 00:07:33 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Apr 2014 15:07:28 +0800
Message-ID: <1398150448-25424-4-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1398150448-25424-1-git-send-email-Chong.Lu@windriver.com>
References: <1398150448-25424-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 4/4] postgresql: enable some bindings
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
X-List-Received-Date: Tue, 22 Apr 2014 07:07:34 -0000
Content-Type: text/plain

1. Enable pam, openssl, python, uuid, libxml, tcl, nls, libxml and perl bindings.
2. Make plperl, plpython, pltcl subpackages as dynamic in case other packages runtime
depend on them.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../postgresql/files/postgresql.pam                |    4 +
 meta-oe/recipes-support/postgresql/postgresql.inc  |  129 +++++++++++++++++++-
 2 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql.pam

diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.pam b/meta-oe/recipes-support/postgresql/files/postgresql.pam
new file mode 100644
index 0000000..0b6fdc5
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/postgresql.pam
@@ -0,0 +1,4 @@
+#%PAM-1.0
+auth            include         common-auth
+account         include         common-account
+password        include         common-password
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 0bb0eb3..0f17c87 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -27,6 +27,7 @@ ARM_INSTRUCTION_SET = "arm"
 SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2 \
            file://postgresql.init \
            file://postgresql-bashprofile \
+           file://postgresql.pam \
 "
 
 LEAD_SONAME = "libpq.so"
@@ -34,7 +35,20 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig useradd
+inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d
+
+enable_pam = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
+PACKAGECONFIG[python] = "--with-python,--wsithout-python,python,python"
+PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
+# when tcl native package  is fixed change WORKDIR to STAGING_BINDIR_CROSS
+PACKAGECONFIG[tcl] = \
+    "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl,"
+PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
+PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
+PACKAGECONFIG[perl] = "--with-perl,--without-perl,perl,perl"
 
 EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
                  --datadir=${datadir}/${BPN} \
@@ -44,6 +58,85 @@ EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
 EXTRA_OECONF_sh4 += "--disable-spinlocks"
 EXTRA_OECONF_aarch64 += "--disable-spinlocks"
 
+PACKAGES_DYNAMIC += "^${PN}-plperl ^${PN}-plperl-dbg \
+                     ^${PN}-pltcl ^${PN}-pltcl-dbg \
+                     ^${PN}-plpython ^${PN}-plpython-dbg \
+"
+
+python populate_packages_prepend() {
+
+    def fill_more(name, dbg=True):
+        if name is None or name.strip() == "":
+            return
+
+        fpack=d.getVar('PACKAGES') or ""
+        fpack="${PN}-" + name + " " + fpack
+        if dbg:
+            fpack="${PN}-" + name + "-dbg" + " " + fpack
+        d.setVar('PACKAGES', fpack)
+
+    conf=(d.getVar('PACKAGECONFIG', True) or "").split()
+    pack=d.getVar('PACKAGES') or ""
+    bb.debug(1, "PACKAGECONFIG=%s" % conf)
+    bb.debug(1, "PACKAGES1=%s" % pack )
+
+    if "perl" in conf :
+        fill_more("plperl")
+
+    if "tcl" in conf:
+        fill_more("pltcl")
+
+    if "python" in conf:
+        fill_more("plpython")
+
+    pack=d.getVar('PACKAGES', True) or ""
+    bb.debug(1, "PACKAGES2=%s" % pack)
+
+}
+
+do_configure() {
+	# do_configure_prepend
+	# make sure configure finds python includdirs with these envs
+	export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+	       STAGING_INCDIR=${STAGING_INCDIR} \
+	       STAGING_LIBDIR=${STAGING_LIBDIR}
+
+	# do_configure
+	autotools_do_configure
+
+	# do_configure_append
+	# workaround perl package related bugs
+	sed -i -e "s:-L/usr/local/lib:-L=/usr/local/lib:g" \
+	    ${S}/src/Makefile.global
+	LIBPNA="\${STAGING_LIBDIR_NATIVE}/perl-native"
+	LIBNA="\${STAGING_LIBDIR_NATIVE}"
+	BLIBNA="\${STAGING_BASE_LIBDIR_NATIVE}"
+	sed -i -e "/^perl_archlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
+	    ${S}/src/Makefile.global
+	sed -i -e "/^perl_privlibexp/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
+	    ${S}/src/Makefile.global
+	# remove the rpath, replace with correct lib path
+	sed -i \
+	    -e "/^perl_embed_ldflags/s:-Wl,-rpath,${LIBNA}::g" \
+	    -e "/^perl_embed_ldflags/s:-Wl,-rpath,${BLIBNA}::g" \
+	    -e "/^perl_embed_ldflags/s:-Wl,-rpath-link,${LIBNA}::g" \
+	    -e "/^perl_embed_ldflags/s:-Wl,-rpath-link,${BLIBNA}::g" \
+	    -e "/^perl_embed_ldflags/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
+	    -e "/^perl_embed_ldflags/s:${LIBNA}:${STAGING_LIBDIR}:g"  \
+	    -e "/^perl_embed_ldflags/s:${BLIBNA}:${STAGING_BASELIBDIR}:g" \
+	${S}/src/Makefile.global
+
+	# workaround perl package's libperl.so problem
+	# we are using perlnative so this perl should have same version
+	perl_version=`perl -v 2>/dev/null | \
+            sed -n 's/This is perl.*v[a-z ]*\([0-9]\.[0-9][0-9.]*\).*$/\1/p'`
+	if [ ! -h "${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so" -a \
+	     ! -h "${STAGING_LIBDIR}/libperl.so" ]; then
+		ln -sf ../../../libperl.so.5 \
+		    ${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so
+	fi
+}
+
 do_compile_append() {
 	oe_runmake -C contrib all
 }
@@ -87,6 +180,12 @@ do_install_append() {
 	chown -R postgres:postgres ${D}${localstatedir}/lib/${BPN}
 	# multiple server config directory
 	install -d -m 700 ${D}${sysconfdir}/default/${BPN}
+
+	if [ "${@d.getVar('enable_pam', True)}" = "pam" ]; then
+		install -d ${D}${sysconfdir}/pam.d
+		install -m 644 ${WORKDIR}/postgresql.pam \
+		    ${D}${sysconfdir}/pam.d/postgresql
+	fi
 }
 
 SSTATE_SCAN_FILES += "Makefile.global"
@@ -106,6 +205,9 @@ FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
     ${libdir}/${BPN}/euc2004_sjis2004.so \
     ${libdir}/${BPN}/libpqwalreceiver.so \
     ${libdir}/${BPN}/*_and_*.so \
+    ${@'${sysconfdir}/pam.d/postgresql' \
+       if 'pam' == d.getVar('enable_pam', True) \
+       else ''} \
 "
 
 FILES_${PN}-dbg += " ${libdir}/${BPN}/.debug/dict_snowball.so \
@@ -241,3 +343,28 @@ FILES_${PN}-contrib-dbg = " \
 "
 DESCRIPTION_${PN}-contrib = "The postgresql-contrib package contains \
     contributed packages that are included in the PostgreSQL distribution."
+
+FILES_${PN}-pltcl = "${libdir}/${BPN}/pltcl.so ${bindir}/pltcl_delmod \
+    ${binddir}/pltcl_listmod ${bindir}/pltcl_loadmod  \
+    ${datadir}/${BPN}/unknown.pltcl"
+FILES_${PN}-pltcl-dbg = "${libdir}/${BPN}/.debug/pltcl.so"
+SUMMARY_${PN}-pltcl = "The Tcl procedural language for PostgreSQL"
+DESCRIPTION_${PN}-pltcl = "PostgreSQL is an advanced Object-Relational \
+    database management system.  The postgresql-pltcl package contains the PL/Tcl \
+    procedural language for the backend."
+
+FILES_${PN}-plperl = "${libdir}/${BPN}/plperl.so"
+FILES_${PN}-plperl-dbg = "${libdir}/${BPN}/.debug/plperl.so"
+SUMMARY_${PN}-plperl = "The Perl procedural language for PostgreSQL"
+DESCRIPTION_${PN}-plperl = "PostgreSQL is an advanced Object-Relational \
+    database management system.  The postgresql-plperl package contains the \
+    PL/Perl procedural language for the backend."
+
+# In version 8, it will be plpython.so
+# In version 9, it might be plpython{2,3}.so depending on python2 or 3
+FILES_${PN}-plpython = "${libdir}/${BPN}/plpython*.so"
+FILES_${PN}-plpython-dbg = "${libdir}/${BPN}/.debug/plpython*.so"
+SUMMARY_${PN}-plpython = "The Python procedural language for PostgreSQL"
+DESCRIPTION_${PN}-plpython = "PostgreSQL is an advanced Object-Relational \
+    database management system.  The postgresql-plpython package contains \
+    the PL/Python procedural language for the backend."
-- 
1.7.9.5


