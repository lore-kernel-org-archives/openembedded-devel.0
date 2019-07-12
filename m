Return-Path: <prvs=0897dbaa6=Mikko.Rapeli@bmw.de>
Received: from esa1.bmw.c3s2.iphmx.com (esa1.bmw.c3s2.iphmx.com
	[68.232.133.201])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB317F14A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 13:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1562938545; x=1594474545;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=m3YY3dB5O0jI08XSvdJlfTmgjRBXN+cGTLqRwJsju7I=;
	b=ErXutT49qe19wXoIbuVWqeuaLsDAhjC2w5PK1BgIq79qVOmpzuJbkmGA
	FLQCGBOeDiK0DzvXlsftPtpLAeimmk3FWa/LInGLstBrJD5UtLo3nxXSq
	xwhSKOEygx3bnJx3x+bpucJFU5cth8RYTJtfes2RbS8uljRcITh7gaBCw 4=;
IronPort-SDR: yTzNbY5VVNX8ouH+UhW5YN2CSIVolLT9zh7HHzeKAnYbPVqHov7VuvFfnRtTlW92eMF0UIlyDT
	aUYHqwhsUNiRQKnG9Icf1hp4XIdZBoQ8mtK2gDBoaguaSLMzFE4nxKxMmW4swQmnGVcBZ8TPYQ
	YZ/5oCB54ENfkfK+pCLYjRDSYYFvKJp4fOqB+OEHMXNMrLYQeNA0MqGx+bsKI0H/k+Q9iJKZIn
	5LixRISQdDvGaE0Tfu4PVZVARppnn8N4nMbZeX/MTMNSe6+KiqbaIw4kXKEW5EM3pwlB9EhSFW
	+Cg=
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa1.bmw.c3s2.iphmx.com with ESMTP/TLS; 12 Jul 2019 15:35:44 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw3.muc with ESMTP/TLS;
	12 Jul 2019 15:35:43 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb3.muc with ESMTP/TLS; 12 Jul 2019 15:35:43 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Fri, 12 Jul 2019 15:35:43 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Fri, 12 Jul 2019 15:35:43 +0200
From: <Mikko.Rapeli@bmw.de>
To: <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] protobuf: fix ptest compilation with
	hardening flags
Thread-Index: AQHVOKTDQRAw8+Q0sk2sggqG8N/9FKbGxB6AgAAAhgCAABXzgA==
Date: Fri, 12 Jul 2019 13:35:43 +0000
Message-ID: <20190712133543.GI3459@hiutale>
References: <1562930807-28919-1-git-send-email-mikko.rapeli@bmw.de>
	<CA+chaQe9QVLqAos53+svN0-V-9+hF=xgWEvyhR8bLGP-gL-Dow@mail.gmail.com>
	<CA+chaQdVMV=WmqzR0FAD7N4YvLxhe8scWBPw0TXgJDGQmA3auw@mail.gmail.com>
In-Reply-To: <CA+chaQdVMV=WmqzR0FAD7N4YvLxhe8scWBPw0TXgJDGQmA3auw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.42]
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] protobuf: fix ptest compilation with hardening flags
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jul 2019 13:35:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FB309E48BF915C47A28137FD56B71BF4@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2019 at 02:17:10PM +0200, Martin Jansa wrote:
> Nevermind, now I see that your changes is based on top of mine.
>=20
> Will re-test with your change - strange that I wasn't seeing it here, I d=
o
> have security-flags as well as ptest enabled as well.

Yes, my change is on top of latest master with your changes. I saw it in
a larger project tree but reproduced with hardening flags and ptest support
in plain poky + meta-openembedded upstream build.

-Mikko

> On Fri, Jul 12, 2019 at 2:15 PM Martin Jansa <martin.jansa@gmail.com> wro=
te:
>=20
> > Doesn't
> > http://git.openembedded.org/meta-openembedded/commit/?id=3Da2fac5a0a484=
8c2486cb3982f930f45f04469860 resolve
> > the same?
> >
> > Your change might be better (then we should partially revert mine),
> > because I'm still seeing some recipes which depend on protobuf failing =
with
> > similar errors like protobuf itself did.
> >
> > On Fri, Jul 12, 2019 at 1:58 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrot=
e:
> >
> >> Build fails when conf/local.conf has both hardening and ptests enabled=
:
> >>
> >> require conf/distro/include/security_flags.inc
> >>
> >> DISTRO_FEATURES_append =3D " ptest"
> >>
> >> Use CXXFLAGS for examples too to avoid hardening warnings
> >> about using O0 optimization.
> >>
> >> Then change linking order to avoid linker failures:
> >>
> >> aarch64-poky-linux-g++  -fstack-protector-strong  -D_FORTIFY_SOURCE=3D=
2
> >> -Wformat -Wformat-security -Werror=3Dform
> >> at-security -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wformat
> >> -Wformat-security -Werror=3Dformat-security
> >>
> >> --sysroot=3D/home/builder/src/base/build/tmp/work/aarch64-poky-linux/p=
rotobuf/3.8.0-r0/recipe-sysroot
> >>  -O2 -pipe -g -feliminate-unused-debug-types
> >> -fmacro-prefix-map=3D/home/builder/src/base/build/tmp/work/aar
> >> ch64-poky-linux/protobuf/3.8.0-r0=3D/usr/src/debug/protobuf/3.8.0-r0
> >>               -fdebug-pre
> >>
> >> fix-map=3D/home/builder/src/base/build/tmp/work/aarch64-poky-linux/pro=
tobuf/3.8.0-r0=3D/usr/src/debug/pr
> >> otobuf/3.8.0-r0
> >> -fdebug-prefix-map=3D/home/builder/src/base/build/tmp/work/aarch6
> >> 4-poky-linux/protobuf/3.8.0-r0/recipe-sysroot=3D
> >> -fdebug-prefix-map=3D/home/builder/src
> >> /base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysro=
ot-native=3D
> >> -fvisibility-inlin
> >> es-hidden -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> >> -fstack-protector-strong -Wl,-z,relro,-z,now -fstack-p
> >> rotector-strong -Wl,-z,relro,-z,now -pthread
> >> -I/home/builder/src/base/build/tmp/work/aarch64-poky-linux/p
> >> rotobuf/3.8.0-r0/git/src
> >> -L/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.=
8.0-r
> >> 0/git/src/.libs
> >> -L/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.=
8.0-r0/re
> >> cipe-sysroot/usr/lib -lprotobuf
> >> ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc
> >> addressbook.pb.cc -
> >> o add_person_cpp
> >>
> >> /home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.=
0-r0/recipe-sysroot-native/usr
> >> /bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-p=
oky-linux/9.1.0/ld:
> >> ../src/google/protobuf/.libs/timestamp.pb.o: in function
> >> `google::protobuf::Timestamp::SerializeWithCachedSizes(google::protobu=
f::io::CodedOutputStream*)
> >> const':
> >> /usr/src/debug/protobuf/3.8.0-r0/git/src/google/protobuf/
> >> timestamp.pb.cc:279: undefined reference to
> >> `google::protobuf::internal::WireFormat::SerializeUnknownFields(google=
::protobuf::UnknownFieldSet
> >> const&, google::protobuf::io::CodedOutputStream*)'
> >>
> >> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> >> ---
> >>  .../0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch  =
 |
> >> 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git
> >> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-re=
spect-CXX-LDFLAGS-variables-fix-.patch
> >> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-re=
spect-CXX-LDFLAGS-variables-fix-.patch
> >> index 029abfd..0a2e5e2 100644
> >> ---
> >> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-re=
spect-CXX-LDFLAGS-variables-fix-.patch
> >> +++
> >> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-re=
spect-CXX-LDFLAGS-variables-fix-.patch
> >> @@ -45,12 +45,12 @@ index 4ad605641..31d887639 100644
> >>   add_person_cpp: add_person.cc protoc_middleman
> >>         pkg-config --cflags protobuf  # fails if protobuf is not insta=
lled
> >>  -      c++ add_person.cc addressbook.pb.cc -o add_person_cpp
> >> `pkg-config --cflags --libs protobuf`
> >> -+      $(CXX) $(LDFLAGS) $(PROTOBUF)
> >> ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc
> >> addressbook.pb.cc -o add_person_cpp
> >> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> >> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc
> >> addressbook.pb.cc -o add_person_cpp
> >>
> >>   list_people_cpp: list_people.cc protoc_middleman
> >>         pkg-config --cflags protobuf  # fails if protobuf is not insta=
lled
> >>  -      c++ list_people.cc addressbook.pb.cc -o list_people_cpp
> >> `pkg-config --cflags --libs protobuf`
> >> -+      $(CXX) $(LDFLAGS) $(PROTOBUF)
> >> ../src/google/protobuf/.libs/timestamp.pb.o list_people.cc
> >> addressbook.pb.cc -o list_people_cpp
> >> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> >> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc
> >> addressbook.pb.cc -o list_people_cpp
> >>
> >>   add_person_dart: add_person.dart protoc_middleman_dart
> >>
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >=

