Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C08FC47077
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 17:18:09 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.42777.1705252687260214650
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jan 2024 09:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6SwYtAX;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-594cb19c5d9so3869096eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Jan 2024 09:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705252686; x=1705857486; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9iIM8uBYC36tPhggxKYNaJLdGzu8Tu1+DX3lqYuJ6I=;
        b=j6SwYtAXc3yWuU9v36xTkUXB8GcfQhsr4WsMD4qhxJcLPXAvHFuEHHrMaqlCv+AWFD
         q7cadE0ZcE8I676QH8/ss+Rzazu4tXsWTUssjrN7D5Z8bCMteQ03oT55H3eQgVtzgEdB
         /sNh2cngbbfIQ2BBkHd4mkJrp38le6OenvQHUe7STzPxqYCTp4SjcxDXXF1TDC4AgDrT
         eLvnboSWjehPDlVx79k8zNeRzjRuQU79GBVJQpSYtnvpjM7VAWLDyv8LPiHrsydoMW+U
         blQr64uwWILbJaOfd/tg5TdZ8FXhuIwzMeOuVca0YDym2QCTdu4S4+eaes5ULpkoI8+w
         ZzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705252686; x=1705857486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9iIM8uBYC36tPhggxKYNaJLdGzu8Tu1+DX3lqYuJ6I=;
        b=SJpkGNGbd/SHfdjroOez5t2kwBYJZKTalBRZhSMJSp3A4K4A0n2Mxn3C3MSczl9Rq8
         FWH9vSbodOug5rl2/RoHU4ZCn7JhgJp2iXvWbPfT7Odfqt+ca3c6y2OMjf/LD/OyJ9Hl
         h0LKjTMhEbX6BLPBjJfxWOPEPNvEVewN3qzuW/sGJHILwATVJg5JhyBr3fjnagUOxU0w
         05uR/mFHpLUHd1KbOuvzA3vzY9BER91hWeCSkxwSFljAc24KJe+SAySuIuPaYLEcC9N5
         wKKATak/zChzZYZe7C4s7l4KBxdJpWD+1pn1YB31Qbe8tcT+ER/aDv6c1mYaEpnHrhpq
         m63Q==
X-Gm-Message-State: AOJu0Yzm6O+nuI0L+daOlePQkebhh7khps57LRw9pGFbwae8mXOD4phF
	S+apGcg+hYvwa2iYC6kMNzZR9GjuEUqjxFID0Mc=
X-Google-Smtp-Source: AGHT+IG6POUOMJGNKwSNbo7ABHQhoir/a/gWEzUolGPjwK8FmJgaBCezqnqimP7/H9SPuqGnMyMzKsV8siyBCFERNk8=
X-Received: by 2002:a05:6870:1482:b0:206:7fbe:b142 with SMTP id
 k2-20020a056870148200b002067fbeb142mr2610273oab.17.1705252686360; Sun, 14 Jan
 2024 09:18:06 -0800 (PST)
MIME-Version: 1.0
References: <20240103093943.959731-1-peter.marko@siemens.com> <CAJiuCcfVA6H=L3-3+PRnJKdpcU3YR2JGDx11W2vUQ+C9TN4T=w@mail.gmail.com>
In-Reply-To: <CAJiuCcfVA6H=L3-3+PRnJKdpcU3YR2JGDx11W2vUQ+C9TN4T=w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jan 2024 09:17:40 -0800
Message-ID: <CAMKF1sqzuUHHTkON6eOd9zu9Gith_Bsg7QBzCdL-=e1m1NFgng@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] protobuf-c: upgrade 1.4.1 -> 1.5.0
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: peter.marko@siemens.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jan 2024 17:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108275

On Sun, Jan 14, 2024 at 6:17=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.clem=
@gmail.com> wrote:
>
> Hi,
>
> On Wed, 3 Jan 2024 at 10:40, Peter Marko via lists.openembedded.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Current hash pointed to version with code already indentical
> > to v1.5.0, it was just missing three formal release commits:
> >     a15d80a Bump copyright years to 2023
> >     6600fd5 Bump version to 1.5.0
> >     8c201f6 CHANGELOG.md: 1.5.0
> >
> > License-Update: copyright years refreshed
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  .../protobuf/{protobuf-c_1.4.1.bb =3D> protobuf-c_1.5.0.bb}     | 4 ++=
--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.4.1.bb =3D> pro=
tobuf-c_1.5.0.bb} (91%)
> >
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb b/me=
ta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
> > similarity index 91%
> > rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
> > rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
> > index 1d9ca9daae..545618a4ec 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
> > @@ -8,14 +8,14 @@ has been split out into the protobuf-c-rpc project."
> >  HOMEPAGE =3D "https://github.com/protobuf-c/protobuf-c"
> >  SECTION =3D "console/tools"
> >  LICENSE =3D "BSD-2-Clause"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9f725889e0d77383e26cb42b0b6=
2cea2"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd11077c6a2b5d2e64b9f32b61a9=
b78ba"
> >
> >  DEPENDS =3D "protobuf-native protobuf"
> >
> >  SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git;branch=3Dnext;=
protocol=3Dhttps"
>
> The branch=3Dnext should be updated here as well.

this patch is already accepted so please send an incremental patch

>
> Regards,
>
> >  SRC_URI:append:class-native =3D " file://0001-Makefile.am-do-not-compi=
le-the-code-which-was-genera.patch"
> >
> > -SRCREV =3D "ba4c55f0e686e0252c451f7163ab529e4b36831a"
> > +SRCREV =3D "8c201f6e47a53feaab773922a743091eb6c8972a"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.30.2
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108274): https://lists.openembedded.org/g/openembedde=
d-devel/message/108274
> Mute This Topic: https://lists.openembedded.org/mt/103499083/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

