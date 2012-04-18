Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SKRLm-0001ix-Sd; Wed, 18 Apr 2012 11:38:58 +0200
Received: by wgbdr12 with SMTP id dr12so6051084wgb.24
	for <multiple recipients>; Wed, 18 Apr 2012 02:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h8xOpqs4hPThkGA8z2/gkZGZTWssqo4X2r4j5CpPNxM=;
	b=cRVw1Ly7+8stQbLjXRFCvf4aPZE8rNNM75qxTgoqAs5va6laiU7+749iuWxEL0NV1g
	/BwgwGGBWoZcz5tL99Ef4em9TOA1rQmz7DMD8ZkKWwi7sWqloENhxwdrT8WsFt8OCk1A
	UfSyRamfGL4LXdLvaeC5IJa536q06pkry+npBZr8ldL7E6+g5mxsiz9h6/xJVTdpMSeY
	VFO+oY247OruW+XokBfnl9iwuj9LbZ/Rwm2MUHUiAHF35gylsiVyM6jeib3mKpufCvi7
	Z9kilSI21PFGSlbmGLYLpFbPSiM6/aYb30tK27P0m+gwN+AEUz1TmHvqVKm5b+i1NfO/
	wBpQ==
Received: by 10.180.104.231 with SMTP id gh7mr4455820wib.10.1334741370783;
	Wed, 18 Apr 2012 02:29:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ca3sm33297342wib.6.2012.04.18.02.29.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 02:29:30 -0700 (PDT)
Date: Wed, 18 Apr 2012 11:29:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120418092930.GF3635@jama.jama.net>
References: <20120418085611.C6AA710216@opal>
MIME-Version: 1.0
In-Reply-To: <20120418085611.C6AA710216@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
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
X-List-Received-Date: Wed, 18 Apr 2012 09:38:59 -0000
X-Groupsio-MsgNum: 38309
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Content-Disposition: inline

--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 08:56:10AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: ca5e7197524efef0961bdbbe111f6dd16f1d46b4
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dca5e7197524efef0961bdbbe111f6dd16f1d46b4
>=20
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date:   Wed Apr 18 10:45:41 2012 +0200
>=20
> gateone: silence systemd bbclass WARNING, ${PN}-systemd is unwanted
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> ---
>=20
>  .../recipes-connectivity/gateone/gateone_git.bb    |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-o=
e/recipes-connectivity/gateone/gateone_git.bb
> index 2469f9e..983dc24 100644
> --- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> +++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> @@ -24,6 +24,7 @@ do_install_append() {
>  	install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avah=
i/services/
>  }
> =20
> +NATIVE_SYSTEMD_SUPPORT =3D "1"

what exactly do you mean by native support?

gateone.service is added to SRC_URI like in other systemd supporting
recipes and packaging it in own subpackage would silence the warning=20
it too.

I'm fine with those changes, just wondering what's the advantage and
"native" here.

Cheers,

>  SYSTEMD_PACKAGES =3D "${PN}"
>  SYSTEMD_SERVICE =3D "gateone.service"
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+OiXoACgkQN1Ujt2V2gBwNEACgk6GOdYNHgnX7i0qL8dCA+GtX
hCcAnRD5xcoNpp3UqspdZqaA96MxHLo5
=snk+
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--
