Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 23CAD72641
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:25 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so14739059pab.14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=HhRUc/rgtfaCR5SjSXwnghOcqWMPq/zlPuqsbSmmE9I=;
	b=HVv+HP3OjUX4kZBcBWsvQoQw690V0D0AIXyr6z+R77k4CxrCLt90hbmAWEP7J/viIg
	KDCf8NSnUmRwKXo3lHn/+UG6PFyozpivzqZdQV8FyWCN2N4Aa4dsy0VmsR7m4J/Gsi7y
	ay98EKHY6ls+8Ozj4CGJdX/hEr8X2wjWodydFHUC18HynXr0E/v9Iyap4SRRSPVO2oZp
	FkPXs0QR/yh0eeX6I1NGocWFGS7j6bwzwb9Z1vnlnRKlIiY5Y3vNPZaYxHSQjyaT3MUd
	GVFPZA7RUIsl7NBNh8kanza4hhNJXmdH7bPYQOawxhXER8TSlSUXfPch+/QZjwiD4Wac
	BwNg==
X-Received: by 10.68.132.2 with SMTP id oq2mr74382180pbb.45.1419700946597;
	Sat, 27 Dec 2014 09:22:26 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:54 -0800
Message-Id: <a88ed1d7a836b21c5af7320f95d72249e3ca2fcc.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 07/27] rrdtool: inherit cpan-base to help build perl modules
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:26 -0000

From: Jackie Huang <jackie.huang@windriver.com>

It's incorrect to use -I for nativeperl to specify @INC/#include
directory to target build perl, which cause error like:
| temp/do_configure/run.do_configure.20749: line 112: 20256 Illegal instruction (core dumped)
| perl -I/path/to/tmp/sysroots/intel-haswell-64/usr/lib64/perl/$perl_version Makefile.PL

Inherit cpan-base and set related env vars to fix this and
avoid using sed to hack Makefile when build perl modules.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


