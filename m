Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56495D1713F
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 21:07:00 +0000 (UTC)
Received: from ci74p00im-qukt09081501.me.com (ci74p00im-qukt09081501.me.com [17.57.156.4])
 by mx.groups.io with SMTP id smtpd.web10.3469.1729544809985918826
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Oct 2024 14:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@subset.ch header.s=sig1 header.b=Ip4gqGvY;
 spf=pass (domain: subset.ch, ip: 17.57.156.4, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1729544808; bh=s3iBgpfyf8HSDtJFJeJNCE9a/DiBlg7LNaPMo0Gis70=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=Ip4gqGvYxA3knnK0im7Oqn+xXzsyCQiwS6YnJmiHx+3cLltZrohM2EO1kXkzz98uJ
	 C7PQRV9QoUzol63o3P9w1xxA1y1dP+0YU6R5t13cNl5Vk0EwFOJ3oew0jwREFSS5/j
	 Yu+QkD9l6qc5HEfSmL17IAuGrrSoz/FSwTy+Tq1sLWOjK1WjkWLCnH8iE7J+2HSBNm
	 3V85jS3VycTbp/GlIYhgc3xN/OMAiwBRrXmpghqp4bwERWvh5Eh8EL+Umo/1uo9QDI
	 bGUl4fGdKdNrhz9uY0ZASa9cXC9BBzcWpfwUMdow6BcuVT5+tnSweB34S3gxQrpubl
	 kNxJXsB04TkBA==
Received: from [192.168.1.131] (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09081501.me.com (Postfix) with ESMTPSA id C294325C00EE;
	Mon, 21 Oct 2024 21:06:46 +0000 (UTC)
Message-ID: <cbd176e32e63fe8e4351c6374eef55ed44e8ddb5.camel@subset.ch>
Subject: Re: [oe] [meta-oe][PATCH v2] fluentbit: fix building with wasm
 support
From: Patrick Wicki <patrick.wicki@subset.ch>
To: Niko Mauno <niko.mauno@vaisala.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Oct 2024 23:06:40 +0200
In-Reply-To: <dcd59bb1-3893-4b77-8792-10e13217c3d7@vaisala.com>
References: <20241017070839.39476-1-patrick@subset.ch>
	 <CAMKF1spGmL-v7izu2-zJQ=KmxE=qf2QwVQe_sGE-9exGhMeHhw@mail.gmail.com>
	 <6358f89f72cfdc608818f24cbc9f282fbe99e240.camel@subset.ch>
	 <dcd59bb1-3893-4b77-8792-10e13217c3d7@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: TbxH60LUHciJ7n3RIkUq07nEFqfY87le
X-Proofpoint-GUID: TbxH60LUHciJ7n3RIkUq07nEFqfY87le
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-21_21,2024-10-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 clxscore=1030
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410210150
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 21:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113083

You are right. Creating /usr/share/upstart on my build host was enough
to reproduce the issue.

Thanks for spotting (and fixing) this!
I will send a v3 that should apply on top of your patch.

On Mon, 2024-10-21 at 20:00 +0300, Niko Mauno wrote:
> The CMake failure which occurs during fluentbit do_configure, seems
> to be
>=20
> =C2=A0=C2=A0 | CMake Error at src/CMakeLists.txt:550 (install):
> =C2=A0=C2=A0 |=C2=A0=C2=A0 install DIRECTORY given unknown argument "/etc=
/fluent-bit/".
>=20
> which occurs inside "upstart" specific segment at
> https://github.com/fluent/fluent-bit/blob/v3.1.9/src/CMakeLists.txt#L550
>=20
> I looked to me like the preceding condition on line 543:
>=20
> =C2=A0=C2=A0=C2=A0 elseif(IS_DIRECTORY /usr/share/upstart)
>=20
> is not cross-compile friendly, and during the failed test, presumably
> the build host happened to have a /usr/share/upstart directory which
> caused the condition being evaluated as true.
>=20
> I've now submitted a patch which should mitigate this issue, and also
> fixes potential for similar kind of issue with systemd init manager
> case, when the build host does not have systemd specific
> /lib/systemd/system directory.
>=20
> -Niko
>=20
> On 21.10.2024 15.29, Patrick Wicki via lists.openembedded.org wrote:
> > I've been unable to reproduce this failure on my end unfortunately.
> > In
> > my understanding, the contents of the patched file should not even
> > affect the build at all unless the "wasm" PACKAGECONFIG is enabled,
> > which is not the case by default.
> >=20
> > I'm open to suggestions. Otherwise, I think we can skip this patch
> > and
> > wait for upstream to update the WASM runtime, which should fix it
> > too.
> >=20
> > On Thu, 2024-10-17 at 11:54 -0700, Khem Raj via
> > lists.openembedded.org
> > wrote:
> > > it fails in configure -
> > > https://valkyrie.yoctoproject.org/#/builders/81/builds/66/steps/14/lo=
gs/stdio
> > >=20
> > > On Thu, Oct 17, 2024 at 12:09=E2=80=AFAM Patrick Wicki via
> > > lists.openembedded.org
> > > <patrick.wicki=3Dsubset.ch@lists.openembedded.org> wrote:
> > > >=20
> > > > From: Patrick Wicki <patrick.wicki@siemens.com>
> > > >=20
> > > > Add patch for the wasm runtime that fixes building for x86.
> > > >=20
> > > > Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> > > > ---
> > > > =C2=A0=C2=A0...d-cmake-try_run-when-cross-compiling.patch | 42
> > > > +++++++++++++++++++
> > > > =C2=A0=C2=A0.../fluentbit/fluentbit_3.1.9.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > > =C2=A0=C2=A02 files changed, 43 insertions(+)
> > > > =C2=A0=C2=A0create mode 100644 meta-oe/recipes-
> > > > extended/fluentbit/fluentbit/0002-wasm-avoid-cmake-try_run-
> > > > when-
> > > > cross-compiling.patch
> > > >=20
> > > > diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-
> > > > wasm-avoid-cmake-try_run-when-cross-compiling.patch b/meta-
> > > > oe/recipes-extended/fluentbit/fluentbit/0002-wasm-avoid-cmake-
> > > > try_run-when-cross-compiling.patch
> > > > new file mode 100644
> > > > index 000000000..419e85903
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-wasm-
> > > > avoid-
> > > > cmake-try_run-when-cross-compiling.patch
> > > > @@ -0,0 +1,42 @@
> > > > +From 5b6d274664f92a6c6083f4d27a1b1604a326f22c Mon Sep 17
> > > > 00:00:00
> > > > 2001
> > > > +From: Patrick Wicki <patrick.wicki@siemens.com>
> > > > +Date: Sat, 5 Oct 2024 21:36:12 +0200
> > > > +Subject: [PATCH] wasm: avoid cmake try_run when cross-
> > > > compiling
> > > > for x86
> > > > +
> > > > +This fixes building the wasm micro runtime used when enabling
> > > > wasm
> > > > +support in fluentbit.
> > > > +cmake try_run does not work when cross-compiling because the
> > > > test
> > > > program
> > > > +cannot be executed:
> > > > +
> > > > +| CMake Error: try_run() invoked in cross-compiling mode,
> > > > please
> > > > set the following cache variables appropriately:
> > > > +|=C2=A0=C2=A0=C2=A0 TEST_WRGSBASE_RESULT (advanced)
> > > > +| For details see
> > > > .../fluentbit/3.1.9/build/TryRunResults.cmake
> > > > +|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Write linear memory base addr to x=
86 GS register
> > > > disabled
> > > > +| -- Configuring incomplete, errors occurred!
> > > > +
> > > > +Since we cannot run the test program, assume that the
> > > > instruction
> > > > is not
> > > > +available and disable the option.
> > > > +
> > > > +This patch is no longer needed once fluentbit updates WAMR, as
> > > > it's been
> > > > +fixed in
> > > > https://github.com/bytecodealliance/wasm-micro-runtime/pull/3066
> > > > .
> > > > +
> > > > +Upstream-Status: Pending
> > > > [https://github.com/fluent/fluent-bit/pull/8744]
> > > > +
> > > > +Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> > > > +---
> > > > + .../build-
> > > > scripts/config_common.cmake=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > > 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/lib/wasm-micro-runtime-WAMR-1.3.0/build-
> > > > scripts/config_common.cmake b/lib/wasm-micro-runtime-WAMR-
> > > > 1.3.0/build-scripts/config_common.cmake
> > > > +index e73ebc85f..c2504e007 100644
> > > > +--- a/lib/wasm-micro-runtime-WAMR-1.3.0/build-
> > > > scripts/config_common.cmake
> > > > ++++ b/lib/wasm-micro-runtime-WAMR-1.3.0/build-
> > > > scripts/config_common.cmake
> > > > +@@ -408,7 +408,7 @@ if (WAMR_BUILD_STATIC_PGO EQUAL 1)
> > > > +=C2=A0=C2=A0 add_definitions (-DWASM_ENABLE_STATIC_PGO=3D1)
> > > > +=C2=A0=C2=A0 message ("=C2=A0=C2=A0=C2=A0=C2=A0 AOT static PGO ena=
bled")
> > > > + endif ()
> > > > +-if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1)
> > > > ++if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1 OR
> > > > CMAKE_CROSSCOMPILING)
> > > > +=C2=A0=C2=A0 add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=3D1)
> > > > +=C2=A0=C2=A0 message ("=C2=A0=C2=A0=C2=A0=C2=A0 Write linear memor=
y base addr to x86 GS
> > > > register
> > > > disabled")
> > > > + elseif (WAMR_BUILD_TARGET STREQUAL "X86_64"
> > > > diff --git a/meta-oe/recipes-
> > > > extended/fluentbit/fluentbit_3.1.9.bb
> > > > b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> > > > index fc67236d3..d42a9a964 100644
> > > > --- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> > > > +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> > > > @@ -21,6 +21,7 @@ SRCREV =3D
> > > > "431fa79ae27edaef8d050a7af6f038f4400193a1"
> > > > =C2=A0=C2=A0SRC_URI =3D "\
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git://github.com/fluent/fluent-
> > > > bit.git;branch=3D3.1;protocol=3Dhttps \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.pa=
tch
> > > > =C2=A0=C2=A0\
> > > > +
> > > > file://0002-wasm-avoid-cmake-try_run-when-cross-compiling.patch
> > > > =C2=A0\
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.pa=
tch
> > > > =C2=A0=C2=A0\
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURE=
S', 'systemd', '',
> > > > '
> > > > file://0003-Disable-installing-systemd-service-file.patch',=C2=A0d)=
}
> > > > \
> > > > =C2=A0=C2=A0"
> > > > --
> > > > 2.47.0
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > >=20
> > >=20
> > >=20
> >=20
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#113076):
> > https://lists.openembedded.org/g/openembedded-devel/message/113076
> > Mute This Topic:
> > https://lists.openembedded.org/mt/109059531/3618471
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub=C2=A0[
> > niko.mauno@vaisala.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


