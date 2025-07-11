Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7F1C8303C
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 06:24:45 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.7568.1752215083722195047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 23:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C4affLgA;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso2150553a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752215083; x=1752819883; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4U+mlCVhRcyyfCSmo7a9H5LP1+4EB5YsZ0HyP0uk9s=;
        b=C4affLgAm7RfDu8lx+8yDUyYwNTZRIho4FVav6oSYZmdt+7YNEe0fpMi+8zOalc3HC
         +HvGwEv0yEC3Ks+BxHivLc4KhSdq+HxCmaiSwwRcMBX3U8iUkJXBd3pGhFyKaHSCnJhD
         fSibgaLruv1OJl79y8rt9EBoBLhMQZd4IQ88+91jK2ZLkDenatDNjsrXJvLMn3M+geVg
         u9/G8bcfKj+7HGWZ5zbSwK7tY0JAcrKrvxfjbPxwUR6BlEqEwCUvfKBvemMGWaauSTcU
         /FaBlDklKEBF8CtKmqNyK3QcLfIdjs/EPSIXwifwseLs6wRV5aabbd2J/IMRM1Rmwy+T
         ui2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752215083; x=1752819883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4U+mlCVhRcyyfCSmo7a9H5LP1+4EB5YsZ0HyP0uk9s=;
        b=Vp9WMaYQ5plLOMnL8Lmu1rBvVlOV8YCw+gt8S8ClZJyjQ84AZUsMOH+YAugIX2P1dO
         hDs71S5ek9LJZvg94MaIgMDyUdzbdlwduXxLQjAoVtRgAQ5Z6ck4Z3IGgKxGQ9Ta8P+X
         Q7GvjWuBHZGDW+acqycMhvqTGHdtucpTXl47T5OAGllzcb0NiDANRwz3bA2eEIT32e89
         IcuY/3bhagOHd6Q//6kiuxjre4FdlFvDFnCDdrLg7Taof53WEsFuNeqyZeZOr4K4iFmv
         BwjNDLSh4bvNdu/tjzXP7Um+48anx2h/VkyM7IMugs9ro5AmWo9ATH4Bfh/Y7UTeC9Ub
         FHIg==
X-Gm-Message-State: AOJu0YyROeXBJ/znBGdbCN6BYIuNG1t2eDY4U31+OQ6wG2TVpvO01ksg
	t0domn6cw/XFv/lgW60HcgvrXBAazdaFsHM4g7fJPGo5XZGWwOBNZIpUWUk5QI3riH4TpESsTjK
	X3odRvt1pj5VJiz++kTpSErDzvAadCY/IbEwL
X-Gm-Gg: ASbGncsycdfbJOctfsktbVLk0rKxcv5Qf7gLZj7ODcnEHph3S8wQISJQVeJioGxZhms
	t/0j2bNLKNdUZzMMj17zWmscmNCFvQdFtY42ik//JQqAtgLZPatWVy01F/EgCFh3DNug4n4FY+c
	61GtlmIVYoDG0Ra6Twkh6xn7eqYt6qU9H/FKXf7D3ugorAFOog9qCiNNEqJhRGc8pw3cmlhVSXe
	ZD+pA==
X-Google-Smtp-Source: AGHT+IEDI3Guyr3TW74YWXN/1Z4YI9hU0KdjyyI7ynrYbEKOJVQwExpmBvUGenFh/Kl4fNnAUIcJTmvMM9T0xuNseHg=
X-Received: by 2002:a17:90b:3d86:b0:313:d6ce:6c6e with SMTP id
 98e67ed59e1d1-31c4ca845e2mr3244025a91.8.1752215082950; Thu, 10 Jul 2025
 23:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250710173827.43239-1-alperyasinak1@gmail.com>
 <20250710173827.43239-5-alperyasinak1@gmail.com> <CAMKF1spBd6BEtZscGGFzrpArx3+w0HsYBrWF4ZOW6+XXBnTs-w@mail.gmail.com>
In-Reply-To: <CAMKF1spBd6BEtZscGGFzrpArx3+w0HsYBrWF4ZOW6+XXBnTs-w@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Fri, 11 Jul 2025 09:24:31 +0300
X-Gm-Features: Ac12FXxICTnoKyc558VRCxaJ4gcHxonDQsHx2bsEi5t3vSQRDObLOEfvmek3S8E
Message-ID: <CAGpma=4N9LYtGqrmKJG10kyU66cB2KT9w3OoxrsQizOB1-okBg@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 5/5] linux-serial-test: Add patch
 for CMake 4+ compatibility
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 06:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118431

Sent a v2 patch ->
https://lists.openembedded.org/g/openembedded-devel/message/118430

Khem Raj <raj.khem@gmail.com>, 11 Tem 2025 Cum, 04:58 tarihinde =C5=9Funu y=
azd=C4=B1:
>
> your patch has been accepted. Please bump the SRCREV instead here now ?
>
> On Thu, Jul 10, 2025 at 10:39=E2=80=AFAM Alper Ak via lists.openembedded.=
org
> <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Fix:
> >
> > | CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
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
> >  .../0001-allow-build-with-cmake-4.patch       | 43 +++++++++++++++++++
> >  .../linux-serial-test_git.bb                  |  3 +-
> >  2 files changed, 45 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-test/linux-serial-test/linux-serial=
-test/0001-allow-build-with-cmake-4.patch
> >
> > diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test/0=
001-allow-build-with-cmake-4.patch b/meta-oe/recipes-test/linux-serial-test=
/linux-serial-test/0001-allow-build-with-cmake-4.patch
> > new file mode 100644
> > index 0000000000..0b67ad03b1
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test/0001-all=
ow-build-with-cmake-4.patch
> > @@ -0,0 +1,43 @@
> > +From 83ec3d72913cbdee0c0f27fe74f77bf2ef1d1901 Mon Sep 17 00:00:00 2001
> > +From: Alper Ak <alperyasinak1@gmail.com>
> > +Date: Thu, 10 Jul 2025 14:11:22 +0300
> > +Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake =
4+
> > + compatibility
> > +
> > +Fix:
> > +
> > +| CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
> > +|   Compatibility with CMake < 3.5 has been removed from CMake.
> > +|
> > +|   Update the VERSION argument <min> value.  Or, use the <min>...<max=
> syntax
> > +|   to tell CMake that the project requires at least <min> but has bee=
n updated
> > +|   to work with policies introduced by <max> or earlier.
> > +|
> > +|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring an=
yway.
> > +|
> > +|
> > +| -- Configuring incomplete, errors occurred!
> > +
> > +Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-tes=
t/pull/60]
> > +
> > +Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > +---
> > + CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 10e3968..4ce6ef1 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -1,7 +1,7 @@
> > + # SPDX-License-Identifier: MIT
> > +
> > + project(linux-serial-test C)
> > +-cmake_minimum_required(VERSION 2.6)
> > ++cmake_minimum_required(VERSION 3.5)
> > + add_executable(linux-serial-test linux-serial-test.c)
> > + target_link_libraries(linux-serial-test rt)
> > + install(TARGETS linux-serial-test DESTINATION bin)
> > +--
> > +2.43.0
> > +
> > diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_g=
it.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> > index c617cf09a3..a451db2a76 100644
> > --- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> > +++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> > @@ -3,7 +3,8 @@ HOMEPAGE =3D "https://github.com/cbrake/linux-serial-te=
st"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSES/MIT;md5=3D544799d0b492f119fa0464=
1d1b8868ed"
> >
> > -SRC_URI =3D "git://github.com/cbrake/linux-serial-test.git;protocol=3D=
https;branch=3Dmaster"
> > +SRC_URI =3D "git://github.com/cbrake/linux-serial-test.git;protocol=3D=
https;branch=3Dmaster \
> > +        file://0001-allow-build-with-cmake-4.patch"
> >
> >  PV =3D "0+git"
> >  SRCREV =3D "2ee61484167eab846f7b7c565284d7c350d738d3"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#118420): https://lists.openembedded.org/g/openembed=
ded-devel/message/118420
> > Mute This Topic: https://lists.openembedded.org/mt/114086939/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

