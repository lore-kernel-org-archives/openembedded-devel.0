Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J5f8p-0000XD-Lh
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 11:30:10 +0100
Received: (qmail invoked by alias); 21 Dec 2007 10:24:53 -0000
Received: from e178102245.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.102.245]
	by mail.gmx.net (mp035) with SMTP; 21 Dec 2007 11:24:53 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX187UIl4mAo7JM16cwuQPJ25Ip9f+YAgXRsyuhsxxx
	Kqq+uxQhR+yT0F
Message-ID: <476B9470.2020607@gmx.net>
Date: Fri, 21 Dec 2007 11:24:48 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <476B7A8D.4070603@gmx.net>
	<1198230789.4636.25.camel@localhost.localdomain>
In-Reply-To: <1198230789.4636.25.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: RFC: feature request - wrap sources
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
X-List-Received-Date: Fri, 21 Dec 2007 10:30:11 -0000
X-Groupsio-MsgNum: 3725
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigD6551FE4C006AA360CD97E1F"

--------------enigD6551FE4C006AA360CD97E1F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Richard Purdie schrieb:
> On Fri, 2007-12-21 at 09:34 +0100, Robert Schuster wrote:
>> I have a feature request that should help dealing with those source
>> tarballs which do not contain a proper top level directory. The idea i=
s
>> to allow to add a parameter 'wrap' to the SRC_URI entry denoting the
>> source tarball. If it is present (and 1) the unpacker creates a
>> directory named ${P} and unpacks the tarball therein.
>>
>> This would make it unneccessary to change S for such packages and
>> furthermore the work directory is not cluttered with files and folders=

>> from inside the source tarball.
>>
>> Like it? (Any pointer where such code should be put?)
>=20
> Would it not be simpler just to specify an attribute like unpacksubdir
> which you could set to ${PN}-${PV}?
Specifying the directory to be created would be nice. However one of my
idea was that by using such a mechanism S would be correct.

Would it be possible to automatically set S to ${WORKDIR}/<anything> if
unpacksubdir=3D<anything> is used? If so we could have genericity and
saving boilerplate code. :)

Regards
Robert


--------------enigD6551FE4C006AA360CD97E1F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHa5R0G9cfwmwwEtoRCAUTAJ91A+B+aRZOSfZLtx3rYIuVguC6uACfQmIl
6Iju0hED8chRJogTDYsVzvs=
=jyvd
-----END PGP SIGNATURE-----

--------------enigD6551FE4C006AA360CD97E1F--
