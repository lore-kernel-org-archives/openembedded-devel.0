Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1I8DLS-0004lb-1o
	for openembedded-devel@openembedded.org; Tue, 10 Jul 2007 12:53:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6AAlixI026232
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jul 2007 11:47:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26127-02 for <openembedded-devel@openembedded.org>;
	Tue, 10 Jul 2007 11:47:41 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6AAle47026222
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Jul 2007 11:47:40 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200707101236.04011.openembedded@hrw.one.pl>
References: <E1I8BNL-0002lu-BC@linuxtogo.org>
	<986250811.20070710125440@gmail.com>
	<200707101236.04011.openembedded@hrw.one.pl>
Date: Tue, 10 Jul 2007 11:47:39 +0100
Message-Id: <1184064459.6435.40.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	l6AAlixI026232
Subject: Re: [oe-commits] org.oe.dev packages/glib-2.0/glib.inc :	remove bogus ${PN}-dev from packages.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2007 10:53:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 2007-07-10 at 12:36 +0200, Marcin Juszkiewicz wrote:
> Dnia wtorek, 10 lipca 2007, Paul Sokolovsky napisa=C5=82:
> > Hello xora,
> > > packages/glib-2.0/glib.inc : remove bogus ${PN}-dev from packages.
>=20
> > > -PACKAGES =3D+ "${PN}-dev glib-2.0-utils "
> > > +PACKAGES =3D+ " glib-2.0-utils "
>=20
> >   This is not bogus. For this package, -dev must be packaged before
> > the main package, or the latter will get *.h and *.m4 files.=20
>=20
> fix FILES_${PN} then
>=20
> > Putting something in packages twice works after all, and we should
> > either accept its usage fro such cases,
>=20
> -1 from me - we should not allow such things as they can hide bugs
>=20
> > or find other solution to do proper flexible packaging (and that woul=
d
> > be a bit hard on syntax. =20
>=20
> FILES adapting was fast job - I am testing fix in Poky now.

Duplicate entries in PACKAGES cause all kinds of subtle problems as per
the error message. Please don't do it and set FILES correctly.

Cheers,

Richard



