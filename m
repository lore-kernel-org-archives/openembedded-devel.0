Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB46C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 19:15:18 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.1513.1685646911260058177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 12:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Z1h2owKL;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-19a427d7b57so911192fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 12:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685646910; x=1688238910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqmrKv9zyeBL1GeRy2Av9i189rURHO75FELzlXYJ2nU=;
        b=Z1h2owKLZCL0G3QWj7LLHuA9XvKYZHnt5GeAva830xHUU/IYnqJqNS0JF3NVIw4/SQ
         0sIJi9GlFsSLRyxwzoerfnVWsgrYLff9vfhq1U1vTAId+zcRAtlC/RvVti4Sydx1lvrg
         LyNYvcfmg6iJe4M0ELvq7YeyVWEIDuo211vWg6sztQ2zfOT37FS/b8otcozUp4kziPoz
         FgxEtn5MGkREx4z0CJXqEwRocvilfs9UcyVI2DjyWkW9l7UHVhQIMttNhoZXW2vZbuJ5
         +oh4pKVGTmhsfxT3FmmGnp+DhiVMXzVWky8RtH/4Eu0aFBVmc9uqmCVgMUwXcfmSahdd
         4HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685646910; x=1688238910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqmrKv9zyeBL1GeRy2Av9i189rURHO75FELzlXYJ2nU=;
        b=HshT7bdcMQlLYGBxHTaPN7SkGa1dCaZPqssxE4gJtN5WmBJafEG469ccdfAwWen/sM
         o0U4NW7khqx2aJL2l0P/x40SKUsR2Lo/HykLqp2XR3MvsxOsjVY8qqxWBw1k10dQdw7M
         fRb30RSb91ktZijnOS9TL/9ZyPNnJZuksFIJdmZ5cL9lujNbnb+qVHz6uSthKrIZ543A
         ZTeajNZmyV/ICtGksB31mugWnyjOji6k0faH9KpfyEE+pzNw3lUOxvP9RJdj3Dh7iAwX
         pK+YHzv2ObTZRRba+UymwPZ6V9Xdt6bxLtFx4JdFVCzmRilZpCvyCRjMZ90u1yVMnX+x
         r4RQ==
X-Gm-Message-State: AC+VfDwXdhjc91o/GYafS2gu1DD3+KHIJGanLUoh1ycq85a2lfrAYrL+
	EulpqPpkXFBpIWij2j9FdLH3aYpnN9vaweUrDz3HjY4F6YE=
X-Google-Smtp-Source: ACHHUZ7OCUS87et75Nja3xQ+psGpYSfuFiLZvY0/318+tyhkgwskDrqR4GWKa/itFDq2pdsozKP4lzKE3AmDW8Utqec=
X-Received: by 2002:a05:6870:d04:b0:19d:a4bf:dbb5 with SMTP id
 mk4-20020a0568700d0400b0019da4bfdbb5mr186786oab.24.1685646910251; Thu, 01 Jun
 2023 12:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230524181131.3890392-1-joe.slater@windriver.com>
 <6a34b59d-413b-ab1c-2818-8b933ad55438@windriver.com> <CAMRc=MeZTM-cUaganZ2Tuf5WOnbDQftVAX-_QODzvO_fWrWGhw@mail.gmail.com>
In-Reply-To: <CAMRc=MeZTM-cUaganZ2Tuf5WOnbDQftVAX-_QODzvO_fWrWGhw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Jun 2023 12:14:44 -0700
Message-ID: <CAMKF1srQ6rTbVCEVhcbnVyJAqxekTfK3gvZSL6QqxCdaaSHxsw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle (continuous)'
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: randy.macleod@windriver.com, joe.slater@windriver.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 19:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103086

On Thu, Jun 1, 2023 at 12:04=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, May 24, 2023 at 9:46=E2=80=AFPM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > On 2023-05-24 14:11, joe.slater@windriver.com wrote:
> >
> > From: Joe Slater <joe.slater@windriver.com>
> >
> > Look for level transitions when testing toggling
> > values because using fixed delays to assume value
> > changes is not reliable.
> >
> > The updated commit log and comment below look good to me.
> >
> >
> > Please send a patch to upstream and reply to this thread with
> > a link to that or send a commit to update the:
> >
> > Upstream-Status: pending
> >
>
> This patch breaks the following test for me:
>
>  =E2=9C=97 gpioset: toggle (continuous)
>    (from function `gpiosim_wait_value' in file
> /usr/lib/libgpiod/ptest/tests/gpio-tools-test.bats, line 155,
>     in test file /usr/lib/libgpiod/ptest/tests/gpio-tools-test.bats, line=
 1587)
>      `gpiosim_wait_value sim0 1 0' failed
>
> on current master meta-openembedded. Why did this even get here?

It was reviewed and request to upstream was also made.

We now have ptests runs for meta-oe but on a subset of recipes and they are
run regularly as part of testing. So perhaps it will be good to enable
ptests for
this and add it to PTESTS_FAST_META_OE in
meta-oe/conf/include/ptest-packagelists-meta-oe.inc
currently this recipe is part of PTESTS_PROBLEMS_META_OE which means
tests are not ready to be enabled, it will be good to sort this out for fut=
ure.

The
> patch did not go upstream in this form and needs some more work.
> Please Cc me on future patches to any of the libgpiod recipes.
>

Thanks for signing up although I am not sure how to make it visible,
perhaps it would be good to
add maintainer info in the recipe header in standard way.

> In the meantime. Khem: could you please revert this?
>

Yes we can.

> Bart
>
> > tag.
> >
> > Thanks,
> >
> > ../Randy
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  ...-ptest-modify-delays-in-toggle-tests.patch | 60 +++++++++++++++++++
> >  .../libgpiod/libgpiod_2.0.1.bb                |  2 +
> >  2 files changed, 62 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-=
ptest-modify-delays-in-toggle-tests.patch
> >
> > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-m=
odify-delays-in-toggle-tests.patch b/meta-oe/recipes-support/libgpiod/libgp=
iod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch
> > new file mode 100644
> > index 0000000000..11f2d5c4a9
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-d=
elays-in-toggle-tests.patch
> > @@ -0,0 +1,60 @@
> > +From b73a79245ac0fa36b15bf3308e4ed008793ff15c Mon Sep 17 00:00:00 2001
> > +From: Joe Slater <joe.slater@windriver.com>
> > +Date: Fri, 19 May 2023 08:46:47 -0700
> > +Subject: [PATCH] ptest: modify delays in toggle test
> > +
> > +The test "gpioset: toggle (continuous)" uses fixed delays to test
> > +toggling values.  This is not reliable, so we switch to looking
> > +for transitions from one value to another.
> > +
> > +Upstream-Status: pending
> > +
> > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > +---
> > + tools/gpio-tools-test.bats | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +--- libgpiod-2.0.orig/tools/gpio-tools-test.bats
> > ++++ libgpiod-2.0/tools/gpio-tools-test.bats
> > +@@ -141,6 +141,20 @@ gpiosim_check_value() {
> > + [ "$VAL" =3D "$EXPECTED" ]
> > + }
> > +
> > ++gpiosim_wait_value() {
> > ++ local OFFSET=3D$2
> > ++ local EXPECTED=3D$3
> > ++ local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > ++ local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > ++
> > ++ for i in {1..10} ; do
> > ++ VAL=3D$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
> > ++ [ "$VAL" =3D "$EXPECTED" ] && return
> > ++ sleep 0.1
> > ++ done
> > ++ return 1
> > ++}
> > ++
> > + gpiosim_cleanup() {
> > + for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> > + do
> > +@@ -1567,15 +1581,15 @@ request_release_line() {
> > + gpiosim_check_value sim0 4 0
> > + gpiosim_check_value sim0 7 0
> > +
> > +- sleep 1
> > +-
> > +- gpiosim_check_value sim0 1 0
> > ++ # sleeping fixed amounts can be unreliable, so we
> > ++ # sync to the toggles
> > ++ #
> > ++ gpiosim_wait_value sim0 1 0
> > + gpiosim_check_value sim0 4 1
> > + gpiosim_check_value sim0 7 1
> > +
> > +- sleep 1
> > +
> > +- gpiosim_check_value sim0 1 1
> > ++ gpiosim_wait_value sim0 1 1
> > + gpiosim_check_value sim0 4 0
> > + gpiosim_check_value sim0 7 0
> > + }
> > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb b/meta-=
oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > index 337554cd89..91c4d27692 100644
> > --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D " \
> >
> >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
> >
> > +SRC_URI +=3D "file://0001-ptest-modify-delays-in-toggle-tests.patch"
> > +
> >  SRC_URI[sha256sum] =3D "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce2=
2b0c1d05ec57a38392"
> >
> >  # Enable all project features for ptest
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#102793): https://lists.openembedded.org/g/openembed=
ded-devel/message/102793
> > Mute This Topic: https://lists.openembedded.org/mt/99114621/3618139
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[brgl@bgdev.pl]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

