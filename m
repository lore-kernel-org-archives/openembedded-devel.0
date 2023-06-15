Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0540DEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:42:32 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.20358.1686840149399702847
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 07:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IqcUcrSW;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-558cb7f201cso1487034eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 07:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686840148; x=1689432148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf1PT5HMIWR+W3JTs3puQ8Vqt5OKJNWyUcLoYgDoZLY=;
        b=IqcUcrSW0gOygpnYj/jiKFUQB+ym92shRNzAN4BS1bP6eMHVzERqVnJLTPN+ptWsG6
         Vk7buzqWC5etmeGjVqSLCV3GcCTjap7UHvd6K8GcIULqHyYm27rYhsZsntuAy5eV4B2j
         6W+mLf5IcsdVJKHb+gKx4oK2IEJOUgcG3GN8CzIgXnX/Jqwhgfvvx6LsN3xqWxrtTuDO
         V0gxTPQbEykdl9YFyZIDfUtn374XlgwixyuBK2+KrYHHdO/KtOtj6HzHvfUMOFNDR/B1
         bOhNE5Rso9W1X+pc9R6wDYUCArZDJucYeF0+eB8ZcB2HrXFCAxygc2shQ/DkdgXtbDdw
         hSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840148; x=1689432148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bf1PT5HMIWR+W3JTs3puQ8Vqt5OKJNWyUcLoYgDoZLY=;
        b=hvtSUuAPDsEPYiU50alRxWctjkpRsq9WTK441UxKnoJgo7etx3s0ev5cXbkmHtl5wX
         MoXHKeHgudRFwALndMLwx+IVkqSh9vfAXlTk8HQCWFqEJQS2gTmHbb4Gk2cpVhanPomi
         f4Hb96wG41hPjuFl1jJGh+htrcVnDfbIfqZ8HsX6W5/4HE3zFwQEzlFoIpY5rgTJ2GWB
         RAt/fHfpn3mZlZeUMZfc0lhxLygXd2kCR5rd5qLrcBonmLRcxAjmYnVU/tNSG1HUKWoX
         10hoNBotqV6DhBNTfiqoGhHYp3EqvnwDB0lseq55tZiYAjLlynwloDzvRGrSxnz6LD+Q
         Xx/g==
X-Gm-Message-State: AC+VfDzDd1luIx3DVJ6iXpRTWLkxwQ+FUymlh6es2kRZJEFdPFSa5RQx
	zRkfsrHS1YKBXL+J2ES/WikeVo2bITOPjGf+9xA=
X-Google-Smtp-Source: ACHHUZ5LzTRvlyOPvGos+6b29BBL7QXYL2H97eMAMTPFUmj/9DxLYiEwgjvTI3gzpnmYPj2yAFnD5VrQWHhgewu6I0Y=
X-Received: by 2002:a4a:e2c8:0:b0:55d:bbc2:b12b with SMTP id
 l8-20020a4ae2c8000000b0055dbbc2b12bmr5766403oot.5.1686840148510; Thu, 15 Jun
 2023 07:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230614140611.2415960-1-joe.slater@windriver.com>
 <CAMRc=Mdh3po_oMNU4mRJxkzatgaDGCJE-JNX3o4zdQp3iQZ5Hg@mail.gmail.com>
 <BY5PR11MB399222744470B071426ED281885AA@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=Me+qsZS1wK+rqhAwWSBQN8c7QNrCo9zX9nAY2mwuYTrOw@mail.gmail.com>
In-Reply-To: <CAMRc=Me+qsZS1wK+rqhAwWSBQN8c7QNrCo9zX9nAY2mwuYTrOw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jun 2023 07:42:02 -0700
Message-ID: <CAMKF1spkO1DBrRqg44_M3=+uKT+7kYFvD7guZMsgQXCrdoChaA@mail.gmail.com>
Subject: Re: [oe] [v3][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset:
 toggle (continuous)'
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Slater, Joseph" <joe.slater@windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 14:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103306

On Thu, Jun 15, 2023 at 12:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Wed, Jun 14, 2023 at 5:41=E2=80=AFPM Slater, Joseph <joe.slater@windri=
ver.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Bartosz Golaszewski <brgl@bgdev.pl>
> > > Sent: Wednesday, June 14, 2023 8:13 AM
> > > To: Slater, Joseph <joe.slater@windriver.com>
> > > Cc: openembedded-devel@lists.openembedded.org; MacLeod, Randy
> > > <Randy.MacLeod@windriver.com>
> > > Subject: Re: [v3][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset:=
 toggle
> > > (continuous)'
> > >
> > > On Wed, Jun 14, 2023 at 4:06=E2=80=AFPM <joe.slater@windriver.com> wr=
ote:
> > > >
> > > > From: Joe Slater <joe.slater@windriver.com>
> > > >
> > > > Look for level transitions when testing toggling values because usi=
ng
> > > > fixed delays to assume value changes is not reliable.
> > > >
> > > > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > > ---
> > > >  .../gpio-tools-test-bats-modify.patch         | 67 +++++++++++++++=
++++
> > > >  .../libgpiod/libgpiod_2.0.1.bb                |  2 +
> > > >  2 files changed, 69 insertions(+)
> > > >  create mode 100644
> > > > meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-=
mod
> > > > ify.patch
> > > >
> > > > diff --git
> > > > a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bat=
s-m
> > > > odify.patch
> > > > b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bat=
s-m
> > > > odify.patch
> > > > new file mode 100644
> > > > index 0000000000..4d49467968
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test=
-ba
> > > > +++ ts-modify.patch
> > > > @@ -0,0 +1,67 @@
> > > > +From 53f9670d6af1bd0745c1df9c469b269c72607b23 Mon Sep 17 00:00:00
> > > > +2001
> > > > +From: Joe Slater <joe.slater@windriver.com>
> > > > +Date: Tue, 6 Jun 2023 08:04:27 -0700
> > > > +Subject: [PATCH] tools: tests: modify delays in toggle test
> > > > +
> > > > +The test "gpioset: toggle (continuous)" uses fixed delays to test
> > > > +toggling values. This is not reliable, so we switch to looking for
> > > > +transitions from one value to another.
> > > > +
> > > > +We wait for a transition up to 1.5 seconds.
> > > > +
> > > > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > > +Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org=
>
> > > > +
> > > > +Upstream-status: accepted
> > > > +
> > > > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > > +---
> > > > + tools/gpio-tools-test.bats | 21 ++++++++++++++++-----
> > > > + 1 file changed, 16 insertions(+), 5 deletions(-)
> > > > +
> > > > +diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.ba=
ts
> > > > +index c83ca7d..929c35a 100755
> > > > +--- a/tools/gpio-tools-test.bats
> > > > ++++ b/tools/gpio-tools-test.bats
> > > > +@@ -141,6 +141,20 @@ gpiosim_check_value() {
> > > > +       [ "$VAL" =3D "$EXPECTED" ]
> > > > + }
> > > > +
> > > > ++gpiosim_wait_value() {
> > > > ++      local OFFSET=3D$2
> > > > ++      local EXPECTED=3D$3
> > > > ++      local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > > > ++      local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > > > ++      local
> > > > ++PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
> > > > ++
> > > > ++      for i in {1..15}; do
> > > > ++              [ "$(<$PORT)" =3D "$EXPECTED" ] && return
> > > > ++              sleep 0.1
> > > > ++      done
> > > > ++      return 1
> > > > ++}
> > > > ++
> > > > + gpiosim_cleanup() {
> > > > +       for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> > > > +       do
> > > > +@@ -1567,15 +1581,12 @@ request_release_line() {
> > > > +       gpiosim_check_value sim0 4 0
> > > > +       gpiosim_check_value sim0 7 0
> > > > +
> > > > +-      sleep 1
> > > > +-
> > > > +-      gpiosim_check_value sim0 1 0
> > > > ++      gpiosim_wait_value sim0 1 0
> > > > +       gpiosim_check_value sim0 4 1
> > > > +       gpiosim_check_value sim0 7 1
> > > > +
> > > > +-      sleep 1
> > > > +
> > > > +-      gpiosim_check_value sim0 1 1
> > > > ++      gpiosim_wait_value sim0 1 1
> > > > +       gpiosim_check_value sim0 4 0
> > > > +       gpiosim_check_value sim0 7 0
> > > > + }
> > > > +--
> > > > +2.25.1
> > > > +
> > > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > > b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > > index 337554cd89..6958f2d841 100644
> > > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D " \
> > > >
> > > >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
> > > >
> > > > +SRC_URI +=3D "file://gpio-tools-test-bats-modify.patch"
> > > > +
> > > >  SRC_URI[sha256sum] =3D
> > > "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b0c1d05ec57a38392"
> > > >
> > > >  # Enable all project features for ptest
> > > > --
> > > > 2.25.1
> > > >
> > > Reluctant:
> > >
> > > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Although, I'm asking myself - why do you need this? Have you seen any=
 failures
> > > with ptest? Can this wait for a full release?
> >
> > [Slater, Joseph]
> > Yes, we have seen failures.  It is not my call as to when they need to =
be fixed.  I can understand meta-oe wanting to wait for a release.  If that=
 is the case, I'll have to see what people want to do locally as a temporar=
y fix.
> >
>
> Ok, let's take it and I'll backport it to v2.0.x.
>

thanks it is in master now

> Thanks,
> Bartosz
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103291): https://lists.openembedded.org/g/openembedde=
d-devel/message/103291
> Mute This Topic: https://lists.openembedded.org/mt/99528223/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

