Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ojsz6-0008TP-6p for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 14:03:56 +0200
Received: from g225081126.adsl.alicedsl.de ([92.225.81.126]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ojsyu-00022T-Gk for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 12:03:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1281698231-26231-1-git-send-email-noor_ahsan@mentor.com>
References: <1281698231-26231-1-git-send-email-noor_ahsan@mentor.com>
Date: Fri, 13 Aug 2010 14:03:25 +0200
Message-ID: <1281701005.3858.129.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 12:03:57 -0000
X-Groupsio-MsgNum: 22152
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-HQv5mGoMsovKspwhmT3v"

--=-HQv5mGoMsovKspwhmT3v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 13.08.2010, 17:17 +0600 schrieb noor_ahsan@mentor.com:
> genboot-native: Removing legacy staging

You used `git-send-email`, but it looks strange since this line should
have been the subject line and not in the commit message.

Please also mark iteration of your patches. For example this with =C2=BBPAT=
CH
v2=C2=AB. (See `--subject-prefix` in `git help format-patch`.) For clarity
also add a small comment, what changed after the S-o-b line like below
when you use `git commit`.

> * Replaced do_stage function with do_install and replaced ${STAGING_BINDI=
R} with ${D}${bindir}
> =20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
v2: Increase `PR`.
---

> diff --git a/recipes/simpad-utilities/genboot-native.bb b/recipes/simpad-=
utilities/genboot-native.bb
> index 47b9b34..f398a55 100644
> --- a/recipes/simpad-utilities/genboot-native.bb
> +++ b/recipes/simpad-utilities/genboot-native.bb
> @@ -1,5 +1,5 @@
>  SECTION =3D "console/utils"
> -PR =3D "r1"
> +PR =3D "r2"
>  DESCRIPTION =3D "Console utility for generating a SIMpad boot image for =
the proprietary SIEMENS Switzerland bootloader"
>  FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/genboot"
>  SRC_URI =3D "file://gen_boot.c file://arnold_boot.h file://simpad-make-f=
lashimg"
> @@ -9,12 +9,15 @@ DEPENDS =3D "pad-native"
> =20
>  inherit native
> =20
> +NATIVE_INSTALL_WORKS =3D "1"

I am really a noob, but is not that for =E2=80=9Cnormal=E2=80=9D, i.e. no *=
-native,
recipes indicating no explicit native recipe is needed?

>  do_compile() {
> -	cp ${WORKDIR}/*.h ${WORKDIR}/*.c .
> -	${CC} -I. -o genboot gen_boot.c
> +        cp ${WORKDIR}/*.h ${WORKDIR}/*.c .
> +        ${CC} -I. -o genboot gen_boot.c
>  }

You changed the whitespace. I do not know if there are any
rules/recommendations in OE, but it bloats up the patch.

> -do_stage() {
> -	install -m 0755 genboot ${STAGING_BINDIR}/
> -	install -m 0755 ${WORKDIR}/simpad-make-flashimg ${STAGING_BINDIR}/
> +do_install() {
> +        install -d ${D}${bindir}/
> +        install -m 0755 genboot ${D}${bindir}/
> +        install -m 0755 ${WORKDIR}/simpad-make-flashimg ${D}${bindir}/
>  }


Thanks,

Paul

--=-HQv5mGoMsovKspwhmT3v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxlNI0ACgkQPX1aK2wOHVgGEACffJnsRzC0duUEb808bViee+30
5dwAnjel/Iep9V7llsfrxv7LwyD40tQV
=St7X
-----END PGP SIGNATURE-----

--=-HQv5mGoMsovKspwhmT3v--
