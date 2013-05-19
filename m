Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Ue1jJ-0003Q6-Tr
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 13:24:46 +0200
Received: (qmail 6180 invoked by uid 1003); 19 May 2013 11:06:26 -0000
Received: from unknown (HELO ?192.168.0.60?)
	(philip@opensdr.com@75.136.226.207)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	19 May 2013 11:06:26 -0000
Message-ID: <5198B21A.5090907@balister.org>
Date: Sun, 19 May 2013 07:06:02 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1368457185-8140-1-git-send-email-philip@balister.org>
	<20130519073217.GA3196@jama>
In-Reply-To: <20130519073217.GA3196@jama>
X-Enigmail-Version: 1.5.1
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] gnuradio : Update recipe to build on all machines again.
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
X-List-Received-Date: Sun, 19 May 2013 11:24:47 -0000
X-Groupsio-MsgNum: 44784
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="----enig2MXRDICFGBDUVABMQGLEO"

------enig2MXRDICFGBDUVABMQGLEO
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 05/19/2013 03:32 AM, Martin Jansa wrote:
> On Mon, May 13, 2013 at 10:59:45AM -0400, Philip Balister wrote:
>> Also updated the git repo address after recent changes in hosting.
>>
>> The recipe failed to build for machines without neon as a tune feature=
=2E
>> The cmake config options have been changed so that it configures prope=
rly
>> now.
>>
>> Test on armv7a, x86, and x86-64.
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 10 +++-------=

>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/m=
eta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
>> index edd4615..9e6998b 100644
>> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
>> +++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
>> @@ -70,7 +70,7 @@ SRCREV =3D "5f69899e059e9bea58f92af61f70fc3f63825087=
"
>>  GIT_REPO =3D "gnuradio.git"
>>  GIT_BRANCH =3D "master"
>> =20
>> -SRC_URI =3D "git://gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH};pr=
otocol=3Dgit \
>> +SRC_URI =3D "git://git.gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH=
};protocol=3Dgit \
>>  "
>> =20
>>  S=3D"${WORKDIR}/git"
>> @@ -88,15 +88,11 @@ EXTRA_OECMAKE =3D "-DENABLE_GR_ATSC=3DFALSE \
>>                   -DQT_LIBRARY_DIR=3D${STAGING_LIBDIR} \
>>                   -DQT_QTCORE_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQ=
tCore.so \
>>                   -DQT_QTGUI_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQt=
Gui.so \
>> +                 ${@base_contains('TUNE_FEATURES', 'neon', \
>> +                     '-Dhave_mfpu_neon=3D1', '-Dhave_mfpu_neon=3D0', =
d)} \
>>  "
>> =20
>>  inherit distutils-base cmake pkgconfig
>> =20
>>  EXTRA_OEMAKE =3D "-C ${OECMAKE_BUILDPATH}"
>> =20
>> -# Only builds for machines with neon instructions. Problem is in upst=
ream cmake.
>> -python () {
>> -    if not oe.utils.contains ('TUNE_FEATURES', 'neon', True, False, d=
):
>> -        raise bb.parse.SkipPackage("'neon' not in TUNE_FEATURES")
>> -}
>=20
> Hi,=20
>=20
> this enables gnuradio to build on qemu* MACHINEs I'm testing and it
> failed on all 3 because of docs generation, can you disable it?
>=20
> | [ 20%] /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/ar=
mv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trellis.=
xml:6: warning: failed to load external entity "/home/jenkins/oe/shr-core=
-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.=
4.1-r0/git/gr-trellis/doc/docbookx.dtd"
> | ]>
> |   ^
> | warning: failed to load external entity "/home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1=
-r0/git/gr-trellis/doc/docbookx.dtd"
> | validity error : Could not load the external subset "docbookx.dtd"
> | Document /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/=
armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trelli=
s.xml does not validate
>=20

Thanks. Do you want me to make a new patch including that and resend?

It built on my machine, I wonder if there is a host contamination issue?

Philip

> Cheers,
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20


------enig2MXRDICFGBDUVABMQGLEO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJRmLIqAAoJEMDJd4rr0merBv4H/1XjPi4fRp6GjYC6fyKaCRi2
2k0vbUJxX+di16n4uxXuqVfOFeJC0V7YcMix7APALSlQapsMxcXVzEofxmR1Rpag
yFd+rAVjkp00ClN5z1TlWW7QZrynhwbqZGFl2xWR2sWy6r9wDR4InAdWoT75dZ6x
50TN3ZDRuVbvjVp6DmIu98fE0RcfV+1zy26QqR7jyYYnSQrsZfQVshVaVDXw8eRe
LDnMeSlBIoIj0xlGh13ROiqEyTZ/DxCKljKYF2d/ikjfLBROyaxTsjG9BWHUrWDQ
xSHZ/Hs8plir96MW9H40LHBQUpJnZ1TMPb0g6AepylsRE62McbJiwMmDfm3h0Z8=
=pFo1
-----END PGP SIGNATURE-----

------enig2MXRDICFGBDUVABMQGLEO--
