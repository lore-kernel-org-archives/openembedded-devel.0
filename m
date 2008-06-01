Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1K2wnF-0007ga-LZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Jun 2008 01:16:53 +0200
Received: (qmail invoked by alias); 01 Jun 2008 23:12:42 -0000
Received: from brln-4db88d3f.pool.einsundeins.de (EHLO [192.168.4.110])
	[77.184.141.63]
	by mail.gmx.net (mp038) with SMTP; 02 Jun 2008 01:12:42 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/ACVI0UcHAAWA7vlg6vxNrxqCuMhlwMP9YjjtDBG
	gWdKH4IP4Lop1A
Message-ID: <48432CE8.8080508@gmx.net>
Date: Mon, 02 Jun 2008 01:12:40 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	John Lee <john_lee@openmoko.com>
References: <20080509153032.79D501892D4@amethyst.openembedded.net>
	<482A1FEC.5000804@gmx.net>
In-Reply-To: <482A1FEC.5000804@gmx.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] org.oe.dev classpath-native_0.97.1.bb : add from OM mtn
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
X-List-Received-Date: Sun, 01 Jun 2008 23:16:53 -0000
X-Groupsio-MsgNum: 5270
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig81C57451C76C1036D6DD1E50"

--------------enig81C57451C76C1036D6DD1E50
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all, John
good news!

The Classpath team will soon do a 0.97.2 bugfix release which will
contain pre-generated headers. Classpath' includence in Debian depends
on this decision so we are going to profit from it, too. :)

Regards
Robert

Robert Schuster schrieb:
> Hi,
> I would like this commit to be reverted. While it may look logical to g=
o
> from one below 1.0 release to another something important changed in
> classpath in that release and makes bootstrapping far more complicated.=

>=20
> The problem is that from 0.97 onwards, a classpath build needs a workin=
g
> javah tool. this program is a header generator which creates C header
> files from compiled Java classes. Such a javah program is provided by
> the classpath tools but needs a working runtime and class library first=
=2E
>=20
> Earlier classpath releases had pre-generated header files and needed no=

> javah program.
>=20
> There are multiple ways to fix this issue. One way would involve
> upstream allowing the just built javah application being run with a
> provided java executable. This would be less pain for us and would also=

> benefit other cross compilation efforts.
>=20
> Regards
> Robert
>=20
> xora commit schrieb:
>> classpath-native_0.97.1.bb : add from OM mtn
>>
>> Author: xora@openembedded.org
>> Branch: org.openembedded.dev
>> Revision: 3607c00052ba968a5052e6b5f44f6cb522a38d8b
>> ViewMTN: http://monotone.openembedded.org/revision/info/3607c00052ba96=
8a5052e6b5f44f6cb522a38d8b
>> Files:
>> 1
>> packages/classpath/classpath-native_0.97.1.bb
>> Diffs:
>>
>> #
>> # mt diff -r471eef0dd55e52c8e89d42f17ff7a3c920452d9f -r3607c00052ba968=
a5052e6b5f44f6cb522a38d8b
>> #
>> #
>> #
>> # add_file "packages/classpath/classpath-native_0.97.1.bb"
>> #  content [4b052ebae756323751932779865b45cf50a920fa]
>> #
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- packages/classpath/classpath-native_0.97.1.bb	4b052ebae75632375193=
2779865b45cf50a920fa
>> +++ packages/classpath/classpath-native_0.97.1.bb	4b052ebae75632375193=
2779865b45cf50a920fa
>> @@ -0,0 +1,3 @@
>> +require classpath-native.inc
>> +
>> +PR =3D "r0"
>>
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi=
ts
>>
>=20
>=20
>=20
> -----------------------------------------------------------------------=
-
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------enig81C57451C76C1036D6DD1E50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIQyzoG9cfwmwwEtoRCG5GAJ93LSrw6YNUA6GxSkaifQd+O1dN2QCfapwM
iQHP9Y2HkbhG44jFQ27nOP0=
=GOBS
-----END PGP SIGNATURE-----

--------------enig81C57451C76C1036D6DD1E50--
