Received: from [63.139.215.211] (helo=maxie.russound.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <jims@russound.com>) id 1LnJUS-0001kN-Eg
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 22:21:24 +0100
Received: from kmfms (unknown [10.0.3.67])
	by maxie.russound.com (Postfix) with ESMTP id 48C84C9863A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 17:15:27 -0400 (EDT)
Date: Fri, 27 Mar 2009 17:17:29 -0400
From: Jim Sheldon <jims@russound.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090327171729.413357e7@kmfms>
In-Reply-To: <49CBD43B.6070402@bolloretelecom.eu>
References: <49C9FEFF.2010802@bolloretelecom.eu>
	<49CBD43B.6070402@bolloretelecom.eu>
X-Mailer: Claws Mail 3.5.0 (GTK+ 2.12.11; i486-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: Dropping qt4-x11-free versions 4.1.2 and 4.3.3?
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
X-List-Received-Date: Fri, 27 Mar 2009 21:21:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Jeremy,

I just updated my tree and ran bitbake qt4-embedded which failed with
this:

| In file included from io/qbuffer.cpp:473:
| .moc/release-shared-emb-arm/moc_qbuffer.cpp:14:2: error: #error "This
file was generated using the moc from 4.4.3. It"
| .moc/release-shared-emb-arm/moc_qbuffer.cpp:15:2: error: #error
"cannot be used with the include files from this version of Qt."
| .moc/release-shared-emb-arm/moc_qbuffer.cpp:16:2: error: #error "(The
moc has changed too much.)" | make[1]: ***
[.obj/release-shared-emb-arm/qbuffer.o] Error 1 | make[1]: Leaving
directory
`/home/jim/Projects/beagleboard/oe/tmp/work/armv7a-angstrom-linux-gnueabi/q=
t4-embedded-4.5.0-r0/qt-embedded-linux-opensource-src-4.5.0/src/corelib'
| make: *** [sub-corelib-make_default-ordered] Error 2 | FATAL:
oe_runmake failed

Looks like something stuck around from 4.4.3.

I will have more time next week to assist with this, thanks for helping
get Qt 4.5 in OE!

Jim

On Thu, 26 Mar 2009 15:15:07 -0400
Jeremy Lain=C3=A9 <jeremy.laine@bolloretelecom.eu> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
> > Ideally, I would like to keep only version 4.4.3 and add 4.5.0
> > sometime
> in the near
> > future. This would allow us to simplify the rules used to build Qt.
> OK, Qt 4.5.0 has landed in OE. For now I have set a DEFAULT_PREFERENCE
> of -1 until we get some build reports. I you use Qt, give it a spin
> and let me know whether it works for you.
>=20
> Cheers,
>=20
> - --
> Jeremy LAINE
> Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>=20
> iEYEARECAAYFAknL1DsACgkQCL1n3lVB9EbaPQCgyq2iInVmWEQc3wwgIVg+Urb9
> UpoAnjs3LrtHqF9yJP+19KS11EiMX2hQ
> =3Dgjt1
> -----END PGP SIGNATURE-----
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


