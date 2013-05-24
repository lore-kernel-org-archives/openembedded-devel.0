Return-Path: <manuel.nickschas@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 4CECC6223C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 10:05:10 +0000 (UTC)
Received: from ulm-dc01.bmw-carit.intra ([172.20.0.50]:9619
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128) (Exim 4.76)
	(envelope-from <Manuel.Nickschas@bmw-carit.de>) id 1Uforq-0001mn-36
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 May 2013 12:04:59 +0200
Received: from luxon.localnet (172.20.20.62) by ULM-DC01.bmw-carit.intra
	(172.20.0.50) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Fri, 24 May 2013 12:04:57 +0200
X-CTCH-RefID: str=0001.0A0C0207.519F3B4B.011D, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Manuel Nickschas <manuel.nickschas@bmw-carit.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 May 2013 12:04:54 +0200
Message-ID: <3360048.L8lNidcH0T@luxon>
Organization: BMW Car IT GmbH
User-Agent: KMail/4.11 pre (Linux/3.8.6-gentoo; KDE/4.10.60; x86_64;
	git-23a95d8; 2013-05-21)
MIME-Version: 1.0
X-Originating-IP: [172.20.20.62]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Qt5 and CMake in OE/Yocto
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
X-List-Received-Date: Fri, 24 May 2013 10:05:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

we're trying to deploy a Qt5-based piece of software on a Yocto system =
(I=20
hope this is on topic for this mailing list as well; the issue I'm abou=
t to=20
describe should occur on pure OE too). As build system for this softwar=
e, we=20
use CMake.=20

We've added meta-qt5 (master) and successfully installed qtbase on the=20=

platform. However, there is a serious issue if one tries to cross-compi=
le=20
CMake-based software against the resulting Qt5 installation.

As you probably know, Qt5 ships its own support for CMake in the form o=
f a=20
bunch of Qt5$ModuleConfig.cmake files somewhere in /usr/lib/cmake.=20
These files are found with a find_package(Qt5Core) call and set everyth=
ing=20
needed for building against the Qt5 installation. The problem is, that =
those=20
files contain absolute paths to both the libraries and the host tools f=
or=20
building (such as moc, rcc etc).

meta-qt5 actually installs two sets of CMake files for Qt5, one in the =
target=20
sysroot (from the qtbase package) and one in the native sysroot (from t=
he=20
qtbase-native package). A recipe inheriting cmake.bbclass will find the=
 ones=20
in the target sysroot.

The issue is that these files hardcode the paths *on the target*, i.e. =
they try=20
to find the host tools in /usr/bin/qt5/ and the libraries in /usr/lib/.=
 Obviously,=20
this fails when trying to build against those, because the target sysro=
ot path=20
isn't prepended.

If I remove the CMake files from the target sysroot (could not figure o=
ut how=20
to force it otherwise in my recipe), the ones from the native sysroot a=
re found=20
and used instead. These actually contain proper paths into the native=20=

sysroot, so the build tools - like moc - are found and the program comp=
iles=20
successfully - but it can't link, because it then tries to link to the =
libraries in=20
the native sysroot. And those are, of course, built for the wrong archi=
tecture.

I'm at a loss as of how to properly fix this issue. What we need is a s=
et of=20
CMake config files for Qt5 that point to the tools in the native sysroo=
t and the=20
libraries in the target sysroot. However, we probably wouldn't want to =
deploy=20
them as such on the target (because there we want to actually point to =
both=20
tools and libraries in /usr for the target), and we probably also would=
n't want=20
to do it in the native sysroot (because then we couldn't build native t=
hings=20
that like to link to the native libraries).

Of course, I could just copy the CMake files from Qt5, patch them=20
accordingly and ship them as part of my project; but bundling such thin=
gs is=20
evil and I would really like to avoid this.

So now I'm wondering, are people here aware of that issue and have a pl=
an=20
or idea on how to fix this?

https://bugreports.qt-project.org/browse/QTBUG-28922 might be relevant,=
=20
although I am not sure if this is describing a similar issue and if it =
applies to=20
the multiple sysroot approach Yocto uses.

Thank you for any pointers.

Cheers,
~ Sput
--=20
Manuel "Sput" Nickschas * Development Specialist, Head Unit Software
BMW Car IT GmbH * http://www.bmw-carit.de
Embedded Software House Ulm * Lise-Meitner-Str. 14 * 89081 Ulm
-----------------------------------------------------------------------=
------
BMW Car IT GmbH
Gesch=C3=A4ftsf=C3=BChrer: Harald Heinecke und Reinhard Stolle
Sitz und Registergericht: M=C3=BCnchen HRB 134810
-----------------------------------------------------------------------=
------

