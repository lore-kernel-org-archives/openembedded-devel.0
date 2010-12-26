Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PWyJK-0002oz-PS
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Dec 2010 22:39:27 +0100
Received: by ewy28 with SMTP id 28so906818ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Dec 2010 13:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=rRlos2aLh/c8c5BYHNmC/vdxqf7HBxKjVWAvxxz3S2Q=;
	b=CgA0S6CsUGQdUEfKdbssrvug3O6AwhwtCwCn8HbGVm3YehJfpT8+Xsfn5WKZsZKgpM
	7nX15Gg+lPbHsJB6c6qE9Td51F0Ml03hMFBO5NXRUYvYaCdjOJXKJ9q9EOcvbkUX1i7T
	qPS9y99eoPd9aj/Inlrr6dUPJ3s/TA5YS5Li0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=tHH9U3JJKM/zjUa09PXHusEhdUiosRiKXn2uY8sFRl9C/vWBln/qnX1719XP/8V56w
	fWbQ+nIQNatMytHUXe+a3rbdkf3pUdakrm0KGVh7mBFGDuA8EjETvZSzXsFrm4nDQNxi
	pBLUSylkLnq94MwsjHi5SV4nHcDuRxPENz/SU=
Received: by 10.213.5.15 with SMTP id 15mr4536280ebt.13.1293399507247;
	Sun, 26 Dec 2010 13:38:27 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id x54sm8332412eeh.17.2010.12.26.13.38.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 26 Dec 2010 13:38:25 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Dec 2010 22:38:18 +0100
Message-Id: <1293399498-14036-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH v2] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Sun, 26 Dec 2010 21:39:27 -0000

Without these gcc would be used which resolves to /usr/bin/gcc
and one gets an intel exe.
This showed up with libparams-validate-perl and libdatetime-perl
The LDFLAGS are added to resolve the GNU_HASH QA error

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/cpan_build.bbclass     |    1 +
 classes/poky/cpan-base.bbclass |   42 ++++++++++++++++++++++++++++++++++++++++
 classes/poky/cpan.bbclass      |   38 ++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 classes/poky/cpan-base.bbclass
 create mode 100644 classes/poky/cpan.bbclass

diff --git a/classes/cpan_build.bbclass b/classes/cpan_build.bbclass
index d1bbc4f..070e061 100644
--- a/classes/cpan_build.bbclass
+++ b/classes/cpan_build.bbclass
@@ -26,6 +26,7 @@ cpan_build_do_configure () {
 		# build for target
 		. ${STAGING_LIBDIR}/perl/config.sh
 		perl Build.PL --installdirs vendor \
+		        --config cc="${CC} ${LDFLAGS}" --config ld="${CCLD} ${LDFLAGS}" \
 			--destdir ${D} \
 			--install_path lib="${datadir}/perl5" \
 			--install_path arch="${libdir}/perl5" \
diff --git a/classes/poky/cpan-base.bbclass b/classes/poky/cpan-base.bbclass
new file mode 100644
index 0000000..3175248
--- /dev/null
+++ b/classes/poky/cpan-base.bbclass
@@ -0,0 +1,42 @@
+#
+# cpan-base providers various perl related information needed for building
+# cpan modules
+#
+FILES_${PN} += "${libdir}/perl5 ${datadir}/perl5"
+
+DEPENDS  += "${@["perl", "perl-native"][(bb.data.inherits_class('native', d))]}"
+RDEPENDS  += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
+
+# Determine the staged version of perl from the perl configuration file
+def get_perl_version(d):
+	import re
+    	cfg = bb.data.expand('${STAGING_LIBDIR}/perl/config.sh', d)
+	try:
+		f = open(cfg, 'r')
+	except IOError:
+		return None
+	l = f.readlines();
+	f.close();
+	r = re.compile("^version='(\d*\.\d*\.\d*)'")
+	for s in l:
+		m = r.match(s)
+		if m:
+			return m.group(1)
+	return None
+
+# Determine where the library directories are
+def perl_get_libdirs(d):
+	libdir = bb.data.getVar('libdir', d, 1)
+	libdirs = libdir + '/*/*/perl5'
+	return libdirs
+
+def is_target(d):
+    if not bb.data.inherits_class('native', d):
+        return "yes"
+    return "no"
+
+PERLLIBDIRS = "${@perl_get_libdirs(d)}"
+
+FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
+                    ${PERLLIBDIRS}/auto/*/*/.debug \
+                    ${PERLLIBDIRS}/auto/*/*/*/.debug"
diff --git a/classes/poky/cpan.bbclass b/classes/poky/cpan.bbclass
new file mode 100644
index 0000000..513f0b3
--- /dev/null
+++ b/classes/poky/cpan.bbclass
@@ -0,0 +1,38 @@
+#
+# This is for perl modules that use the old Makefile.PL build system
+#
+inherit cpan-base
+
+EXTRA_CPANFLAGS ?= ""
+
+# Env var which tells perl if it should use host (no) or target (yes) settings
+export PERLCONFIGTARGET = "${@is_target(d)}"
+
+# Env var which tells perl where the perl include files are
+export PERL_INC = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}/CORE"
+export PERL_LIB = "${STAGING_DATADIR}/perl/${@get_perl_version(d)}"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
+
+cpan_do_configure () {
+	export PERL5LIB="${PERL_ARCHLIB}"
+	yes '' | perl Makefile.PL ${EXTRA_CPANFLAGS}
+	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
+		. ${STAGING_LIBDIR}/perl/config.sh
+		# Use find since there can be a Makefile generated for each Makefile.PL
+		for f in `find -name Makefile.PL`; do
+			f2=`echo $f | sed -e 's/.PL//'`
+			sed -i -e "s:\(PERL_ARCHLIB = \).*:\1${PERL_ARCHLIB}:" \
+			$f2
+		done
+	fi
+}
+
+cpan_do_compile () {
+	oe_runmake PASTHRU_INC="${CFLAGS}" CCFLAGS="${CFLAGS}" LD="${CCLD}"
+}
+
+cpan_do_install () {
+	oe_runmake DESTDIR="${D}" install_vendor
+}
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
1.7.1



