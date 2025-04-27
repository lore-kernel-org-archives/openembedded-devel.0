Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93786C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 14:48:09 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.27512.1745765243752047540
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 07:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6bfiLxF;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6066c02cd92so260152eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745765243; x=1746370043; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fK+QmhVFDBEFZEQ1Kf3XUyE7R72t6Qc81usAyTdvkWQ=;
        b=H6bfiLxFnLDLHJDa3Xh8vYCKEwm7dPJAO2tXkum/hlXpCwIXA3HtswSNICWDrXqdAE
         GeSuTNCg1r+2/rcQQdBcKVHdr86XScTzXuvNWhdMARv+0Cgm5Uld6oXAf/ecOFvkyb8C
         PokIW4rOp4JaImP3OignL8Z8i8ePDXYZNZsJqtLDdWRuMufWZQs8UN4Ra2fyM2Lx7pJv
         zOnP0RZEY4xcN4wiXREgSgU/dmFk0X12JgVTGJTHdNR6XvSZ/l0pV5F4IM/MumjjfWGs
         W+kbTM7AnWlcl/V5oGt+X1HZn6JhIkWIgYR51YF6MKGmqBt/7hejZZYlD3GsRUQLFcYt
         UPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745765243; x=1746370043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fK+QmhVFDBEFZEQ1Kf3XUyE7R72t6Qc81usAyTdvkWQ=;
        b=vi9VtDJm77+3MXLAm0RP/vXVl1mX1xal+AeA+f8i9drOJfNK5hBfbl5S/hXPmIUrhz
         l6gX6zFgrfnDSRZmH7lbevnn6uU1wy9zcTyjeQYifBFarlQ/I7NzKyLQZi0lDZbhQe3B
         JuyYdcFo6WBvNPKAH4LzjvrP63ZBpnQktHt42Jd++6Eecp81DPIzJCiUVHjAXikn4pj/
         KdQnBJ1zRNeGHD3AiI+2ONBeUZRSHYtLJRzIfLWomEbTTFWceoPj/FE2RaN1ZEddihhp
         bC7FQTaI/Ib0aiRGnBKpSC1TogMmyKetEPHjvC5a3FO4uysRibgYIR8HC3g4/WFcidnE
         IMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcoRLhdh7qtCqfQQHvlXGav9/nqI/iwvyY2qpXM2wQSqR460nGy9zS2q4jjBA5bslM2ls9Uhi4ZUd60+/XL+AYPQI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxROo68TeVT30tDiV24hc9l13aRnpsobQMczEsqwOjgixBZZib5
	6Eq0haXwRzY7fOVDMpucVL/RyA5rdBiytm9hP+lNNnO90FA8HzgyjgZhORsjj84iqHJdkvd8Rke
	6ZnevIGAVtnlgYuJgm1a94Hm0iDo=
X-Gm-Gg: ASbGncteNQEWu3430tRsYAwbeWcQNf/nxkrEm9wXhHAmcQI0kFKdaqF2/cg0pLCC2LS
	PIItAVjr8aabH6QRleQIGVG61eN8UCmKGpe9PXZfqoohnJhj7NZY6PA5TtYGdPCPiT/MfMR0EAq
	5Zd0TQDMC94jC6yhYrUPX/NZhbjc9Hy1RGpsPQ
X-Google-Smtp-Source: AGHT+IGkQKuHaoRBjgvjhWzS4+jBZuMtB1lyVbtrr8HXHm5mvC4U1aEquCwyxi0iVsqHgw97ym/bD2wJxRjmdt/LSFQ=
X-Received: by 2002:a05:6820:99b:b0:603:f1b5:ca02 with SMTP id
 006d021491bc7-60652bc2cc7mr5873753eaf.6.1745765242880; Sun, 27 Apr 2025
 07:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250427091918.26541-1-mingli.yu@eng.windriver.com> <4cfa7d5a-1fdd-4b61-a6af-349dc97dd2a6@gmail.com>
In-Reply-To: <4cfa7d5a-1fdd-4b61-a6af-349dc97dd2a6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Apr 2025 07:46:57 -0700
X-Gm-Features: ATxdqUHmQCJFhlJkbZKLnulsZzChiXAFOf1VGYsNPovMD0AjVCZPwE8ly6-EEZE
Message-ID: <CAMKF1sp63RcvT=50ssBpw6JUkqDDWEvNg3RGQWyJiiY95ZCgvA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nlohmann-json: Upgrade 3.11.3 -> 3.12.0
To: skandigraun@gmail.com
Cc: mingli.yu@eng.windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 14:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117168

It still fails ptests on musl systems.

On Sun, Apr 27, 2025 at 2:40=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
>
> On 4/27/25 11:19, Yu, Mingli via lists.openembedded.org wrote:
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > License-Update:
> > Copyright year updated to 2025
> >
> >  # ./run-ptest
> > PASS: test-algorithms_cpp11
> > PASS: test-allocator_cpp11
> > PASS: test-alt-string_cpp11
> > PASS: test-assert_macro_cpp11
> > PASS: test-binary_formats_cpp11
> > PASS: test-bjdata_cpp11
> > PASS: test-bson_cpp11
> > PASS: test-byte_container_with_subtype_cpp11
> > PASS: test-capacity_cpp11
> > PASS: test-cbor_cpp11
> > PASS: test-class_const_iterator_cpp11
> > PASS: test-class_iterator_cpp11
> > PASS: test-class_lexer_cpp11
> > PASS: test-class_parser_cpp11
> > [snip]
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  .../{nlohmann-json_3.11.3.bb =3D> nlohmann-json_3.12.0.bb}  | 8 ++++--=
--
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >  rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.11.3.bb=
 =3D> nlohmann-json_3.12.0.bb} (81%)
> >
> > diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.=
3.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> > similarity index 81%
> > rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3=
.bb
> > rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.b=
b
> > index 194e80546e..0064a3e726 100644
> > --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
> > +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> > @@ -2,16 +2,16 @@ SUMMARY =3D "JSON for modern C++"
> >  HOMEPAGE =3D "https://nlohmann.github.io/json/"
> >  SECTION =3D "libs"
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE.MIT;md5=3Df969127d7b7ed0a8a63c2bb=
eae002588"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.MIT;md5=3D3b489645de9825cca5beeb9=
a7e18b6eb"
> >
> >  CVE_PRODUCT =3D "json-for-modern-cpp"
> >
> > -SRC_URI =3D "git://github.com/nlohmann/json.git;branch=3Ddevelop;proto=
col=3Dhttps \
> > +SRC_URI =3D "git://github.com/nlohmann/json.git;branch=3Ddevelop;branc=
h=3Dmaster;protocol=3Dhttps \
> This seems to have 2 branches in the URI.
> >             git://github.com/nlohmann/json_test_data.git;destsuffix=3Dg=
it/json_test_data;name=3Djson-test-data;branch=3Dmaster;protocol=3Dhttps \
> >             file://run-ptest \
> >  "
> >
> > -SRCREV =3D "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
> > +SRCREV =3D "55f93686c01528224f448c19128836e7df245f72"
> >  SRCREV_json-test-data =3D "a1375cea09d27cc1c4cadb8d00470375b421ac37"
> >
> >  SRCREV_FORMAT .=3D "_json-test-data"
> > @@ -25,7 +25,7 @@ EXTRA_OECMAKE +=3D "${@bb.utils.contains('PTEST_ENABL=
ED', '1', '-DJSON_BuildTests=3D
> >  # nlohmann-json is a header only C++ library, so the main package will=
 be empty.
> >  ALLOW_EMPTY:${PN} =3D "1"
> >  RDEPENDS:${PN}-dev =3D ""
> > -RDEPENDS:${PN}-ptest =3D "perl"
> > +RDEPENDS:${PN}-ptest =3D "perl locale-base-de-de"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117167): https://lists.openembedded.org/g/openembedde=
d-devel/message/117167
> Mute This Topic: https://lists.openembedded.org/mt/112480376/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

