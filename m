Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1PdNiu-0003bv-3f
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 15:00:20 +0100
Received: (qmail invoked by alias); 13 Jan 2011 13:59:45 -0000
Received: from p5DDC09D0.dip0.t-ipconnect.de (EHLO [192.168.4.39])
	[93.220.9.208]
	by mail.gmx.net (mp020) with SMTP; 13 Jan 2011 14:59:45 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+3ZaJkJGa32SWZCI7kFpl+qzAIipsYLbeBIhFWpc
	zdltkPmRjUtvxM
Message-ID: <4D2F054F.4020002@gmx.net>
Date: Thu, 13 Jan 2011 14:59:43 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2E3885.8030207@cbnco.com>
In-Reply-To: <4D2E3885.8030207@cbnco.com>
X-Enigmail-Version: 1.1.2
X-Y-GMX-Trusted: 0
Subject: Re: openjdk-6-vm-shark on armv6 (ARM1176)
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
X-List-Received-Date: Thu, 13 Jan 2011 14:00:20 -0000
X-Groupsio-MsgNum: 27996
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig0B3A150A3FF70E8AA7F8D284"

--------------enig0B3A150A3FF70E8AA7F8D284
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Michael,
can you check whether your llvm build definitely has multithread
support? Check the build logfiles. If it is not enabled there will be
warning message somewhere.

Regards
Robert

Am 13.01.2011 00:25, schrieb Michael Smith:
> Hey,
>=20
> Maybe OT for here, but I'm wondering if anyone else has tried to run th=
e
> OE-built shark VM on armv6. For me it crashes the first time it tries t=
o
> JIT anything.
>=20
> LLVM llc/lli fail to run the hello world app from here:
>=20
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/m=
sg08264.html
>=20
>=20
> /tmp # llvm-as hello.ll
> /tmp # lli hello.bc
> Stack dump:
> 0.      Program arguments: lli hello.bc
> 1.      Running pass 'ARM Instruction Selection' on function '@main'
> Segmentation fault
>=20
> /tmp # llc hello.bc
> Stack dump:
> 0.      Program arguments: llc hello.bc
> 1.      Running pass 'ARM Instruction Selection' on function '@main'
> Segmentation fault
>=20
> I'll look further; just wondering if this is known not to work.
>=20
> Thanks,
> Mike
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





--------------enig0B3A150A3FF70E8AA7F8D284
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk0vBVEACgkQG9cfwmwwEtpUdACffCrdQeoH6A/j/otMt2wf1h22
4MMAn1DklwvO26PjH++RgvCEoQpaV+iy
=IGWY
-----END PGP SIGNATURE-----

--------------enig0B3A150A3FF70E8AA7F8D284--
