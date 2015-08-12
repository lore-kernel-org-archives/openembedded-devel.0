Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B76B3607A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 23:23:57 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so12149032pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=0xkzRBuEIWoFsDrhrP0CnzCZK9kNeGXifJdTS+Gjv7c=;
	b=cjYeIaxi//bgpcdOiVLfQICcsfqoBZkb7Z3QbyiU/aSchLYFVwQShtbjfRU8JKJnCj
	gI12JSwm1DQodlsYoGuAJ55zoozqKVbaY97ZMFRt+cLTAWcuFn3jcgUCgfMAIjKlbshR
	9D2YzlB4PsyRO/5FtrRzyu0jJit1x2v2ykyF5/84B7EvYtW2JtNZS5qZ0x8bUe4/TJer
	m99BsTqEe71NropBl7pxAU8eLI+6bT9qMajNE5i5VGhCyjcVOMgxRB9E76yEpykJzgcc
	1WoibxM/WOpO/vywsdIBc92c8IBX8ROgfQEVJMUiooVv71dMcTQ7dWYLOGw4zwCpb0tx
	J2ag==
X-Received: by 10.70.140.41 with SMTP id rd9mr40636711pdb.145.1439421837609;
	Wed, 12 Aug 2015 16:23:57 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:fc7c:c1e4:3af6:2fa1?
	([2601:646:8601:4580:fc7c:c1e4:3af6:2fa1])
	by smtp.gmail.com with ESMTPSA id hh3sm242643pbc.8.2015.08.12.16.23.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Aug 2015 16:23:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150812183730.GG26375@denix.org>
Date: Wed, 12 Aug 2015 16:23:52 -0700
Message-Id: <8F8F74A1-8AE1-492D-B42B-48F4C70C27FD@gmail.com>
References: <20150812183730.GG26375@denix.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-qt5] qtbase_5.4.2 do_install fails to chown fonts
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
X-List-Received-Date: Wed, 12 Aug 2015 23:24:04 -0000
X-Groupsio-MsgNum: 56675
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A673A32E-914E-49FC-BA82-8A6E7A5E011B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A673A32E-914E-49FC-BA82-8A6E7A5E011B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 12, 2015, at 11:37 AM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>=20
> Hi,
>=20
> Has anyone seen the issue of qtbase_5.4.2 failing at the end of =
do_install to
> chown fonts? Here's the message:
>=20
> chown: cannot access =
`[cut]/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image//usr/lib/fonts': No =
such file or directory
>=20
> Here's the code that fails:
>=20
> =
https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase_git=
.bb#L230
>=20
> Looking at the install location, it seems that the previous command
>=20
> cp -a ${S}/lib/fonts ${D}/${OE_QMAKE_PATH_LIBS}
>=20
> copied font files not into /usr/lib/fonts, but instead into /usr/lib =
directly.
> This usually happens with "cp -a" when /usr/lib destination is =
empty...
>=20
> I'm thinking about submitting a patch that replaces above copy with:
>=20
> mkdir -p ${D}/${OE_QMAKE_PATH_LIBS}/fonts
> cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_LIBS}/fonts
>=20
> Any objections, comments, suggestions?
>=20

seems sane to me.

> --
> Denys
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_A673A32E-914E-49FC-BA82-8A6E7A5E011B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXL1YsACgkQuwUzVZGdMxRxnwCfVUk5w9lg7ELQxfOkdaLon4MJ
YvEAoIsp1Z5vTtiFfRObeKNzPz0N5lfy
=0qYS
-----END PGP SIGNATURE-----

--Apple-Mail=_A673A32E-914E-49FC-BA82-8A6E7A5E011B--
