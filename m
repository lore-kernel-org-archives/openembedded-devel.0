Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B306C021A3
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 16:08:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.98348.1726330110927532123
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 09:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hIKA/wFw;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374b9761eecso2477458f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1726330109; x=1726934909; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFCr7f4sQaZ+vxu7b1m07Mw/czs7A0LKBm6SqWrKprk=;
        b=hIKA/wFwqRRZe0SEpUxjD6owg7kuGFsSN++kwOqyyJlAJJ8H5LqclLUDj3c9Oe6qpH
         wdd0BVTbSqP7LKKjtQJFWwaShCPo9pwlOkgiR1siHkKww89Eb+bOQFgZuOHBXQqjbHbx
         595PPu8TgeJrJKWXqjwyuCSCOTQucnNkIANCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726330109; x=1726934909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFCr7f4sQaZ+vxu7b1m07Mw/czs7A0LKBm6SqWrKprk=;
        b=FqtFv1DCFwUA9UVm0bfBgwCL5LQjofckw0h0MEAGKbiyH6dq6AYEEY7c8B/cjZQHP6
         Hyb8kBBTaz9QHzgVVGCzqM1Fb2FBGI3pMp0wb0jGBuusiDwGLo+CVTNAc3PkKpD8Dnyx
         Ujdi8F60DwHxzl1SGMhbG01cbNUz8CN9dMWTgvFzPkzdEd8VBBfQQs600v7a40AKS/O2
         8FwlX+pW35kpdiBi1NxXdXJXzyByK8se9h5lgc1txayXh1C2Xhhnomyqo8+3BsFPVGRv
         O8777DoxjBRZUPMIDjhiTAMmUr14n9XHu6F1rb9ZhiEMYWw0REnI10BKkdUWzShWlGy1
         u9Ug==
X-Gm-Message-State: AOJu0Yz2ugRSXOVAHZQ+FauGdC5AQeodLohOMk42m3MnbemnZk3wmVV8
	iejgGTMQ07rANdf1zy0bnRerG8yEam3b051BdXX5KJ0u3FkUD3kK07i8MAJGxOibrB64hsia7YN
	fTLa6TxI45izQoQeh0uQ78TVetAZFbPOBjUGV2g==
X-Google-Smtp-Source: AGHT+IGXTZJ2FR367yrolNIHsio8YDlK84YlRIykFyXQy9s/Bkgl4PYJVBkiHupfF9178jhEsulIsCAXx62cyPJ2Tr8=
X-Received: by 2002:adf:b312:0:b0:371:8eb3:603a with SMTP id
 ffacd0b85a97d-378c2d031e0mr5812025f8f.27.1726330108212; Sat, 14 Sep 2024
 09:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240914143557.2211085-1-yoann.congal@smile.fr> <CAMKF1spKgTPE+GTpym-d9O9+7q9X1QJXOsLoR2KGNH66x-puUw@mail.gmail.com>
In-Reply-To: <CAMKF1spKgTPE+GTpym-d9O9+7q9X1QJXOsLoR2KGNH66x-puUw@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 14 Sep 2024 18:08:02 +0200
Message-ID: <CAMSfU+6X=vgYUY6G3EgGLQCM=GyR2aCfHBqudbgU5HU0GyEkWg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] non-repro-meta-python: exclude packages
 that failed previously
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 16:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112291

Le sam. 14 sept. 2024 =C3=A0 17:50, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :
> Thanks for updating this list, we have fixed many recipes lately, I
> wonder if we need to remove some of them now from these lists as well.

The list of the meta-python excluded packages that were the same :
unused_exclusions=3D['python3-frozenlist-dbg', 'python3-kivy-src',
'python3-pandas-dbg', 'python3-pandas-src', 'python3-pycocotools-src',
'python3-pynacl-dbg', 'python3-pynacl-src', 'python3-pyproj',
'python3-pyproj-dbg', 'python3-pyproj-src', 'python3-yarl-dbg']
(https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43/step=
s/40/logs/stdio
Iine 73)

My plan was to get to a green build first, then look through
unused_exclusions lists to see if some packages are repeatedly in it
and reinclude those. I fear that some non-reproducibility are tied to
the host OS/worker which is chosen randomly by AB.

But, maybe some of the meta-* are "green enough" to start this now. I'll lo=
ok.

> On Sat, Sep 14, 2024 at 7:36=E2=80=AFAM Yoann Congal via
> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
> wrote:
> >
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > Those are the non-reproducible packages from:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  meta-python/conf/include/non-repro-meta-python.inc | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-python/conf/include/non-repro-meta-python.inc b/meta-=
python/conf/include/non-repro-meta-python.inc
> > index 629dc4aa04..64dc69ed55 100755
> > --- a/meta-python/conf/include/non-repro-meta-python.inc
> > +++ b/meta-python/conf/include/non-repro-meta-python.inc
> > @@ -1,6 +1,8 @@
> >  # List of known non-reproducible package of the meta-python layer
> >  # Please keep this list sorted
> >  KNOWN_NON_REPRO_META_PYTHON =3D " \
> > +    python3-evdev \
> > +    python3-evdev-dbg \
> >      python3-evdev-src \
> >      python3-frozenlist \
> >      python3-frozenlist-dbg \
> > @@ -8,6 +10,7 @@ KNOWN_NON_REPRO_META_PYTHON =3D " \
> >      python3-pandas \
> >      python3-pandas-dbg \
> >      python3-pandas-src \
> > +    python3-pybind11-json-dev \
> >      python3-pycocotools-src \
> >      python3-pydantic-core \
> >      python3-pynacl \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112286): https://lists.openembedded.org/g/openembed=
ded-devel/message/112286
> > Mute This Topic: https://lists.openembedded.org/mt/108449449/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Yoann Congal
Smile ECS - Tech expert

