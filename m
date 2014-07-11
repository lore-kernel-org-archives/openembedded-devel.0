Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1D5670486
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 06:08:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6B68bYC026596
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 23:08:37 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 10 Jul 2014 23:08:37 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Jul 2014 14:08:35 +0800
Message-ID: <1405058915-12198-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 3/3][meta-perl] libnet-libidn-perl: add recipe
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
X-List-Received-Date: Fri, 11 Jul 2014 06:08:38 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../libidn-wr-cross-compile.patch                  |   49 ++++++++++++++++++++
 .../recipes-perl/libnet/libnet-libidn-perl_0.12.bb |   34 ++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-libidn-perl-0.12/libidn-wr-cross-compile.patch
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb

diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl-0.12/libidn-wr-cross-compile.patch b/meta-perl/recipes-perl/libnet/libnet-libidn-perl-0.12/libidn-wr-cross-compile.patch
new file mode 100644
index 0000000..679caa3
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl-0.12/libidn-wr-cross-compile.patch
@@ -0,0 +1,49 @@
+perl-Net-LibIDN: cross-compile
+
+Upstream-Status: Pending
+
+Add support for cross-compile allowing the compiler binary to be
+specified into the perl Makefile instead of using the default 'gcc'.
+
+Signed-off-by: Greg Moffatt <greg.moffatt@windriver.com>
+---
+
+--- perl-Net-LibIDN-0.12.orig/Makefile.PL	2009-02-26 07:09:45.000000000 -0500
++++ perl-Net-LibIDN-0.12/Makefile.PL	2010-10-19 09:34:22.811173965 -0400
+@@ -9,6 +9,7 @@
+ my $options;
+ my $testno=1;
+ my %MakeParams = InitMakeParams();
++my $compiler;
+ 
+ WriteMakefile(%MakeParams);
+ 
+@@ -44,7 +45,8 @@
+ 	(
+ 		"with-libidn=s" => \$libdir,
+ 		"with-libidn-inc=s" => \$incdir,
+-		"disable-tld" => \$disable_tld
++		"disable-tld" => \$disable_tld,
++		"compiler=s" => \$compiler
+ 	);
+ 
+ 	if ($libdir)
+@@ -165,12 +167,17 @@
+ 		return 0;
+ 	}
+ 
+-	foreach my $cc (qw/cc gcc/)
++	foreach my $cc ($compiler, qw/cc gcc/)
+ 	{
+ 		unlink($test);
+ 		system "$cc $cflags -o $test $test.c $ldflags";
+ 		next if ($? >> 8);
+ 
++		if ($compiler == $cc)
++		{
++			return 1;
++		}
++
+ 		if (open(FILE, "./$test|"))
+ 		{
+ 			my $match;
diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
new file mode 100644
index 0000000..42b213d
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Net::LibIDN - Perl bindings for GNU Libidn"
+DESCRIPTION = "\
+Provides bindings for GNU Libidn, a C library for handling Internationalized \
+Domain Names according to IDNA (RFC 3490), in a way very much inspired by \
+Turbo Fredriksson's PHP-IDN. \
+"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPLv1+"
+HOMEPAGE = "http://search.cpan.org/dist/Net-LibIDN/"
+DEPENDS += "libidn"
+# We must need eglibc-gconvs to enable charset related functions, 
+# such as Net::LibIDN::idn_to_ascii().
+RDEPENDS_${PN} += "eglibc-gconvs"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
+SRC_URI[md5sum] = "c3e4de2065009d67bcb1df0afb473e12"
+SRC_URI[sha256sum] = "2f8acc9442b3866ec7dc63cd449fc693ae3e930d5d3e5e9430fbb6f393bdbb17"
+
+SRC_URI += "file://libidn-wr-cross-compile.patch"
+
+LIC_FILES_CHKSUM = "file://README;beginline=42;endline=92;md5=3374ea0369ca3ead6047520477a43147"
+
+S = "${WORKDIR}/Net-LibIDN-${PV}"
+
+EXTRA_CPANFLAGS = "--with-libidn=${STAGING_LIBDIR} --with-libidn-inc=${STAGING_INCDIR} --compiler='${CC}'"
+EXTRA_CPANFLAGS += "--disable-tld"
+
+inherit cpan
+
+FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/Net/LibIDN/.debug/"
+
+do_configure_prepend() {
+	rm -rf ${S}/.pc/
+}
-- 
1.7.10.4


