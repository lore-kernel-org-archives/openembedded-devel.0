Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQ3Os-00068r-I8
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 00:21:59 +0200
Received: by mail-da0-f46.google.com with SMTP id y19so391424dan.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 15:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CEPgNkKCutGnIC27ModFLTPMfF7uje/qdAnH7bVknVw=;
	b=eJGL7gR3zSMwDHx4HdBbS/c5Rqb0FcsVDxu/EkN7ZNHQY0ZJ5PB11amd43PZXjyt6r
	Oba+yL4MGWALLjudiMdfXLbKa7IDrZG5JJE7xtkVG2veHi91RG/V+6X7sbWqoiA+G7r5
	KLIMG5t0W7QOIR9Cnu/1f7+IpRZ5PaToMt8fe3vHikLWTEv16QE1SuOhJTTB1aWrjbdW
	F/U5mEhwp2i0WfCau3uV6h7evVpvBqD7kHzPG/9sKzCeN7dBLz3Py49TqGh4+Q/qXPNw
	YdihmLe09zCUAYkYtiQle1FZliMrPtpSxqBLeXumCYafhG8UsJukG2OwYRPoACLllpM6
	vq7g==
X-Received: by 10.66.154.76 with SMTP id vm12mr6014281pab.106.1365631471618;
	Wed, 10 Apr 2013 15:04:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gi2sm1436494pbb.2.2013.04.10.15.04.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 15:04:30 -0700 (PDT)
Date: Thu, 11 Apr 2013 00:04:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130410220423.GH2471@jama>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
	<1365610462-29689-4-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1365610462-29689-4-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 4/8] gateone: fix html5 feature check
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
X-List-Received-Date: Wed, 10 Apr 2013 22:22:06 -0000
X-Groupsio-MsgNum: 44047
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rCwQ2Y43eQY6RBgR"
Content-Disposition: inline

--rCwQ2Y43eQY6RBgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 06:14:18PM +0200, Koen Kooi wrote:
> The BlobBuilder and Blob checks never succeeded, even on cutting edge bro=
wsers. Nudge SRCREV forward to drag in those fixes.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-connectivity/gateone/gateone_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-o=
e/recipes-connectivity/gateone/gateone_git.bb
> index 652876f..8133cf9 100644
> --- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> +++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dee5b168fc7=
de89a0cadc49e27830aa2c"
>  PR =3D "r9"
> =20
>  PV =3D "1.1"
> -SRCREV =3D "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
> +SRCREV =3D "ea5db3dcb3bbbe445ae6d1a5611c1f8d547c57b9"

I'll at least bump PR in this one.

>  SRC_URI =3D "git://github.com/liftoff/GateOne.git \
>             file://gateone-avahi.service \
>             file://server.conf \
> --=20
> 1.8.1.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rCwQ2Y43eQY6RBgR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFl4ecACgkQN1Ujt2V2gBxx7ACeIkX8VpuMySXdkRmqnzyXTmiM
obcAn297Mj9MP3oaE0EZ7Ufz0oSqqfI+
=18BQ
-----END PGP SIGNATURE-----

--rCwQ2Y43eQY6RBgR--
