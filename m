Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1Pzuy1-0005kd-78
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 18:57:29 +0100
Received: from source ([209.85.214.173]) (using TLSv1) by
	na3sys009aob101.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTYD5irWnpZfiQNBY2JD4/jJY2pixhG41@postini.com;
	Wed, 16 Mar 2011 10:55:24 PDT
Received: by mail-iw0-f173.google.com with SMTP id 42so2416633iwl.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ksvoXPafGBm32Lq5ukVMvTpl+ef0aYmYRyTe49Qx0nI=;
	b=YTYrKdjDgC8uqtNtq+qoDdGJZGj56U+NdZXCs0rfyJxow0RXpNXH1YtwRou5RZYRdZ
	SWhDyjTxxawyxZK+S1LDCzd091hwOZet239qE5j3lYNDcB1Izsqjq3P04fnviahOUPX5
	vmVaGabrf2TVGp6zpNflqpkxk+VRl48UHWX6Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=haRn5pUFSQm86dy1/SaiH95lfm1vO7dwMGPdn4lvH0/cAgm5p368HLuJrr+kS4eLzp
	74/dtodD1v45rXDaF3EMOHqg+3zxJUWueLAnn3VhwNc1NQlMDA4xXxVzPA/y/FcpvW1l
	YHua+F08esTf4VTgnEA3MkYMr3xeVncm8XbAs=
Received: by 10.43.63.203 with SMTP id xf11mr280449icb.316.1300294250540;
	Wed, 16 Mar 2011 09:50:50 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q34sm39593ibu.40.2011.03.16.09.50.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:50:49 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 12:50:38 -0400
Message-Id: <1775a7d2fdc6b7cc242b2b4e9f0a6516edf0ad83.1300293663.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1300293663.git.bengardiner@nanometrics.ca>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
Subject: [2010.03-maintenance] [PATCH 5/7] external-toolchain-csl: Drop do_stage, add gdbserver
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
X-List-Received-Date: Wed, 16 Mar 2011 17:57:43 -0000

From: Tom Rini <tom_rini@mentor.com>

Based on work from Noor Ahsan, we merge the important part of do_stage
into do_install and then set NATIVE_INSTALL_WORKS.  We also add a function
for getting the gdb version for packaging up gdbserver and ship that.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
(cherry picked from commit 207971b244ee6958dab1fb41d6f3cd94ac416b73)

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 recipes/meta/external-toolchain-csl.bb |   39 +++++++++++++++++--------------
 1 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/recipes/meta/external-toolchain-csl.bb b/recipes/meta/external-toolchain-csl.bb
index 0761cf2..e56b74f 100644
--- a/recipes/meta/external-toolchain-csl.bb
+++ b/recipes/meta/external-toolchain-csl.bb
@@ -1,4 +1,4 @@
-PR = "r8"
+PR = "r9"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -6,6 +6,7 @@ INSANE_SKIP_libgcc = "True"
 INSANE_SKIP_libstdc++ = "True"
 INSANE_SKIP_nscd = "True"
 INSANE_SKIP_glibc-utils = "True"
+INSANE_SKIP_gdbserver = "True"
 
 SRC_URI = "file://SUPPORTED"
 
@@ -22,6 +23,7 @@ PROVIDES = "\
 	virtual/libiconv \
 	glibc-thread-db \
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
+	gdbserver \
 "
 
 DEPENDS = "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)}"
@@ -44,6 +46,7 @@ PACKAGES = "\
 	nscd \
 	ldd \
 	localedef \
+	gdbserver \
 	glibc-utils \
 	glibc-dev \
 	glibc-locale \
@@ -120,6 +123,7 @@ FILES_ldd = "${bindir}/ldd"
 FILES_nscd = "${sbindir}/nscd*"
 FILES_sln = "${base_sbindir}/sln"
 FILES_localedef = "${bindir}/localedef"
+FILES_gdbserver = "${bindir}/gdbserver"
 
 DESCRIPTION_glibc-utils = "glibc: misc utilities like iconf, local, gencat, tzselect, rpcinfo, ..."
 DESCRIPTION_glibc-extra-nss = "glibc: nis, nisplus and hesiod search services"
@@ -127,6 +131,7 @@ DESCRIPTION_ldd = "glibc: print shared library dependencies"
 DESCRIPTION_nscd = "glibc: name service cache daemon for passwd, group, and hosts"
 DESCRIPTION_sln = "glibc: create symbolic links between files"
 DESCRIPTION_localedef = "glibc: compile locale definition files"
+DESCRIPTION_gdbserver = "gdb - GNU debugger"
 
 def csl_get_main_version(d):
 	import subprocess,os,bb
@@ -162,12 +167,19 @@ def csl_get_kernel_version(d):
 				return str(maj)+'.'+str(min)+'.'+str(ver)
 		return None
 
+def csl_get_gdb_version(d):
+	import subprocess,os,bb
+	if os.path.exists(bb.data.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+bb.data.getVar('TARGET_PREFIX', d, 1)+'gdb'):
+		return subprocess.Popen([bb.data.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+bb.data.getVar('TARGET_PREFIX', d, 1)+'gdb', '-v'],stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[-1]
+
 CSL_VER_MAIN := "${@csl_get_main_version(d)}"
 CSL_VER_GCC := "${@csl_get_gcc_version(d)}"
 CSL_VER_LIBC := "${@csl_get_libc_version(d)}"
 CSL_VER_KERNEL := "${@csl_get_kernel_version(d)}"
 CSL_LIC_LIBC := "LGPLv2.1+"
 CSL_LIC_RLE := "${@["GPLv3 with GCC RLE", "GPLv2 with GCC RLE"][csl_get_main_version(d) <= "2007q3-51"]}"
+CSL_VER_GDBSERVER := "${@csl_get_gdb_version(d)}"
+CSL_LIC_GDBSERVER := "${@["GNU GPL version 2", "GNU GPL version 3 or later"][csl_get_gdb_version(d) >= "6.7.1"]}"
 
 PKGV = "${CSL_VER_MAIN}"
 PKGV_libgcc = "${CSL_VER_GCC}"
@@ -190,6 +202,7 @@ PKGV_ldd = "${CSL_VER_LIBC}"
 PKGV_localedef = "${CSL_VER_LIBC}"
 PKGV_libsegfault = "${CSL_VER_LIBC}"
 PKGV_linux-libc-headers = "${CSL_VER_KERNEL}"
+PKGV_gdbserver = "${CSL_VER_GDBSERVER}"
 
 LICENSE = "${CSL_LIC_LIBC}"
 LICENSE_ldd = "${CSL_LIC_LIBC}"
@@ -199,6 +212,7 @@ LICENSE_libgcc = "${CSL_LIC_RLE}"
 LICENSE_libgcc-dev = "${CSL_LIC_RLE}"
 LICENSE_libstdc++ = "${CSL_LIC_RLE}"
 LICENSE_libstdc++-dev = "${CSL_LIC_RLE}"
+LICENSE_gdbserver = "${CSL_LIC_GDBSERVER}"
 
 do_install() {
 	install -d ${D}${sysconfdir}
@@ -218,27 +232,14 @@ do_install() {
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${D}/usr/include
 
-	rm -rf ${D}${bindir}/gdbserver
 	rm -rf ${D}${sysconfdir}/rpc
 	rm -rf ${D}${datadir}/zoneinfo
-}
 
-do_stage() {
-	install -d ${STAGING_INCDIR}
-	install -d ${STAGING_LIBDIR}
-	install -d ${STAGING_DIR_TARGET}${base_libdir}
+	sed -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so > ${D}${libdir}/temp
+	mv ${D}${libdir}/temp ${D}${libdir}/libc.so
 
-	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/include/* ${STAGING_INCDIR}
-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
-	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${STAGING_INCDIR}
-	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/lib/* ${STAGING_LIBDIR}
-	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/lib/* ${STAGING_DIR_TARGET}${base_libdir}
-
-	sed -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${STAGING_LIBDIR}/libc.so > ${STAGING_LIBDIR}/temp
-	mv ${STAGING_LIBDIR}/temp ${STAGING_LIBDIR}/libc.so
-
-	sed -e "s# /lib# ../../lib#" -e "s# /usr/lib# .#g" ${STAGING_LIBDIR}/libpthread.so > ${STAGING_LIBDIR}/temp
-	mv ${STAGING_LIBDIR}/temp ${STAGING_LIBDIR}/libpthread.so
+	sed -e "s# /lib# ../../lib#" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so > ${D}${libdir}/temp
+	mv ${D}${libdir}/temp ${D}${libdir}/libpthread.so
 }
 
 TMP_LOCALE="/tmp/locale${libdir}/locale"
@@ -457,3 +458,5 @@ python populate_packages_prepend () {
 		bb.data.setVar('PKG_libgcc-dev', 'libgcc1-dev', d)
 	bb.build.exec_func('package_do_split_gconvs', d)
 }
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.7.1



