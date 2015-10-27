Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id D7B4A75D4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:22:40 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so177035948wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=+vTDgFgETWqwlrrkqgiqR+8XT+JKpN8d2wGH0BYWYDI=;
	b=uSwEzagqRMw3cy4VZsprXxAJXjgzJstbup2Nltc+uGIwh3wnAdW6Wc4TzdLP+vMIfI
	rJ/mqq7ZMsrfy0cJ3pN696p+5Zus9LVnTMrjPVR/EM2t+z1GTKu8cAnzNeTCMfBAJ1VW
	Mb69PKHPUeEnrFsRsQrojUpwTSruTIbOtIvP7m0VnkHxn/aNpJR62iiesojMtXuVFYxB
	DI7p5ji2IQBGfqO53RlcZulvQ8Tpb8DsFv1d+aDSxnFH0/xTm6UwfcKHM6b961wJr/V8
	jJ2iL53BsLOh7J4q7WZ32YhKVUC6ly2xvG3qB3t5I+Qc5cLvhW4AxeTjrxTobWwsFtv4
	mEUQ==
X-Received: by 10.194.2.34 with SMTP id 2mr29172812wjr.39.1445977360316;
	Tue, 27 Oct 2015 13:22:40 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	jf13sm19009075wic.8.2015.10.27.13.22.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Oct 2015 13:22:38 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <A162E8E5-5317-4F65-B049-7897DAF41CAC@gmail.com>
Date: Tue, 27 Oct 2015 21:22:38 +0100
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-oe][PATCH] rrdtool: fix compile error V2
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
X-List-Received-Date: Tue, 27 Oct 2015 20:22:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Since cpan.bbclass has evolved, the old wrapper simulation needs some =
adoption.
Use as much as possible from cpan.bbclass instead of copying code from =
there.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb =
b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 2c81d56..666ace9 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "\
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools-brokensep gettext pythonnative perlnative python-dir =
cpan-base systemd
+inherit cpan autotools-brokensep gettext pythonnative python-dir =
systemd
=20
 BBCLASSEXTEND =3D "native"
=20
@@ -50,21 +50,13 @@ EXTRA_OECONF =3D " \
     --disable-rpath \
 "
=20
-# don't use perl.real, this results in break issues with prebuilts =
since perl.real doesn't
-# know where the PERL5LIB is...
-# use wrapper perl instead
-EXTRA_OEMAKE =3D "PERL=3D${STAGING_BINDIR_NATIVE}/perl-native/perl =
FULLPERL=3D${STAGING_BINDIR_NATIVE}/perl-native/perl"
-
 export BUILD_SYS
 export HOST_SYS
 export STAGING_LIBDIR
 export STAGING_INCDIR
=20
-# Env var which tells perl if it should use host (no) or target (yes) =
settings
-export PERLCONFIGTARGET =3D "${@is_target(d)}"
-export PERL_INC =3D =
"${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/CORE"
-export PERL_LIB =3D =
"${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
-export PERL_ARCHLIB =3D =
"${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+# emulate cpan_do_configure
+EXTRA_OEMAKE =3D ' PERL5LIB=3D"${PERL_ARCHLIB}" '
=20
 do_configure() {
     #fix the pkglib problem with newer automake
--=20
1.9.1

This is a V2 after rebasing oe/master

Error is here for a few days ... http://nopaste.linux-dev.org/?785761

--=20
Jens Rehsack - rehsack@gmail.com


