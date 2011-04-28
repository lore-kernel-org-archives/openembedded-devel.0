Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QFWxD-0000v5-Q4 for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 21:32:47 +0200
Received: from g225080101.adsl.alicedsl.de ([92.225.80.101]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QFWvb-0002I9-9x for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 19:31:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DB9283C.1030602@cioinfoindus.fr>
References: <4DB82E7C.9080206@cioinfoindus.fr>
	<1303936802.4833.8.camel@mattotaupa> <4DB9283C.1030602@cioinfoindus.fr>
Date: Thu, 28 Apr 2011 21:30:15 +0200
Message-ID: <1304019015.3911.19.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/2] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Thu, 28 Apr 2011 19:32:47 -0000
X-Groupsio-MsgNum: 31511
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-k0NpXiZMIZyAUooLE1LS"

--=-k0NpXiZMIZyAUooLE1LS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


Am Donnerstag, den 28.04.2011, 10:41 +0200 schrieb Christian Charreyre:

> sorry for all these mistakes,

no problem at all.

> it is my first patch submission and I'm not quite operational ....

I hope there will be a lot more. ;-)

> A few questions for some of your comments :
>=20
> Le 27/04/2011 22:40, Paul Menzel a =C3=A9crit :

> > Am Mittwoch, den 27.04.2011, 16:55 +0200 schrieb Christian Charreyre:
> >
> >> this new recipe will build the painting soft mypaint.
> > thank you for your patches.
> >
> >> In order to correctly run on the target, it is necessary to add new
> >> recipes dependencies in python-numpy recipe.
> >>
> >> Here are the two patches.
> >>
> >> Hoping it will be valuable.
> > Please send each patch separately using `git send-email` or using your
> > mail program and removing the first From line and past the subject into
> > the according field of your mailer.
> >
> When you says "send each patch separetely", do you lean that I must=20
> split "recipes/mypaint/files/scons-adapt.patch" and=20
> "recipes/mypaint/mypaint_0.9.1.bb" in 2 separate patches, or that I must=
=20
> split those related to mypaint and those related to python-numpy ? The=
=20
> second alternative has been done.

My bet. Reading the two Signed-off-by lines got me on the wrong track in
the beginning. Please ignore my comment.

> I was thinking that when 2 files changes are correlated, they must be in=
=20
> the same patch, no ?

You are of course right on this point. I am sorry.

> >>    From 0cc6d007fecb3ad7f5d09a9d4897d506a5c41d39 Mon Sep 17 00:00:00 2=
001
> >> From: C. Charreyre<christian.charreyre@cioinfoindus.fr>
> > A space is missing. You can set it up correctly using `git config`.
> I suppose the missing space is before the 2nd From with my email=20
> address. Is is ok ?

That is correct. My comments always refer two the last line above.

> >> Date: Thu, 21 Apr 2011 16:40:54 +0200
> >> Subject: [PATCH] mypaint: new recipe for version 0.9.1

I forgot. Please add also a note what build configuration you used.

> >> Signed-off-by: C. Charreyre<christian.charreyre@cioinfoindus.fr>
> >> ---
> >>     recipes/mypaint/files/scons-adapt.patch |   20 +++++++++++++++++
> >>     recipes/mypaint/mypaint_0.9.1.bb        |   36
> >> +++++++++++++++++++++++++++++++
> > Your mail program mangled the patch. Please resend as `[PATCH v2]` and
> > remember to turn off line wrapping.
> OK, noted.
> >>     2 files changed, 56 insertions(+), 0 deletions(-)
> >>     create mode 100644 recipes/mypaint/files/scons-adapt.patch
> >>     create mode 100644 recipes/mypaint/mypaint_0.9.1.bb
> >>
> >> diff --git a/recipes/mypaint/files/scons-adapt.patch
> >> b/recipes/mypaint/files/scons-adapt.patch
> >> new file mode 100644
> >> index 0000000..dcad6db
> >> --- /dev/null
> >> +++ b/recipes/mypaint/files/scons-adapt.patch
> >> @@ -0,0 +1,20 @@
> >> +Author: Christian Charreyre<christian.charreyre@cioinfoindus.fr>
> >> +
> >> +Adapt scons to OE
> >> +Index: mypaint-0.9.1/lib/SConscript
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- mypaint-0.9.1.orig/lib/SConscript    2011-04-21 11:31:29.00000000=
0
> >> +0200
> >> ++++ mypaint-0.9.1/lib/SConscript    2011-04-21 11:35:30.000000000 +02=
00
> >> +@@ -1,5 +1,11 @@
> >> + Import('env')
> >> +-import sys
> >> ++import sys, os
> >> ++env.Replace(SHCXX =3D os.environ['CXX'])
> >> ++env.Replace(SHLINK =3D os.environ['CXX'])
> >> ++env.Replace(LDMODULEFLAGS =3D os.environ['TARGET_LDFLAGS'])
> >> ++env.Append(LDMODULEFLAGS =3D ['-Wl,--hash-style=3Dgnu'])
> >> ++env.Append(LDMODULEFLAGS =3D ['-shared'])
> >> ++env.Replace(PATH =3D os.environ['PATH'])
> > Did you send this upstream so that they can improve the build system fo=
r
> > cross compilation?
> I think I can't send it upstream, because this is specific to OE=20
> (TARGET_LDFLAGS for instance is defined by OE).
> In fact I didn't knew scons at all, and there are very few recipes with=
=20
> this compilation system, so I have tried to have mypaint successfully=20
> cross-compiled in OE with this patch.
> If someone can improve that, it would be fine.

Maybe you can just report an issue upstream that cross compilation
fails.

[=E2=80=A6]

> >> +SRC_URI =3D "http://download.gna.org/mypaint/${PN}-${PV}.tar.bz2 \
> >> +    file://scons-adapt.patch \
> >> +"
> >> +
> >> +inherit distutils scons
> >> +
> >> +do_compile() {
> >> +    STAGING_INCDIR=3D${STAGING_INCDIR} \
> >> +    STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> >> +    BUILD_SYS=3D${BUILD_SYS} \
> >> +    HOST_SYS=3D${HOST_SYS} \
> >> +    PATH=3D${PATH} scons_do_compile
> >> +}
> > I do not know Scons, but it looks strange that the above is needed and
> > not done automatically.
> Same reply as above, there are few recipes with scons, I've found this=
=20
> tip in one recipe and applied it here to get the build completed.

I understand. Did you try with the default `do_compile`? If it does not
work leave it so it works.

> >> +
> >> +do_install() {
> >> +    BUILD_SYS=3D${BUILD_SYS} \
> >> +    HOST_SYS=3D${HOST_SYS} \
> >> +    scons_do_install
> >> +}
> >> +
> >> +FILES_${PN} +=3D "${datadir}"
> >> +
> >> +SRC_URI[md5sum] =3D "6249a16359a438d6dc658f5765b35515"
> >> +SRC_URI[sha256sum] =3D
> >> "407b599f62fb0d6e711fee57d22e64d3aec88825364fb5f7f73b9f0940aa7aed"
> > Please put it right at the top under `SRC_URI`.
> I don't understand what is the problem. What part has to be placed under=
=20
> 'SRC_URI' ?

`SRC_URI =3D "http://download.gna.org/mypaint/=E2=80=A6` is defined at the =
top.
Put the checksums right below it.

[=E2=80=A6]

> Thanks for your comments that will improve my future submissions.

Thank you for your response. I hope we will get your next patch
iteration included.


Thanks,

Paul

--=-k0NpXiZMIZyAUooLE1LS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk25wEcACgkQPX1aK2wOHVjBewCeNcFU8eWFOBBAp7RKtyCIN2d7
bxkAoIzgxk0+EIXjpCcp/SJjV7qjasWm
=VCZN
-----END PGP SIGNATURE-----

--=-k0NpXiZMIZyAUooLE1LS--
