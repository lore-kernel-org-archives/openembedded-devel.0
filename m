Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id B0ECC6A48C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 08:28:48 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hq7so2214076wib.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 01:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w0oHHt2MgetCXlu0hCUnwU6/wN2aqiN557QPPRAwsFc=;
	b=rOqPUBpXZc6Ld1vJ8dS7iMXdVcx/Hxi9S5fhnfFaLdgXAD1iabl7KMaUezMSnDy4WP
	QBBrpsOWVGQQ65WG1TXJvmcTuMH7TN+bozXyJ1CsDd1gMG2SmEh/d6MT6KuKlDbY9NAt
	+VaANbcTAEzQSSrczx7WOZYWaS7kp+ik9aH8hGIhpzZpv1hpTEX68nezFvkSa0ER10IG
	2I8tLizk7htVcLJ+7uYkrqNAHCNXwg5wxTieqdH0TNnbrpksr1J6PXWZ+iKXdD6VFByU
	terJ3UzgMfjmQGgUmWnOZxCOocb6W9Y5uU835qTonRP0LjnhhsYIA9QlFAUlCYZqdtPW
	4ZwA==
X-Received: by 10.180.88.231 with SMTP id bj7mr11252033wib.5.1369729728632;
	Tue, 28 May 2013 01:28:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e5sm22660726wiy.5.2013.05.28.01.28.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 28 May 2013 01:28:47 -0700 (PDT)
Date: Tue, 28 May 2013 10:28:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130528082857.GA3192@jama>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
	<1369698233-4500-7-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1369698233-4500-7-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][PATCH 7/8] qtbase: install and split package fonts
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
X-List-Received-Date: Tue, 28 May 2013 08:28:49 -0000
X-Groupsio-MsgNum: 44885
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 01:43:52AM +0200, Eric B=E9nard wrote:
> - fonts were not installed (at least in qt 5.0.2) so install
> them manually.
> - split the font package in smaller package as done in qt4 to
> save space on the target.
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes-qt/qt5/qtbase.inc |   30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 81cc2e1..4b4fb10 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -161,7 +161,33 @@ do_install_append() {
>      # qemu built on host breaks do_package, remove it here (will be repl=
aces with right qemu when do_compile is fixed
>      # ERROR: objcopy failed with exit code 1 (cmd was 'arm-oe-linux-gnue=
abi-objcopy' --only-keep-debug '/OE/oe-core/tmp-eglibc/work/armv5te-oe-linu=
x-gnueabi/qtbase/5.0.1-r0.0/package/usr/bin/qmake' '/OE/oe-core/tmp-eglibc/=
work/armv5te-oe-linux-gnueabi/qtbase/5.0.1-r0.0/package/usr/bin/.debug/qmak=
e')
>      rm -f ${D}/${bindir}/${QT_DIR_NAME}/qmake
> +    # install fonts manually if they are missing
> +    if [ ! -d ${D}/${libdir}/fonts ]; then
> +        cp -a ${S}/lib/fonts ${D}/${libdir}
> +    fi
>  }
> =20
> -PACKAGES =3D. "${PN}-fonts "
> -FILES_${PN}-fonts =3D "${libdir}/${QT_DIR_NAME}/fonts ${libdir}/fonts"
> +PACKAGES =3D. "${PN}-fonts \
> +             ${PN}-fonts-ttf-vera \
> +             ${PN}-fonts-ttf-dejavu \
> +             ${PN}-fonts-pfa \
> +             ${PN}-fonts-pfb \
> +             ${PN}-fonts-qpf "
> +
> +RRECOMMENDS_${PN}-fonts =3D " \
> +             ${PN}-fonts-ttf-vera \
> +             ${PN}-fonts-ttf-dejavu \
> +             ${PN}-fonts-pfa \
> +             ${PN}-fonts-pfb \
> +             ${PN}-fonts-qpf "
> +
> +ALLOW_EMPTY_${PN}-fonts =3D "1"
> +PACKAGES_DYNAMIC +=3D "^${PN}-fonts-.*"

Is this line needed? You're creating all ${PN}-fonts manually, I don't
see any do_split_packages which would require PACKAGES_DYNAMIC.

> +
> +FILES_${PN}-fonts-ttf-vera       =3D "${libdir}/${QT_DIR_NAME}/fonts/Ver=
a*.ttf ${libdir}/fonts/Vera*.ttf"
> +FILES_${PN}-fonts-ttf-dejavu     =3D "${libdir}/${QT_DIR_NAME}/fonts/Dej=
aVu*.ttf ${libdir}/fonts/DejaVu*.ttf"
> +FILES_${PN}-fonts-pfa            =3D "${libdir}/${QT_DIR_NAME}/fonts/*.p=
fa ${libdir}/fonts/*.pfa"
> +FILES_${PN}-fonts-pfb            =3D "${libdir}/${QT_DIR_NAME}/fonts/*.p=
fb ${libdir}/fonts/*.pfb"
> +FILES_${PN}-fonts-qpf            =3D "${libdir}/${QT_DIR_NAME}/fonts/*.q=
pf* ${libdir}/fonts/*.qpf*"
> +FILES_${PN}-fonts                =3D "${libdir}/${QT_DIR_NAME}/fonts/REA=
DME ${libdir}/fonts/README \
> +                                    ${libdir}/${QT_DIR_NAME}/fonts/fontd=
ir ${libdir}/fonts/fontdir"
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGkaskACgkQN1Ujt2V2gBwavgCePxCElPCB9Kkx8QfxviLd/MRC
znUAni0/slLTRNbKrnmOEWQJ2dhud3il
=MxFL
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
