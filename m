Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834EDC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 16:08:03 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.26447.1716912482649174159
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 09:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c3npmnKY;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-578972defb3so1246604a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716912481; x=1717517281; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2JZOxkwz6WajyoitK15X+Qz8rhsbF9Me2KYF2aurjQ=;
        b=c3npmnKYL7r989nVDVYyPxuTAPfxy/5Mf2kcruYrVlh1/uT99ZfaksIdekdeg/U5L7
         SHhKT+2U5SB2PdlMOA9wZrnqU9P35dMR6JCljMnuzcH69Y5Hryy5Z++QFaUPjoBzwP12
         +VFnfLk9JHumNlbmWa+WF46xvNY37wq3adFeqRJO98zHKc274e8kJxE6sfwbLCQJPnCB
         EJt9inPGvvOAetOLsJB11WNO17iWF4WgBHIjCiCovcu3DuANAn/RTJ64E83kubxUdKIP
         1Dyp7yc/0nfZchBlBrl217e95w5w+EviWIV5TgSiYohspJKpv9vddPJyg9l9+c4GIBuU
         QQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716912481; x=1717517281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2JZOxkwz6WajyoitK15X+Qz8rhsbF9Me2KYF2aurjQ=;
        b=Myhz3uByCSLUQlSJ9MXgrSkUSL63kDHjehyV3P1fgKZoQLJHEMDtlqrm+NT3VGplkY
         bU6Yfzi8mpc+o1RyCydVo7Yurtm+q54JWdCVv38eLmJLW/SbeJX8PsSSAu1plXSTEVpH
         yF8/1OfKXDYVAYb3cXdBxmRgB7BVM0qI+aD4JYCzvRjye6iWTpH373ZzEt6Hphj/nIE9
         oqfrHdTNQPEMoDQ57iyFPTRbTUkUXgNnWLDqbvnFCSHFwEq+sZAp0nh2V67Oim6OrD1C
         j8jsFoh6iJpF/RuTo+ctmMRPYiukxTCx2HAiWswU74Z5WHSymeCYFWdpG1fl4v0KWxm3
         p5gQ==
X-Gm-Message-State: AOJu0YyyfBymShuB06c9NaCGQ55gt1W+RnFdR85Y7P9oWRvulQQpslsI
	9M4oNCTR3j6Uomt7bDDGxFdUn43pHek+dHx8vrRm4aMuyU1y9+w8dAc2qtXKi1XgBp0njgO+lHH
	frhbKDQhqO6ySzeBXYq19C8EBkac=
X-Google-Smtp-Source: AGHT+IE4gJi5PcUkQu9qZFac9RbqBrddJJt7MDUTdjlqQumZCIwvMvz/yui78cbkhf0SgWJ7tLaQTnoAfynlea48REk=
X-Received: by 2002:a17:906:3881:b0:a59:a078:9e41 with SMTP id
 a640c23a62f3a-a62645d6362mr801647066b.45.1716912480586; Tue, 28 May 2024
 09:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240528091459.3885623-1-dmitry.baryshkov@linaro.org> <CAMKF1sqd_8++4Z6orBcD8-jJ+72=WyOJ0kJ5typvXcoeSoGyYQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqd_8++4Z6orBcD8-jJ+72=WyOJ0kJ5typvXcoeSoGyYQ@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 28 May 2024 19:07:49 +0300
Message-ID: <CALT56yOEuj_CNLVd2RsL6fq4dMwjMsLxJSwb8kPsGvhK62G0-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] android-tools-configfs: point S to UNPACKDIR
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 16:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110594

On Tue, 28 May 2024 at 18:42, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, May 28, 2024 at 2:15=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > android-tools-configfs doesn't have any checked out source files, which
> > results in a warning regarding S not existing. Fix the warning by
> > pointing S to UNPACKDIR.
> >
> > The warning text:
> >
> > WARNING: android-tools-conf-configfs-1.0-r0 do_unpack:
> > android-tools-conf-configfs: the directory ${WORKDIR}/${BP} (<scrubbed>=
)
> > pointed to by the S variable doesn't exist - please set S within the
> > recipe to point to where the source has been unpacked to
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../android-tools/android-tools-conf-configfs_1.0.bb            | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-=
configfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf=
-configfs_1.0.bb
> > index 430b53c4d0cf..b50437615ebf 100644
> > --- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configf=
s_1.0.bb
> > +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configf=
s_1.0.bb
> > @@ -3,6 +3,8 @@ SECTION =3D "console/utils"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade69=
8e0bcf8506ecda2f7b4f302"
> >
> > +S =3D "${UNPACKDIR}"
> > +
>
> perhaps follow the pattern we are using elsewhere
>
> S =3D "${WORKDIR}/sources"
> UNPACKDIR =3D "${S}"

Hmm. Why not.

>
> >  SRC_URI =3D " \
> >      file://android-gadget-setup \
> >      file://android-gadget-start \
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#110579): https://lists.openembedded.org/g/openembed=
ded-devel/message/110579
> > Mute This Topic: https://lists.openembedded.org/mt/106345437/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
With best wishes
Dmitry

