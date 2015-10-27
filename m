Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id AD48777080
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:09:18 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so176607997wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=0J40MtMN1K5c5xriJFzKprriDwqWzJJpA2DVlV8bka8=;
	b=rXyzTNuejtrVPranc4afwulMnBZUpUCwPqmR1v2uvVKa3qohFYKMLDXIAs94RAFflg
	dhKcm6Kwxc+t4dJt2udG4VSrgrndjmZA06liiE2RTVaLXKsY+6ERCFpzYn2z1yCM990S
	MN5gYPcvqkFwyREJEVMdmJsz5bHOtx6eJYAA94TPYGyiGBQ+t01+6tDVGhssD+s2DZdP
	pEvogdDxnqi+BFE9vNFb0X0cLegmP7RMuIV+8F4rRCAMMc2U/Z8bgtipFE7XEJAIpnAP
	SFR4Rjqw8z3R9QSRajDQLOCFKx0q9D4XsKLF273lotsX+qSuLL4WgGNEe6n3y6fudJNL
	fL+g==
X-Received: by 10.194.19.134 with SMTP id f6mr30304508wje.133.1445976558234;
	Tue, 27 Oct 2015 13:09:18 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	wz7sm12626755wjc.26.2015.10.27.13.09.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Oct 2015 13:09:17 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <3423124B-6E37-463C-B4EC-1FFD9F20B586@gmail.com>
Date: Tue, 27 Oct 2015 21:09:16 +0100
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-oe][PATCH] rrdtool: fix compile error
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
X-List-Received-Date: Tue, 27 Oct 2015 20:09:19 -0000
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
index aba342b..7c75fab 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "\
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools-brokensep gettext pythonnative perlnative python-dir =
cpan-base
+inherit cpan autotools-brokensep gettext pythonnative python-dir
=20
 BBCLASSEXTEND =3D "native"
=20
@@ -46,21 +46,13 @@ EXTRA_OECONF =3D " \
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

Error is here for a few days ... http://nopaste.linux-dev.org/?785761

--=20
Jens Rehsack - rehsack@gmail.com


