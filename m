Return-Path: <manuel.nickschas@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 473046007C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 10:06:40 +0000 (UTC)
Received: from ulm-dc01.bmw-carit.intra ([172.20.0.50]:60617
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128) (Exim 4.76)
	(envelope-from <Manuel.Nickschas@bmw-carit.de>) id 1UpblE-0003U3-2I
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jun 2013 12:06:36 +0200
Received: from luxon.localnet (172.20.20.79) by ULM-DC01.bmw-carit.intra
	(172.20.0.50) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Thu, 20 Jun 2013 12:06:36 +0200
X-CTCH-RefID: str=0001.0A0C0206.51C2D42C.01E9, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Manuel Nickschas <manuel.nickschas@bmw-carit.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Jun 2013 12:06:31 +0200
Message-ID: <137188331.qH2f3OD9K1@luxon>
Organization: BMW Car IT GmbH
User-Agent: KMail/4.11 pre (Linux/3.8.8-gentoo; KDE/4.10.60; x86_64;
	git-23a95d8; 2013-05-21)
In-Reply-To: <51B61BBB.1030508@herbrechtsmeier.net>
References: <3389668.90m8Qn9G8H@luxon> <16136190.1I5tgHWYiU@luxon>
	<51B61BBB.1030508@herbrechtsmeier.net>
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
X-List-Received-Date: Thu, 20 Jun 2013 10:06:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 10 June 2013 20:32:27 Stefan Herbrechtsmeier wrote:
> Am 10.06.2013 16:09, schrieb Manuel Nickschas:
> > On Friday 24 May 2013 16:56:41 Stefan Herbrechtsmeier wrote:
> >> All paths in the target sysroot represents the path on the target.=
 They
> >> should be
> >> adapted via an variable or automatically detected during runtime.
> >=20
> > What would be the proper way of doing this in the CMake files shipp=
ed=20
by
> > Qt5?
> >=20
> > /usr/bin/qt5/moc is hard-coded. We could prepend that with
> > ${STAGING_DIR_NATIVE} maybe, which could be exported (via
> > EXTRA_OECMAKE) by recipes so it's picked up by CMake, and it would
> > resolve to nothing if it's not set (so the CMake file would still w=
ork
> > outside of Bitbake).
>=20
> You can try to import the executable from a file passed via -P parame=
ter
> to cmake. I'm not sure if this works.

It does not; -P is for processing a cmake script (see -E), but you can'=
t use it=20
to prepend a normal cmake file, unfortunately. I didn't find any other =
option=20
that would allow to do that, either.

> add_executable(Qt5::rcc IMPORTED)
> set_target_properties(Qt5::rcc PROPERTIES IMPORTED_LOCATION
> "${STAGING_BINDIR_NATIVE}/rcc4")

This gave me the idea for an ugly workaround at least; I can overwrite =
the=20
location in my project's CMakeLists.txt after processing=20
find_package(Qt5Core). Or I could check if something like qtpaths.cmake=
=20
exists in the source dir and include that conditionally at this point.

To avoid Yocto-specific hacks ending up in the upstream repo, I think t=
he=20
best workaround for now would be to have my recipe patch the=20
CMakeLists.txt to include a generated file that overwrites the location=
s.

But this really should be properly fixed in meta-qt5, by modifying the=20=

relevant *Config.cmake files in such a way that the native tools are us=
ed=20
when something is built by Bitbake (e.g. by setting some variable), and=
 the=20
target tools in case someone compiles manually on the target. We=20
shouldn't force developers to have to include hackish workarounds in th=
eir=20
own recipes, or worse, their upstream code. With the proliferation of Q=
t5 in=20
the embedded space, and the fact that CMake is the de-facto build syste=
m=20
for Qt-based things these days, it's a problem that will come up quite =
often=20
in the future and deserves a global solution.

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

