Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id EDD0A74765
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 23:14:25 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id e19-v6so11731012qtp.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 16:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=J3nF09zDE2qBFBf5cXvpO7qQajpX8s+5exqjz7k0wlg=;
	b=G0PdTiEgv23jqbZsY/yjbb23EKHRLAZk6vm0IfbqGCG/C2OGvxGlxzQOS2frXriYQ8
	Kz8wTIuhUNwSUMdX8VkFy0UOcqQuE8lgnmyewNVfrcwt3DY1pHc905AgfkAUQAx5znUV
	AvaNLt2o8wQbdL/icql6Zdj/bCX4gDOiOAQ1rmUBiKuoZlEVNGAgZSmNx3xWeCOHpQvG
	q/m/ZtXMB47//ipzNB+/vWBaZVl3F1TF5nvSIRhAAibahyeFumOsknuokv/HlaDCuvNx
	+kqb+m2aH97NhlNQXEgxAL+NLCdk8HDqMOGHsR1L/ZLXl2uZimF58u+rKqwTomV8Ib1z
	KEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=J3nF09zDE2qBFBf5cXvpO7qQajpX8s+5exqjz7k0wlg=;
	b=mG5RNXbaMeZ28/c7+aDdL24s0gx/Hbo63NnTkjJnFpXDubSaQ5QvZB9+0kHOU8pwMq
	kWn0aTK2yHjDtpsCiXgUNw7uYgnn8js/wGBuPIX6t/iOZcvoDw/EpIDlwjTV2Nf3/412
	AtZ1FKti0lVwWjsqmrJ3UhjXPEvOWEEsMNAUW7oWJwC58t+Bfyx+aIbw7zg7IAvYeWxF
	KKDbNEI0xmhXijF9HcceK5as2PSbNYNdYn6sMc8XAAzxuuUB7cRmDAcnSWlH82bTBEZi
	o27tC082azXUengaEaydLS8VM8v5dhsQFlzjDPo6ZyolTDNFuC8Zuj64pav8Mdg5Y7Zr
	e44w==
X-Gm-Message-State: AOUpUlGWFPbrnuNyVJ5ZrM6I1kGTyC/s7eg1Zle1AdAowfh3AckV56md
	z5OstCsdV+t6PfMaO2qh5DvSwDy4l0PV+yMH1dU=
X-Google-Smtp-Source: AAOMgpfq1iaJl2knvjpkndpKlBWoUbmz43Px0/HBsvrXwHRoUosnxniNZDYwiPMzHLEVcpUd0d2eBGt9hlsSSy8nKoo=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr3992262qta.128.1532128466442; 
	Fri, 20 Jul 2018 16:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <1531980780-138112-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1spShdTYnsMubxu=nGSOcZSk9mcD4JeK512Rgm+MmUgryQ@mail.gmail.com>
	<4001df0b-edea-9ee4-be1a-0f10d1469b06@windriver.com>
In-Reply-To: <4001df0b-edea-9ee4-be1a-0f10d1469b06@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jul 2018 16:14:00 -0700
Message-ID: <CAMKF1sog17N18Q=wmUj3QZYsQktP=8ZO9XVnu-juZhJpn3BXPg@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] protobuf: upgrade 3.5.1 -> 3.6.0.1
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
X-List-Received-Date: Fri, 20 Jul 2018 23:14:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After all patches, this still fails to build native version of
protobuf-c_1.3.0.bb,

On Fri, Jul 20, 2018 at 1:22 AM Changqing Li <changqing.li@windriver.com> w=
rote:
>
>
>
> On 07/20/2018 01:12 AM, Khem Raj wrote:
> > On Wed, Jul 18, 2018 at 11:13 PM <changqing.li@windriver.com> wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> License-Update: copyright year updated and clean some useless content
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   .../0001-protobuf-fix-configure-error.patch        | 33 ++++++++++++=
++++++++++
> >>   .../{protobuf_3.5.1.bb =3D> protobuf_3.6.0.1.bb}     | 14 ++++++---
> >
> > my host has gcc8 and it failed to build native version
> > NOTE: Running task 13158 of 33598
> > (virtual:native:/mnt/a/oe/sources/meta-openembedded/meta-oe/recipes-dev=
tools/protobuf/protobuf-c_1.3.0.bb:do_compile)
> > |                                ^
> > |    vector<pair<string, string> > options;
> > |                      ^
> > | ../git/protoc-c/c_generator.cc:108:29: error: expected
> > primary-expression before =E2=80=98>=E2=80=99 token
> > |    vector<pair<string, string> > options;
> > |                              ^
> > | ../git/protoc-c/c_generator.cc:108:31: error: expected
> > primary-expression before =E2=80=98>=E2=80=99 token
> > |    vector<pair<string, string> > options;
> > |                                ^
> > | ../git/protoc-c/c_generator.cc:108:33: error: =E2=80=98options=E2=80=
=99 was not
> > declared in this scope
> > |    vector<pair<string, string> > options;
> > |                                  ^~~~~~~
> > | ../git/protoc-c/c_generator.cc:152:5: error: =E2=80=98scoped_ptr=E2=
=80=99 was not
> > declared in this scope
> > |      scoped_ptr<io::ZeroCopyOutputStream> output(
> > |      ^~~~~~~~~~
> > | ../git/protoc-c/c_generator.cc:152:5: note: suggested alternative:
> > =E2=80=98sched_param=E2=80=99
> > |      scoped_ptr<io::ZeroCopyOutputStream> output(
> > |      ^~~~~~~~~~
> > |      sched_param
> > | ../git/protoc-c/c_generator.cc:152:40: error: expected
> > primary-expression before =E2=80=98>=E2=80=99 token
> > |      scoped_ptr<io::ZeroCopyOutputStream> output(
> > |                                         ^
> > | ../git/protoc-c/c_generator.cc:152:42: error: =E2=80=98output=E2=80=
=99 was not
> > declared in this scope
> > |      scoped_ptr<io::ZeroCopyOutputStream> output(
> > |                                           ^~~~~~
> > | ../git/protoc-c/c_generator.cc:152:42: note: suggested alternative: =
=E2=80=98getpt=E2=80=99
> > |      scoped_ptr<io::ZeroCopyOutputStream> output(
> > |                                           ^~~~~~
> > |                                           getpt
> > | ../git/protoc-c/c_generator.cc:160:5: error: =E2=80=98scoped_ptr=E2=
=80=99 was not
> > declared in this scope
> > |      scoped_ptr<io::ZeroCopyOutputStream> output(
> > |      ^~~~~~~~~~
> > | ../git/protoc-c/c_generator.cc:160:5: note: suggested alternative:
> > =E2=80=98sched_param=E2=80=99
> > |      scoped_ptr<io::ZeroCopyOutputStream> output(
> > |      ^~~~~~~~~~
> > |      sched_param
> > | ../git/protoc-c/c_generator.cc:160:40: error: expected
> > primary-expression before =E2=80=98>=E2=80=99 token
> > |      scoped_ptr<io::ZeroCopyOutputStream> output(
> > |                                         ^
> > | ../git/protoc-c/c_generator.cc:160:42: error: =E2=80=98output=E2=80=
=99 was not
> > declared in this scope
> > |      scoped_ptr<io::ZeroCopyOutputStream> output(
> > |                                           ^~~~~~
> > | ../git/protoc-c/c_generator.cc:160:42: note: suggested alternative: =
=E2=80=98getpt=E2=80=99
> > |      scoped_ptr<io::ZeroCopyOutputStream> output(
> > |                                           ^~~~~~
> > |                                           getpt
> > | make: *** [Makefile:1497: protoc-c/protoc_gen_c-c_primitive_field.o] =
Error 1
> > | make: *** [Makefile:1441: protoc-c/protoc_gen_c-c_generator.o] Error =
1
> > | ERROR: oe_runmake failed
>
> I have send a patch for protobuf-c to fix this problem and have cc to
> you. Thanks.
>
> //sandy
> >
> >>   2 files changed, 43 insertions(+), 4 deletions(-)
> >>   create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-p=
rotobuf-fix-configure-error.patch
> >>   rename meta-oe/recipes-devtools/protobuf/{protobuf_3.5.1.bb =3D> pro=
tobuf_3.6.0.1.bb} (86%)
> >>
> >> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-=
fix-configure-error.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001=
-protobuf-fix-configure-error.patch
> >> new file mode 100644
> >> index 0000000..a2f7a4b
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-con=
figure-error.patch
> >> @@ -0,0 +1,33 @@
> >> +From 52959e8e01e39139d18f752e97283e45b4b7a426 Mon Sep 17 00:00:00 200=
1
> >> +From: Changqing Li <changqing.li@windriver.com>
> >> +Date: Wed, 18 Jul 2018 17:52:34 +0800
> >> +Subject: [PATCH] protobuf: fix configure error
> >> +
> >> +fix below error:
> >> +gnu-configize: 'configure.ac' or 'configure.in' is required
> >> +
> >> +third_party/googletest is git submodule of protobuf. Above error
> >> +caused by missing submodule googletest.
> >> +
> >> +Upstream-Status: Inappropriate [oe-specific]
> >> +
> >> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> +---
> >> + configure.ac | 1 -
> >> + 1 file changed, 1 deletion(-)
> >> +
> >> +diff --git a/configure.ac b/configure.ac
> >> +index aec10cf..7fbe57d 100644
> >> +--- a/configure.ac
> >> ++++ b/configure.ac
> >> +@@ -214,7 +214,6 @@ AX_CXX_COMPILE_STDCXX([11], [noext], [mandatory])
> >> + #   too.
> >> + export CFLAGS
> >> + export CXXFLAGS
> >> +-AC_CONFIG_SUBDIRS([third_party/googletest])
> >> +
> >> + AC_CONFIG_FILES([Makefile src/Makefile benchmarks/Makefile conforman=
ce/Makefile protobuf.pc protobuf-lite.pc])
> >> + AC_OUTPUT
> >> +--
> >> +2.7.4
> >> +
> >> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb b/met=
a-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
> >> similarity index 86%
> >> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
> >> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
> >> index 8cef391..5850744 100644
> >> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
> >> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
> >> @@ -5,18 +5,19 @@ all of its internal RPC protocols and file formats."
> >>   HOMEPAGE =3D "https://github.com/google/protobuf"
> >>   SECTION =3D "console/tools"
> >>   LICENSE =3D "BSD-3-Clause"
> >> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D35953c752efc9299b184f91bef=
540095"
> >> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8bd=
a4266b"
> >>
> >>   DEPENDS =3D "zlib"
> >>   DEPENDS_append_class-target =3D " protobuf-native"
> >>
> >>   PV .=3D "+git${SRCPV}"
> >> -SRCREV =3D "106ffc04be1abf3ff3399f54ccf149815b287dd9"
> >>
> >> -SRC_URI =3D "git://github.com/google/protobuf.git;branch=3D3.5.x \
> >> +SRCREV =3D "ce044817c7ba0aea27c3fd8e496635d94d20a755"
> >> +
> >> +SRC_URI =3D "git://github.com/google/protobuf.git;branch=3D3.6.x \
> >>              file://run-ptest \
> >> +           file://0001-protobuf-fix-configure-error.patch \
> >>   "
> >> -
> >>   S =3D "${WORKDIR}/git"
> >>
> >>   inherit autotools-brokensep pkgconfig ptest
> >> @@ -82,3 +83,8 @@ RDEPENDS_${PN}-ptest =3D "bash python-protobuf"
> >>   MIPS_INSTRUCTION_SET =3D "mips"
> >>
> >>   BBCLASSEXTEND =3D "native nativesdk"
> >> +
> >> +LDFLAGS_append_arm =3D " -latomic"
> >> +LDFLAGS_append_mips =3D " -latomic"
> >> +LDFLAGS_append_powerpc =3D " -latomic"
> >> +LDFLAGS_append_mipsel =3D " -latomic"
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> BRs
>
> Sandy(Li Changqing)
> +861084778653
>

