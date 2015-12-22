Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A43E46FFEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 15:46:36 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p187so114137217wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 07:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tkKoQN9uUFcwFsbKB12Bl3UYKP9NAN7zXe8cWnqwvuE=;
	b=Na4vjFUnAIQd2TAGz1G//zbrCQqMktEJhCiG4RjN9s/R81Rjozta3j6cDO+4DK2qfQ
	hiJvlzXH/XFg+Hh60LbG56h9R0yNbBl+iu3WRrbXtiZAe35PX9j7JlW0XlH1KJapt6mi
	DdBld3m//GNZZyW5N7CVV7DMPirWvgxx95O17UV8ptI6MjE27Z0w9jG5AuqcRSg+mNfr
	dz93I2EblGo4hh+DLOldD0TcsvcFOQaX+SiHWgowaNS9VGum/WnAUlAslHdF1m0XoHKJ
	87lf6YO4qtmxGngnffW/Rlbada85bD+EomMgw9Iw+nmcLUkdNP/WiEq72brE1OVrS7yE
	O2Iw==
X-Received: by 10.194.77.51 with SMTP id p19mr27563158wjw.159.1450799196694;
	Tue, 22 Dec 2015 07:46:36 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l7sm33574372wjx.14.2015.12.22.07.46.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Dec 2015 07:46:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Dec 2015 16:49:40 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151222154940.GA2556@jama>
References: <1450758431-18974-1-git-send-email-twoerner@gmail.com>
	<1450758431-18974-2-git-send-email-twoerner@gmail.com>
	<CAJ86T=X7-FxDqTZ1fJgx-sQaVUjM+Xe-E_QXe1QfXfgQMptLww@mail.gmail.com>
	<56796C6B.9070002@gmail.com>
MIME-Version: 1.0
In-Reply-To: <56796C6B.9070002@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH v3 1/1] nodejs: cleanup and update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Dec 2015 15:46:36 -0000
X-Groupsio-MsgNum: 59139
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2015 at 10:29:47AM -0500, Trevor Woerner wrote:
> Hi Andre,
>=20
> On 12/22/15 04:35, Andre McCurdy wrote:
> > Here's the link to the "official" announcement about v8 dropping
> > support for ARM cores without vfp2 support:
>=20
> Thanks, I'll include that in v4.
>=20
> > +COMPATIBLE_MACHINE =3D "(-)"
> > +COMPATIBLE_MACHINE_x86 =3D "(.*)"
> > +COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
> > +COMPATIBLE_MACHINE_armv7a =3D "(.*)"
> > Please blacklist armv4 and armv5 instead of whitelisting armv7a (armv6
> > and potential future arm targets such as armv7ve are still expected to
> > work. It's only armv4 and armv5 which are not).
>=20
> That was what I was trying to do :-) I don't have much experience in
> this, I've been asking on IRC and the mailing lists, and there aren't
> many examples to copy. I think the following works:
>=20
>     COMPATIBLE_MACHINE_armv4 =3D "(!.*armv4).*"
>     COMPATIBLE_MACHINE_armv5 =3D "(!.*armv5).*"
>     COMPATIBLE_MACHINE_mips64 =3D "(!.*mips64).*"
>=20
> ?

It's not nice but you can use:
COMPATIBLE_MACHINE_arm =3D "(.*)"
COMPATIBLE_MACHINE_armv4 =3D "(-)"
COMPATIBLE_MACHINE_armv5 =3D "(-)"
COMPATIBLE_MACHINE_mips64 =3D "(-)"

If these 3 are the only 3 unsupported, then you can drop override for
x86, x86-64, arm and change the default to (.*).

> Best regards,
>     Trevor
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZ5bu4ACgkQN1Ujt2V2gBxmZgCglultk1jcNR43FLxXBSeZYFeF
KcIAoLm5eB3/sd/Gj0uHaX8wrukLNF2i
=K9uo
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
