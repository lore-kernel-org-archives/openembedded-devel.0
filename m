Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47942FC72C2
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:53:51 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28556.1774176828109261985
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PvsLaiX8;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-409de4132b5so1107460fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774176827; cv=none;
        d=google.com; s=arc-20240605;
        b=EboLtRjxBqjGPCbDgFeQj95y32mLFVuh++YidpTYdK2MUqgUjIce5JySUORFxRP1Zb
         yBe1zZXRgcg2lpZncY2v7t71rmYjtIpJcjVkaBi6n+JpBlLgRbhYTsQPJ5UWZc5g3nEZ
         uqmGzUf+bxHd8Ai4A/PRgNIaGcgGqYt/s1MT/QdsU0qZ9HXr+qjwams1T0tSsQp5H6mK
         SOteHzjE4RJ4sgH2VqlfB/x/4RaL06oxw9+PEOhpdSEhZagqwSDtk62WcBfPKPwtx/RV
         EActbL9Vv/eyXK+VvI6wf+AMJVxcluZP5foM0nGJUfuZd7QDZbEgLo2JnGCPGeEjeFL0
         r2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1G7UqkLt8xf3wBBOycrqphBydU7plM+YnMK2AE1PKbo=;
        fh=/Zfoi4o9G9NEfOtGJ0LSUrfiVhZcuLLzOVZQmzCL8qM=;
        b=HijwnvJisC7pPh6hdJzCT1WR3HSOA99brDIrxGa+QE1MPQ2itNEZSBHvoe5kgsmJG/
         iEOahsxePH8vhNzfpJjmyARif/CMtM6T0RQK+60vokGGcpC4igOI9jaPbRNNKyIE4rwF
         I/CsUEyVQVLkipdjsWw/vjNrq1kBj2xaN5ljMGoPXbC4LgVpPLNzXghqCaXJo/ntDSmu
         pXLcLDkTjCbJI2yyodN4aMH7lANXqi4kJhLPDcepzfsScceZYYzYb5elBpGfMeXoqigK
         emV2bYqz4Q7Dgb2r+ZuWtHVPJGp1LADsLBlrlY5pRvqn0IRSkEXwK0F5RdszX+hhP0on
         /WLA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774176827; x=1774781627; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G7UqkLt8xf3wBBOycrqphBydU7plM+YnMK2AE1PKbo=;
        b=PvsLaiX8AxmtPMl1NkefdIqVzPUUdGqKoa2jm7F0WFED6RmFzGyQU6XBOQYOhaUEUh
         +aI3IycHmJ36LRDvk4bt0wjoP7wqYhpeUtg8gmKH/2BjzqCuzVp1z+eBs1cwXG1P+igk
         Lv15TNgFIBHXpL7i47KkY1iAeupUVQtHvJ+REPjoYHDskM3sRwWGC38wwrDWrn254Xeb
         jqpbPwGSciLaFWVlQZ1wqDxwuX2GuySoQEEvNCxkXnbLY3i16X2ClT/PEuR0XyjvR8ip
         s3859zADhtFQYd8hsPEOpjLtWdWUYwMoEozUDYpxkBcc0O92DyiyOBAPqWyFyR3NM+F3
         ZSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774176827; x=1774781627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1G7UqkLt8xf3wBBOycrqphBydU7plM+YnMK2AE1PKbo=;
        b=elKf8m9CNapdeEyUSxuOTbpGva6TtPtbCw/FkDtoTpyM9pqlT3ZPGjjEAgJNsg1mM1
         KegrGSvWXcX83jVSDy7Tu2KQc+km+ngPybp+qpbBMkoni0gfgBre2Pcq8Q65mTNNjv+S
         UXSgObCEzqSlZDaxoxKX1fi1Q2r/S1Za69/iweH7nQrsIlKPXnqtX18iBiLaCwlspIs7
         dLFjFkqm2kY+FBVAprn294baVfjxIWrChWrnOsmzTHF9+Q08Cv/AWp5t3M2hm4+aTw9J
         A80NPhiqK/XJV821huqm18Qytk64AWbkgauUuhm/Z2Q0Te0VQfA/azjXatPbdK3N6G/8
         UuUA==
X-Gm-Message-State: AOJu0Yx6uozhlLvq1Dq/V2ZeJaV/ek6hM6btBxZWYjOr/ft8izG8f/1R
	6uCLrepvOu857tqP5WCZ9XAHUq9GhZ47bhGwZALWYoJ4VdKmaJuVS8Cn3IZAD7behtn4rY3C7ZJ
	D8vc509gDTlXCsYxTxnZUFhhqmUeYpfM=
X-Gm-Gg: ATEYQzycIc+Vg/yzjvUrE3zXhy92hs/WpkDjRbnCyZrxffnpe/TbLSLZBNJpmo+kFO/
	xTKedKSIUVppRI1h1t/YwPOacDZSzVK+ZnzLJmKJN8QhtidBX32bVp+bhkcByX298wS75kMzQMK
	Q+FHhEPNpMmxxutkDTNH7QPhVE1kAbDWH/EJM1Pp3mTgBO31xJ0HR3qqqicK0vybbbOqMZkB6/e
	Kae4Uda09OWWJDnKAlXerR5Rw8VXh2YFlSxED9OYl6udpsUUEB3C4I9k481/nBQ9OYh8QWZF/rm
	qKsNQIIS
X-Received: by 2002:a05:6871:73a6:b0:41c:5ea1:b4e with SMTP id
 586e51a60fabf-41c5ea12357mr214195fac.0.1774176827181; Sun, 22 Mar 2026
 03:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260322101350.439083-1-ankur.tyagi85@gmail.com>
 <52904911-e48c-4a2b-8172-ea1751747413@gmail.com> <CADySD0G66QxHnOp1a5U=nN_97_oaUyj_bmjVq8jqarreub=i0g@mail.gmail.com>
In-Reply-To: <CADySD0G66QxHnOp1a5U=nN_97_oaUyj_bmjVq8jqarreub=i0g@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 22 Mar 2026 23:53:35 +1300
X-Gm-Features: AaiRm52Xzaqib8vG-9IK96NDEnUIt1Mue50t-SlsoonfanjYz1tO3OmYtWRxGrs
Message-ID: <CADySD0F1ndC7U5amuToCLEShCH2MjOPeqdW330eHdav9Wcmw5w@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/4] jasper: upgrade 4.2.8 -> 4.2.9
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125483

Please drop this series, it is not intended for the master branch.

On Sun, Mar 22, 2026 at 11:27=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.c=
om> wrote:
>
> On Sun, Mar 22, 2026 at 11:18=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmai=
l.com> wrote:
> >
> > Is it possible that you forgot the [whinlatter] tag from the subject?
>
> Indeed, thanks for pointing that out.
> >
> >
> > On 3/22/26 11:13, Ankur Tyagi via lists.openembedded.org wrote:
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Changelog:
> > > - Fixed a bug in the JP2 encoder that caused incorrect handling of
> > >   opacity components in some cases.
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > (cherry picked from commit 330ecdd2ad03225db3cd0933f1083abed8598a98)
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > ---
> > >  .../jasper/{jasper_4.2.8.bb =3D> jasper_4.2.9.bb}                 | =
2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta-oe/recipes-graphics/jasper/{jasper_4.2.8.bb =3D> jasper_=
4.2.9.bb} (92%)
> > >
> > > diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb b/meta-o=
e/recipes-graphics/jasper/jasper_4.2.9.bb
> > > similarity index 92%
> > > rename from meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
> > > rename to meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
> > > index e00b56ddbf..b48fff7081 100644
> > > --- a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
> > > +++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
> > > @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da80440d1d8f17d041c71c=
7271d6e06eb"
> > >
> > >  SRC_URI =3D "https://github.com/jasper-software/${BPN}/releases/down=
load/version-${PV}/${BP}.tar.gz"
> > > -SRC_URI[sha256sum] =3D "98058a94fbff57ec6e31dcaec37290589de0ba6f47c9=
66f92654681a56c71fae"
> > > +SRC_URI[sha256sum] =3D "f71cf643937a5fcaedcfeb30a22ba406912948ad4413=
148214df280afc425454"
> > >
> > >  UPSTREAM_CHECK_URI =3D "https://github.com/jasper-software/jasper/re=
leases"
> > >  UPSTREAM_CHECK_REGEX =3D "releases/tag/version-(?P<pver>\d+(\.\d+)+)=
"
> > >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#125473): https://lists.openembedded.org/g/openemb=
edded-devel/message/125473
> > > Mute This Topic: https://lists.openembedded.org/mt/118446093/6084445
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [skandigraun@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >

