Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5ECC67861
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 17:03:49 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.36758.1712423020380240723
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Apr 2024 10:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hB+b8jQA;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-229661f57cbso1629040fac.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712423019; x=1713027819; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHeqUsmfOr3U4pC3fAkMNPYZpscUKLuBWtiXWIUg+0M=;
        b=hB+b8jQAIqtZ+V8uJrvVLSAuC8B8C1CyymUXYxQ4UPsxk7t4Ag4Sx5sBmNvbLgcAIq
         mBszhmRiZwgFnlrSBXN9njOh1dGF+zAaZqE9Lh7Kiix1cDtAFlUsrHN/YW6qpeMFp6Bu
         NNwoIyHFxzD/VIUIn18VnpVixGZdbkCOzNppq3xboRZ2eyGxQ59YM6eqdYQj8UmyF5TJ
         heBNREUPkHyz1N6AEYqrNl9SbaMJLK9poCo3oD4rAbpuZF/WOYR0yyFbe9m11EJhNGJN
         kZrKFUg0hwUtyWdj2i6tz2xjc9mLqEAqZoC502Wt07XFaIxkMaNNmtq1AQhE/28qwvSz
         O+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712423019; x=1713027819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHeqUsmfOr3U4pC3fAkMNPYZpscUKLuBWtiXWIUg+0M=;
        b=dFev5cV6x1M0L+iE0TdnjwvaZGBwSiQQRggacO/LcoMeUOnKEzcxJ+gbiTqbkqz5x5
         XxN0tR4zVS7tb9+nNmfDPo9E8YjsHGrwcI+2/zB+JTizprNIJWy7XWU3/THb6ZKErYyZ
         I3ckXcCd3Rx4Ly/QZYp2zXLuUZ1mdCJSJrbVfbnbzRsjAg+RPhEQDxFzLvTqckYAo/It
         8jQHD/8/aKW5LnzNU9RZAhYcrvZ0zDMdFaPQyKUX0iIoo+cZdB7R8nAqFORq+AQmuRRG
         V23haXXTRqjdhLA8eGb01m23i8SBgCDwnnWBJJKhkEuwLvk0pHFcmmaWvtNcK9dtuI12
         r6BQ==
X-Gm-Message-State: AOJu0YwrhqfxDqhChZqzuuU4mxszpoaZ12SvY57rUAub8SjzB0tbAqEd
	Ouor8DAjmvpzTL37JTrkmRCakVZj/rj+IjyRle8zBnnQyLb+BNIRTlYP7XO0xTJfwkFWeY85Azm
	GCIKYmLXytQl1lrtRMAoV6Dg0AvE=
X-Google-Smtp-Source: AGHT+IH3VewZYOxwSRqLBhwqjFUfrZ42+3s3JkAiPhb3nxdIjVk7q7vO4k+Ub5fnEma6vXruh317wd1ZKc+PfEFQl2E=
X-Received: by 2002:a05:6870:819d:b0:22e:bcfd:debc with SMTP id
 k29-20020a056870819d00b0022ebcfddebcmr5278195oae.13.1712423019624; Sat, 06
 Apr 2024 10:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240405162459.1286945-1-fathi.boudra@linaro.org> <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com>
In-Reply-To: <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Apr 2024 10:03:13 -0700
Message-ID: <CAMKF1spPChTZ2j0QUzWVamSKzZPCPuX9R+eOe=04qXfef7ecFg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] composefs: add a new recipe
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 17:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109834

also fails

stdio: ERROR: Nothing PROVIDES 'fuse3' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-extended/composefs/composefs_1.0.3.bb
DEPENDS on or otherwise requires it)

this is because fuse3 is in meta-filesystem and meta-oe does not depend on =
it.

On Fri, Apr 5, 2024 at 6:03=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails with latest musl
>
> https://errors.yoctoproject.org/Errors/Details/761688/
>
> On Fri, Apr 5, 2024 at 9:25=E2=80=AFAM Fathi Boudra <fathi.boudra@linaro.=
org> wrote:
> >
> > Tools to handle creating and mounting composefs images
> >
> > Flexible mechanism to support read-only mountable filesystem trees,
> > stacking on top of Linux filesystem.
> >
> > It will allow to enable filesystem integrity by leveraging the stack:
> > ostree -> composefs -> fs-verity
> >
> > For reference:
> > https://github.com/containers/composefs?tab=3Dreadme-ov-file#filesystem=
-integrity
> > https://ostreedev.github.io/ostree/composefs/#using-composefs-with-ostr=
ee
> >
> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> > ---
> >  .../composefs/composefs_1.0.3.bb              | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/composefs/composefs_1.0.3.=
bb
> >
> > diff --git a/meta-oe/recipes-extended/composefs/composefs_1.0.3.bb b/me=
ta-oe/recipes-extended/composefs/composefs_1.0.3.bb
> > new file mode 100644
> > index 0000000000..ddc67d9b57
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/composefs/composefs_1.0.3.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "Tools to handle creating and mounting composefs images"
> > +HOMEPAGE =3D "https://github.com/containers/composefs"
> > +LICENSE =3D "GPL-3.0-or-later & LGPL-2.0-or-later & Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://BSD-2-Clause.txt;md5=3D121c8a0a8fa5961a26b7863034ebcce8 \
> > +    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > +    file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> > +    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> > +    file://COPYINGv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > +    file://LICENSE.Apache-2.0;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
> > +"
> > +DEPENDS =3D "fuse3 openssl"
> > +SRCREV =3D "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
> > +PV =3D "1.0.3"
> > +
> > +SRC_URI =3D "git://github.com/containers/composefs.git;protocol=3Dhttp=
s;branch=3Dmain"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109825): https://lists.openembedded.org/g/openembed=
ded-devel/message/109825
> > Mute This Topic: https://lists.openembedded.org/mt/105351850/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

