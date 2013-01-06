Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXE-00036O-5R
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:58 +0100
Received: by mail-pb0-f54.google.com with SMTP id wz12so9996791pbc.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=R+B5x/DMxXysWqajZeEnw3z+mVmXr8RpCOZR/NXsY9g=;
	b=NiR+PG6vqnDsYu8pwI3cBgSqOA1g09oxftImVzZoGlVwxcXOQbmXM1Mkrrnv8gqdJB
	jzuXxQdZbYbk7VmHStD0GbfYl/KeY3GHuiHvS68xeEXMMQvUu2kCuIR2kyfYKyEmWBzo
	HuGH9L+FZRq5lZ0KJSkesH+X6Z0OQmd0nl/2BoVbEb/inSiNLK8suUpc6OSDw2tIDkXc
	LHs4BZwYXeeFORU/4q0U353yToXW3vkobzrO+phjoZ2MJFbWOhufQPTAECcn17k+Peni
	ljiXVVgsEkAK+naJSEFQeqMkVVw5RR6HhMwNfHJPacQ6L6Kat4p6ZhCsprC1D45PRrJX
	5Emw==
X-Received: by 10.68.236.8 with SMTP id uq8mr176020008pbc.156.1357463623736;
	Sun, 06 Jan 2013 01:13:43 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:33 -0800
Message-Id: <1357463568-26241-10-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 10/25] tcpdump: Upgrade from 4.1.1 -> 4.3.0
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
X-List-Received-Date: Sun, 06 Jan 2013 09:29:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-minimal-IEEE802.15.4-allowed.patch        |    0
 .../configure.patch                                |    0
 .../ipv6-cross.patch                               |    0
 .../tcpdump_configure_no_-O2.patch                 |    0
 .../tcpdump/{tcpdump_4.1.1.bb => tcpdump_4.3.0.bb} |   32 +++++++++++---------
 5 files changed, 17 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-support/tcpdump/{tcpdump-4.1.1 => tcpdump-4.3.0}/0001-minimal-IEEE802.15.4-allowed.patch (100%)
 rename meta-oe/recipes-support/tcpdump/{tcpdump-4.1.1 => tcpdump-4.3.0}/configure.patch (100%)
 rename meta-oe/recipes-support/tcpdump/{tcpdump-4.1.1 => tcpdump-4.3.0}/ipv6-cross.patch (100%)
 rename meta-oe/recipes-support/tcpdump/{tcpdump-4.1.1 => tcpdump-4.3.0}/tcpdump_configure_no_-O2.patch (100%)
 rename meta-oe/recipes-support/tcpdump/{tcpdump_4.1.1.bb => tcpdump_4.3.0.bb} (55%)

diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/0001-minimal-IEEE802.15.4-allowed.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
similarity index 100%
rename from meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/0001-minimal-IEEE802.15.4-allowed.patch
rename to meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/configure.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
similarity index 100%
rename from meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/configure.patch
rename to meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/ipv6-cross.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
similarity index 100%
rename from meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/ipv6-cross.patch
rename to meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/tcpdump_configure_no_-O2.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
similarity index 100%
rename from meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/tcpdump_configure_no_-O2.patch
rename to meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb b/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb
similarity index 55%
rename from meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
rename to meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb
index 46b19a1..d3ca24f 100644
--- a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
+++ b/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb
@@ -4,7 +4,6 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
 SECTION = "console/network"
 DEPENDS = "libpcap"
-PR = "r2"
 
 SRC_URI = " \
 	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
@@ -13,29 +12,32 @@ SRC_URI = " \
 	file://ipv6-cross.patch \
 	file://configure.patch \
 "
+SRC_URI[md5sum] = "a3fe4d30ac85ff5467c889ff46b7e1e8"
+SRC_URI[sha256sum] = "efd08b610210d39977ec3175fa82dad9fbd33587930081be2a905a712dba4286"
 
 inherit autotools
-# ac_cv_linux_vers=${ac_cv_linux_vers=2}
+CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
 
-EXTRA_OECONF = "--without-crypto \
+EXTRA_OECONF = "--without-crypto --disable-rpath \
 		${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6', '--disable-ipv6', d)}"
 
-do_configure() {
+EXTRA_AUTORECONF += " -I m4"
+
+do_configure_prepend() {
+	mkdir -p ${S}/m4
+	if [ -f aclocal.m4 ]; then
+		mv aclocal.m4 ${S}/m4
+	fi
 	# AC_CHECK_LIB(dlpi.. was looking to host /lib
-	sed -i 's:-L/lib:-L${STAGING_LIBDIR}:g' ./configure.in
-        
-	gnu-configize
-	autoconf
-	oe_runconf
-	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
-	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
+	sed -i 's:-L/lib::g' ./configure.in
+}
+do_configure_append() {
+	sed -i 's:-L/usr/lib::' ./Makefile
+	sed -i 's:-Wl,-rpath,${STAGING_LIBDIR}::' ./Makefile
+	sed -i 's:-I/usr/include::' ./Makefile
 }
 
 do_install_append() {
 	# tcpdump 4.0.0 installs a copy to /usr/sbin/tcpdump.4.0.0
 	rm -f ${D}${sbindir}/tcpdump.${PV}
 }
-
-SRC_URI[md5sum] = "d0dd58bbd6cd36795e05c6f1f74420b0"
-SRC_URI[sha256sum] = "e6cd4bbd61ec7adbb61ba8352c4b4734f67b8caaa845d88cb826bc0b9f1e7f0a"
-
-- 
1.7.9.5



