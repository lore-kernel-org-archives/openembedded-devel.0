Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPxyd-0001m3-Ff
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:34:29 +0200
Received: by mail-ea0-f175.google.com with SMTP id r16so311436ead.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 09:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=32MIsKQ7ywpJBU41pet/NoOpwdLpJ1pDW103nRpwkQo=;
	b=WhG+Yusnnkm67OtjF0Y7+JA1OVQJ5Hq5u7qY/V7FdCSFD3crANkRfhxfnIItERk/Lk
	HYjurwAHAmI5hPC+nJ/1INxyysBa2Rfyc7/xKeg6nvZ3v2jckWPRfxrry8SLj7n8KbMw
	Y6UnbAWC2symupLhEQrylmRZy1yI1JV3q4wfnoJCx7yV9ndZ85o6bgNXyfZx10E0jK5l
	AK8a1GJfLxN+2NzGUOIHPr1k1Fs3XpafDakCfL3AIBt6VZF40HXzxmUWTPkOV6ZDoCqE
	1rx+Tle9DcU+PFXWgf2Ez2ZkIA537n+ouJWILvDT4o8yLi0enknnLHzw3Fb0r3acat+E
	TTqw==
X-Received: by 10.15.102.3 with SMTP id bq3mr6856553eeb.42.1365610619369;
	Wed, 10 Apr 2013 09:16:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id cd3sm712571eeb.6.2013.04.10.09.16.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 09:16:58 -0700 (PDT)
Date: Wed, 10 Apr 2013 18:17:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130410161700.GE2471@jama>
References: <1365407863-23360-1-git-send-email-jdk@ti.com>
	<kk42oq$o6t$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <kk42oq$o6t$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-systemd][danny][PATCH] cloud9: add EnvironmentFile
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
X-List-Received-Date: Wed, 10 Apr 2013 16:34:42 -0000
X-Groupsio-MsgNum: 44040
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline

--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 06:07:59PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 08-04-13 09:57, Jason Kridner schreef:
> > * Allows specification of NODE_PATH
> >=20
> > Signed-off-by: Jason Kridner <jdk@ti.com> ---=20
> > .../recipes-devtools/cloud9/cloud9/cloud9.service  |    1 + 1 files
> > changed, 1 insertions(+), 0 deletions(-)
> >=20
> > diff --git
> > a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
> > b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service=20
> > index 714b465..54a9db0 100644 ---
> > a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service +++
> > b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service @@
> > -3,6 +3,7 @@ Description=3DCloud9 IDE ConditionPathExists=3D|/var/lib/c=
loud9
> >=20
> > [Service] +EnvironmentFile=3D-/etc/conf.d/node ExecStart=3D/usr/bin/nod=
e4
> > /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
> >=20
> > [Install]
> >=20
>=20
>=20
> It's a bit late now, but this shouldn't go in, it introduces a gentoo-ism
> (/etc/conf.d) that we don't want.

Ah, sorry about that.

> Martin, can you revert it please?

Sure

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFRZY5fMkyGM64RGpERAsUrAKCpirNbZj9g6fdigv2+GZUqSksGVQCeJths
> zlp4sG6jcgBF1RjzikHwksw=3D
> =3D6TFx
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFlkHwACgkQN1Ujt2V2gBxvlACgr2ac3rXSv9EEIaycJW9MU2MR
J68An0YSPuh0zEyTlXO+Lm0qeCzvAGCj
=mj7U
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
