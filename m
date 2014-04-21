Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id A1DA665D73
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 11:32:01 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so3542094eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oTd20AfpSrP7AjmH9ErUQWF02Kmp/zKiV72cM8K6g18=;
	b=GUGN1XmXXU3lgKP++nbj7PTUXs2np7TG8PcPHY5Rn1ZXbi52CtKLFyRvlnpnknBNQW
	FxZRpmynjFPGl3CGxOFJ7e2naDfA6gAhamn4T2MoeikUG2ivB631GrQH84PZSgEFtEiA
	hoHI7TqJ0drgSnCfI/kNXHoh7kNlA2uXD/ADjDRtrxH89wLpKw2lPqvHrzG5sinJdX9t
	VAuhOTXRckXk+DMVpAcSLLKA3ozYzMvt/IyKHGJvQY4TxpsRfUegTTqWUx5zHgOWFuGt
	atuyksnlWEH9v8ztRLQkeEwlO3ohranBuPatgbD1oQbnDB7vpm12N5/HSUFYoKLeXi8+
	c4Pg==
X-Received: by 10.15.35.66 with SMTP id f42mr339102eev.93.1398079922464;
	Mon, 21 Apr 2014 04:32:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x46sm102231736een.17.2014.04.21.04.32.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 04:32:01 -0700 (PDT)
Date: Mon, 21 Apr 2014 13:32:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140421113207.GW2486@jama>
References: <cover.1397816030.git.Chong.Lu@windriver.com>
	<deccbaa80823665caeaa2763f587303595cc6115.1397816030.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <deccbaa80823665caeaa2763f587303595cc6115.1397816030.git.Chong.Lu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/3] vim: add dependency and selinux and acl support control
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
X-List-Received-Date: Mon, 21 Apr 2014 11:32:04 -0000
X-Groupsio-MsgNum: 49389
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xhBcNpeZh7WRSjC8"
Content-Disposition: inline

--xhBcNpeZh7WRSjC8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2014 at 06:16:30PM +0800, Chong Lu wrote:
> 1. Add explicit selinux and acl support control.
> 2. Vim depends on gettext-native, add to the dependency list.
> 3. Split binary file into vim package and put others in vim-common.

All 3 merged, thanks!

>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta-oe/recipes-support/vim/vim_7.4.258.bb | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/vim/vim_7.4.258.bb b/meta-oe/recipes=
-support/vim/vim_7.4.258.bb
> index 878c79e..023e8fc 100644
> --- a/meta-oe/recipes-support/vim/vim_7.4.258.bb
> +++ b/meta-oe/recipes-support/vim/vim_7.4.258.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Vi IMproved - enhanced vi editor"
>  SECTION =3D "console/utils"
> -DEPENDS =3D "ncurses"
> +DEPENDS =3D "ncurses gettext-native"
>  # vimdiff doesn't like busybox diff
>  RSUGGESTS_${PN} =3D "diffutils"
>  LICENSE =3D "vim"
> @@ -28,11 +28,14 @@ do_configure () {
> =20
>  #Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
>  PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', ''=
, d)}"
> +PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'selinux', 'seli=
nux', '', d)}"
> =20
>  PACKAGECONFIG[gtkgui] =3D "--enable-gtk2-test --enable-gui=3Dgtk2,--enab=
le-gui=3Dno,gtk+,"
>  PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
>  PACKAGECONFIG[x11] =3D "--with-x,--without-x,xt,"
>  PACKAGECONFIG[tiny] =3D "--with-features=3Dtiny,--with-features=3Dbig,,"
> +PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x,"
> =20
>  EXTRA_OECONF =3D " \
>      --disable-gpm \
> @@ -68,6 +71,21 @@ FILES_${PN}-help =3D "${datadir}/${PN}/${VIMDIR}/doc"
>  FILES_${PN}-tutor =3D "${datadir}/${PN}/${VIMDIR}/tutor ${bindir}/${PN}t=
utor"
>  FILES_${PN}-vimrc =3D "${datadir}/${PN}/vimrc"
>  FILES_${PN}-data =3D "${datadir}/${PN}"
> +FILES_${PN}-common =3D " \
> +    ${datadir}/${PN}/${VIMDIR}/*.vim \
> +    ${datadir}/${PN}/${VIMDIR}/autoload \
> +    ${datadir}/${PN}/${VIMDIR}/colors \
> +    ${datadir}/${PN}/${VIMDIR}/compiler \
> +    ${datadir}/${PN}/${VIMDIR}/ftplugin \
> +    ${datadir}/${PN}/${VIMDIR}/indent \
> +    ${datadir}/${PN}/${VIMDIR}/keymap \
> +    ${datadir}/${PN}/${VIMDIR}/lang \
> +    ${datadir}/${PN}/${VIMDIR}/macros \
> +    ${datadir}/${PN}/${VIMDIR}/plugin \
> +    ${datadir}/${PN}/${VIMDIR}/print \
> +    ${datadir}/${PN}/${VIMDIR}/spell \
> +    ${datadir}/${PN}/${VIMDIR}/tools \
> +"
> =20
>  # Recommend that runtime data is installed along with vim
>  RRECOMMENDS_${PN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc $=
{PN}-data"
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xhBcNpeZh7WRSjC8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNVAbcACgkQN1Ujt2V2gBxKlACfVyauHzCQVUTZIFUgdYveOVz9
F9cAoKgKX3PI36QGusjcF4lfaGADCFPg
=2DoC
-----END PGP SIGNATURE-----

--xhBcNpeZh7WRSjC8--
