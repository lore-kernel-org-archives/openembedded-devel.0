Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id A298860125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 10:03:19 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so17606844wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8ZCQeImaaYbt7GFKRuzgxS0UQ0qf7s5dN3RkD/UGd5Q=;
	b=yjM9DpK+3jwfLMT6daVFFS2VCMipySWNf6UEJ+eaV/IOE5KIR6dYeucdIdIPpfgogQ
	9YUIiCKJpIfZj9wOMVb8Be9tgj34iW8gnLjSbrCJPqBHB9r9mnH0qXMlguHnR/E5YhwL
	pZrT1F8iqkJMmbK5MSliLcI7js1N8l3GjCDOytFh7OckhYYdoWNHXODaHeSYETR3vj2m
	1b4Vh4AcGvbt7hxiLDFCcdH3P/JJE1BoWAFFkAcdNIQDr1F2SzHJAQ8CfwsqpmRajwKy
	O1yuuSpm1uhHdkwhpJ3xhWsLhTvp8MkWa4ot7st8V6CKzDtW3GR9gfT5VePMeXaWw5Pi
	Ac8w==
X-Received: by 10.180.109.163 with SMTP id ht3mr3116898wib.25.1444298599490;
	Thu, 08 Oct 2015 03:03:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jv5sm44222455wjb.16.2015.10.08.03.03.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 03:03:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 12:03:30 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008100330.GB2385@jama>
References: <1443907359-22569-1-git-send-email-manuel.bachmann@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1443907359-22569-1-git-send-email-manuel.bachmann@iot.bzh>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH v3][meta-multimedia] mkvtoolnix: fix Boost 1.58 build, update to 7.9.0
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
X-List-Received-Date: Thu, 08 Oct 2015 10:03:22 -0000
X-Groupsio-MsgNum: 57728
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline

--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2015 at 11:22:39PM +0200, Manuel Bachmann wrote:
> mkvtoolnix does not compile with newest Boost 1.58, mostly
> due to the following bugs :
> https://github.com/mbunkus/mkvtoolnix/issues/1172
> https://github.com/mbunkus/mkvtoolnix/issues/1176
>=20
> Update to the version immediately subsequent to their
> fixes, and adapt configure steps accordingly.
>=20
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> ---
>  meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 15 ++++++++++=
+----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb b/m=
eta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> index dd613b3..da10153 100644
> --- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> +++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> @@ -6,9 +6,16 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5f=
ce4486a80fdaf4a4263"
> =20
>  DEPENDS =3D "curl boost expat zlib libebml libmatroska libogg libvorbis =
bzip2 lzo file ruby-native"
> =20
> -PV =3D "7.1.0+git${SRCPV}"
> -SRCREV =3D "0c89ff941bfdd9f3378312f293a84f13cf3e2a96"
> -SRC_URI =3D "git://github.com/mbunkus/mkvtoolnix.git"
> +PV =3D "7.9.0+git${SRCPV}"
> +SRCREV_mkvtoolnix =3D "1a8b23b1e82ed180a5aaeb43537f2426be252985"
> +SRCREV_libebml =3D "04b34b0dbded40e0cec93cafa6a4f4c8e90c3206"
> +SRCREV_libmatroska =3D "db5d627b5bf48516c9e0b540254c0d36595760c3"
> +SRCREV_FORMAT =3D "mkvtoolnix"
> +SRC_URI =3D " \
> +           git://github.com/mbunkus/mkvtoolnix.git;name=3Dmkvtoolnix \
> +           git://github.com/Matroska-Org/libebml.git;name=3Dlibebml;dest=
suffix=3Dgit/lib/libebml \
> +           git://github.com/Matroska-Org/libmatroska.git;name=3Dlibmatro=
ska;destsuffix=3Dgit/lib/libmatroska \
> +          "
> =20
>  S =3D "${WORKDIR}/git"
> =20
> @@ -28,7 +35,7 @@ EXTRA_OECONF =3D " --with-boost-libdir=3D${STAGING_LIBD=
IR} \
> =20
>  # remove some hardcoded searchpaths
>  do_configure_prepend() {
> -    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/inclu=
de:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
> +    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/inclu=
de:${STAGING_INCDIR}:g ${S}/ac/qt5.m4

It still fails in do_configure
configure:8231: checking for the Qt version /home/jenkins/oe/world/shr-core=
/tmp-glibc/sysroots/x86_64-linux/usr/bin/moc uses
configure:8239: result: too old: 4.8.7

Can we use some PACKAGECONFIGs to disable qt{4,5}?

>  }
> =20
>  # Yeah, no makefile
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWP3EACgkQN1Ujt2V2gByXPACguExDMCJ3e3Yd/3dthzgC22Kx
K6cAn270HSyQ8PHyVm9XiuYV0VYh0re9
=hIlk
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
