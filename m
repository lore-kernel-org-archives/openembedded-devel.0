Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4CDBC60EAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 23:59:09 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so1487978eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 16:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+uDn73rlURZ6pKH5IHGb2xM9GD5N9NlR5cK7JUKkbmM=;
	b=L8xdjF8Wu+1vmMNuRPUKguodSq5tJAx3lkuhSdMPyhAX54hrZnHHSdB54gyZO8OcOV
	2sGuzmDGkVOk9QYDjTBTGpJAiOPO6rGVyS49Rvz/3dzIs/HMjzYlRDuvoqDbqFODBm+N
	xp+zNYJopoSU+YwopmpP04rPMQhj+7eLlGNcDQxX9G/wKjAVVUiFcZxt5LFmpFx0pnFs
	mPyOiVZSO3XBlg5BEyMupjdvceJmYXRnng561wHjfKsO0G++1aKvXNcpTgzI0Iga42MP
	dLDpQUQwU8WgLHofAkPTphA7cfpazqs0XwvRrIgY1AB6RKX2P7W00ZphLk8le/eNKIjE
	vy2A==
X-Received: by 10.14.115.6 with SMTP id d6mr148384eeh.145.1382054350148;
	Thu, 17 Oct 2013 16:59:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm199271948eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 16:59:09 -0700 (PDT)
Date: Fri, 18 Oct 2013 01:59:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131017235914.GE3930@jama>
References: <1382051520-1562-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1382051520-1562-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [meta-oe][PATCHv2 1/3] libraw1394: add recipe
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
X-List-Received-Date: Thu, 17 Oct 2013 23:59:10 -0000
X-Groupsio-MsgNum: 46779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8vCeF2GUdMpe9ZbK"
Content-Disposition: inline

--8vCeF2GUdMpe9ZbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2013 at 04:11:58PM -0700, Khem Raj wrote:
> From: Cliff Brake <cbrake@bec-systems.com>
>=20
> Initial recipe created by Khem Raj

libraw1394 was already merged today:
http://git.openembedded.org/meta-openembedded/commit/?h=3Ddora&id=3Dcd87552=
53e6972356e2172670c1861ea664b0f0a
http://git.openembedded.org/meta-openembedded/commit/?id=3D309eb8a5ff0e7ecb=
eaf191a9dc906b618d40dd94

It wasn't removed when you rebased, because it was moved to
recipes-support as discussed on #oe.

I haven't merged coriander yet, because it wasn't build on jenkins at
all, because one of dependencies failed because of newer automake.

> Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb | 11 +++++++++=
++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.=
0.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb b/=
meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb
> new file mode 100644
> index 0000000..617ba1b
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "base library for low-level IEEE 1394 accesses"
> +HOMEPAGE =3D "https://ieee1394.wiki.kernel.org/index.php/Libraries#libra=
w1394"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPL-2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Dd8045f3b8f929c1cb29a1e3fd=
737b499"
> +
> +SRC_URI =3D "https://www.kernel.org/pub/linux/libs/ieee1394/${BPN}-${PV}=
=2Etar.gz"
> +SRC_URI[md5sum] =3D "d06cccb776b240b6ab5efdee33b87af2"
> +SRC_URI[sha256sum] =3D "a83cff16fb8885831bc29d7d17f3c570dc39251d89e20795=
c08e87720de0ba70"
> +
> +inherit autotools
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8vCeF2GUdMpe9ZbK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJgedIACgkQN1Ujt2V2gBz+XACeO3VFdwSpN1DPqTkJYssKW1uF
0VEAoIZWfE8cDKsWtvhP9Qut10tG2lfW
=RwvU
-----END PGP SIGNATURE-----

--8vCeF2GUdMpe9ZbK--
