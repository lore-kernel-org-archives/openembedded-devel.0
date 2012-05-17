Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUyfK-0002N1-9g
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 13:14:42 +0200
Received: by werg55 with SMTP id g55so1162459wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 04:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8PWveYowDB2OMtHFYecQlVuU7CB1wvPWUz4vV1eoYfI=;
	b=Mom8jj+JyqoG6SnvfUuYK6FuNeb2qksnrLNEG7yM9zAv535WAM2x9meYuc/yoganN7
	W950EIyxW/YXoB/mdyuU1zreV5fimp4/SaNaHiCx7lUmlg5cIjuCdaC2bilh5vqWo9vq
	roUm+j37KSm0HAXBsg/L1VM609mGYKkEE/5vwGG6V5hwKMSz9WLTEdIadCTiBaAJu0Dc
	IYHdbwFzU8yNtf6v8FRCxVWSPYpG+M48odi/W2tcL/MpY5xmNGEIU4yNWDpBJWrS9Qzo
	IiP0np50xF361pkcESPCyIQB/vh7OM1gQM+a9jw9QTnETtCIr/dTQRjV9OQw625WGgb8
	NO0Q==
Received: by 10.180.80.97 with SMTP id q1mr17323001wix.13.1337252680028;
	Thu, 17 May 2012 04:04:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g10sm47482914wiw.0.2012.05.17.04.04.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 04:04:39 -0700 (PDT)
Date: Thu, 17 May 2012 13:04:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120517110438.GF3164@jama.jama.net>
References: <1337246639-5192-1-git-send-email-Martin.Jansa@gmail.com>
	<jp2i06$mvm$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jp2i06$mvm$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] systemd: create /var/run/utmp
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
X-List-Received-Date: Thu, 17 May 2012 11:14:42 -0000
X-Groupsio-MsgNum: 38843
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline

--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 11:56:22AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 17-05-12 11:23, Martin Jansa schreef:
> > * it was created by volatiles before,
>=20
> If it was done by volatiles before shouldn't it be a tmpfile.d/ snippet
> instead of do_install_append? /var/run gets clean on boot on a lot of sys=
tems.

Do you have symlink /var/run -> /run?

Here /var/run is normal directory (without tmpfs mounted there, not cleaned=
 on boot),=20
so it's enough to create it once.

Cheers,

>=20
> regards,
>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFPtMtGMkyGM64RGpERAuSeAJoDjJkjMTgjE5nPQMrVktEOg09V9ACfWWtI
> qiRbdUTWm265EWCNd+z955Y=3D
> =3DSMCB
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+020YACgkQN1Ujt2V2gByq2gCfXXUS/aZIRxhBsHVXkBv28lSk
Fd8AnizU0CvPa4q0ZnJWYiFauoVAftoJ
=NV9J
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--
