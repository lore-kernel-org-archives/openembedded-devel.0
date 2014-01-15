Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id D39F06B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 19:34:25 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so699197eaj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dKNwoVFcIjODlU1pqIYVpHJwMBueQhgAAfo8ZAQgJXk=;
	b=mz/b6NA4EEyOAqXDj0tM4L/zO/dFLuwpq8hgyi2KU3V97A+bAqfCh62qcR3aN6d6nY
	pedxzUjTnA3JYtahuX8pxByPfFNZEyuOybJxhJyV9G3rFqgMcMENxU6CLP0wTlloTFjF
	jc4vbyLIeHr5jerWnRQHKozpr7MHztR994J9ihhS7JqHnKIE2UCl4Qi8zmLeQO5n8eFd
	QMWJQ/6BivcNhCUsINFapJFVRg28b2xAyPh2kMS+v7uxwa1kCPR/N96TBxuuvyKfk41L
	37/Gb++MR2lSgnb6X2Cq36f6QMw+scRcfB5OI71XwhVYBCrWTKD8iwMykpEEjVpm/fcn
	ghtg==
X-Received: by 10.15.51.13 with SMTP id m13mr32146eew.103.1389814466415;
	Wed, 15 Jan 2014 11:34:26 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm12738970eeg.0.2014.01.15.11.34.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 11:34:25 -0800 (PST)
Date: Wed, 15 Jan 2014 20:34:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140115193446.GC3742@jama>
References: <1389812873.92918.YahooMailNeo@web164702.mail.gq1.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1389812873.92918.YahooMailNeo@web164702.mail.gq1.yahoo.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: non debug package contains .debug directory
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
X-List-Received-Date: Wed, 15 Jan 2014 19:34:26 -0000
X-Groupsio-MsgNum: 47765
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline

--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2014 at 11:07:53AM -0800, kris duff wrote:
> Hello,
>=20
> I'm working to port a custom software.
>=20
> bitbake complain about :
>=20
> NOTE: Checking Package: fcgi
> ERROR: QA Issue: non debug package contains .debug directory: fcgi path /=
work/armv7a-vfp-neon-poky-linux-gnueabi/fcgi-0.25-r0/packages-split/fcgi/us=
r/bin/.debug/fast.fcgi
> ERROR: QA run found fatal errors. Please consider fixing them.
>=20
> In my recipe I added :=20
> FILES_${PN}-dbg +=3D "${WORKDIR}/trunk/Debug"
> FILES_${PN}-dbg +=3D "${WORKDIR}/trunk/Debug/*"
>=20
> I also tried :=20
> FILES_${PN}-dbg +=3D "${D}/usr/bin/.debug"
> FILES_${PN}-dbg +=3D "${D}/usr/bin/.debug/*"

Don't use ${D} or ${WORKDIR} prefix, it's path like on target so just:

FILES_${PN}-dbg +=3D "${bindir}/.debug"

> no luck for now. I tried few other things and I don't understand how to d=
o that.
>=20
> Any help would be highly appreciated!

There is plenty of examples in layers, git grep is often best friend.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLW4tYACgkQN1Ujt2V2gByvdgCgjKb7nEnMWFbJcZaZRkLHRbog
BzYAnjePlBegFfn5K9zMVWH5jzEVIy5e
=c/fE
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
