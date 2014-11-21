Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D9D1E6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 14:04:36 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id y10so6648032wgg.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 06:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=36hQjX1r/dj01mOUEinnSrOcF5APbG9zQ1VrH5KXbNs=;
	b=Let50aI/emdFj5MHc+3Nv4MGjwO5GVcEFBKG8yz1czkBKG00GMGoOnpIp4WyxeFW4z
	YOrmT/pmVO178Z8Uopu2giw7RQo7ki70yK/kI8LRnMPD+JZmOprNd+G+LfWjADfN1iAI
	Bh0Ufzd+k6rPtKa55pSrY8JrmT9zbBAxfuj2Xmt57bjlo5uaLrrXyW9oLS4ViT2ARlxl
	LOL+KdBSmXnxflRNSmJMJCgSZ5pUqPdcV6X7dPn/kJuCFSrskQgSKCfl30NiROPmOsu1
	aN7xrsCMl8gsbvpOqH+ngGz+VBYLGCaMj7Y5wpYRiQ16p/OZvOztKga1c+kunZeqMLQn
	dqDg==
X-Received: by 10.194.239.164 with SMTP id vt4mr7825355wjc.131.1416578674295; 
	Fri, 21 Nov 2014 06:04:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jp3sm6676453wid.9.2014.11.21.06.04.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 06:04:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 15:04:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141121140434.GG2163@jama>
References: <1416420840-2194-1-git-send-email-cmorgan@cybexintl.com>
MIME-Version: 1.0
In-Reply-To: <1416420840-2194-1-git-send-email-cmorgan@cybexintl.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Chris Morgan <cmorgan@cybexintl.com>
Subject: Re: [meta-oe]]PATCH] dfu-util: Switch from using a gitorious generated download to using the git repository to avoid potential checksum mismatches if the generated download changes
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
X-List-Received-Date: Fri, 21 Nov 2014 14:04:37 -0000
X-Groupsio-MsgNum: 52969
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TdkiTnkLhLQllcMS"
Content-Disposition: inline

--TdkiTnkLhLQllcMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2014 at 01:14:00PM -0500, Chris Morgan wrote:
> ---
>  meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks for PATCHv2, the old version was failing as forseen:

ERROR: Fetcher failure for URL: 'https://gitorious.org/dfu-util/dfu-util/ar=
chive/a0a3668e0571a9b007f7d62b01e7dcfd7754ce50.tar.gz'. Checksum mismatch!
File: '/home/jenkins/oe/world/shr-core/downloads/a0a3668e0571a9b007f7d62b01=
e7dcfd7754ce50.tar.gz' has md5 checksum ccb84df0c2c4c27dc9b975af81a50bdb wh=
en 1de724551604bce1962960b7a301cc08 was expected
File: '/home/jenkins/oe/world/shr-core/downloads/a0a3668e0571a9b007f7d62b01=
e7dcfd7754ce50.tar.gz' has sha256 checksum 5d051e1570c3adf1d6c473936a4881fa=
e12cc5a6fd9b5cf013afc1d67a604dbd when 5d253f924fd29bc13054b664bba9aa86b8652=
99971195969478253c1775b7e56 was expected
If this change is expected (e.g. you have upgraded to a new version without=
 updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] =3D "ccb84df0c2c4c27dc9b975af81a50bdb"
SRC_URI[sha256sum] =3D "5d051e1570c3adf1d6c473936a4881fae12cc5a6fd9b5cf013a=
fc1d67a604dbd"
Otherwise you should retry the download and/or check with upstream to deter=
mine if the file has become corrupted or otherwise unexpectedly modified.

I'll squash both changes to one so that the master stays bisect-able

>=20
> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/r=
ecipes-support/dfu-util/dfu-util_0.7.bb
> index c706fd1..7f06f8f 100644
> --- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> +++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> @@ -4,12 +4,12 @@ AUTHOR =3D "Harald Welte <laforge@openmoko.org>"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
> -S =3D "${WORKDIR}/${BPN}-${BPN}"
> +S =3D "${WORKDIR}/git"
> =20
> -REV=3D"a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
> -SRC_URI =3D "https://gitorious.org/${BPN}/${BPN}/archive/${REV}.tar.gz \
> +SRC_URI =3D "git://gitorious.org/dfu-util/dfu-util.git \
>      file://0001-configure.ac-Don-t-check-for-usbpath.patch \
>  "
> +SRCREV=3D"a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
> =20
>  inherit autotools pkgconfig
> =20
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TdkiTnkLhLQllcMS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRvRnIACgkQN1Ujt2V2gBzOawCgsZFeUX+gBHwRvtcwNiHaJCUM
FH0AniJuaAU7OwlttakQYgdyhWxrQosy
=O+Ex
-----END PGP SIGNATURE-----

--TdkiTnkLhLQllcMS--
