Return-Path: <joe@deserted.net>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE826F923
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 20:28:24 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so3504073qgd.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 13:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=4BkQ0Yw53Kgq3vbaHE80Lar5Kj7WrfIHNIlABk1S5xc=;
	b=hP23ry3cTiy6uHVcBxNLGS4zT6K7Jsmo/5up4NgBlkW5Fq4cp+QlaJ5oWrN9nVvIMN
	wWBb5b/HvIHTY9JfyDLayZqkpfGBzroTh3iIawGHWayNT2lvIQsmai5pMnq49++gvQc8
	B+e2W0mcs3r5pgAgX5ol1dJCk+xQCVCYs1uutgAcQw+8RZj6H4Qvkre1JZv0bRnyOdyO
	YsBPRhJnBKWM03d/pBcPp/tXSLjZdnh0I5f/HhImKKUbWVb4WglbWGeX1HgBLEDRIK56
	09GcIHEO8XREQ805ur+p+jvIe34r1D4JsB2HIYiBev3wL040h8MBSNwzfddrGuCLtqa0
	is/Q==
X-Gm-Message-State: ALoCoQm75TXTKgP9K/9pKEQU7HYNKeRsoO5UdrJn6p1qu68xGcCqLtAYayiEI1f3a/N1xWpETDNy
X-Received: by 10.140.24.52 with SMTP id 49mr4594412qgq.12.1395952105580;
	Thu, 27 Mar 2014 13:28:25 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id f48sm4050117qge.5.2014.03.27.13.28.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 13:28:24 -0700 (PDT)
Date: Thu, 27 Mar 2014 16:28:22 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140327202820.GD15666@deserted.net>
References: <1390222355-9757-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1390222355-9757-1-git-send-email-liezhi.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking] [PATCH] traceroute: filter-out patches dir
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
X-List-Received-Date: Thu, 27 Mar 2014 20:28:25 -0000
X-Groupsio-MsgNum: 48872
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline

--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking] [PATCH] traceroute: filter-out patches dir] On 14.0=
1.20 (Mon 20:52) Robert Yang wrote:

> The $(subdirs) contains all the dirs under the ${B}, and this one:
>=20
> do_unpack[cleandirs] =3D "${S}/patches"
>=20
> will create a "patches" dir, then there will be compile errors, filter
> out the patches will fix the problem.
>=20
> Note: poky doesn't have this problem since it separates the ${S} and
> ${B}
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../filter-out-the-patches-from-subdirs.patch      | 47 ++++++++++++++++=
++++++
>  .../traceroute/traceroute_2.0.18.bb                |  1 +
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta-networking/recipes-support/traceroute/traceroute=
/filter-out-the-patches-from-subdirs.patch
>=20
> diff --git a/meta-networking/recipes-support/traceroute/traceroute/filter=
-out-the-patches-from-subdirs.patch b/meta-networking/recipes-support/trace=
route/traceroute/filter-out-the-patches-from-subdirs.patch
> new file mode 100644
> index 0000000..2c030b5
> --- /dev/null
> +++ b/meta-networking/recipes-support/traceroute/traceroute/filter-out-th=
e-patches-from-subdirs.patch
> @@ -0,0 +1,47 @@
> +From e273e0ebc753645555909bcc4874c72458b17891 Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Fri, 17 Jan 2014 03:17:44 -0500
> +Subject: [PATCH] Make.rules: filter-out the patches from subdirs
> +
> +The $(subdirs) contains all the dirs under the ${B}, and this one:
> +
> +do_unpack[cleandirs] =3D "${S}/patches"
> +
> +will create a "patches" dir, then there will be compile errors, filter
> +out the patches will fix the problem.
> +
> +Note: poky doesn't have this problem since it separates the ${S} and
> +${B}
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + Make.rules |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Make.rules b/Make.rules
> +index b077cd5..0bfce2d 100644
> +--- a/Make.rules
> ++++ b/Make.rules
> +@@ -97,7 +97,7 @@ endif
> + subdirs :=3D $(filter-out $(SKIPDIRS), $(subdirs))
> + endif
> +=20
> +-install install-%: subdirs :=3D $(filter-out $(SKIPINSTALL), $(subdirs))
> ++install install-%: subdirs :=3D $(filter-out $(SKIPINSTALL) patches, $(=
subdirs))
> +=20
> +=20
> + override MAKE +=3D srcdir=3D$(srcdir) subdirs=3D"$(subdirs)" shared=3D$=
(shared)
> +@@ -106,7 +106,7 @@ override MAKE +=3D srcdir=3D$(srcdir) subdirs=3D"$(s=
ubdirs)" shared=3D$(shared)
> + INCLUDEDIRS :=3D $(filter $(INCLUDEDIRS), $(subdirs))
> + LIBDIRS :=3D $(filter $(LIBDIRS), $(subdirs))
> + MODDIRS :=3D $(filter $(MODDIRS), $(subdirs))
> +-EXEDIRS :=3D $(filter-out $(INCLUDEDIRS) $(LIBDIRS) $(MODDIRS), $(subdi=
rs))
> ++EXEDIRS :=3D $(filter-out $(INCLUDEDIRS) $(LIBDIRS) $(MODDIRS) patches,=
 $(subdirs))
> + MODUSERS :=3D $(filter $(MODUSERS), $(subdirs))
> + SBINUSERS :=3D $(filter $(SBINUSERS), $(subdirs))
> +=20
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18=
=2Ebb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> index e6718db..31c16aa 100644
> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> @@ -16,6 +16,7 @@ PR =3D "r1"
>  inherit update-alternatives
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/traceroute/traceroute/traceroute-2.0.=
18/traceroute-2.0.18.tar.gz \
> +           file://filter-out-the-patches-from-subdirs.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "b7254149b7f081cce07f4b9e065ba5ef"
--=20
-Joe MacDonald.
:wq

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlM0ieQACgkQwFvcllog0XwRrACgoDkom0Bc2T4d4RR4YxvNiHOb
lRkAoLQQRLFKhY0bbOUvTWk+nMP/9+0h
=80Tv
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
