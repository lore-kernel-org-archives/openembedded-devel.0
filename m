Return-Path: <manuel.nickschas@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 7367C61F47
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 13:03:09 +0000 (UTC)
Received: from ulm-dc01.bmw-carit.intra ([172.20.0.50]:40697
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128) (Exim 4.76)
	(envelope-from <Manuel.Nickschas@bmw-carit.de>) id 1UfreF-0005AS-04
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 May 2013 15:03:07 +0200
Received: from luxon.localnet (172.20.20.62) by ULM-DC01.bmw-carit.intra
	(172.20.0.50) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Fri, 24 May 2013 15:03:06 +0200
X-CTCH-RefID: str=0001.0A0C0209.519F650B.010C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Manuel Nickschas <manuel.nickschas@bmw-carit.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 May 2013 15:03:02 +0200
Message-ID: <5622796.kW1BjNgdNO@luxon>
Organization: BMW Car IT GmbH
User-Agent: KMail/4.11 pre (Linux/3.8.6-gentoo; KDE/4.10.60; x86_64;
	git-23a95d8; 2013-05-21)
In-Reply-To: <519F60B9.1020604@herbrechtsmeier.net>
References: <3389668.90m8Qn9G8H@luxon> <20130524120750.GV32431@jama>
	<519F60B9.1020604@herbrechtsmeier.net>
MIME-Version: 1.0
X-Originating-IP: [172.20.20.62]
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
X-List-Received-Date: Fri, 24 May 2013 13:03:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 24 May 2013 14:44:41 Stefan Herbrechtsmeier wrote:

Hi,

> > It would be good to let CMake respect OE_QMAKE_PATH_* variables, so=
=20
you
> > can
> > generate .cmake files with correct paths for target and in OE build=
s
> > override them with OE_QMAKE_PATH_* values to use correct sysroot.
>=20
> CMake offers find_xxx functions and CMAKE_FIND_ROOT_PATH to=20
modify the
> program, include and library paths.
> Or you could use CMAKE_CURRENT_LIST_DIR in a cmake file to get the=20=

path
> of the file.
>=20
> The problem is that its up to the developer to use this functions and=

> that CMake don't support a common way to model the dependencies like=20=

the
> Requires field of pkg-config files.
>=20
> > The same for finding native host tools in
> > OE_QMAKE_PATH_EXTERNAL_HOST_BINS.
>=20
> The cmake.class overlays the machine sysroot over the native sysroot =
and
> don't install any binaries into the machine sysroot. Thereby the
> find_program function detects the binary in the native sysroot and al=
l
> the other find_xxx functions detect the include files and libraries i=
n
> the machine sysroot.

Hm, no, that is not the issue. The issue is that Qt5 uses a fairly rece=
nt=20
CMake feature where find_package and friends look for a *Config.cmake f=
ile=20
first, and then use that to set everything up. In case of Qt5, please h=
ave a=20
look at the files Qt5 (the qtbase package) installs into the target sys=
root, in=20
/usr/lib/cmake/.

In particular, the issue is with=20
$sysroot/usr/lib/cmake/Qt5Core/Qt5CoreConfigExtras.cmake:

[...]
    set_target_properties(Qt5::moc PROPERTIES
        IMPORTED_LOCATION "/usr/bin/qt5/moc"
    )
[...]

and similar for other host binaries such as rcc or qdbusxml2cpp (in=20
Qt5DBus/Qt5DBusConfigExtras.cmake).

The path specified there is clearly wrong for cross-compiling, because =
it=20
references the location in the target itself, without prepending the sy=
sroot=20
prefix. Thus, it won't find moc. In particular, it needs not even find =
the moc=20
from the target sysroot, but from the native sysroot, as it's a host to=
ol.

Unfortunately, I have no clue how the Qt5 build system ends up generati=
ng=20
those paths; I assume it's not using CMake and find_program, but=20
hardcodes the paths somewhere.

One could probably patch this away, but then you'd end up with host-
specific absolute paths inside the target, which will then break if you=
 try to=20
use them for compiling something inside the target.

Or maybe indeed replace the hardcoded path by some CMake variable that=20=

can then be set at cmake runtime to the proper sysroot; not sure if thi=
s would=20
work.

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

