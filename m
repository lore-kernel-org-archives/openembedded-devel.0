Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471CEC3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 13:20:25 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.75586.1746537618720648778
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 06:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BDaj1iR+;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2c2ada8264aso4585754fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746537618; x=1747142418; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEo01QJUoKEGyVYGpvpQndzJnmeGK4+zYF8YGMcyltE=;
        b=BDaj1iR+RzfobEbLJFL/05G8UTeAqyl/50AYMtBOuOrHN5+tNGIHdahOFag+L/uJv1
         4R/gML5WHxU5NixNHsZEi8btNA/yjQbYXioaNDcybpv9D7QpYyTiRXA4DJKLGQjI+eHJ
         /62fo8QaAcGC8q0m+nKUZoDhmUz2AV0jaJ+r95jCf8zJ4eeKs/7BoG05YMBnP3FING+L
         B2O813KfhHlB9sLf3Gs1HZ0007zEUVPz21CDl4BLXHQHFkrJaQ7qia2457uE+325h9Vh
         7QoLy3CCWidXbXCUQZdL1q+N5cI49oILe1oPGM3+s1sg7yV12fyBF1ignV5Fe1p0crWX
         semA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537618; x=1747142418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEo01QJUoKEGyVYGpvpQndzJnmeGK4+zYF8YGMcyltE=;
        b=LzJIoU37KP+udKFYB7omgCVWmgfZNQLspu0+mv9oXkjBuGb9weNPQFuHIjeML6YDxg
         etEVoXuOctPXL25YJd6TvdLzUTyLo4eNzdOmb6ksDo6CGp76C5A6Co/oscPtE85ddC83
         AArLV+1MazzgyHyTpjokYoinQaf98Gor6Vfp3qstRlai4cGvfbpsneJh4RMSbM8cbewz
         vC4zI7mu7/S2gXMnJ4HwJBjfrQvp5SXv9wNZtkyzth9PP69Tqd3/aAoxnP2Fe4qGpToP
         tYRE8zppH7tldzhjwGLRMj2cfR85sfgRLL+VTt4TOdZD2zYNJGox009G/TGS5jq8dE0t
         HhVw==
X-Gm-Message-State: AOJu0YxdhqptjoTfq5bPG9JgQ9Cie+/6/DHO5YBqW4DqCVvLKy9MKmLW
	h1vS4243TPSosIJnbU1xZOB9tK6zb00CNsbcN0ifA7J2c1PD9sST7qPECsjDKEJNf7pH82mux4n
	+772h69E/R3ZF1m011v7SFmZ0jWs=
X-Gm-Gg: ASbGnctfg8NbS4fQVcztA8QSvbAaqe0HmBmp/zF85e3S0UCNOA8vO5SShy2Arn+TEm2
	rbyMZScBnkBvd/w9YOKG58v8xzo01qA+N9JQaUMYR3wh2N10NHaAp5PyUUDOgk3hqdH7XoT2OGv
	REWaxyHU1jERdcf2ToEsZ1
X-Google-Smtp-Source: AGHT+IGRVj7SBTpefTFQ5XwHJxzMQK8OSbXEBDgkWug3pPuww429MPEydfBkW/QO53f/DIb0aLVETWn/3nJ96xHYbM0=
X-Received: by 2002:a05:6870:a7a7:b0:2d6:667c:511f with SMTP id
 586e51a60fabf-2dae82d891bmr6347683fac.9.1746537617908; Tue, 06 May 2025
 06:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250505062142.3478500-1-raj.khem@gmail.com> <20250505062142.3478500-6-raj.khem@gmail.com>
 <CA+chaQcmQLw=3AH0sjj3U_MLLSYQaR_XOR4A25uKKpEJNT-Vwg@mail.gmail.com>
In-Reply-To: <CA+chaQcmQLw=3AH0sjj3U_MLLSYQaR_XOR4A25uKKpEJNT-Vwg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2025 06:19:51 -0700
X-Gm-Features: ATxdqUGTJX-8GaSkBiq9IGfCAhw9pXG6o0g8Zc1A6TJYe9pafZNPQ8OgU-ZayaE
Message-ID: <CAMKF1srgHQ4pThG_GpU_O8cZaBbudTYVPhyOLyBozg0AgKGdWw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-icu: Fix build with GCC-15
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 13:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117351

On Tue, May 6, 2025 at 2:31=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> FYI: In next release we should be able to drop this .patch as it
> should be resolved by:
> https://gitlab.pyicu.org/main/pyicu/-/commit/82fa082b149db81c894e0d887c0f=
ff67c3d2826f
>

Thanks Martin, I think its better to replace my patch with what got
applied upstream
care to send a patch?

> On Mon, May 5, 2025 at 8:21=E2=80=AFAM Khem Raj via lists.openembedded.or=
g
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > drop is_trivial check
> > Fixes
> > | In file included from bases.cpp:32:
> > | arg.h:856:37: error: static assertion failed
> > |   856 |   static_assert(std::is_trivial<T>::value);             \
> > |       |                 ~~~~~~~~~~~~~~~~~~~~^~~~~
> > | arg.h:859:1: note: in expansion of macro '_IS_POD'
> > |   859 | _IS_POD(AnyPythonObject);
> > |       | ^~~~~~~
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...ove-assert-checking-for-trivial-type.patch | 26 +++++++++++++++++++
> >  .../python/python3-icu_2.15.2.bb              |  3 ++-
> >  2 files changed, 28 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-icu/000=
1-Remove-assert-checking-for-trivial-type.patch
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-icu/0001-Remov=
e-assert-checking-for-trivial-type.patch b/meta-python/recipes-devtools/pyt=
hon/python3-icu/0001-Remove-assert-checking-for-trivial-type.patch
> > new file mode 100644
> > index 0000000000..4c75eb5f7b
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-icu/0001-Remove-asser=
t-checking-for-trivial-type.patch
> > @@ -0,0 +1,26 @@
> > +From 3d58fb48bb1cef2177aab8e291167638993495f4 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 3 May 2025 21:27:34 -0700
> > +Subject: [PATCH] Remove assert checking for trivial type
> > +
> > +This fails with GCC-15, is_trivial is deprecated in C++26
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + arg.h | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/arg.h b/arg.h
> > +index a493d11..6cb232d 100644
> > +--- a/arg.h
> > ++++ b/arg.h
> > +@@ -853,7 +853,6 @@ public:
> > + };
> > +
> > + #define _IS_POD(T)                                      \
> > +-  static_assert(std::is_trivial<T>::value);             \
> > +   static_assert(std::is_standard_layout<T>::value)
> > +
> > + _IS_POD(AnyPythonObject);
> > diff --git a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb =
b/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
> > index 77013330d8..d265a20975 100644
> > --- a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
> > @@ -12,7 +12,8 @@ UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> >
> >  SRC_URI[sha256sum] =3D "561e77eedff17cec6839f26211f7a5ce3c071b776e8a0e=
c9d1207f46cbce598f"
> >
> > -SRC_URI +=3D "file://0001-Fix-host-contamination-of-include-files.patc=
h"
> > +SRC_URI +=3D "file://0001-Fix-host-contamination-of-include-files.patc=
h \
> > +            file://0001-Remove-assert-checking-for-trivial-type.patch"
> >
> >  inherit pkgconfig pypi python_setuptools_build_meta
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#117295): https://lists.openembedded.org/g/openembed=
ded-devel/message/117295
> > Mute This Topic: https://lists.openembedded.org/mt/112625197/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

