Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2F34B607A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 08:53:32 +0000 (UTC)
Received: by wgmn9 with SMTP id n9so27779214wgm.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UtximDO0Iikxmes83zJFV6EhHlgB4SSR/UReGAG9GoM=;
	b=hg0dJsDNkJwc+Xm3P7sb2DjbohxPuTZAkoiQY91EUMBHih1CmyqpLEczTjnK1GGu8R
	kuCXxJ6W3JgK2IVuoxxDIzY9ZVMSLszHyMZmBCx23BNAhZel/7Gu5F/Yhr0sbyb/ppX/
	wA5eAX728SecWuB2zLBfiJ5+ME4cdbcs0rY1QCNhbIOyEMiinb/rqpfBBuE/kgoo4AbT
	7Id8ok62sm6m52e2S33QTexVUzMn+JDghzPnqSXZf/BFTwMrD9Pgq3Y/LQapeEFLpqiX
	NnsWQKixWR63t5Xn9KIae4Qr6n8zKgBzgp5JSdrncIzHkl8VkBIE+nD7ulgnTSAzabtJ
	OfMQ==
X-Received: by 10.194.20.161 with SMTP id o1mr6447929wje.32.1436950412045;
	Wed, 15 Jul 2015 01:53:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	dl10sm6755814wjb.42.2015.07.15.01.53.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jul 2015 01:53:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Jul 2015 10:53:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150715085349.GA2163@jama>
References: <1435134394-15393-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1435134394-15393-1-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-ruby][PATCH] imsettings: fix build error.
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
X-List-Received-Date: Wed, 15 Jul 2015 08:53:33 -0000
X-Groupsio-MsgNum: 56247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2015 at 04:26:34PM +0800, Bian Naimeng wrote:
> multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf, otherwise
> a configure error as follow will be caught.
>=20
>   aclocal: error: non-option arguments are not accepted: '\'.

There is one more issue:
imsettings-1.6.8: imsettings rdepends on xfconf, but it isn't a build
dependency? [build-deps]

can you please fix it in separate commit? I'm going to merge this one
now thanks.
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  ...OCAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 21 +++++++++++++++=
++++++
>  .../recipes-extended/imsettings/imsettings_1.6.8.bb |  3 ++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ruby/recipes-extended/imsettings/imsettings/mult=
i-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
>=20
> diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-=
ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-ruby/recipes-ext=
ended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-a=
utoreconf.patch
> new file mode 100644
> index 0000000..9e31847
> --- /dev/null
> +++ b/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL=
_AMFLAGS-isnot-supported-by-autoreconf.patch
> @@ -0,0 +1,21 @@
> +multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf.
> +It will cause configure error as follow.
> +
> +  aclocal: error: non-option arguments are not accepted: '\'.
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +diff -Nurp imsettings-1.6.8.orig/Makefile.am imsettings-1.6.8/Makefile.am
> +--- imsettings-1.6.8.orig/Makefile.am	2013-02-08 11:33:59.000000000 +0900
> ++++ imsettings-1.6.8/Makefile.am	2015-06-24 14:15:32.070000007 +0900
> +@@ -1,9 +1,7 @@
> + NULL =3D
> + SUBDIRS =3D data imsettings imsettings-daemon backends utils po tests d=
ocs
> +=20
> +-ACLOCAL_AMFLAGS =3D			\
> +-	-I m4macros			\
> +-	$(NULL)
> ++ACLOCAL_AMFLAGS =3D -I m4macros $(NULL)
> +=20
> + CONFIGURE_DEPENDENCIES =3D		\
> + 	requires			\
> diff --git a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb b/=
meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
> index 91443d7..64a229b 100644
> --- a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
> +++ b/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
> @@ -10,7 +10,8 @@ SECTION =3D "Applications/System"
>  inherit autotools gtk-doc
> =20
>  SRC_URI =3D "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${P=
V}.tar.bz2 \
> -           file://gtk-is-required-by-notify.patch"
> +           file://gtk-is-required-by-notify.patch \
> +           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreco=
nf.patch"
> =20
>  SRC_URI[md5sum] =3D "c31429f1d60e36d7f811f871c75b6c41"
>  SRC_URI[sha256sum] =3D "2620ffbf9a6dc842dbf994b4773d4fe355eb77076ccf33f7=
26ba63f16c0d08ba"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWmH5gACgkQN1Ujt2V2gBweQwCgnu/yhKQ6vCwmm7SwEaCvVuv7
QmMAoLiX7VLSoGVs+y6J1q/DjeRG0ki+
=0oK0
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
