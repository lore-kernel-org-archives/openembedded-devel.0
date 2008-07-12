Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KHjPy-0006R5-7j
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jul 2008 20:01:58 +0200
Received: (qmail invoked by alias); 12 Jul 2008 18:01:33 -0000
Received: from e178116136.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.116.136]
	by mail.gmx.net (mp034) with SMTP; 12 Jul 2008 20:01:33 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/nWxcMQLHnH7o86LQPlYZFZEt+kaXVSUeEgKquzz
	8ygEIfpZa6X6Ly
Message-ID: <4878F18C.2080404@gmx.net>
Date: Sat, 12 Jul 2008 20:01:48 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4870DF7B.2050603@gmx.net> <g577ce$6hu$1@ger.gmane.org>
In-Reply-To: <g577ce$6hu$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: libtool issues with angstrom and classpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 12 Jul 2008 18:01:58 -0000
X-Groupsio-MsgNum: 5494
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig263A4F9689F1ED9F6954C0C8"

--------------enig263A4F9689F1ED9F6954C0C8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Koen Kooi schrieb:
>>
>> I debugged this problem to the point where I found out that it does no=
t
>> like the '-lmagic'. If I remove that from the makefile the build
>> continues. However this cannot be the real fix.
>>
>> What is wrong here and how should I fix it?
>>
>> What other program that uses libtool and links to an external library
>> can I look at and study their autotools files?
>=20
> It seems that the following bit causes the error:
>=20
> ./configure.ac:383:  AC_CHECK_LIB(magic, magic_open, LIBMAGIC=3D-lmagic=
)
Thanks for looking at this. I found a different 'solution'. In the
current libtool scripts that are generated from ./configure the variable
hardcode_direct is empty. For earlier libtool versions this was set to
'no'. If I manually edit the script and set the variable to 'no' the
build continues just fine.

I am currently discussing this on the libtool mailing list. If you know
other packages that break with the 'invalid hardcode properties' error
message you may try the above workaround.

Regards
Robert


--------------enig263A4F9689F1ED9F6954C0C8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIePGMG9cfwmwwEtoRCEbuAJ9xP15JbKioG0ga3IKKOVcCZVZWXQCffN6g
XiSocWb8X8y7DeRvf+DRQIw=
=rVoV
-----END PGP SIGNATURE-----

--------------enig263A4F9689F1ED9F6954C0C8--
