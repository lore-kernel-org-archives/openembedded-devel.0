Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A48FEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 07:35:49 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.12741.1686814546258169109
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 00:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=t1vahuAg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.222.51, mailfrom: brgl@bgdev.pl)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-783f7e82f2aso1317542241.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686814545; x=1689406545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdzkWWC8DehXU257siE0yMzjTQ7R3BuIm75P+oHM1aI=;
        b=t1vahuAgWO4Nlob+nk32Qvpe/DP3Bibun08IQpim1WDZ8fau3Vf1NOEt8R5TS/LGQJ
         InDGftJsHo8u1w9AIS6L9QlQrk4U7UbS/DXzepC40Qmn21I5jlYzR5fxtVPcec/AmNtT
         pqR6WXETgEGsQw1/w8IHV1BZ0LD8HYwFTrioVza896PO4HkEXvHRW1MIlVS9OIy8mvue
         m9sB2TATTNAgw0QcZ/g2lBcJ8yf6tpU5Vvy1mJvK1xQLFTNInQzuy2GfWvdRJdV/6u7U
         H8/90mOCJSc3G3Et/lUVieXAUT8JRvq52TkrgD8+iTXzCPMljphR2knjg9y3bPQNUz9X
         0Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814545; x=1689406545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdzkWWC8DehXU257siE0yMzjTQ7R3BuIm75P+oHM1aI=;
        b=DYeETBAhKrSytdgetXasbZzoDIa4YS/v2nSRusp96qPeXohScCFSAUHSlKHQZofP1T
         gvYXle4a/8ZjGyzBFXfv+0KkYgsCHsTWRXQvaBsMpgeP8E+pykoVlw+SZ7/wXuD3YQJx
         qJFfgwr91P4hMk6A6YNRZRAIaxTg/gN53oob0Kt1Vz9eqVOjhkrP/ussJ35rYpAPfGB4
         PavV6uaALny1mz8/eVdUyc91Y43zTH1E2eSXuh8r7wxdhywX0j3+MIQyyujr7LMSL7eB
         pt0aFyFoBc/mPbRRgaSBhvKhzm5XrxFptCT7NaIAw6GrOD/3vwDeMH9O+2D7+GtzaVbd
         uhCg==
X-Gm-Message-State: AC+VfDye6KIYb5owHyTpbi2MPW5K5b7cySA+vwFtFfqlqAITZtRk+n+E
	/E/njh7O5Do9fzw6p5/37/G9OqlSCkglf7YugdNtQg==
X-Google-Smtp-Source: ACHHUZ4em0HMkjXKoC9/PE6295unhFlDGAkdkFA1en+WN80w19/pdOojGK4F72uJw2Ptr5Ee4kAarX7ZElVMODWJJgo=
X-Received: by 2002:a05:6102:2759:b0:43f:5ce1:1d5 with SMTP id
 p25-20020a056102275900b0043f5ce101d5mr219599vsu.8.1686814545158; Thu, 15 Jun
 2023 00:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230614140611.2415960-1-joe.slater@windriver.com>
 <CAMRc=Mdh3po_oMNU4mRJxkzatgaDGCJE-JNX3o4zdQp3iQZ5Hg@mail.gmail.com> <BY5PR11MB399222744470B071426ED281885AA@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB399222744470B071426ED281885AA@BY5PR11MB3992.namprd11.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 15 Jun 2023 09:35:34 +0200
Message-ID: <CAMRc=Me+qsZS1wK+rqhAwWSBQN8c7QNrCo9zX9nAY2mwuYTrOw@mail.gmail.com>
Subject: Re: [v3][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle (continuous)'
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 07:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103291

On Wed, Jun 14, 2023 at 5:41=E2=80=AFPM Slater, Joseph <joe.slater@windrive=
r.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <brgl@bgdev.pl>
> > Sent: Wednesday, June 14, 2023 8:13 AM
> > To: Slater, Joseph <joe.slater@windriver.com>
> > Cc: openembedded-devel@lists.openembedded.org; MacLeod, Randy
> > <Randy.MacLeod@windriver.com>
> > Subject: Re: [v3][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: t=
oggle
> > (continuous)'
> >
> > On Wed, Jun 14, 2023 at 4:06=E2=80=AFPM <joe.slater@windriver.com> wrot=
e:
> > >
> > > From: Joe Slater <joe.slater@windriver.com>
> > >
> > > Look for level transitions when testing toggling values because using
> > > fixed delays to assume value changes is not reliable.
> > >
> > > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > ---
> > >  .../gpio-tools-test-bats-modify.patch         | 67 +++++++++++++++++=
++
> > >  .../libgpiod/libgpiod_2.0.1.bb                |  2 +
> > >  2 files changed, 69 insertions(+)
> > >  create mode 100644
> > > meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-mo=
d
> > > ify.patch
> > >
> > > diff --git
> > > a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-=
m
> > > odify.patch
> > > b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-=
m
> > > odify.patch
> > > new file mode 100644
> > > index 0000000000..4d49467968
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-b=
a
> > > +++ ts-modify.patch
> > > @@ -0,0 +1,67 @@
> > > +From 53f9670d6af1bd0745c1df9c469b269c72607b23 Mon Sep 17 00:00:00
> > > +2001
> > > +From: Joe Slater <joe.slater@windriver.com>
> > > +Date: Tue, 6 Jun 2023 08:04:27 -0700
> > > +Subject: [PATCH] tools: tests: modify delays in toggle test
> > > +
> > > +The test "gpioset: toggle (continuous)" uses fixed delays to test
> > > +toggling values. This is not reliable, so we switch to looking for
> > > +transitions from one value to another.
> > > +
> > > +We wait for a transition up to 1.5 seconds.
> > > +
> > > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > +Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > +
> > > +Upstream-status: accepted
> > > +
> > > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > +---
> > > + tools/gpio-tools-test.bats | 21 ++++++++++++++++-----
> > > + 1 file changed, 16 insertions(+), 5 deletions(-)
> > > +
> > > +diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> > > +index c83ca7d..929c35a 100755
> > > +--- a/tools/gpio-tools-test.bats
> > > ++++ b/tools/gpio-tools-test.bats
> > > +@@ -141,6 +141,20 @@ gpiosim_check_value() {
> > > +       [ "$VAL" =3D "$EXPECTED" ]
> > > + }
> > > +
> > > ++gpiosim_wait_value() {
> > > ++      local OFFSET=3D$2
> > > ++      local EXPECTED=3D$3
> > > ++      local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > > ++      local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > > ++      local
> > > ++PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
> > > ++
> > > ++      for i in {1..15}; do
> > > ++              [ "$(<$PORT)" =3D "$EXPECTED" ] && return
> > > ++              sleep 0.1
> > > ++      done
> > > ++      return 1
> > > ++}
> > > ++
> > > + gpiosim_cleanup() {
> > > +       for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> > > +       do
> > > +@@ -1567,15 +1581,12 @@ request_release_line() {
> > > +       gpiosim_check_value sim0 4 0
> > > +       gpiosim_check_value sim0 7 0
> > > +
> > > +-      sleep 1
> > > +-
> > > +-      gpiosim_check_value sim0 1 0
> > > ++      gpiosim_wait_value sim0 1 0
> > > +       gpiosim_check_value sim0 4 1
> > > +       gpiosim_check_value sim0 7 1
> > > +
> > > +-      sleep 1
> > > +
> > > +-      gpiosim_check_value sim0 1 1
> > > ++      gpiosim_wait_value sim0 1 1
> > > +       gpiosim_check_value sim0 4 0
> > > +       gpiosim_check_value sim0 7 0
> > > + }
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > index 337554cd89..6958f2d841 100644
> > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> > > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D " \
> > >
> > >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
> > >
> > > +SRC_URI +=3D "file://gpio-tools-test-bats-modify.patch"
> > > +
> > >  SRC_URI[sha256sum] =3D
> > "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b0c1d05ec57a38392"
> > >
> > >  # Enable all project features for ptest
> > > --
> > > 2.25.1
> > >
> > Reluctant:
> >
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Although, I'm asking myself - why do you need this? Have you seen any f=
ailures
> > with ptest? Can this wait for a full release?
>
> [Slater, Joseph]
> Yes, we have seen failures.  It is not my call as to when they need to be=
 fixed.  I can understand meta-oe wanting to wait for a release.  If that i=
s the case, I'll have to see what people want to do locally as a temporary =
fix.
>

Ok, let's take it and I'll backport it to v2.0.x.

Thanks,
Bartosz

