Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1QPAFW-0003Xf-Pe
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 11:19:31 +0200
Received: (qmail invoked by alias); 25 May 2011 09:16:23 -0000
Received: from 230.118.101.84.rev.sfr.net (EHLO [192.168.42.72])
	[84.101.118.230]
	by mail.gmx.net (mp058) with SMTP; 25 May 2011 11:16:23 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19yzCFeMtdycFYORp1KjdviffsC4YJ5ZXFDaGT3cs
	f4lJc08i/OvOau
Message-ID: <4DDCC8E1.5060302@gmx.net>
Date: Wed, 25 May 2011 11:16:17 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Henning Heinold <h.heinold@tarent.de>,
	Paul Menzel <paulepanter@users.sourceforge.net>, 
	pgsellmann@portner-elektronik.at
References: <1306099474.5994.112.camel@mattotaupa>
In-Reply-To: <1306099474.5994.112.camel@mattotaupa>
X-Enigmail-Version: 1.1.2
X-Y-GMX-Trusted: 0
Subject: =?UTF-8?B?UmU6IGljZWR0ZWE2LW5hdGl2ZTogdGFzayBjb21waWxlIGZhaWxzIHdpdGggYHVuemlwOiBjYW5ub3QgZmluZCB6aXBmaWxlIGRpcmVjdG9yeSBpbiBvbmUgb2YgL29lL2J1aWxkLWFuZ3N0cm9tLW5leHQvYW5nc3Ryb20tZGV2L3N5c3Jvb3RzL2k2ODYtbGludXgvdXNyL2Jpbi91bnppcCBvciDigKZg?=
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
X-List-Received-Date: Wed, 25 May 2011 09:19:31 -0000
X-Groupsio-MsgNum: 32273
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigB483F8FFC7060AEA3287BC4C"

--------------enigB483F8FFC7060AEA3287BC4C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I'll look into this.

Regards,
Robert

Am 22.05.2011 23:24, schrieb Paul Menzel:
> Dear OE folks,
>=20
>=20
> even with the latest patches send to the list [1].
>=20
>         Importing binaries from component CORBA_DIST
>         ( cd  /oe/build-angstrom-next/angstrom-dev/work/i686-linux/iced=
tea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86 && /o=
e/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip -o /=
oe/build-angstrom-next/angstrom-dev/work/i686-linux/icedtea6-native-1.7.1=
0-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/dist/lib/bin.zip=
 )
>         Archive:  /oe/build-angstrom-next/angstrom-dev/sysroots/i686-li=
nux/usr/bin/unzip
>           End-of-central-directory signature not found.  Either this fi=
le is not
>           a zipfile, or it constitutes one disk of a multi-part archive=
=2E  In the
>           latter case the central directory and zipfile comment will be=
 found on
>           the last disk(s) of this archive.
>         note:  /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux=
/usr/bin/unzip may be a plain executable, not an archive
>         unzip:  cannot find zipfile directory in one of /oe/build-angst=
rom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip or /oe/build-angs=
trom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip.zip, and cannot =
find /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unz=
ip.ZIP, period.
>         make[4]: *** [/oe/build-angstrom-next/angstrom-dev/work/i686-li=
nux/icedtea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x=
86/tmp/java/components_imported] Error 9
>=20
> Running the command directly works fine though.
>=20
>         $ /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/=
bin/unzip -o /oe/build-angstrom-next/angstrom-dev/work/i686-linux/icedtea=
6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/di=
st/lib/bin.zip
>         Archive:  /oe/build-angstrom-next/angstrom-dev/work/i686-linux/=
icedtea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/c=
orba/dist/lib/bin.zip
>           inflating: lib/orb.idl            =20
>           inflating: lib/ir.idl
>=20
>=20
> Thanks,
>=20
> Paul
>=20
>=20
> [1] http://patches.openembedded.org/patch/4621/
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------enigB483F8FFC7060AEA3287BC4C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3cyOQACgkQG9cfwmwwEtp3GQCglYMdr1d1x/JQRbSFp7LJtkZj
dawAniCIA9PY9YgYN5CFYn26NunztiRB
=1I/m
-----END PGP SIGNATURE-----

--------------enigB483F8FFC7060AEA3287BC4C--
