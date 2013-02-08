Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U3reT-0004YC-KX
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 18:22:18 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 20E10D22B3;
	Fri,  8 Feb 2013 18:06:23 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 18:06:19 +0100
Message-Id: <1360343179-29346-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH] cyrus-sasl2: add 2.1.26
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
X-List-Received-Date: Fri, 08 Feb 2013 17:22:31 -0000

I took recipe from OE classic, updated, cleaned and got it build. I use
it only as build dependency - did not checked binaries from ${PN}-bin.

There are RPATH problems to solve:

WARNING: QA Issue: package cyrus-sasl-bin contains bad RPATH
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/genericarmv8/usr/lib
in file
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/cyrus-sasl/2.1.26-r0/packages-split/cyrus-sasl-bin/usr/sbin/saslpasswd2
WARNING: QA Issue: package cyrus-sasl-bin contains bad RPATH
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/genericarmv8/usr/lib
in file
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/cyrus-sasl/2.1.26-r0/packages-split/cyrus-sasl-bin/usr/sbin/pluginviewer
WARNING: QA Issue: package cyrus-sasl-bin contains bad RPATH
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/genericarmv8/usr/lib
in file
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/cyrus-sasl/2.1.26-r0/packages-split/cyrus-sasl-bin/usr/sbin/sasldblistusers2
WARNING: QA Issue: package cyrus-sasl contains bad RPATH
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/genericarmv8/usr/lib
in file
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/cyrus-sasl/2.1.26-r0/packages-split/cyrus-sasl/usr/lib/sasl2/libsasldb.so.3.0.0

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
new file mode 100644
index 0000000..44336f0
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Generic client/server library for SASL authentication."
+SECTION = "console/network"
+DEPENDS = "openssl virtual/db"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
+
+SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz "
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--with-dblib=berkeley \
+                 --with-bdb-libdir=${STAGING_LIBDIR} \
+                 --with-bdb-incdir=${STAGING_INCDIR} \
+                 --without-pam --without-opie --without-des"
+
+do_configure_prepend () {
+    rm -f acinclude.m4 config/libtool.m4
+}
+
+do_compile_prepend () {
+    cd include
+    ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} makemd5.c -o makemd5
+    touch makemd5.o makemd5.lo makemd5
+    cd ..
+}
+
+pkg_postinst_${PN}-bin () {
+    grep cyrus /etc/passwd || adduser --disabled-password --home=/var/spool/mail --ingroup mail -g "Cyrus sasl" cyrus
+    echo "cyrus" | saslpasswd2 -p -c cyrus
+    chgrp mail /etc/sasldb2
+}
+
+SRC_URI[md5sum] = "a7f4e5e559a0e37b3ffc438c9456e425"
+SRC_URI[sha256sum] = "8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f1345b7bc3"
+
+PACKAGES =+ "${PN}-bin"
+
+FILES_${PN}           += "${libdir}/sasl2/*.so.*"
+FILES_${PN}-bin       += "${bindir}"
+FILES_${PN}-dev       += "${libdir}/sasl2/*.so ${libdir}/sasl2/*.la"
+FILES_${PN}-dbg       += "${libdir}/sasl2/.debug"
+FILES_${PN}-staticdev += "${libdir}/sasl2/*.a"
-- 
1.8.0



