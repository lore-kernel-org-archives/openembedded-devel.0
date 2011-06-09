Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUl3x-0007Lt-KD
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jun 2011 21:38:41 +0200
Received: by pwj9 with SMTP id 9so947429pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2011 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=wNJloDKUMsKbV5gUBVM7hBEBpMS0oFASVAwAYC3vAfM=;
	b=afMdF0+lnjaeocRPNR+RXBueFv72/uMyvukW1JpM3rIc99Bl4cj+4FC8ZeG9vOHEuU
	2ab8oIXMI+AwzJc6/4dKngQ8rYh9nJ02kR4yhOtH6RQHW02r5zrjGEOl7HajZEA9wl8Z
	owvvA4lQF6Lq4JNmfMqBHRCGBTm45sCQzETGU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=MKP68vp6UrkGRsIGmBDpSIRQDKuyM5UzBHip4Gj0EIHqKwFQj4CM+jP692tf7aNjkR
	R6NB05qV9PpM2FikaWRy8syQf5jZcdmiHmaKKJD/k7FmCpeL31RFfduSH4mag09fS8Op
	I11dvZ/fkogfaym/j/waMsse52QB1j8adAMUY=
Received: by 10.68.65.78 with SMTP id v14mr553309pbs.204.1307648120978;
	Thu, 09 Jun 2011 12:35:20 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x1sm1649734pbb.18.2011.06.09.12.35.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 12:35:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jun 2011 12:35:04 -0700
Message-Id: <1307648104-24260-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] gcc: Package libstdc++ gdb python helpers into dev package
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
X-List-Received-Date: Thu, 09 Jun 2011 19:38:41 -0000

People are seeing these errrors from ldconfig
libstdc++.so.6.0.14-gdb.py is not an ELF file - it has the wrong magic
bytes at the start.

this file is moved into gdb's autoload directory
if it exists there then gdb will find it when debugging
and it wont be in the paths where ldconfig looks for
libraries.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-4.5.inc            |    2 +-
 recipes/gcc/gcc-package-cross.inc  |    8 +++++++-
 recipes/gcc/gcc-package-target.inc |    4 ++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index aa5bb00..69229ef 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 
-INC_PR = "r36"
+INC_PR = "r37"
 
 SRCREV = "170880"
 PV = "4.5"
diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index f9a7eeb..1533069 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -4,7 +4,7 @@ PACKAGE_STRIP = "no"
 
 SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
 
-PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
+PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran libstdc++-dev libgcc-dev"
 
 # Called from within gcc-cross, so libdir is set wrong
 FILES_libg2c = "${target_libdir}/libg2c.so.*"
@@ -18,6 +18,7 @@ FILES_libgcc-dev = "${target_libdir}/libgcc_s.so"
 
 FILES_libstdc++ = "${target_libdir}/libstdc++.so.*"
 
+FILES_libstdc++-dev = "${target_datadir}/gdb/auto-load/${libdir}/libstdc++.so.*-gdb.py*"
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 	install -d ${D}${target_base_libdir}
@@ -68,5 +69,10 @@ GROUP ( libgcc_s.so.1 libgcc.a )" > ${D}${target_libdir}/libgcc_s.so
 	# We use libiberty from binutils or binutils-cross
 	rm -f ${D}${libdir}/libiberty.a
 	rm -f ${D}${target_libdir}/libiberty.a
+	if [ -f ${D}${target_libdir}/libstdc++.so.*-gdb.py ]; then
+		# move the gdb python helpers to gdb auto-load directory
+		install -d ${D}${target_datadir}/gdb/auto-load${target_libdir}
+		mv -f ${D}${target_libdir}/libstdc++.so.*-gdb.py* ${D}${target_datadir}/gdb/auto-load${target_libdir}
+	fi
 }
 
diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package-target.inc
index 5cfe47b..959b9ec 100644
--- a/recipes/gcc/gcc-package-target.inc
+++ b/recipes/gcc/gcc-package-target.inc
@@ -83,6 +83,7 @@ FILES_libstdc++-dev = "\
   ${libdir}/libsupc++.la \
   ${libdir}/libsupc++.a \
 "
+FILES_libstdc++-dev += "${datadir}/gdb/auto-load/${libdir}/libstdc++.so.*-gdb.py*"
 
 FILES_libgfortran-dev = "${libdir}/libgfortran.a \
                          ${libdir}/libgfortran.so \
@@ -168,4 +169,7 @@ GROUP ( libgcc_s.so.1 libgcc.a )" > ${D}${libdir}/libgcc_s.so
 
 	# Remove precompiled c++ headers as they are really big
 	rm -rf ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/*.gch
+	# move the gdb python helpers to gdb auto-load directory
+	install -d ${D}${datadir}/gdb/auto-load/${libdir}
+	mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir}
 }
-- 
1.7.0.4



