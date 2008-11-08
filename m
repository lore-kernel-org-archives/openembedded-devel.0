Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Kyxg8-00083s-MA
	for openembedded-devel@openembedded.org; Sun, 09 Nov 2008 00:57:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 0036F1417191
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Nov 2008 00:54:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bm21xAv7q7De for <openembedded-devel@openembedded.org>;
	Sun,  9 Nov 2008 00:54:13 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id A45751416BCE
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Nov 2008 00:54:13 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@openembedded.org
Date: Sun, 09 Nov 2008 00:55:36 +0100
Message-Id: <1226188536.12854.25.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: [patch review] cpan.class and perl: Fix MakeMaker paths to prevent	path clashes
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
X-List-Received-Date: Sat, 08 Nov 2008 23:57:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hallo core developers.

Here is next patch. It affects classes =3D> requires core team review.

Please approve or comment following patch of cpan.class.

The patch tries to prevent mixing of host, native and target perl
instances.

=EF=BB=BFExample of failing package: Compilation of libxml-parser-perl on=
 host
system that has perl !=3D 5.8.8.

That mixing may causes build failure and probably also miscompilation
(if Config.pm is mistakenly referenced during target build).

Patch prevents references to /usr/share/perl/{version}/ExtUtils/typemap
and /usr/lib/perl/{version}/Config.pm on host system and installs both
native and target files needed by MakeMaker.


diff --git a/classes/cpan.bbclass b/classes/cpan.bbclass
index 3ff3f30..7b3faa2 100644
--- a/classes/cpan.bbclass
+++ b/classes/cpan.bbclass
@@ -10,7 +10,8 @@ export PERLCONFIGTARGET =3D "${@is_target(d)}"
=20
 # Env var which tells perl where the perl include files are
 export PERL_INC =3D "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}/CORE=
"
-export PERL_ARCHLIB =3D "${STAGING_LIBDIR_NATIVE}/perl/${@get_perl_versi=
on(d)}"
+export PERL_LIB =3D "${STAGING_DATADIR}/perl/${@get_perl_version(d)}"
+export PERL_ARCHLIB =3D "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
=20
 cpan_do_configure () {
 	yes '' | perl Makefile.PL ${EXTRA_CPANFLAGS}
diff --git a/packages/perl/perl-5.8.8/native-perlinc.patch b/packages/per=
l/perl-5.8.8/native-perlinc.patch
index aea38a0..6dc4b95 100644
--- a/packages/perl/perl-5.8.8/native-perlinc.patch
+++ b/packages/perl/perl-5.8.8/native-perlinc.patch
@@ -1,12 +1,20 @@
 Index: perl-5.8.8/lib/ExtUtils/MM_Unix.pm
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm	2007-05-30 15:16:47.00000000=
0 +1000
-+++ perl-5.8.8/lib/ExtUtils/MM_Unix.pm	2007-05-30 15:18:12.000000000 +10=
00
-@@ -1597,6 +1597,11 @@
+--- perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.00000000=
0 +0000
++++ perl-5.8.8/lib/ExtUtils/MM_Unix.pm	2008-11-08 16:01:12.000000000 +00=
00
+@@ -1597,6 +1597,19 @@
  	$self->{PERL_LIB}     ||=3D $Config{privlibexp};
  	$self->{PERL_ARCHLIB} ||=3D $Config{archlibexp};
  	$self->{PERL_INC}     =3D $self->catdir("$self->{PERL_ARCHLIB}","CORE"=
); # wild guess for now
 +	# Check for environment override so we'll find the headers in the corr=
ect place
++        if (defined $ENV{PERL_LIB})
++        {
++            $self->{PERL_LIB} =3D $ENV{PERL_LIB};
++        }
++        if (defined $ENV{PERL_ARCHLIB})
++        {
++            $self->{PERL_ARCHLIB} =3D $ENV{PERL_ARCHLIB};
++        }
 +        if (defined $ENV{PERL_INC})
 +        {
 +            $self->{PERL_INC} =3D $ENV{PERL_INC};
diff --git a/packages/perl/perl-native_5.8.8.bb b/packages/perl/perl-nati=
ve_5.8.8.bb
index c58f828..e3d7384 100644
--- a/packages/perl/perl-native_5.8.8.bb
+++ b/packages/perl/perl-native_5.8.8.bb
@@ -65,8 +65,25 @@ do_stage_append() {
         # We need a hostperl link for building perl
         ln -sf ${STAGING_BINDIR_NATIVE}/perl${PV} ${STAGING_BINDIR_NATIV=
E}/hostperl
         # Store native config in non-versioned directory
-        install -d ${STAGING_DIR_HOST}/perl
+        install -d ${STAGING_DIR_HOST}/perl \
+                   ${STAGING_LIBDIR_NATIVE}/perl/${PV}/CORE \
+                   ${STAGING_DATADIR_NATIVE}/perl/${PV}/ExtUtils
         install config.sh ${STAGING_DIR_HOST}/perl
+	# target configuration
+        install lib/Config.pm       ${STAGING_LIBDIR_NATIVE}/perl/${PV}/
+	install lib/ExtUtils/typemap ${STAGING_DATADIR_NATIVE}/perl/${PV}/ExtUt=
ils/
+        # perl shared library headers
+        for i in av.h embed.h gv.h keywords.h op.h perlio.h pp.h regexp.=
h \
+                 uconfig.h XSUB.h cc_runtime.h embedvar.h handy.h opname=
s.h \
+                 perliol.h pp_proto.h regnodes.h unixish.h config.h EXTE=
RN.h \
+                 hv.h malloc_ctl.h pad.h perlsdio.h proto.h scope.h utf8=
.h \
+                 cop.h fakesdio.h INTERN.h mg.h patchlevel.h perlsfio.h =
\
+                 reentr.h sv.h utfebcdic.h cv.h fakethr.h intrpvar.h \
+                 nostdio.h perlapi.h perlvars.h reentr.inc thrdvar.h uti=
l.h \
+                 dosish.h form.h iperlsys.h opcode.h perl.h perly.h regc=
omp.h \
+                 thread.h warnings.h; do
+            install $i ${STAGING_LIBDIR_NATIVE}/perl/${PV}/CORE
+        done
 }
=20
 PARALLEL_MAKE =3D ""
diff --git a/packages/perl/perl_5.8.8.bb b/packages/perl/perl_5.8.8.bb
index 8c00a61..2118bba 100644
--- a/packages/perl/perl_5.8.8.bb
+++ b/packages/perl/perl_5.8.8.bb
@@ -139,11 +139,15 @@ do_install() {
 do_stage() {
         install -d ${STAGING_DIR_HOST}/perl \
                    ${STAGING_LIBDIR_NATIVE}/perl/${PV} \
-                   ${STAGING_LIBDIR}/perl/${PV}/CORE
+                   ${STAGING_LIBDIR}/perl/${PV}/CORE \
+                   ${STAGING_DATADIR}/perl/${PV}/ExtUtils
         # target config, used by cpan.bbclass to extract version informa=
tion
         install config.sh ${STAGING_DIR_HOST}/perl/
         # target configuration, used by native perl when cross-compiling
         install lib/Config_heavy.pl ${STAGING_LIBDIR_NATIVE}/perl/${PV}/=
Config_heavy-target.pl
+	# target configuration
+        install lib/Config.pm       ${STAGING_LIBDIR}/perl/${PV}/
+	install lib/ExtUtils/typemap ${STAGING_DATADIR}/perl/${PV}/ExtUtils/
         # perl shared library headers
         for i in av.h embed.h gv.h keywords.h op.h perlio.h pp.h regexp.=
h \
                  uconfig.h XSUB.h cc_runtime.h embedvar.h handy.h opname=
s.h \



________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



