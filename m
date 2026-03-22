Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F59FFC72BA
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:27:41 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28312.1774175256128260947
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y4YSeaZT;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d9b21d1461so352470a34.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774175255; cv=none;
        d=google.com; s=arc-20240605;
        b=M4mYrOXIv0fsrHpPKMy46P3doh58FQI/AUAUFFF/6W+6IhDem+iKatkxlLLJNlUpHx
         oztZxotKgw42Aqkva7xrNic3PlXWFf26QAPFSfII6MAAxeWFtNptqGGDyhKj5637qjF4
         Z9U+gtDf5md49wCADz+2HIs0HolOLeWCiT7tn1MbPEq2U9aJIf1JBDXDqjmcS32PgrSs
         sCe23uPyf5BuQS6PsnNYboeWIxT+wNtBbKXNyp3P7cMDEOH/WCGJNfc7+c5OuUlqgldW
         /wxHglmNJPHHybzKaNThO/+cb3KULXTOcVP65Vh9eFqiKxNLIAL5BqsL7FqyFRGQUFE1
         tWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gQ1DCw0eLsb03GKy4BCXZBs0+MdXK+ChgWysKd19ozg=;
        fh=/Zfoi4o9G9NEfOtGJ0LSUrfiVhZcuLLzOVZQmzCL8qM=;
        b=QMSC+nlQuhI/hzM5z3D1MH3wyP6iBait70gKOMXdV0fIZ+q/6Zll+QP9fKMsvWK4FK
         6Z7GrnWT7Lh6yzRTNNijoIUPMYAOAI+SdsSzriKWXX2NnHzshoOTjmqdsLT00J6JA1hd
         yrIMN8x3AQ9YctvGjUju281bAZc34T2mtxB9z7xM/uJqK1NqYy46EKOAKPazYEoPFlFv
         cdSBYVZWrVH46TH/W1gKcp+SyH2u8R+KytYOjgY3SFzSgEu8VPdJcmrxm4A9MqAs0HDN
         ctHokBD8Z+HGoBB9q9F5L0XR6ofS3anXrD+sQEIdCi82MZjEvHvuy0QcWGiIT1KTb7Zq
         UmJg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774175255; x=1774780055; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQ1DCw0eLsb03GKy4BCXZBs0+MdXK+ChgWysKd19ozg=;
        b=Y4YSeaZT6atsQ2AKxH6D9Mm+rSLq/afrbWdOqEV4unAYjoUZ7cizWGvWABHgzIbNHq
         XXBZA03pKJqNlel8KYFGB+IKh8G0DUf1vKT2UW52n2mpEaZkL6C0uBC2gVUZbUzaa3nz
         qj4jMJa5nsReAjumXvzztHlYuhQeBmZUZY/ejGj1jdYk1CK7+nZEchsvm3VgplDRIY3Q
         u0uAtcfrP971gwkyXJWFZS/GG+hxKshmGkN6SXP/dr+v8KLB31/JixfPVyE+4eh2cDNS
         vr5cywE7HmZGmWW6sWKCUGG38ExUvwugBzWC0kwVZ88ThzvLL9uHRC1lJ7PeeYgekkrN
         mIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774175255; x=1774780055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gQ1DCw0eLsb03GKy4BCXZBs0+MdXK+ChgWysKd19ozg=;
        b=SMjvuRphAlMyrpFewvetZv9f9kZeX8bXSAoLgyCKp4VCvRy9iozj8XNgmIXaIGU954
         JrUiIQGMwpDcF44hMEr2neV2+8IDjH+VYV6cCZfS6ffH8fo+8SSQ5wvp2tbXJSt4l3ca
         UgsmvUo2DWZZpNkSyawXaBdDnV60J4uWjuFPtO+QEFNlZeGQD5EN4DHGX+aGEAq0y2AB
         zx+mW6FNajX1z5CRUkUhGo++L7+TOWk8cvEu227KUbxZDSo5zajCKeYkaDKEao6ENLd9
         purK3eGYn++3PcGPie4vjL4H3SPl/2mIsXYj+C1XYXtjqYmtVnWzXPhkqmWUcQVNbiGJ
         1ibw==
X-Gm-Message-State: AOJu0YxKi7JT6CwXU5wsI/k6KLL9mhNmAAeHm6Ebb98M5l7egAmB8mzw
	kfxj8eIv9qHBEiNcLZuIzzRRWfrfifZvcs5ACPWeZcpmjhQIAWXS3eHPUR0Uvx92r3e5sK3ivkn
	EhxySu5CQaTLLQ59EogNg4t72S+DUEm8=
X-Gm-Gg: ATEYQzxtx6e5eBCRjhdf68M14t53wG9+368veB5d9Ji+wVtbryycOQy780IhNzhjxAC
	xPYxLUJ5+G8TqlXCP4RbxhXvhWVs2L5LGqZ6fpAylVbS+Nhm7PRx697ILZZioFa5RJ853MNMHdx
	HlhkoWywHUOzz1LU0Y1VUNr/MFEzjZJLn7kk4gpfXuqWuwAWu3+e/XG/10ad1d8x+PQ9sKbi6AZ
	Wn7ZE1ByhJ3B4JNt40UCE7FmNwb11qMmFYOtyMQcgHNnS/5kUE7+SMO0CgsTML4UuYE/ApO+uHT
	1dt1udl/OH0aQx3fUZc=
X-Received: by 2002:a05:6830:60c4:10b0:7d7:cc54:7792 with SMTP id
 46e09a7af769-7d7da564717mr5495156a34.8.1774175255253; Sun, 22 Mar 2026
 03:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260322101350.439083-1-ankur.tyagi85@gmail.com> <52904911-e48c-4a2b-8172-ea1751747413@gmail.com>
In-Reply-To: <52904911-e48c-4a2b-8172-ea1751747413@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 22 Mar 2026 23:27:24 +1300
X-Gm-Features: AaiRm52blRGaZQIPyshgH_QWvEu78apbX8obMLHOhpoekCCITjNIO_OFd0mBnAA
Message-ID: <CADySD0G66QxHnOp1a5U=nN_97_oaUyj_bmjVq8jqarreub=i0g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/4] jasper: upgrade 4.2.8 -> 4.2.9
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125478

On Sun, Mar 22, 2026 at 11:18=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> Is it possible that you forgot the [whinlatter] tag from the subject?

Indeed, thanks for pointing that out.
>
>
> On 3/22/26 11:13, Ankur Tyagi via lists.openembedded.org wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Changelog:
> > - Fixed a bug in the JP2 encoder that caused incorrect handling of
> >   opacity components in some cases.
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit 330ecdd2ad03225db3cd0933f1083abed8598a98)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../jasper/{jasper_4.2.8.bb =3D> jasper_4.2.9.bb}                 | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-graphics/jasper/{jasper_4.2.8.bb =3D> jasper_4.=
2.9.bb} (92%)
> >
> > diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb b/meta-oe/=
recipes-graphics/jasper/jasper_4.2.9.bb
> > similarity index 92%
> > rename from meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
> > rename to meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
> > index e00b56ddbf..b48fff7081 100644
> > --- a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
> > +++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da80440d1d8f17d041c71c72=
71d6e06eb"
> >
> >  SRC_URI =3D "https://github.com/jasper-software/${BPN}/releases/downlo=
ad/version-${PV}/${BP}.tar.gz"
> > -SRC_URI[sha256sum] =3D "98058a94fbff57ec6e31dcaec37290589de0ba6f47c966=
f92654681a56c71fae"
> > +SRC_URI[sha256sum] =3D "f71cf643937a5fcaedcfeb30a22ba406912948ad441314=
8214df280afc425454"
> >
> >  UPSTREAM_CHECK_URI =3D "https://github.com/jasper-software/jasper/rele=
ases"
> >  UPSTREAM_CHECK_REGEX =3D "releases/tag/version-(?P<pver>\d+(\.\d+)+)"
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#125473): https://lists.openembedded.org/g/openembed=
ded-devel/message/125473
> > Mute This Topic: https://lists.openembedded.org/mt/118446093/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

