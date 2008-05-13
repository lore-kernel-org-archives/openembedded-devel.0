Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1Jw3fF-00006M-Qd
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 May 2008 01:12:09 +0200
Received: (qmail invoked by alias); 13 May 2008 23:10:40 -0000
Received: from e178124085.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.124.85]
	by mail.gmx.net (mp025) with SMTP; 14 May 2008 01:10:40 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19w5Kg0j/xwNFpYgdxS09h9BJbzbNu8jgrH1MZDFm
	N4Z6Vm9C/JgpCR
Message-ID: <482A1FEC.5000804@gmx.net>
Date: Wed, 14 May 2008 01:10:36 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.12 (X11/20080420)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080509153032.79D501892D4@amethyst.openembedded.net>
In-Reply-To: <20080509153032.79D501892D4@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] org.oe.dev classpath-native_0.97.1.bb : add from OM mtn
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 13 May 2008 23:12:10 -0000
X-Groupsio-MsgNum: 5170
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig57098732EB13F255C30A0EB9"

--------------enig57098732EB13F255C30A0EB9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
I would like this commit to be reverted. While it may look logical to go
from one below 1.0 release to another something important changed in
classpath in that release and makes bootstrapping far more complicated.

The problem is that from 0.97 onwards, a classpath build needs a working
javah tool. this program is a header generator which creates C header
files from compiled Java classes. Such a javah program is provided by
the classpath tools but needs a working runtime and class library first.

Earlier classpath releases had pre-generated header files and needed no
javah program.

There are multiple ways to fix this issue. One way would involve
upstream allowing the just built javah application being run with a
provided java executable. This would be less pain for us and would also
benefit other cross compilation efforts.

Regards
Robert

xora commit schrieb:
> classpath-native_0.97.1.bb : add from OM mtn
>=20
> Author: xora@openembedded.org
> Branch: org.openembedded.dev
> Revision: 3607c00052ba968a5052e6b5f44f6cb522a38d8b
> ViewMTN: http://monotone.openembedded.org/revision/info/3607c00052ba968=
a5052e6b5f44f6cb522a38d8b
> Files:
> 1
> packages/classpath/classpath-native_0.97.1.bb
> Diffs:
>=20
> #
> # mt diff -r471eef0dd55e52c8e89d42f17ff7a3c920452d9f -r3607c00052ba968a=
5052e6b5f44f6cb522a38d8b
> #
> #
> #
> # add_file "packages/classpath/classpath-native_0.97.1.bb"
> #  content [4b052ebae756323751932779865b45cf50a920fa]
> #
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/classpath/classpath-native_0.97.1.bb	4b052ebae756323751932=
779865b45cf50a920fa
> +++ packages/classpath/classpath-native_0.97.1.bb	4b052ebae756323751932=
779865b45cf50a920fa
> @@ -0,0 +1,3 @@
> +require classpath-native.inc
> +
> +PR =3D "r0"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commit=
s
>=20



--------------enig57098732EB13F255C30A0EB9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIKh/vG9cfwmwwEtoRCJEBAJ9qOjnJlaOPLgNG/bq7jtg6fATlkACePLGX
Vvzbshjh3QogTO7v9FlxpL8=
=pdSF
-----END PGP SIGNATURE-----

--------------enig57098732EB13F255C30A0EB9--
