Return-Path: <manuel.nickschas@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCB3621CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 14:09:50 +0000 (UTC)
Received: from ulm-dc01.bmw-carit.intra ([172.20.0.50]:33055
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128) (Exim 4.76)
	(envelope-from <Manuel.Nickschas@bmw-carit.de>) id 1Um2n4-0005VJ-1o
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jun 2013 16:09:46 +0200
Received: from luxon.localnet (172.20.20.79) by ULM-DC01.bmw-carit.intra
	(172.20.0.50) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Mon, 10 Jun 2013 16:09:45 +0200
X-CTCH-RefID: str=0001.0A0C0204.51B5DE2A.021A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Manuel Nickschas <manuel.nickschas@bmw-carit.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 10 Jun 2013 16:09:41 +0200
Message-ID: <16136190.1I5tgHWYiU@luxon>
Organization: BMW Car IT GmbH
User-Agent: KMail/4.11 pre (Linux/3.8.8-gentoo; KDE/4.10.60; x86_64;
	git-23a95d8; 2013-05-21)
In-Reply-To: <519F7FA9.60100@herbrechtsmeier.net>
References: <3389668.90m8Qn9G8H@luxon> <5622796.kW1BjNgdNO@luxon>
	<519F7FA9.60100@herbrechtsmeier.net>
MIME-Version: 1.0
X-Originating-IP: [172.20.20.79]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Problems with Qt5 and CMake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jun 2013 14:09:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 24 May 2013 16:56:41 Stefan Herbrechtsmeier wrote:
> Am 24.05.2013 15:03, schrieb Manuel Nickschas:

Hi,

sorry for not replying sooner, I had some other tasks to do and only re=
cently=20
could look into the issue again.

> >> The cmake.class overlays the machine sysroot over the native sysro=
ot=20
and
> >> don't install any binaries into the machine sysroot. Thereby the
> >> find_program function detects the binary in the native sysroot and=
 all
> >> the other find_xxx functions detect the include files and librarie=
s in
> >> the machine sysroot.
> >=20
> > Hm, no, that is not the issue. The issue is that Qt5 uses a fairly =
recent
> > CMake feature where find_package and friends
>=20
> What do you mean by friends?

Well, probably it's only find_package. Not sure if there's other macros=
 that=20
make use of the *Config.cmake feature.

> >   look for a *Config.cmake file
> >=20
> > first, and then use that to set everything up. In case of Qt5, plea=
se have
> > a look at the files Qt5 (the qtbase package) installs into the targ=
et
> > sysroot, in /usr/lib/cmake/.
>=20
> I don't use qt but have similar problems with other cmake projects.
>=20
> > In particular, the issue is with
> > $sysroot/usr/lib/cmake/Qt5Core/Qt5CoreConfigExtras.cmake:
> >=20
> > [...]
> >=20
> >      set_target_properties(Qt5::moc PROPERTIES
> >     =20
> >          IMPORTED_LOCATION "/usr/bin/qt5/moc"
> >     =20
> >      )
> >=20
> > [...]
> >=20
> > and similar for other host binaries such as rcc or qdbusxml2cpp (in=

> > Qt5DBus/Qt5DBusConfigExtras.cmake).
>=20
> If they would use find_program they would get the correct path for mo=
c.

Well, they don't. I'm not sure why Qt upstream believes so much in=20
hardcoded paths, maybe it's so you can manage different Qt installation=
s on=20
the same host. They do the same for qmake, of course, which also contai=
ns=20
hard-coded paths.

Since I don't think we can talk upstream into changing that approach, w=
e=20
have to see how we can workaround that on our end.

> > The path specified there is clearly wrong for cross-compiling, beca=
use it
> > references the location in the target itself, without prepending th=
e
> > sysroot prefix. Thus, it won't find moc. In particular, it needs no=
t even
> > find the moc from the target sysroot, but from the native sysroot, =
as
> > it's a host tool.
> All paths in the target sysroot represents the path on the target. Th=
ey
> should be
> adapted via an variable or automatically detected during runtime.

What would be the proper way of doing this in the CMake files shipped b=
y=20
Qt5?

/usr/bin/qt5/moc is hard-coded. We could prepend that with=20
${STAGING_DIR_NATIVE} maybe, which could be exported (via=20
EXTRA_OECMAKE) by recipes so it's picked up by CMake, and it would=20
resolve to nothing if it's not set (so the CMake file would still work =
outside of=20
Bitbake).

I also had to add

-DCMAKE_AUTOMOC_MOC_OPTIONS=3D'-p.'

because moc generates wrong include paths otherwise.

I'd like to see that handled by some cmake-qt5.bbclass or similar thoug=
h, to=20
lower the burden for developers.

> > Unfortunately, I have no clue how the Qt5 build system ends up=20
generating
> > those paths; I assume it's not using CMake and find_program, but
> > hardcodes the paths somewhere.
> >=20
> > One could probably patch this away, but then you'd end up with host=
-
> > specific absolute paths inside the target, which will then break if=
 you
> > try to use them for compiling something inside the target.
>=20
> You should prepend a variable or use find_program.

The latter idea wouldn't work without completely rewriting Qt's CMake s=
tuff, I=20
think; the former would amount to what I suggested above?

Cheers,
~ Sput
--=20
Manuel "Sput" Nickschas * Development Specialist, Team GENIVI
BMW Car IT GmbH * http://www.bmw-carit.de
Embedded Software House Ulm * Lise-Meitner-Str. 14 * 89081 Ulm
-----------------------------------------------------------------------=
------
BMW Car IT GmbH
Gesch=C3=A4ftsf=C3=BChrer: Harald Heinecke und Reinhard Stolle
Sitz und Registergericht: M=C3=BCnchen HRB 134810
-----------------------------------------------------------------------=
------

