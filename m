Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF26D2F7F6
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 07:03:03 +0000 (UTC)
Received: from qs51p00im-qukt01072102.me.com (qs51p00im-qukt01072102.me.com [17.57.155.11])
 by mx.groups.io with SMTP id smtpd.web11.43555.1729148580827923914
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 00:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@subset.ch header.s=sig1 header.b=f91kaFj8;
 spf=pass (domain: subset.ch, ip: 17.57.155.11, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1729148579; bh=k3yZeRsTwj9JeUOU/r3K9r8ItD8XDRHN+wG6WkWJ8xQ=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=f91kaFj8fkOtkDIUT8C6EKhA/8Zq3vcvOkaK43Dze/g/ORw7+lCWzsWHEpS2EsAwK
	 gBL6hWyVaEdvNtI0MYEBrCPVieALn42MRlRKIsJHwwF4e46oYTQbQO+z1RRXN/Cmvm
	 ikDZp/EKR7GfO3W3yQ7rNFV1nI+30gJ5SBZ91LChBft6OD0rfJ03OMUaO6QiSOM7Oa
	 Za8NrYXq8wPfYzPUbIpKUqbmbuV5xtnbtgxuJ6jK3Qm9/xv9sUZsGMJHATv84NL23U
	 VqyEzpjhXvxE2uAsCHwf9HAXjfVaNVAiY5SrGx6kOAdvejf7uUrnpaffBV2TJZ+l2A
	 ze/gOCl7DYp/Q==
Received: from [192.168.1.131] (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01072102.me.com (Postfix) with ESMTPSA id 0B1FF340124;
	Thu, 17 Oct 2024 07:02:57 +0000 (UTC)
Message-ID: <fb975af067b79118ca3496b85b6f5559954354e1.camel@subset.ch>
Subject: Re: [oe] [meta-oe][PATCH] fluentbit: fix building with wasm support
From: Patrick Wicki <patrick.wicki@subset.ch>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2024 09:02:52 +0200
In-Reply-To: <CAMKF1spFuOqQPRVwNtW=+ACePT=9-vq7sQHdnM96K-TOL4Ncvw@mail.gmail.com>
References: <20241007200946.414276-1-patrick@subset.ch>
	 <CAMKF1spFuOqQPRVwNtW=+ACePT=9-vq7sQHdnM96K-TOL4Ncvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-Proofpoint-GUID: roCS13fXQopeKKUQVvBy9_mVVppKH3Jt
X-Proofpoint-ORIG-GUID: roCS13fXQopeKKUQVvBy9_mVVppKH3Jt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_06,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 clxscore=1030 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410170046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 07:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112960

Hi Khem,

thanks for the info. The patch is indeed still needed, I will resend
it.

On Thu, 2024-10-10 at 12:58 -0700, Khem Raj via lists.openembedded.org
wrote:
> Hi Patrick
>=20
> Thanks for the patch. There have been few iterations of the fluentbit
> upgrade patch ( currently testing v4 in master-next )
> can you rebase this patch on top of the latest master-next and resend
> if it's still needed.
>=20
> On Mon, Oct 7, 2024 at 1:10=E2=80=AFPM Patrick Wicki via
> lists.openembedded.org
> <patrick.wicki=3Dsubset.ch@lists.openembedded.org> wrote:
> >=20
> > From: Patrick Wicki <patrick.wicki@siemens.com>
> >=20
> > Add patch for the wasm runtime that fixes building for x86.
> >=20
> > Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> > ---
> > =C2=A0...d-cmake-try_run-when-cross-compiling.patch | 42
> > +++++++++++++++++++
> > =C2=A0.../fluentbit/fluentbit_3.1.9.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A02 files changed, 43 insertions(+)
> > =C2=A0create mode 100644 meta-oe/recipes-
> > extended/fluentbit/fluentbit/0002-wasm-avoid-cmake-try_run-when-
> > cross-compiling.patch
> >=20
> > diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-
> > wasm-avoid-cmake-try_run-when-cross-compiling.patch b/meta-
> > oe/recipes-extended/fluentbit/fluentbit/0002-wasm-avoid-cmake-
> > try_run-when-cross-compiling.patch
> > new file mode 100644
> > index 000000000..419e85903
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-wasm-avoid-
> > cmake-try_run-when-cross-compiling.patch
> > @@ -0,0 +1,42 @@
> > +From 5b6d274664f92a6c6083f4d27a1b1604a326f22c Mon Sep 17 00:00:00
> > 2001
> > +From: Patrick Wicki <patrick.wicki@siemens.com>
> > +Date: Sat, 5 Oct 2024 21:36:12 +0200
> > +Subject: [PATCH] wasm: avoid cmake try_run when cross-compiling
> > for x86
> > +
> > +This fixes building the wasm micro runtime used when enabling wasm
> > +support in fluentbit.
> > +cmake try_run does not work when cross-compiling because the test
> > program
> > +cannot be executed:
> > +
> > +| CMake Error: try_run() invoked in cross-compiling mode, please
> > set the following cache variables appropriately:
> > +|=C2=A0=C2=A0=C2=A0 TEST_WRGSBASE_RESULT (advanced)
> > +| For details see .../fluentbit/3.1.9/build/TryRunResults.cmake
> > +|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Write linear memory base addr to x86 G=
S register disabled
> > +| -- Configuring incomplete, errors occurred!
> > +
> > +Since we cannot run the test program, assume that the instruction
> > is not
> > +available and disable the option.
> > +
> > +This patch is no longer needed once fluentbit updates WAMR, as
> > it's been
> > +fixed in
> > https://github.com/bytecodealliance/wasm-micro-runtime/pull/3066.
> > +
> > +Upstream-Status: Pending
> > [https://github.com/fluent/fluent-bit/pull/8744]
> > +
> > +Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> > +---
> > + .../build-scripts/config_common.cmake=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/lib/wasm-micro-runtime-WAMR-1.3.0/build-
> > scripts/config_common.cmake b/lib/wasm-micro-runtime-WAMR-
> > 1.3.0/build-scripts/config_common.cmake
> > +index e73ebc85f..c2504e007 100644
> > +--- a/lib/wasm-micro-runtime-WAMR-1.3.0/build-
> > scripts/config_common.cmake
> > ++++ b/lib/wasm-micro-runtime-WAMR-1.3.0/build-
> > scripts/config_common.cmake
> > +@@ -408,7 +408,7 @@ if (WAMR_BUILD_STATIC_PGO EQUAL 1)
> > +=C2=A0=C2=A0 add_definitions (-DWASM_ENABLE_STATIC_PGO=3D1)
> > +=C2=A0=C2=A0 message ("=C2=A0=C2=A0=C2=A0=C2=A0 AOT static PGO enabled=
")
> > + endif ()
> > +-if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1)
> > ++if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1 OR CMAKE_CROSSCOMPILING)
> > +=C2=A0=C2=A0 add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=3D1)
> > +=C2=A0=C2=A0 message ("=C2=A0=C2=A0=C2=A0=C2=A0 Write linear memory ba=
se addr to x86 GS register
> > disabled")
> > + elseif (WAMR_BUILD_TARGET STREQUAL "X86_64"
> > diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> > b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> > index e88b5e91a..9eccb8d0b 100644
> > --- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> > +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> > @@ -19,6 +19,7 @@ SRCREV =3D
> > "431fa79ae27edaef8d050a7af6f038f4400193a1"
> > =C2=A0SRC_URI =3D "\
> > =C2=A0=C2=A0=C2=A0=C2=A0 git://github.com/fluent/fluent-
> > bit.git;branch=3D3.1;protocol=3Dhttps \
> > =C2=A0=C2=A0=C2=A0=C2=A0
> > file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
> > =C2=A0\
> > +=C2=A0=C2=A0=C2=A0
> > file://0002-wasm-avoid-cmake-try_run-when-cross-compiling.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0
> > file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
> > =C2=A0\
> > =C2=A0"
> >=20
> > --
> > 2.46.2
> >=20
> >=20
> >=20
> >=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112779):
> https://lists.openembedded.org/g/openembedded-devel/message/112779
> Mute This Topic: https://lists.openembedded.org/mt/108876258/8009873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub=C2=A0[
> patrick.wicki@subset.ch]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


