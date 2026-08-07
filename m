Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39423C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 05:40:12 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36378.1786081207002397708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 22:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xiham1Fx;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-451a49abd8aso1654258fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 22:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786081206; cv=none;
        d=google.com; s=arc-20260327;
        b=NmDoAIH5/G8P/p69DjWBuB6DaXIc9wZOa1jN5bQ2yOHMt0EtbsyBVa6g9vYwNW6jdE
         sm0SIO3GXdR30tjsPckr9v0dkoO4txz+c3xc0snfOiaGPjHbHCziO1iYl29xrr3XfQ4R
         FNihgngh+A0Go2MOeXAsZIbWWH9B2kj4AD0Rac5wZIZdifrelVgiJJTZ+YMu4xG+4KKJ
         0+TeMqpHzRPpAZpd2jeV59IEZyZ6D1rvq4xtRFbJLSQJAVw5z1wlV8YaXFfpoQmZAZfG
         grRC2V9qb9/CMaBHbie8xKQF4snea5YYNZF/Oje/hlq9uknJcu+gmhzv7SOq7bkhnQs/
         9BPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kjnECfVJrP92YCEzk3yAYkgB6/Tp2WNOMxml89/haWo=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=cRpCftBxwA2GTHH71vZs3hpVtwwBh68DIPXJHWD7YBJqmY2e7vEji++SnK+pf1kDwg
         afq+P+CumMFN58ybSwTSBcQ04EdVyoqI2Qfc4Jy4imlLg1Z/o+ouj4o/X6oQsmY+ma+s
         x2BDw2DF0fn53xl2nV5B9ZnnSLMQby3j8IkN8QaONm4B6Lk/tKAVBbY7C7/kJKthjfsP
         MhXSJfLrROmf0q68DEw8CtmFlqMQw/SJtxlLDtqf/v6KqsnoDlUJhXFiF6ftS2rOVTdg
         LJTG+RRXmbq4DuZFQ2fw5IBszrRQOPuILqzrCtLRG9WS/NeLyK8ss+07NijfEDbCNHma
         V5fg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786081206; x=1786686006; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kjnECfVJrP92YCEzk3yAYkgB6/Tp2WNOMxml89/haWo=;
        b=Xiham1FxE0hLVPA9pHmF9/HdbajS+VeUqfaalcMOt8iOsvlA6aUVdiA8JqSVcRIUIf
         d3orcRFQJPSuzkuyNa825ys8zFjXXBJzbrngiaIsJxOTW9zqEyh+hnMsqQIsE59ozOVN
         oJun/RxQ/JFw9kmHhxsvkSTLypP8baiafo1S/iCyToBxZiaZP20EenR3OSNpDb87GaQ2
         +MwjcDXJvysBkyYR080phnPT263M1f/qt8AsN3SZvqE8PPBTczX5ICckwiE5G0H0sc6K
         XLi4L90qmLakbQvL+uJW/VKQqbqNysRmwI+FRxpCzlxlXmhfoBtuLjQ72vnKyQGG6cr8
         Sn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786081206; x=1786686006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjnECfVJrP92YCEzk3yAYkgB6/Tp2WNOMxml89/haWo=;
        b=Dbimh6LhQWfIzaore6YnIJpNQQ8YQ7VW210AljiBk9soRJrKxgpiwUrLhiHfw3K+US
         eYhM6HRWUFFBbaLV26W7FwZl45H8gXA7+AovBlrb99wfOmDccYE94STpZ8P0I86np47b
         4nlZNKSzIrZKenq4gAjGcLca15BekGmRwuV0YhKz2L8bXRoRswE7sdF+PdhUn9UsTvHp
         xxFBZxgABFxGe4ngmmbum/umRgWr3SNQbsWu8DMmy4OJCBxVB0JdfWLQ8aMwkdCpi64D
         zj8dQkmWm4emJzDttW+iSYbx5vw8NOJGLr9NRJ2pAigCAdETsWViBmrn9auAoAj/2epc
         jbMw==
X-Gm-Message-State: AOJu0YxAuKhetJkVcBeOb47IoT9GALd4SwkQ9RK6ktjkt9KPFE6vi1hd
	19tIkFXH3SpCeu3f7PHOohmBlnSpHuIswNGA6aGKggQm1o7A+L0GCZZenN/F/V86Qb7mfRbpW6C
	E+AYAYxg5maxuDnTxWydW34Ws3fKJo57IVBVv1Qs=
X-Gm-Gg: AR+sD10Q4z6ybyeYEasjFgI5UrVVx5Y2u2CDRSzGmDIwaF01rPfWlh1zqYH3kdL2DCw
	BsWGmnEpxU8mlbj6oGHxuI77kb+PI4TK1wGTp2MwJUhzd8OpeyACv9wc1nB5a/JVuIVcuvDJFdI
	l3vv1Hf6n8MFHu0YUjNhYDO+TGbuG/0K0cSt8XwcAauFmaqEDjGu4yBj9tAF6U7m3LhGrw3maes
	/7kBEeOpRfEB9KNjTeAaPiHEosCkFmyGUFhW6jKk/erDDIdTT4akuSC9rlDXLjH61zmaOQQjO2F
	Eq4/hmlESZdyALTiBZ5iBIdtNdYlTaffUOaaXbe9er7Al6QXjk9ci52eow==
X-Received: by 2002:a05:6871:4409:b0:456:4c93:a7f8 with SMTP id
 586e51a60fabf-459ff6cbcd6mr585575fac.6.1786081205984; Thu, 06 Aug 2026
 22:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
 <20260804194003.3158916-3-ankur.tyagi85@gmail.com> <CA+s=J=zHqb6D28qpJ-UmMt3JzMRbmUnZ-fbNqVy=MmGVGgkHJA@mail.gmail.com>
In-Reply-To: <CA+s=J=zHqb6D28qpJ-UmMt3JzMRbmUnZ-fbNqVy=MmGVGgkHJA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 7 Aug 2026 17:39:55 +1200
X-Gm-Features: AUfX_mw-IC-imqNdePs1klEh4BNZysVz8ee8BRxM0mc9T_qWviRsMJ46x1OW3Qg
Message-ID: <CADySD0HSXqKWCnydTb1BD_dxVNU98Cfwwf=djCzkphOHQ80p3Q@mail.gmail.com>
Subject: Re: [oe][meta-networking][wrynose][PATCH 3/36] libiec61850: upgrade
 1.6.1 -> 1.6.2
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 05:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128856

On Fri, Aug 7, 2026 at 1:57=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualcom=
m.com> wrote:
>
> Despite the version numbering, this doesn't look like a bug fix only upgr=
ade.

Hi Anuj,

Though the release contains vulnerability and bug fixes, it also has
some new features as well.
If you think it is not suitable for the stable branch then okay to
drop this patch.

Thanks for the review.

cheers
Ankur
>
> On Wed, Aug 5, 2026 at 3:40=E2=80=AFAM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Release Note:
> > https://github.com/mz-automation/libiec61850/releases/tag/v1.6.2
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../libiec61850/{libiec61850_1.6.1.bb =3D> libiec61850_1.6.2.bb}  | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1=
.6.1.bb =3D> libiec61850_1.6.2.bb} (96%)
> >
> > diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec618=
50_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_=
1.6.2.bb
> > similarity index 96%
> > rename from meta-networking/recipes-connectivity/libiec61850/libiec6185=
0_1.6.1.bb
> > rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_=
1.6.2.bb
> > index c46ed88d83..f87bedf649 100644
> > --- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.=
1.bb
> > +++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.=
2.bb
> > @@ -13,7 +13,7 @@ SECTION =3D "console/network"
> >  LICENSE =3D "GPL-3.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> >  DEPENDS =3D "swig-native python3"
> > -SRCREV =3D "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
> > +SRCREV =3D "f0f797bf955da763353f7081c892a1ff6b55e5a1"
> >
> >  SRC_URI =3D "git://github.com/mz-automation/${BPN}.git;branch=3Dv1.6;p=
rotocol=3Dhttps;tag=3Dv${PV} \
> >             file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUIns=
tallD.patch \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#128750): https://lists.openembedded.org/g/openembed=
ded-devel/message/128750
> > Mute This Topic: https://lists.openembedded.org/mt/120599924/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

