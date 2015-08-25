Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0CB65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 23:10:14 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so47760504pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1L99cy3TFnPgFIfqLfdQHB8KR1Fl1wbkofazHyciG3Q=;
	b=gso+w8kThn7sdmVRDvvL/puVXGNhLsnsUIMkJgIHipQSvc84nwXwJ50eCjW9L3vp0A
	t7PxIBOZzPBPAQY0EQcPEIdg4MiXHj/C7NKMHL9S6SAg4ytAS/BriEnor2lnBHKZdojm
	e73Fb1zyjffwkGMgA7SzyI+RnyyC2p7MG021LbcbbKhZDeE9rwsdkSzEY9VVaFR1TJts
	cltx7k9GCOGpywsbVlK3qGyIGhTcBZzi2i8QUdlj5x59Y3NsFqBt2/jwR7Ur4ua7cVuf
	5bUopzWrdC4l6v/xzhScl9gDbt1/6YiQBxt3JTJcg17AIMb5d18qikvu+nkR6SHIWlpL
	Kr0w==
X-Received: by 10.66.90.166 with SMTP id bx6mr60496987pab.133.1440544214860;
	Tue, 25 Aug 2015 16:10:14 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:316a:3272:24e7:4679?
	([2601:646:8601:4580:316a:3272:24e7:4679])
	by smtp.gmail.com with ESMTPSA id
	ye2sm20971973pab.31.2015.08.25.16.10.13
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Aug 2015 16:10:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1439928871-17797-2-git-send-email-mario@ossystems.com.br>
Date: Tue, 25 Aug 2015 16:10:08 -0700
Message-Id: <992F06D0-90FC-4648-B271-545B0DA26248@gmail.com>
References: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
	<1439928871-17797-2-git-send-email-mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH 2/3] Avoid parse time errors due to dependency on x11, for distros without x11
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
X-List-Received-Date: Tue, 25 Aug 2015 23:10:21 -0000
X-Groupsio-MsgNum: 57022
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CEFEB365-7D8D-4B3A-BC6B-7BCA70FD2DE8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CEFEB365-7D8D-4B3A-BC6B-7BCA70FD2DE8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 18, 2015, at 1:14 PM, Mario Domenech Goulart =
<mario@ossystems.com.br> wrote:
>=20
> BitBake raises some errors when processing recipes that depend on x11
> for distros that don't have x11 in DISTRO_FEATURES. To work around
> that issue, REQUIRED_DISTRO_FEATURES =3D "x11" (from
> distro_features_check.bbclass) has been set for the following recipes:
>=20
> * cacao
> * classpath
> * jamvm
> * openjdk-6-release
> * openjdk-7-release
>=20
> That makes BitBake skip those recipes during the cache generation
> (they'd still be parsed, but ignored).

This will also cause native versions of java to now check for x11, thats =
a wrong assumption. Please fix it asap.
meta-java is currently regressing on two recent commits including this =
one.

so, I would propose to revert this commit if we can=E2=80=99t fix it in =
short period of time.



>=20
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
> recipes-core/cacao/cacao_1.6.1.bb       | 4 +++-
> recipes-core/classpath/classpath.inc    | 4 +++-
> recipes-core/jamvm/jamvm.inc            | 4 +++-
> recipes-core/openjdk/openjdk-common.inc | 4 +++-
> 4 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-core/cacao/cacao_1.6.1.bb =
b/recipes-core/cacao/cacao_1.6.1.bb
> index 14ff019..d52f339 100644
> --- a/recipes-core/cacao/cacao_1.6.1.bb
> +++ b/recipes-core/cacao/cacao_1.6.1.bb
> @@ -15,7 +15,9 @@ SRC_URI =3D =
"http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-
> SRC_URI[md5sum] =3D "2c18478404afd1cffdd15ad1e9d85a57"
> SRC_URI[sha256sum] =3D =
"eecc8bd1b528a028f43d9d1d0c06b97855bbf1d40e03826d911ebbc0b6971e12"
>=20
> -inherit java autotools-brokensep update-alternatives pkgconfig
> +inherit java autotools-brokensep update-alternatives pkgconfig =
distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
>=20
> EXTRA_OECONF_class-native =3D "\
>     --enable-debug \
> diff --git a/recipes-core/classpath/classpath.inc =
b/recipes-core/classpath/classpath.inc
> index 1bdfd78..0f760fe 100644
> --- a/recipes-core/classpath/classpath.inc
> +++ b/recipes-core/classpath/classpath.inc
> @@ -7,7 +7,9 @@ LICENSE =3D "Classpath"
>=20
> PBN =3D "classpath"
>=20
> -inherit autotools java gettext
> +inherit autotools java gettext distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
>=20
> DEPENDS =3D "virtual/javac-native fastjar-native zip-native gmp =
antlr-native gtk+ gconf libxtst file"
>=20
> diff --git a/recipes-core/jamvm/jamvm.inc =
b/recipes-core/jamvm/jamvm.inc
> index bed1c5d..9d9fef6 100644
> --- a/recipes-core/jamvm/jamvm.inc
> +++ b/recipes-core/jamvm/jamvm.inc
> @@ -21,7 +21,9 @@ SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
>           "
>=20
>=20
> -inherit java autotools update-alternatives pkgconfig
> +inherit java autotools update-alternatives pkgconfig =
distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
>=20
> # This uses 32 bit arm, so force the instruction set to arm, not thumb
> ARM_INSTRUCTION_SET =3D "arm"
> diff --git a/recipes-core/openjdk/openjdk-common.inc =
b/recipes-core/openjdk/openjdk-common.inc
> index dc26522..e3e597a 100644
> --- a/recipes-core/openjdk/openjdk-common.inc
> +++ b/recipes-core/openjdk/openjdk-common.inc
> @@ -17,7 +17,9 @@ DEPENDS_append_libc-uclibc =3D " virtual/libiconv "
> # because structure sizes and/or alignment may differ.
> DEPENDS_append =3D " qemu-native "
>=20
> -inherit java autotools gettext qemu pkgconfig
> +inherit java autotools gettext qemu pkgconfig distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
>=20
> # OpenJDK uses slightly different names for certain arches. We need to =
know
> #	this to create some files which are expected by the build.
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_CEFEB365-7D8D-4B3A-BC6B-7BCA70FD2DE8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXc9dQACgkQuwUzVZGdMxSySACfZadGosD8LC7Zge2uAipu3S8g
8T4Ani/qniOEZKGqwyoZ03tJ9DkA61+b
=rwjM
-----END PGP SIGNATURE-----

--Apple-Mail=_CEFEB365-7D8D-4B3A-BC6B-7BCA70FD2DE8--
