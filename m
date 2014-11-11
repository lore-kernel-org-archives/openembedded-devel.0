Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB3C65CC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:50:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAB9o8dp017100
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 01:50:08 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 11 Nov 2014 01:50:07 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Nov 2014 04:50:05 -0500
Message-ID: <1415699406-29540-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/2] rrdtool: inherit cpan-base to help build perl modules
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
X-List-Received-Date: Tue, 11 Nov 2014 09:50:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It's incorrect to use -I for nativeperl to specify @INC/#include
directory to target build perl, which cause error like:
| temp/do_configure/run.do_configure.20749: line 112: 20256 Illegal instruction (core dumped)
| perl -I/path/to/tmp/sysroots/intel-haswell-64/usr/lib64/perl/$perl_version Makefile.PL

Inherit cpan-base and set related env vars to fix this and
avoid using sed to hack Makefile when build perl modules.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
index 449a923..b901f2e 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "\
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep gettext pythonnative perlnative python-dir
+inherit autotools-brokensep gettext pythonnative perlnative python-dir cpan-base
 
 EXTRA_AUTORECONF = "-I m4"
 
@@ -56,6 +56,12 @@ export HOST_SYS
 export STAGING_LIBDIR
 export STAGING_INCDIR
 
+# Env var which tells perl if it should use host (no) or target (yes) settings
+export PERLCONFIGTARGET = "${@is_target(d)}"
+export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/CORE"
+export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+
 do_configure() {
 	#fix the pkglib problem with newer automake
 	#perl
@@ -71,9 +77,6 @@ do_configure() {
 
 	autotools_do_configure
 
-	perl_version=`perl -v 2>/dev/null | \
-	    sed -n 's/This is perl.*v[a-z ]*\([0-9]\.[0-9][0-9.]*\).*$/\1/p'`
-
 	#modify python sitepkg
 	#remove the dependency of perl-shared:Makefile
 	#or perl-shared/Makefile will be regenerated
@@ -86,13 +89,10 @@ do_configure() {
 	#redo the perl bindings
 	(
 	cd ${S}/bindings/perl-shared;
-	perl -I${STAGING_LIBDIR}/perl/$perl_version Makefile.PL INSTALLDIRS="vendor"
-	    INSTALLPRIVLIB="abc";
-	sed -i -e "s| ${libdir}/perl/| ${STAGING_LIBDIR}/perl/|g" Makefile;
+	perl Makefile.PL INSTALLDIRS="vendor" INSTALLPRIVLIB="abc";
 
 	cd ../../bindings/perl-piped;
-	perl -I${STAGING_LIBDIR}/perl/$perl_version Makefile.PL INSTALLDIRS="vendor";
-	sed -i -e "s| ${libdir}/perl/| ${STAGING_LIBDIR}/perl/|g" Makefile;
+	perl Makefile.PL INSTALLDIRS="vendor";
 	)
 
 	#change the interpreter in file
-- 
2.0.0


