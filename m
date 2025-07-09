Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0DFC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 20:07:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.6665.1752091626592302313
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 13:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZZTE460F;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234bfe37cccso3904935ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752091626; x=1752696426; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8WxU8uZ3DYvNPBc/LULISuzhW867ZlH7akWlrWFlfc=;
        b=ZZTE460F76Xf34vApfwMEdcZjKsYAc0HgLWE0WcczwC6jMu2wtgSrC+OTRbSjKf+0r
         lFw3ejAun7YAjE5AbF2Ci/+fJV1BH/pT7ZAcYwxqsWfVyBNDPuT9Wu5bf2BCoJieDVMO
         A2Q3OfwzFIsK3dZ8ETaJOheinFPx8arhIyg/I+n7XqUSrsoq8VTUFmrGp5DEl45fju7e
         RhNjV2k0LG3bgiIL4OuPa7uUm2NB3MzxitJLUyOH/BJsPZCJHC8O1ihK+VDLj9P/HmPK
         5blhhEis4y/EwKUoWEQv83vB7/YWsr4hOIZSnU04+/8hwUp/FyYRCY68c2nKe+akM1si
         i53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752091626; x=1752696426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8WxU8uZ3DYvNPBc/LULISuzhW867ZlH7akWlrWFlfc=;
        b=W2SxydsxgUGrw+QLYYk2UP7H1VB7wTKa+RzMPzTNItO9aT+XfRqZ6R+Trf7VUwTiU0
         jYwFiRDERo0qiyRpfThV7G2FJfrPDQOzFmt1FmkPzA9b2XvsGBRSeMtRLBuD5d7sqmnk
         9JI2B58NktMs+Z0Oj+XJcan7AHtyWsymzjQj2E9r3gUUX6jHK5784AZwQ9F7ta90im1s
         CZgU4gRyl/Lx4qAgCMcMX3wnaUszIbz4e9xkiYVMr6OVbkrj+2Tw/5eZ6PM/Cc6ojNm7
         0QSHiEK6/o9FTVVgzY/2k9Kj9tInK4OH+jD56DpF1yaO3QDuPKdkopYTmidkIIUyTSqT
         1W0w==
X-Gm-Message-State: AOJu0YzaP264xE0WQFYtV+rgIZCytrsAU1VvrkaHTbil6mwI1z+HSgil
	YtyAex+iUGE06G7wZzdNImX3cNu12BZeXbHm3F22kJAknrxhTJoRF1wbBcJLFZ8FQvuwBn1HWh7
	uCAbW5v5/rE3a0YNYzSx18jbw8rkN362d+h3F
X-Gm-Gg: ASbGncunft3BSKTyupqQIPy7sVvfEPzorcwM78XwxCtzoTr2n+3OqO8kRlddEa10pR8
	BTvY+89E9QtQQdt1afoL1B48Br2hILHxRvoRsqr1iTDfBo/GF2m6WuGHjailwabMrlGC0eyPLge
	xaBr8C5MjnTnuqcpSBSi6x979c7RaOAE3Lu72iEdXcivjo8RiUM4NY6Q==
X-Google-Smtp-Source: AGHT+IEF7V1GNn5cCR0iSFoZfYnSYhMN7CeDGkpFsgK7AESPMmwRR0tpE/AP+RQzePGhJAbxraF3FDunmdQUDCycOQs=
X-Received: by 2002:a17:90b:1f84:b0:313:31ca:a74 with SMTP id
 98e67ed59e1d1-31c3c2e2d8amr1857885a91.16.1752091625829; Wed, 09 Jul 2025
 13:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250708195636.1678606-1-alperyasinak1@gmail.com> <3cbc36cb-3602-4585-84f7-01df20856991@gmail.com>
In-Reply-To: <3cbc36cb-3602-4585-84f7-01df20856991@gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Wed, 9 Jul 2025 23:06:54 +0300
X-Gm-Features: Ac12FXyQg-c5zeoFrtWLjIBXneSOZImthx6Wnvx520pZDg6Yc_El4q2V8CaBsys
Message-ID: <CAGpma=6H4-agQt9rzSK6koc+rY51X_p01SW3sR5p1FU6sh6iVQ@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 01/20] cannelloni: Upgrade 1.1.0
 -> 2.0.0 to allow CMake 4+ compatibility
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 20:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118381

Sent a v2 patch ->
https://lists.openembedded.org/g/openembedded-devel/message/118380

Khem Raj <raj.khem@gmail.com>, 9 Tem 2025 =C3=87ar, 19:09 tarihinde =C5=9Fu=
nu yazd=C4=B1:
>
> fails to build with clang ( I think its upgrade having added
> incompatible code )
>
> https://errors.yoctoproject.org/Errors/Details/869562/
>
> On 7/8/25 12:56 PM, Alper Ak via lists.openembedded.org wrote:
> > - Drop 0001-include-bits-stdc-.h-only-when-using-libstdc.patch because =
already fixed in newer version.
> >
> > Changelog:
> >
> > https://github.com/mguentner/cannelloni/compare/v1.1.0...v2.0.0
> >
> > Fix:
> >
> > | CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
> > |   Compatibility with CMake < 3.5 has been removed from CMake.
> > |
> > |   Update the VERSION argument <min> value.  Or, use the <min>...<max>=
 syntax
> > |   to tell CMake that the project requires at least <min> but has been=
 updated
> > |   to work with policies introduced by <max> or earlier.
> > |
> > |   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring any=
way.
> > |
> > |
> > | -- Configuring incomplete, errors occurred!
> >
> > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > ---
> >   ...bits-stdc-.h-only-when-using-libstdc.patch | 37 ------------------=
-
> >   ...annelloni_1.1.0.bb =3D> cannelloni_2.0.0.bb} |  7 +---
> >   2 files changed, 2 insertions(+), 42 deletions(-)
> >   delete mode 100644 meta-networking/recipes-connectivity/cannelloni/ca=
nnelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
> >   rename meta-networking/recipes-connectivity/cannelloni/{cannelloni_1.=
1.0.bb =3D> cannelloni_2.0.0.bb} (71%)
> >
> > diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni=
/0001-include-bits-stdc-.h-only-when-using-libstdc.patch b/meta-networking/=
recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-w=
hen-using-libstdc.patch
> > deleted file mode 100644
> > index 71f447c94b..0000000000
> > --- a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-i=
nclude-bits-stdc-.h-only-when-using-libstdc.patch
> > +++ /dev/null
> > @@ -1,37 +0,0 @@
> > -From 7aed36765ae44b41ede7e139da0a11b3696f2e06 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Mon, 13 Nov 2023 00:07:23 -0800
> > -Subject: [PATCH] include bits/stdc++.h only when using libstdc++
> > -
> > -We have other c++ runtime implementations e.g. llvm's libc++ which doe=
s
> > -not provide this header bits/stdc++.h, therefore make sure that this
> > -header is only included when using libstdc++
> > -
> > -Fixes
> > -| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/cannelloni/1.1.0=
/git/tcpthread.cpp:27:10: fatal error: 'bits/stdc++.h' file not found
> > -|    27 | #include <bits/stdc++.h>
> > -|       |          ^~~~~~~~~~~~~~~
> > -
> > -Upstream-Status: Submitted [https://github.com/mguentner/cannelloni/pu=
ll/56]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - tcpthread.cpp | 2 ++
> > - 1 file changed, 2 insertions(+)
> > -
> > -diff --git a/tcpthread.cpp b/tcpthread.cpp
> > -index a1b3047..bb5a7b2 100644
> > ---- a/tcpthread.cpp
> > -+++ b/tcpthread.cpp
> > -@@ -24,7 +24,9 @@
> > - #include <cstdint>
> > - #include <cstdio>
> > -
> > -+#ifdef __GLIBCXX__
> > - #include <bits/stdc++.h>
> > -+#endif
> > -
> > - #include <linux/can.h>
> > - #include <string.h>
> > ---
> > -2.42.1
> > -
> > diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni=
_1.1.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.=
0.bb
> > similarity index 71%
> > rename from meta-networking/recipes-connectivity/cannelloni/cannelloni_=
1.1.0.bb
> > rename to meta-networking/recipes-connectivity/cannelloni/cannelloni_2.=
0.0.bb
> > index 835f33055a..287c7685e4 100644
> > --- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.=
bb
> > +++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.=
bb
> > @@ -2,15 +2,12 @@ SUMMARY =3D "a SocketCAN over Ethernet tunnel"
> >   HOMEPAGE =3D "https://github.com/mguentner/cannelloni"
> >   LICENSE =3D "GPL-2.0-only"
> >
> > -SRC_URI =3D "git://github.com/mguentner/cannelloni.git;protocol=3Dhttp=
s;branch=3Dmaster \
> > -           file://0001-include-bits-stdc-.h-only-when-using-libstdc.pa=
tch \
> > -          "
> > -SRCREV =3D "3d4fb8c8b07f6d7c62b2bdad7e5a94de61c9a29b"
> > +SRC_URI =3D "git://github.com/mguentner/cannelloni.git;protocol=3Dhttp=
s;branch=3Dmaster"
> > +SRCREV =3D "9f649ef21710999c6f674bc3d914ab2e88363bac"
> >
> >   LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80=
fdaf4a4263"
> >
> >   inherit cmake
> >
> > -
> >   PACKAGECONFIG ??=3D "lksctp-tools"
> >   PACKAGECONFIG[lksctp-tools] =3D "-DSCTP_SUPPORT=3Dtrue, -DSCTP_SUPPOR=
T=3Dfalse, lksctp-tools"
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#118323): https://lists.openembedded.org/g/openembed=
ded-devel/message/118323
> > Mute This Topic: https://lists.openembedded.org/mt/114053246/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

