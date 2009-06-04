Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MCBA1-0007sb-DB
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 13:31:05 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MCB1E-0000ij-Pd
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 12:22:00 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MCB1E-0000tb-PP
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 12:22:00 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 04 Jun 2009 12:22:00 +0100
Message-Id: <1244114520.2611.114.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: [patch] glibc: correct paths in FILES
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
X-List-Received-Date: Thu, 04 Jun 2009 11:31:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

It turns out that glibc-package contains a bunch of hard-coded
references to /lib.  This patch replaces them with the appropriate
${base_libdir}.  Also, the globs in ${libc_baselibs} were a bit too
permissive and would accept, for example, "libc.a" which isn't something
that we want in the main library package.

p.

--

diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
index 78738c2..793401f 100644
--- a/recipes/glibc/glibc-package.bbclass
+++ b/recipes/glibc/glibc-package.bbclass
@@ -32,12 +32,12 @@ USE_LDCONFIG ?= "1"
 PACKAGES = "glibc-dbg glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
 PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* locale-base-* glibc-binary-localedata-*"
 
-libc_baselibs = "/lib/libc* /lib/libm* /lib/ld* /lib/libpthread* /lib/libresolv* /lib/librt* /lib/libutil* /lib/libnsl* /lib/libnss_files* /lib/libnss_compat* /lib/libnss_dns* /lib/libdl* /lib/libanl* /lib/libBrokenLocale*"
+libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${@base_conditional('USE_LDCONFIG', '1', '/sbin/ldconfig', '', d)}"
 FILES_ldd = "${bindir}/ldd"
-FILES_libsegfault = "/lib/libSegFault*"
-FILES_glibc-extra-nss = "/lib/libnss*"
+FILES_libsegfault = "${base_libdir}/libSegFault*"
+FILES_glibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "/sbin/sln"
 FILES_glibc-dev_append = " ${libdir}/*.o ${bindir}/rpcgen"
 FILES_nscd = "${sbindir}/nscd*"
@@ -46,8 +46,8 @@ FILES_glibc-gconv = "${libdir}/gconv/*"
 FILES_${PN}-dbg += " ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
 FILES_catchsegv = "${bindir}/catchsegv"
 RDEPENDS_catchsegv = "libsegfault"
-FILES_glibc-pcprofile = "/lib/libpcprofile.so"
-FILES_glibc-thread-db = "/lib/libthread_db*"
+FILES_glibc-pcprofile = "${base_libdir}/libpcprofile.so"
+FILES_glibc-thread-db = "${base_libdir}/libthread_db*"
 FILES_localedef = "${bindir}/localedef"
 RPROVIDES_glibc-dev += "libc-dev"
 
@@ -145,7 +145,7 @@ do_prep_locale_tree() {
 	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
 		gunzip $i
 	done
-	ls ${D}/lib/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
+	ls ${D}${base_libdir}/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
 	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so ]; then
 		cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
 	fi




