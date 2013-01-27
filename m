Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzXuX-0001Ws-J1
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 20:29:02 +0100
Received: by mail-pb0-f46.google.com with SMTP id mc17so413665pbc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 11:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Z7l9BGA/pV3+aZ03ETyIwWWDBzVYclwFsXW9aH38ar8=;
	b=d6Mn0c1iIdgyP1qSjDZxzLme/dF07YVCkKlkrvC0fY4A+h0pVD6aOhju5pkLlLd5w0
	GQEU6WAmci2hNTq7A6k4q2JRaalvYljlS4C81H0AyUSTCBJmm1+3X3K86u3sXd1zMiiA
	jW5w+iXId0B/tbiiBrvnqQaFBelcLX2fPbfmL3TZyOYSXJTMKbgZW8oJzxfgwstmsotz
	+lllArTctg2Go/rNIxdNX/gdZ3FFdFUhQ6nTF4Qr2u3fBHlyKCLPBW2iUo3+gfXcfrVu
	Hy/23aQrTc0Y2s5CEe4VkH9zDyjNYkB4dvlUBPuNh3hGaXuGcpSZ0QgC0t6knDqOCmbJ
	J6TA==
X-Received: by 10.68.211.42 with SMTP id mz10mr31902790pbc.100.1359314003323; 
	Sun, 27 Jan 2013 11:13:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a4sm5162476pax.25.2013.01.27.11.13.20
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 11:13:22 -0800 (PST)
Date: Sun, 27 Jan 2013 20:13:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130127191320.GL16904@jama.palm1.palmone.com>
References: <1359182715-3063-1-git-send-email-raj.khem@gmail.com>
	<1359182715-3063-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1359182715-3063-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 2/2] ebtables, arptables: add perl as runtime dependency
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
X-List-Received-Date: Sun, 27 Jan 2013 19:29:03 -0000
X-Groupsio-MsgNum: 42864
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yQDbd2FCF2Yhw41T"
Content-Disposition: inline

--yQDbd2FCF2Yhw41T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 10:45:15PM -0800, Khem Raj wrote:
> Fixes errors like

RDEPENDS_${PN}, fixed in jansa/in-test, I'll merge with that fix if Joe
sends his ack.

Cheers,

>=20
> | Computing transaction...error: Can't install
> arptables-0.0.3+4-r0.0@ppce500v2: no package provides /usr/bin/perl
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |    2 ++
>  .../recipes-support/arptables/arptables_0.0.3-4.bb |    2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb=
 b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> index 2596d2f..4e9b0bc 100644
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871=
a28ab1488fdbd2e73e"
>  SECTION =3D "console/network"
>  PR =3D "r1"
> =20
> +RDEPENDS +=3D "perl"
> +
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
>             file://installnonroot.patch \
>             file://01debian_defaultconfig.patch \
> diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.=
bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> index 71e2600..8da9bb7 100644
> --- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> +++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> @@ -3,6 +3,8 @@ PRIORITY =3D "optional"
>  LICENSE =3D "GPL-2.0"
>  SECTION =3D "console/network"
> =20
> +RDEPENDS +=3D "perl"
> +
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
>  SRC_URI =3D " \
>  	${SOURCEFORGE_MIRROR}/ebtables/arptables-v${PV}.tar.gz;name=3Darptables=
 \
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yQDbd2FCF2Yhw41T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEFfFAACgkQN1Ujt2V2gBxsAwCbBmFVMs+msK/IKP9bJORiRaH1
/NgAn26PBsDsT7gY0uK+2BkPN4RkYyEC
=zYH3
-----END PGP SIGNATURE-----

--yQDbd2FCF2Yhw41T--
