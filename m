Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MEVoV-00018z-HL
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 23:58:31 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MEVeo-0001Yk-EE
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 22:48:34 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jun 2009 22:48:17 +0100
Message-Id: <1244670497.4151.74.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: [patch] uclibc: fix glob for FILES
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
X-List-Received-Date: Wed, 10 Jun 2009 21:58:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

As with glibc, the globs used for uclibc_baselibs were rather too
permissive and were causing development files (*.so) to leak into the
main library package.  Rather bizarrely, libdl.so, libm.so,
libpthread.so and libutil.so - though not any of the other .so files -
were also being explicitly mentioned in ${uclibc_baselibs}.

Anyway, this patch corrects that and also replaces some hardcoded paths
with variable references.

p.

--

diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
index bf8df8e..05442ff 100644
--- a/recipes/uclibc/uclibc.inc
+++ b/recipes/uclibc/uclibc.inc
@@ -35,15 +35,18 @@ PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db"
 LEAD_SONAME = "libc.so"
 
 # The last line (gdb and lib1) is for uclinux-uclibc builds 
-uclibc_baselibs = "/lib/libcrypt*.so* /lib/libdl*.so \
-		   /lib/libintl*.so* /lib/libm*.so \
-		   /lib/libnsl*.so* /lib/libpthread*.so \
-		   /lib/libresolv*.so* /lib/libutil*.so \
-		   /lib/libuClibc*.so* /lib/ld*.so* \
-		   /lib/libc*.so* /lib/libdl*.so* \
-		   /lib/libm*.so* /lib/libutil*.so* \
-		   /lib/libpthread*.so* /lib/librt*.so* \
-                   /usr/lib/libc.gdb /usr/lib/libc /lib/lib1.so \
+uclibc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so \
+		   ${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
+		   ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
+		   ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
+                   ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so \
+		   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
+                   ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so \
+		   ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so \
+                   ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so \
+		   ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
+                   ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so \
+                   ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
                    "
 FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
 	       ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
diff --git a/recipes/uclibc/uclibc_0.9.30.1.bb b/recipes/uclibc/uclibc_0.9.30.1.bb
index ab6dcb9..dbdcbb6 100644
--- a/recipes/uclibc/uclibc_0.9.30.1.bb
+++ b/recipes/uclibc/uclibc_0.9.30.1.bb
@@ -7,7 +7,7 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.30.1"
-PR = "r2"
+PR = "r3"
 DEFAULT_PREFERENCE = "1"
 
 require uclibc.inc




