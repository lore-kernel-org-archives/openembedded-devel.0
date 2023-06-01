Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF93DC7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 19:20:28 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.1652.1685647222598026850
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 12:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=RWbhSu3k;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.222.43, mailfrom: brgl@bgdev.pl)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-783fc329e72so349177241.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 12:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685647221; x=1688239221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYuDqQfteIXfXXWeuzJ7yLDCTGuVsbxJUoPvJDo6f5s=;
        b=RWbhSu3kSb370BRPPPsfVsGBat3lreIidMpGY4Lt9BXTCmja04Vejokh75VsNFFQaw
         kkRBnTU4t3a9t2FesSdQ8OEASA0cAXiZJyfVb9AvWmxZ/92LNrcLIgCTfWCBZhNKCmpQ
         EYo4Nk5k6IYKgtpjVEU+WA+IUBy4Y9UujCJOO8eBWLncFdS0CBg710NMiYQRFdCuNNz0
         uTMoh4+yYvh6Zf+L6LAvNM3J/u/4Eaq0CdRYqMAoaom987TpH360wpWqunzAEgaSmwdy
         3IILTa56aMoi1+ff9L58LwHYPPBETVacO2mcHONp+j4t0a+nZbyEJ+1qGgCkkuAL5hn6
         OKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685647221; x=1688239221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYuDqQfteIXfXXWeuzJ7yLDCTGuVsbxJUoPvJDo6f5s=;
        b=MbX3JwiY7IDusXJIQ0iVrNIyIZtTZ1n0/DBg7PEi2CrcjDr0ye5PkqkYqlivHeSLXy
         OQ9jwdsLCLzRfqLlsU2aKU69pztt63dv7PooVY+HnJfrQKDWVgruNO3P9xow0mtSYdgb
         qhZD6TjGZuCO+TsWFxS4j8Dcew62JmrQ96YG80Lq2JjRQgG3w5+vW1LacVNXIq7rQxU7
         6n8ScG5NwNOYIXQFix/GoScOsE51gMtaVt8fszuyLPetK1kiBQnZZCxcQPUxXvV0c5Wl
         vxpCKupkkBssyAAyUg2L6uvgbeFj6p1oxh561dvGxgbJvNHCLomC9lQKOE5AtT5Gv5uc
         x0uw==
X-Gm-Message-State: AC+VfDyrUJrvSywFmmqDFRhnpLmsApO2nL6CEK4mCgHu7buScftb+ZEf
	B+ikcfsZHoC8D+5UT5jDap57IXKRHjasrmN8yPoKFXpMI9DkeO9C
X-Google-Smtp-Source: ACHHUZ4jjKy8/cFAysRUxnXH+XdKl5iWGN88LMMFUuXpWiligJLM3cqfSOpuxGeTsaqQB3VyuKHGPaBQOUJoVDfctKQ=
X-Received: by 2002:a1f:454e:0:b0:450:2025:5b00 with SMTP id
 s75-20020a1f454e000000b0045020255b00mr1503173vka.4.1685647221314; Thu, 01 Jun
 2023 12:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230524181131.3890392-1-joe.slater@windriver.com>
 <6a34b59d-413b-ab1c-2818-8b933ad55438@windriver.com> <CAMRc=MeZTM-cUaganZ2Tuf5WOnbDQftVAX-_QODzvO_fWrWGhw@mail.gmail.com>
 <CAMKF1srQ6rTbVCEVhcbnVyJAqxekTfK3gvZSL6QqxCdaaSHxsw@mail.gmail.com>
In-Reply-To: <CAMKF1srQ6rTbVCEVhcbnVyJAqxekTfK3gvZSL6QqxCdaaSHxsw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 1 Jun 2023 21:20:10 +0200
Message-ID: <CAMRc=Me_aBNJMC47nVxA02g3uFrsmK+0-mhv1NYnsbOy6R+2cw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle (continuous)'
To: Khem Raj <raj.khem@gmail.com>
Cc: randy.macleod@windriver.com, joe.slater@windriver.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 19:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103088

On Thu, Jun 1, 2023 at 9:15=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Jun 1, 2023 at 12:04=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > On Wed, May 24, 2023 at 9:46=E2=80=AFPM Randy MacLeod via
> > lists.openembedded.org
> > <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
> > >
> > > On 2023-05-24 14:11, joe.slater@windriver.com wrote:
> > >
> > > From: Joe Slater <joe.slater@windriver.com>
> > >
> > > Look for level transitions when testing toggling
> > > values because using fixed delays to assume value
> > > changes is not reliable.
> > >
> > > The updated commit log and comment below look good to me.
> > >
> > >
> > > Please send a patch to upstream and reply to this thread with
> > > a link to that or send a commit to update the:
> > >
> > > Upstream-Status: pending
> > >
> >
> > This patch breaks the following test for me:
> >
> >  =E2=9C=97 gpioset: toggle (continuous)
> >    (from function `gpiosim_wait_value' in file
> > /usr/lib/libgpiod/ptest/tests/gpio-tools-test.bats, line 155,
> >     in test file /usr/lib/libgpiod/ptest/tests/gpio-tools-test.bats, li=
ne 1587)
> >      `gpiosim_wait_value sim0 1 0' failed
> >
> > on current master meta-openembedded. Why did this even get here?
>
> It was reviewed and request to upstream was also made.
>
> We now have ptests runs for meta-oe but on a subset of recipes and they a=
re
> run regularly as part of testing. So perhaps it will be good to enable
> ptests for
> this and add it to PTESTS_FAST_META_OE in
> meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> currently this recipe is part of PTESTS_PROBLEMS_META_OE which means
> tests are not ready to be enabled, it will be good to sort this out for f=
uture.
>

Ptest for libgpiod require a kernel feature (gpio-sim module) to be
enabled if using the yocto kernel. Could this pose a problem? I have
an automated yocto build that runs the ptests locally but it would be
great to have it on official autobuilders too.

> The
> > patch did not go upstream in this form and needs some more work.
> > Please Cc me on future patches to any of the libgpiod recipes.
> >
>
> Thanks for signing up although I am not sure how to make it visible,
> perhaps it would be good to
> add maintainer info in the recipe header in standard way.
>

Will do, thanks.

> > In the meantime. Khem: could you please revert this?
> >
>
> Yes we can.
>

Thank you.

Bartosz

> > Bart
> >
> > > tag.
> > >
> > > Thanks,
> > >
> > > ../Randy
> > >
> > > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > ---
> > >  ...-ptest-modify-delays-in-toggle-tests.patch | 60 +++++++++++++++++=
++
> > >  .../libgpiod/libgpiod_2.0.1.bb                |  2 +
> > >  2 files changed, 62 insertions(+)
> > >  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/000=
1-ptest-modify-delays-in-toggle-tests.patch
> > >
> > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest=
-modify-delays-in-toggle-tests.patch b/meta-oe/recipes-support/libgpiod/lib=
gpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch
> > > new file mode 100644
> > > index 0000000000..11f2d5c4a9
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify=
-delays-in-toggle-tests.patch
> > > @@ -0,0 +1,60 @@
> > > +From b73a79245ac0fa36b15bf3308e4ed008793ff15c Mon Sep 17 00:00:00 20=
01
> > > +From: Joe Slater <joe.slater@windriver.com>
> > > +Date: Fri, 19 May 2023 08:46:47 -0700
> > > +Subject: [PATCH] ptest: modify delays in toggle test
> > > +
> > > +The test "gpioset: toggle (continuous)" uses fixed delays to test
> > > +toggling values.  This is not reliable, so we switch to looking
> > > +for transitions from one value to another.
> > > +
> > > +Upstream-Status: pending
> > > +
> > > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > +---
> > > + tools/gpio-tools-test.bats | 6 +++---
> > > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > > +
> > > +--- libgpiod-2.0.orig/tools/gpio-tools-test.bats
> > > ++++ libgpiod-2.0/tools/gpio-tools-test.bats
> > > +@@ -141,6 +141,20 @@ gpiosim_check_value() {
> > > + [ "$VAL" =3D "$EXPECTED" ]
> > > + }
> > > +
> > > ++gpiosim_wait_value() {
> > > ++ local OFFSET=3D$2
> > > ++ local EXPECTED=3D$3
> > > ++ local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > > ++ local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > > ++
> > > ++ for i in {1..10} ; do
> > > ++ VAL=3D$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
> > > ++ [ "$VAL" =3D "$EXPECTED" ] && return
> > > ++ sleep 0.1
> > > ++ done
> > > ++ return 1
> > > ++}
> > > ++
> > > + gpiosim_cleanup() {
> > > + for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> > > + do
> > > +@@ -1567,15 +1581,15 @@ request_release_line() {
> > > + gpiosim_check_value sim0 4 0
> > > + gpiosim_check_value sim0 7 0
> > > +
> > > +- sleep 1
> > > +-
> > > +- gpiosim_check_value sim0 1 0
> > > ++ # sleeping fixed amounts can be unreliable, so we
> > > ++ # sync to the toggles
> > > ++ #
> > > ++ gpiosim_wait_value sim0 1 0
> > > + gpiosim_check_value sim0 4 1
> > > + gpiosim_check_value sim0 7 1
> > > +
> > > +- sleep 1
> > > +
> > > +- gpiosim_check_value sim0 1 1
> > > ++ gpiosim_wait_value sim0 1 1
> > > + gpiosim_check_value sim0 4 0
> > > + gpiosim_check_value sim0 7 0
> > > + }
> > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb b/met=
a-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > index 337554cd89..91c4d27692 100644
> > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D " \
> > >
> > >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
> > >
> > > +SRC_URI +=3D "file://0001-ptest-modify-delays-in-toggle-tests.patch"
> > > +
> > >  SRC_URI[sha256sum] =3D "b5367d28d045b36007a4ffd42cceda4c358737ef4f2c=
e22b0c1d05ec57a38392"
> > >
> > >  # Enable all project features for ptest
> > >
> > >
> > > --
> > > # Randy MacLeod
> > > # Wind River Linux
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#102793): https://lists.openembedded.org/g/openemb=
edded-devel/message/102793
> > > Mute This Topic: https://lists.openembedded.org/mt/99114621/3618139
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [brgl@bgdev.pl]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

