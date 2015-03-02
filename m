Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 15CC372130
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:25:47 +0000 (UTC)
Received: by wghl2 with SMTP id l2so32443330wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 02:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OhrNxcPeeJ68m6dYCZoL68YbwppLXwd7oXdbatm3yB0=;
	b=nQhpjRF7EJ1KxpoB9qS4NbyaD9wNqVT3XPCp79n/kXkrPObUCvgLEcNOggG436J+mO
	2kPkr0/Oi4L1lXSHXruyO2gbV3AwWn8E8vm6Et7DbtdECX/e4/4A11XW1wrMTHiuA0Rq
	Hytm/gAN4C79JV5vQ6bcR5fVRdTayNizdnP2h2VseVD8x05miogXcimHQiAuw8Ez1JPw
	9ow3I3yE7YqyVq4S+YgOWAYv4UHoBOMitwsu1EHHDSgprp7YLKXJIomrIoCqC2agZrr1
	oLPTQAaiiqgj211KIZl8FVK5Z7wrcYZNDwCT3HCQtMaXZH1mf5ZQSri/eCcn0OE5fQvB
	T7OQ==
X-Received: by 10.180.76.45 with SMTP id h13mr33158479wiw.51.1425291948627;
	Mon, 02 Mar 2015 02:25:48 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gm2sm15447261wib.5.2015.03.02.02.25.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 02:25:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Mar 2015 11:26:11 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150302102611.GY2309@jama>
References: <1425283365-19326-1-git-send-email-Martin.Jansa@gmail.com>
	<54F439E6.3010906@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <54F439E6.3010906@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: import recipe from meta-luneos
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
X-List-Received-Date: Mon, 02 Mar 2015 10:25:49 -0000
X-Groupsio-MsgNum: 54577
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RUvhGz2nhX7DIu1B"
Content-Disposition: inline

--RUvhGz2nhX7DIu1B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2015 at 11:22:30AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Martin Jansa schreef op 02-03-15 om 09:02:
> > * useful to run our qemu* builds inside VirtualBox
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > .../vboxguestdrivers/Makefile.utils                | 43 ++++++++++++++=
=20
> > .../vboxguestdrivers/vboxguestdrivers_4.3.22.bb    | 65
> > ++++++++++++++++++++++
>=20
> > +PACKAGES +=3D "kernel-module-vboxguest kernel-module-vboxsf
> > kernel-module-vboxvideo" +RDEPENDS_${PN} +=3D "kernel-module-vboxguest
> > kernel-module-vboxsf kernel-module-vboxvideo"
>=20
> Please don't ever RDEPEND on kernel modules, even when the recipe will bu=
ild
> them, it sets a bad precedent.

I think it makes sense in this case.. nobody will ever include them in
kernel image and vboxguestdrivers utils don't make much sense without
the modules installed.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFU9DnmMkyGM64RGpERAu+jAJ92mQgg4UU7QBoaClZcMsh7Bd/8+wCggBRt
> iXq6vplV1z4aJMxG2xY9+nk=3D
> =3DSREn
> -----END PGP SIGNATURE-----
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RUvhGz2nhX7DIu1B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT0OsMACgkQN1Ujt2V2gBwxaQCgtZJbhefE12kGMzVD9yHmeadZ
V1wAn22IBYPuS3AReI1mMvKcXNLM9Y30
=wwp5
-----END PGP SIGNATURE-----

--RUvhGz2nhX7DIu1B--
