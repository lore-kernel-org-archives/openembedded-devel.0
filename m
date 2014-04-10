Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id BF1B565D8F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:36:11 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2772844eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+xhl6IhGE5qdWI0QTUWBxOi+ZsZJfy203HBwyLlXCLk=;
	b=ClCc/Cez+6CCmb1PW+stYKT6BSEGo1pF4jHE3FDYImjxFYj6DTLSTteVzMES1nngkB
	YUGjfdDU2Sq8dCoNbc4X3v1prtCTvu/z41RVYy5wfkxmiia8CeiR87Xz0r5dcZEnBmgG
	DhclNKgmwkXc98bYNZzyUNc3EBDTzWCqlNOyKf+ioZOcB4JbTYFcK7+nZzMY4bGZxFrJ
	+t+j/B3vH9joSvxbEMl5reV1Guh/VamxxY+cEm/sCjtC+7muhKGXxPj4LXGNX4KnxAf2
	2No+7lGaqZFSW4xWYjNQ6raA8/KaQu3hhe924K5gVLyVpPa3IPjv92iRG6ykHu6RBSGE
	L+ZQ==
X-Received: by 10.15.93.201 with SMTP id w49mr1577426eez.69.1397118972759;
	Thu, 10 Apr 2014 01:36:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm8234040eew.25.2014.04.10.01.36.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 01:36:11 -0700 (PDT)
Date: Thu, 10 Apr 2014 10:36:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: krzysztof.m.sywula@intel.com
Message-ID: <20140410083619.GO2132@jama>
References: <1396964829-6563-1-git-send-email-krzysztof.m.sywula@intel.com>
MIME-Version: 1.0
In-Reply-To: <1396964829-6563-1-git-send-email-krzysztof.m.sywula@intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] dejagnu: recipe taken from openembedded
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
X-List-Received-Date: Thu, 10 Apr 2014 08:36:13 -0000
X-Groupsio-MsgNum: 49155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FRaepaAnLTQkJ4tS"
Content-Disposition: inline

--FRaepaAnLTQkJ4tS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2014 at 02:47:09PM +0100, krzysztof.m.sywula@intel.com wrot=
e:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>=20
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> ---
>  meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb |  6 ++++++
>  meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb        | 14 ++++++++++=
++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4=
=2Ebb
>  create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
>=20
> diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb b/m=
eta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
> new file mode 100644
> index 0000000..07c4cff
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
> @@ -0,0 +1,6 @@
> +PR =3D "r1"

Drop.

> +require dejagnu_${PV}.bb
> +S =3D "${WORKDIR}/dejagnu-${PV}"
> +inherit native
> +
> diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb b/meta-oe/=
recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> new file mode 100644
> index 0000000..723003c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "GNU unit testing framework, written in Expect and Tcl"
> +LICENSE =3D "GPLv2"
> +SECTION =3D "devel"
> +PR =3D "r1"

Drop

> +
> +SRC_URI =3D "ftp://ftp.gnu.org/gnu/dejagnu/dejagnu-${PV}.tar.gz"

Use GNU_MIRROR

> +inherit autotools
> +
> +
> +SRC_URI[md5sum] =3D "053f18fd5d00873de365413cab17a666"
> +SRC_URI[sha256sum] =3D "d0fbedef20fb0843318d60551023631176b27ceb1e11de74=
68a971770d0e048d"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b"

Move next to LICENSE

> --=20
> 1.8.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FRaepaAnLTQkJ4tS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNGWAMACgkQN1Ujt2V2gBy3HQCcD9y0G43iZ+r+hLFvtL+BHCii
RtsAnimJRwO0QC/diWZyAR7aDjFY1YHY
=enbO
-----END PGP SIGNATURE-----

--FRaepaAnLTQkJ4tS--
