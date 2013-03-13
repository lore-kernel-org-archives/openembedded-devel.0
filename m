Received: from mail-ye0-f174.google.com ([209.85.213.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFouy-0007nr-NU
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:52:57 +0100
Received: by mail-ye0-f174.google.com with SMTP id r11so207529yen.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=5J49j/P2GnF86Ve1OZALSXnjhuXA6UmR53LA/IgyIz4=;
	b=jcn7zEXIAzWT1F2lBX3UrrayHN3moiO98eU3GqMYAMosjkFxZt2t8JcQo3QJWi55d1
	Dijx4Tr0gcpzAoYQkjeFY04AiEwcvXiOz3STwBAOh4f/zhwY+w5pvH9R9VbJ78IPdTL5
	Z2VYOTuKvRfWyrNOPumdY9NtZMRPHI6+G9dQ36Sq6NPVElCmiT1DN+7YjqdhaLswnVkh
	DQxcEksnrNAOZq8S9HFe55LzSFwMRFWGhPpgnKopNZfHhvsTZNTGDELzetWuN7lL1Bxq
	QcLvVn6WBpiQFZ8Hq9Ck9PrTMBZyzVUTKwiduRWN77k7E6gTyTnSCJdYvE5NqjZGNEY/
	NAig==
X-Received: by 10.236.114.37 with SMTP id b25mr15919877yhh.85.1363192561637;
	Wed, 13 Mar 2013 09:36:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x8sm36296710yhn.12.2013.03.13.09.35.59
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:36:00 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:35:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163553.GR3260@jama>
References: <1362681343-430-1-git-send-email-mario@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1362681343-430-1-git-send-email-mario@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] libdvdread: update to version 4.2.0
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
X-List-Received-Date: Wed, 13 Mar 2013 16:53:03 -0000
X-Groupsio-MsgNum: 43530
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WKQ7zUpzoH2KEHMN"
Content-Disposition: inline

--WKQ7zUpzoH2KEHMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 03:35:43PM -0300, Mario Domenech Goulart wrote:
> The previous version (4.1.3-10) was unbuildable due to this issue:

Applied, thanks!

>=20
> WARNING: Failed to fetch URL git://git.debian-maintainers.org/git/daniel/=
libdvdread.git;protocol=3Dgit;branch=3Ddebian,
>    attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
> Cloning into bare repository <snip>/downloads//git2/git.debian-maintainer=
s.org.git.daniel.libdvdread.git...
>=20
> fatal: Unable to look up git.debian-maintainers.org (port 9418) (Name or =
service not known)
>=20
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
>  .../libdvdread/libdvdread_4.1.3-10.bb              |   16 --------------=
--
>  .../libdvdread/libdvdread_4.2.0.bb                 |   17 ++++++++++++++=
+++
>  2 files changed, 17 insertions(+), 16 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.=
3-10.bb
>  create mode 100644 meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.=
0.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb=
 b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
> deleted file mode 100644
> index f17043b..0000000
> --- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION =3D "DVD access multimeda library"
> -SECTION =3D "libs/multimedia"
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -SRC_URI =3D "git://git.debian-maintainers.org/git/daniel/${PN}.git;proto=
col=3Dgit;branch=3Ddebian"
> -
> -SRCREV =3D "e465b500c12be5b4c0b6918a9b98038611f66c57"
> -S =3D "${WORKDIR}/git"
> -
> -inherit autotools lib_package binconfig pkgconfig
> -
> -do_unpackpost() {
> -        QUILT_PATCHES=3Ddebian/patches quilt push -a
> -}
> -
> -addtask unpackpost after do_unpack before do_patch
> diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb b/=
meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
> new file mode 100644
> index 0000000..d5695ca
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "DVD access multimeda library"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D64e753fa7d1ca31632bc383da3b57=
c27"
> +SRC_URI =3D "http://dvdnav.mplayerhq.hu/releases/libdvdread-${PV}.tar.bz=
2"
> +
> +SRC_URI[md5sum] =3D "ab7a19d3ab1a437ae754ef477d6231a4"
> +SRC_URI[sha256sum] =3D "0bea15da842a4b04a482b009d72dcc6d9c9524ccc1bf67e5=
748319ec5ada8097"
> +
> +inherit autotools lib_package binconfig pkgconfig
> +
> +CONFIGUREOPTS :=3D "${@d.getVar('CONFIGUREOPTS', True).replace('--disabl=
e-silent-rules', ' ')}"
> +
> +do_configure_prepend() {
> +    # For some weird reason, libdvdread only provides a `configure2' scr=
ipt...
> +    cp ${S}/configure2 ${S}/configure
> +}
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WKQ7zUpzoH2KEHMN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAqukACgkQN1Ujt2V2gBxe5ACfc4lwDMtUb62U+1m7iFM6kRcw
8KMAn3dPIcohfcmdAKjMsqg4CDz6pxOP
=vRpp
-----END PGP SIGNATURE-----

--WKQ7zUpzoH2KEHMN--
