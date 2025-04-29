Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16520C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 09:01:16 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.14040.1745917272340636418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 02:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PftaO2Z9;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54e7967cf67so6071555e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745917270; x=1746522070; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Gdzfmzc8hbL1/TKJ0lefJkR961hVAwdAhqH8sJdZrU=;
        b=PftaO2Z9zlz8G7fOiJM4TkAMTI6wU+N0sm7A/dE4D50e9tuBnLstgy82ZHRx0PUVv6
         B8rdv5O0dbaWvO/jGnNp+veJRkSMT2UiRGaWYi94RFGYdslcGuSmQ4F12yd81RC8mjoH
         4OSAYYBFnwuHKODKd5SuVXWuMBJC8nPE8uSluI5odp7VuS7nFfaZH5fePaxwae/fGlq/
         f1hVS6JdxNz5kWaLmfKOkNhNT1natHkJ+GevDZVOKl1UXT/USr0VBYM7oL7mBvf0T0Vv
         xG+0M5LTO7CxEc4/PIAHKXwYS/2L1Pw3FLxUERto7EqdTQCTo8lvMQD6+rBOsxZDkDDg
         dlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917270; x=1746522070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Gdzfmzc8hbL1/TKJ0lefJkR961hVAwdAhqH8sJdZrU=;
        b=IGKnvoaxFCJz+dzbNRrk+LwUsuWGXxHGw1NjiMptK0RTDBbhbXR52c6MbSJylITfDp
         pRfGzfbjwonGL5uTJymR4l9QsZ79Um6INwNYyaMzIWvHr5rTKyeoub8xeeqqNtVzTPKv
         0EM2hP6auUni5ATI23o22bqmgeqJhsQKoXWSrDQbFkY3tdoB3crur65iLfeX6xPSG48j
         w/vkgLFJqunb/6mixclgxUpWhQMND+8Yn1fZ/08YZL4E0pUd7F7EVE4qZMdBXUbwQ9nq
         ITlOcYFwgFml5L6nrhWcAbJVwZA+fbJD97PcHkTyUqdBkuMOtcNc+a4tuMjKF1gbYvdT
         dgwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr8apMWueDVBHhGV7S2SIiPi6CGmgSm9fof+HhNaYr7YqWvewlXOgwxOoWDZa1b1G/3oVm9kW8B3UrOwEDnhdrbVQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyw3/I9IpXlvvmOYYURZbqmQ+T18znFz/UzY7LnASACJ7v4c+Cp
	oN23y2Br3IChCjdVNV+eZspzdNxQbILsWiMQG1rGvpKK7MpLwgVwDd/ypIVEoW2MYjcrpgfD82W
	X3CI/wGPa5B7oBL52nK/tCrBpmIk=
X-Gm-Gg: ASbGnctfO9OhlMkJmPWHYg4S/EU0bx/g4ywTLjqLTEcYiyHx9kq0DmRzobXeF7+jyK7
	2tKKUUoHwqXUIGhFJ85ec2+hyfU79UKfwl2UhXGeAg5zvMScHzavDk573ZKpm0JNljepr7LB7VT
	3Q4I596gc2SnuMjL8wYnLVL4Is
X-Google-Smtp-Source: AGHT+IF2eVVLnvdIo3DJCKvBU40T8JfLtG8TgMFGOj10Se2lDJjPStoOY+qfVGdxWJmUiNiPNJUlmbEcl20WHS/g/fI=
X-Received: by 2002:a05:6512:3d23:b0:54e:9066:9af7 with SMTP id
 2adb3069b0e04-54e9daf5ed5mr636878e87.27.1745917270076; Tue, 29 Apr 2025
 02:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250428173922.43331-1-nguyenthaithuanalg@gmail.com> <CAMKF1soLcrA7eGKfQ4JHBc+hvBEd5XE=7M+5x3OqhnEMB7FxAA@mail.gmail.com>
In-Reply-To: <CAMKF1soLcrA7eGKfQ4JHBc+hvBEd5XE=7M+5x3OqhnEMB7FxAA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Apr 2025 11:00:53 +0200
X-Gm-Features: ATxdqUFZyfIHRZF66cqHkL7Tzmwtd-kUCYCXLw9OZmI6iaaThIa06vk581XQedk
Message-ID: <CA+chaQfkmMKBwwTcUH+xSR7iZ=iJmA_OibELmV6mK35DDYCQzg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: Clean up code
To: raj.khem@gmail.com
Cc: nguyenthaithuanalg@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 09:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117233

It's correctly updated in
https://lists.openembedded.org/g/openembedded-devel/message/117210

but maybe next time move it to one of existing recipes-* directories
instead of recipes-libsimplelog which is used only for this.

On Mon, Apr 28, 2025 at 11:16=E2=80=AFPM Khem Raj via lists.openembedded.or=
g
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Please rebase and squash the code on master branch or master-next branch
>
> On Mon, Apr 28, 2025 at 11:06=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=
=C3=A1i via
> lists.openembedded.org
> <nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > 1. Add "simplelog-topic.md" designation.
> >
> > 2. Fix warning in building.
> >
> > 3. "-Werror=3Dformat".
> >
> > Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> > ---
> >  meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git=
.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> > index 764425dbc..8acf50fe8 100644
> > --- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> > +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> > @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382=
a6275cb4c2e75c517952ac7c"
> >
> >  SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dma=
in;protocol=3Dhttps"
> >
> > -PV =3D "1.0.5+git"
> > -SRCREV =3D "fa8c68f8dfcf72adb346f1f4d6dfad02829052b5"
> > +PV =3D "1.0.6+git"
> > +SRCREV =3D "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.47.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117204): https://lists.openembedded.org/g/openembedde=
d-devel/message/117204
> Mute This Topic: https://lists.openembedded.org/mt/112505202/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

