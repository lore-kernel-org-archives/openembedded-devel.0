Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NiOf9-0000DZ-2S
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Feb 2010 09:56:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 0AED6A2C3AA;
	Fri, 19 Feb 2010 09:54:00 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uYYqvbFx1GYu; Fri, 19 Feb 2010 09:53:59 +0100 (CET)
Received: from localhost.localdomain (pD9E141BE.dip.t-dialin.net
	[217.225.65.190])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 2F231A2C3AB;
	Fri, 19 Feb 2010 09:53:59 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2010 09:53:38 +0100
Message-Id: <1266569618-8001-1-git-send-email-ml@vdm-design.de>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1265979953-4327-1-git-send-email-ml@vdm-design.de>
References: <1265979953-4327-1-git-send-email-ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] eglibc: unbash ldd and add libpthread_nonshared.a to -dev
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
X-List-Received-Date: Fri, 19 Feb 2010 08:56:42 -0000

* replace shebang of ldd by /bin/sh, so ldd doesn't depend on bash
  anymore. Tested with busybox sh.
* added to do_configure_prepend because do_patch is only a python function
* add libpthread_nonshared.a to eglibc-dev. Now it's possible to
  compile multithreaded applications on the device.
---
 recipes/eglibc/eglibc-package.bbclass |    6 +++++-
 recipes/eglibc/eglibc.inc             |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index fcaba47..3c33f93 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -48,7 +48,7 @@ FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "/sbin/sln"
-FILES_eglibc-dev_append = " ${libdir}/*.o ${bindir}/rpcgen ${libdir}/libc_nonshared.a"
+FILES_eglibc-dev_append = " ${libdir}/*.o ${bindir}/rpcgen ${libdir}/libc_nonshared.a ${libdir}/libpthread_nonshared.a"
 FILES_nscd = "${sbindir}/nscd*"
 FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
 FILES_eglibc-gconv = "${libdir}/gconv/*"
@@ -76,6 +76,10 @@ EXTRA_OECONF += "${@get_eglibc_fpu_setting(bb, d)}"
 
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 
+do_configure_prepend() {
+        sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
+}
+
 do_install() {
 	oe_runmake install_root=${D} install
 	for r in ${rpcsvc}; do
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index 356b838..5c06ae6 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r8"
+INC_PR = "r9"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
-- 
1.7.0



