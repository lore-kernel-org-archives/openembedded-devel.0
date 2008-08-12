Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KSm0z-00080U-Ep
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Aug 2008 07:01:49 +0200
Received: (qmail invoked by alias); 12 Aug 2008 05:01:17 -0000
Received: from e178095193.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.95.193]
	by mail.gmx.net (mp021) with SMTP; 12 Aug 2008 07:01:17 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+FksU6YDWFEoZlzKBsizRwg9CYhjlmha80oCEtbw
	wBSymfnMsfaVXX
Message-ID: <48A11982.9080202@gmx.net>
Date: Tue, 12 Aug 2008 07:02:58 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080726102720.537D9189322@amethyst.openembedded.net>
In-Reply-To: <20080726102720.537D9189322@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.00
Subject: Re: [oe-commits] org.oe.dev Fix horribly broken util-linux-ng 2.14 for	uclibc. It also needs a new config option in .config of	uclibc to enable
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
X-List-Received-Date: Tue, 12 Aug 2008 05:01:49 -0000
X-Groupsio-MsgNum: 5723
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig7520EBF2BDD171648C0AD1A3"

--------------enig7520EBF2BDD171648C0AD1A3
Content-Type: multipart/mixed;
 boundary="------------030503090000020602070907"

--------------030503090000020602070907
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem,

khem commit schrieb:
> Fix horribly broken util-linux-ng 2.14 for uclibc. It also needs a new =
config option in .config of uclibc to enable=20
> UCLIBC_HAS_PROGRAM_INVOCATION_NAME=3Dy
> UCLIBC_HAS___PROGNAME=3Dy
>=20
> These should be enabled in uclibc.distro files. I will seek permission =
to add those if not we can always fix util-linux-ng to define __progname.=

>=20
> Author: khem@openembedded.org
> Branch: org.openembedded.dev
> Revision: b86db14f5edd4f268d21ba089697b479d09548ce
> ViewMTN: http://monotone.openembedded.org/revision/info/b86db14f5edd4f2=
68d21ba089697b479d09548ce
> Files:
> 1
> packages/util-linux-ng/util-linux-ng-2.14
> packages/util-linux-ng/util-linux-ng-2.14/util-linux-ng-uclibc-versions=
ort.patch
> packages/util-linux-ng/util-linux-ng_2.14.bb
> Diffs:
>=20
> #
> # mt diff -r91a47e622b5c8c28247219a17c0f4fe751e9a7cd -rb86db14f5edd4f26=
8d21ba089697b479d09548ce
As said this commit alone does not make util-linux-ng compile against
uclibc (0.9.29). While UCLIBC_HAS___PROGNAME=3Dy is already set
UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not. After doing so util-linux-ng
compiles nicely.

Would the attached patch be accepted?

Regards
Robert

--------------030503090000020602070907
Content-Type: text/x-patch;
 name="oe-uclibc-program_invocation_name.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="oe-uclibc-program_invocation_name.patch"

#
# old_revision [3409bc1c06c4e7b69c7d0d59afa555dac069ccfa]
#
# patch "packages/uclibc/uclibc-0.9.29/uClibc.distro"
#  from [cf89107fd4379acbf2713de1b289276ce66783d2]
#    to [5ab6fa024000a05eedaae60094004a19f23b49cd]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/uclibc/uclibc-0.9.29/uClibc.distro	cf89107fd4379acbf2713de1b=
289276ce66783d2
+++ packages/uclibc/uclibc-0.9.29/uClibc.distro	5ab6fa024000a05eedaae6009=
4004a19f23b49cd
@@ -28,7 +28,7 @@ UCLIBC_HAS_SHADOW=3Dy
 UCLIBC_SUSV3_LEGACY=3Dy
 UCLIBC_SUSV3_LEGACY_MACROS=3Dy
 UCLIBC_HAS_SHADOW=3Dy
-# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=3Dy
 UCLIBC_HAS___PROGNAME=3Dy
 UNIX98PTY_ONLY=3Dy
 ASSUME_DEVPTS=3Dy

--------------030503090000020602070907--

--------------enig7520EBF2BDD171648C0AD1A3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkihGYUACgkQG9cfwmwwEtoE1wCfSJmDxaxsB5vFcTUxM+jVz1vb
OMEAn1LUjU0FX0MoGfw+ny3OSaQEihs1
=OZWW
-----END PGP SIGNATURE-----

--------------enig7520EBF2BDD171648C0AD1A3--
