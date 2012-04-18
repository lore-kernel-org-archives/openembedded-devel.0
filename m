Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SKbCb-00075T-1j
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 22:10:09 +0200
Received: by wera1 with SMTP id a1so5023430wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KJGuWiKl/S7RVJVo0/nB2CSkwoRgq3CZx45S44oPxiE=;
	b=exCxTP3x0Hx3+7eaH6m2DThWEtOUKEJlFcTl+Chd2GgBq6UrPt629X1WcQtBwoP8fM
	zg5NhpnhaWNC23ibyMWN4+Lwb6TJaosEWsP3aoToJzgyQsY9GBRr3oW6BtD+TOg5aQif
	yxFE1QRa9jUbb/g5V/ONw8ZvvtRrzFYRMCpIp34EGRa8pue/zn9ATgM0elhFe7pxyv0V
	zOtAWbqF3eeS3/Pa6SswpzjH33BoW+g8nSoqpy4QYYMNieOPsb6Q0syV3tCyHwtX0Z0S
	DaunRSKDDovKPWwgEcIOtOTePJk0rBm7vHJNK64zQ5oMjKwPzUflXtfxgzIPHqy+SwUo
	H14A==
Received: by 10.180.104.65 with SMTP id gc1mr9204621wib.13.1334779241499;
	Wed, 18 Apr 2012 13:00:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm36812162wib.4.2012.04.18.13.00.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 13:00:40 -0700 (PDT)
Date: Wed, 18 Apr 2012 22:00:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120418200041.GP3635@jama.jama.net>
References: <20120418085611.C6AA710216@opal>
	<20120418092930.GF3635@jama.jama.net>
	<jmms5t$k4d$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jmms5t$k4d$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Koen Kooi : gateone: silence systemd bbclass WARNING, ${PN}-systemd is unwanted
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
X-List-Received-Date: Wed, 18 Apr 2012 20:10:09 -0000
X-Groupsio-MsgNum: 38323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zfao1/4IORAeFOVj"
Content-Disposition: inline

--Zfao1/4IORAeFOVj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 07:04:04PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 18-04-12 11:29, Martin Jansa schreef:
> > On Wed, Apr 18, 2012 at 08:56:10AM +0000, git@git.openembedded.org
> > wrote:
> >> Module: meta-openembedded.git Branch: master Commit:
> >> ca5e7197524efef0961bdbbe111f6dd16f1d46b4 URL:
> >> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=3D=
ca5e7197524efef0961bdbbe111f6dd16f1d46b4
> >>
> >>
> >>=20
> Author: Koen Kooi <koen@dominion.thruhere.net>
> >> Date:   Wed Apr 18 10:45:41 2012 +0200
> >>=20
> >> gateone: silence systemd bbclass WARNING, ${PN}-systemd is unwanted
> >>=20
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >>=20
> >> ---
> >>=20
> >> .../recipes-connectivity/gateone/gateone_git.bb    |    1 + 1 files
> >> changed, 1 insertions(+), 0 deletions(-)
> >>=20
> >> diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> >> b/meta-oe/recipes-connectivity/gateone/gateone_git.bb index
> >> 2469f9e..983dc24 100644 ---
> >> a/meta-oe/recipes-connectivity/gateone/gateone_git.bb +++
> >> b/meta-oe/recipes-connectivity/gateone/gateone_git.bb @@ -24,6 +24,7 @@
> >> do_install_append() { install -m 0644 ${WORKDIR}/gateone-avahi.service
> >> ${D}${sysconfdir}/avahi/services/ }
> >>=20
> >> +NATIVE_SYSTEMD_SUPPORT =3D "1"
> >=20
> > what exactly do you mean by native support?
> >=20
> > gateone.service is added to SRC_URI like in other systemd supporting=20
> > recipes and packaging it in own subpackage would silence the warning it
> > too.
> >=20
> > I'm fine with those changes, just wondering what's the advantage and=20
> > "native" here.
>=20
> if your recipe only has systemd support and no sysvinit, it makes little
> sense to split out a ${PN}-systemd.

Well some people can type
/usr/bin/python gateone.py
to test it without sysvinit or systemd support.

> Anyway, the warnings about stuff that isn't going to get "fixed" are gone=
 now.

But this explains it enough, thanks.

Cheers,

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iQIcBAEBAgAGBQJPjvP/AAoJEHZqAkdh1vT6NesP/1A9An6hjLXNTufcBoE2a0Fo
> J4eDzAzttJtfjnhsd9bKywDyKh5KfyFqccCKm2/vnUsvRwsyoqIy8bveFYWFXvKQ
> NRYAjqmLXYSXrnU4Dyg1/oDgZIIkstl8mUJbByT2sZYjv1VYcRHA02ph7pRVnES1
> tDWMckzpesCc8506xd1qBCF4zphB+llE6T0YwaeP13EL6h2XtQJYm+5iepDusnjv
> eFFZwbFJHWUHOfkWdDFP5fCRmXqDPSlt86nj1AEA3EDHFVaaGkxBbH0zqCuHbYQy
> OcXIEo/TYuonU4croavQtrKxYgNbm4a74Ypsx4JT31wtGteCC8YLpQ8ZWbg39UX1
> v7tmNMV4u9UBeveobc0pZ29Trr9rDYWvBVYueP0YziBiF4gMkXfW8c/rmekVhnnb
> uHqlr/RF+5c2hKg7CZE3PN6DbsvfDTKxgYcXaMbvETXlgXgV/L+Ev7Cf52t+rJF+
> HB90RDLcmUaBERm35zDMPaxo7mk7YK/cY5XbC42eKkOXrwzqxiq321LETKJ0Ci72
> SJVrRnvNdhi0fcDMkWddOk/IQQ/7gvrU/VYusTUMuAbnhzS0uAJoqDMmKepWRQOy
> hgy7DjrromIKcIR3LP4Xcqgb6Xv+NcFrTRpuN2iVWvTcEuTlFhA3ML5UlCDKkOoL
> QSgigGMh+ZlcvqV3jSoP
> =3D3sHA
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Zfao1/4IORAeFOVj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+PHWkACgkQN1Ujt2V2gBwyXQCdFLAzqOxpWcHHacr+VVWNYZmw
wdAAn1t05ufBrMWPuA/KUvrNZ4D6QWBs
=iUvZ
-----END PGP SIGNATURE-----

--Zfao1/4IORAeFOVj--
