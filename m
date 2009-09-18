Received: from [209.85.211.187] (helo=mail-yw0-f187.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mon7Z-0007sH-IG
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Sep 2009 01:44:12 +0200
Received: by ywh17 with SMTP id 17so1915907ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2009 16:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=LKMKKrqDfxy08qIfbcaUho4hR0BDHShHjdifhVqgKmk=;
	b=Nm9rKOo3ebxFA32mw20pOUtk6M0jTxaHsukXNbte/yWvvkIQK8ZVGJ7aTIFtDxDSnl
	ZMQh8s73WQNFg9pjXyxhYb7lD+O/OXjWp81nuMzg9wcQ1iD9XDyIO50TnaYb5ua/MwrL
	L3jM3jmYl4iVlf/3nuGrX1aAAr9RR+VO7Wd4k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=fOnaXbUz4glZQWnt6CV8TuK9XwNaUf0/CKyVM0C3vCP871Br3Y0bgw92diSEsT4LbN
	Tu/sqABaYs2zeT4Mtx6YG+6vLUBf0RPh8jTRbaHJ1ND8pWEkzcaBDpKJwLjJzZYVjILn
	yvSLIRwNTEh0034IBE16av8XINVpZK87BskEg=
Received: by 10.101.166.10 with SMTP id t10mr2130754ano.143.1253317414712;
	Fri, 18 Sep 2009 16:43:34 -0700 (PDT)
Received: from localhost (adsl-71-146-24-114.dsl.pltn13.sbcglobal.net
	[71.146.24.114])
	by mx.google.com with ESMTPS id 21sm981493yxe.1.2009.09.18.16.43.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 18 Sep 2009 16:43:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Sep 2009 16:43:26 -0700
Message-Id: <1253317407-451-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.211.187
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Richard Purdie <rpurdie@linux.intel.com>
Subject: [PATCH] eglibc: Dont package timezone data
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
X-List-Received-Date: Fri, 18 Sep 2009 23:44:12 -0000

* Depend on USE_LDCONFIG to package ldconfig.
* Delete usr/share/zoneinfo from install tree.
* Delete extra binaries installed by getconf.
  POSIX_V6_ILP32_OFF32   POSIX_V7_ILP32_OFF32   XBS5_ILP32_OFF32
  POSIX_V6_ILP32_OFFBIG  POSIX_V7_ILP32_OFFBIG  XBS5_ILP32_OFFBIG
* Fix dangling symlink to /lib/libcidn-2.10.1.so
* in do_stage dont do duplicate install its time
  consuming and complex instead copy the install tree
  into staging. This part it from poky
  http://git.pokylinux.org/cgit.cgi/poky/commit/?h=canadian&id=48a278ed71306f633091ed81d170eeff45ba3759

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <rpurdie@linux.intel.com>
---
 recipes/eglibc/eglibc-package.bbclass |    9 +++++++--
 recipes/eglibc/eglibc-stage.inc       |   20 ++++----------------
 recipes/eglibc/eglibc.inc             |    2 +-
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index ac8a7fe..b49d133 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -26,6 +26,9 @@ ENABLE_BINARY_LOCALE_GENERATION ?= "0"
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
 BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc"
 
+# Set this to zero if you don't want ldconfig in the output package
+USE_LDCONFIG ?= "1"
+
 PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-dev eglibc-doc eglibc-locale libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
 PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
 
@@ -38,9 +41,9 @@ RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
 RPROVIDES_eglibc-thread-db = "glibc-thread-db"
 RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
 RPROVIDES_eglibc-dbg = "glibc-dbg"
-libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
+libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 
-FILES_${PN} = "${sysconfdir} ${libc_baselibs} /sbin/ldconfig ${libexecdir}/* ${datadir}/zoneinfo"
+FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
 FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
@@ -88,6 +91,8 @@ do_install() {
 		mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUPPORTED
 	done
 	rm -f ${D}/etc/rpc
+	rm -rf ${D}${datadir}/zoneinfo
+	rm -rf ${D}${libexecdir}/getconf
 }
 
 TMP_LOCALE="/tmp/locale${libdir}/locale"
diff --git a/recipes/eglibc/eglibc-stage.inc b/recipes/eglibc/eglibc-stage.inc
index 2b7b303..79ca8c8 100644
--- a/recipes/eglibc/eglibc-stage.inc
+++ b/recipes/eglibc/eglibc-stage.inc
@@ -1,18 +1,6 @@
 do_stage() {
-	rm -f ${STAGING_DIR_HOST}${layout_base_libdir}/libc.so.6
-	oe_runmake 'install_root=${STAGING_DIR_HOST}' \
-		   'includedir=${layout_includedir}' 'libdir=${layout_libdir}' 'slibdir=${layout_base_libdir}' \
-		   '${STAGING_DIR_HOST}${layout_base_libdir}/libc.so.6' \
-		   install
-
-	install -d ${STAGING_INCDIR}/gnu \
-		   ${STAGING_INCDIR}/bits \
-		   ${STAGING_INCDIR}/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${STAGING_INCDIR}/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${STAGING_INCDIR}/bits/
-	install -m 0644 misc/syscall-list.h ${STAGING_INCDIR}/bits/syscall.h
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${STAGING_INCDIR}/rpcsvc/
-	done
+    # Installing directly into staging creates some races between existing
+    # glibc-initial files and us. We could use a new DESTDIR but we may as
+    # well just copy the data installed by do_install
+    cp -pPR ${D}/* ${STAGING_DIR_HOST}/
 }
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index f81523e..1b655e1 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r6"
+INC_PR = "r7"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
-- 
1.6.3.3



