Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DF8CE8E7E
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 14:19:58 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.15758.1729779591988986534
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 07:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FGWKPiAo;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5ebc03951abso458982eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729779591; x=1730384391; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIRc29JMYIQAXegV0p7PbiXMiB/aOqM/Ko3KGUjbOSk=;
        b=FGWKPiAoDo43A0icV36WxGU5RXbHqIELj/Y7U677+5r+jqxDtpl/Ch1+XwY6JC9dt7
         riidVYHD7WSnmFfUKbiXvEb1x531kaMtF6Nk5H62CoZhorcPG9q/uyzoOkUBuZEaZMOi
         e8O6rUfy3tz21+3fy5lzWHecfEdCtrW6hQus5wM5j+WAtyY5Rs3oVrb5UZYdkahgWzpR
         XfqNlrHJWtEDEaj8rwi7hetNS4jeUQzgziiy3q93wvY1TB6ZrUiKAgPsYpcb6defc/qH
         B7t9RO830ox7NGGthyrSFU464Nyj2YpW0drXViTqp/M9GWpxjNFfrN5d4UzJ/l4cxA77
         x53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779591; x=1730384391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIRc29JMYIQAXegV0p7PbiXMiB/aOqM/Ko3KGUjbOSk=;
        b=aVc9+V32uZt8abg3Zx0lupc7GMwkSjr7B5TyBSz65C9yI/OuenZZHa+sVDutc+ZAVa
         Y6l8qiapstadmSJmiKBhbOeLJilWIIzr3yLzwAYtMdtZbWwDaUJohmYTS0hQmScysKdU
         QTwoQHn/2lYPqlPZnpmhFxgAr2fxaEDRy0DJYx/wdFomovCfm5RxaNmI+0C2vCyIuN76
         756czQ64YP8LPNpt6R/2pXPSMfKjFneRTlDIRmVdPvLFFAO3/4W8CfBfTRYpAIsE3mj7
         hpP8sPGOKZllq2B3kn1Pzfxka9onQ6g+Ver0YBgx9T+F1Cpwx5nVQQ8nD4QKpe2NLUnM
         kO6w==
X-Forwarded-Encrypted: i=1; AJvYcCX2yhoAdMNITyIQ7hB82gAYDF/ROgBgtT2mLZumrhSZHfNsCIDWR44bcxQtlAzOzZ3ErZio+bVqmHoJ7zUPO46+4L8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyoIgVXcj8F/QY+plW2WzyQHz8WBmvIYseB/zca/x2zjawa76JQ
	OVDft9ciA840g7wSmixy7TR7HX3BwJ9QPr5uOCXuUg8ftf3ay0d1DR5eQ2KUU6Mr5Lb8S//GcpZ
	P3HQEOJShU1avIfBS3yluA7kYx2g=
X-Google-Smtp-Source: AGHT+IFMEYa/BryAgZxkO9PJ3qWG9KZCDd93mDYGF5bIIf8FRZB26sjXJi6NsHuVB9CQ/+KAHTus/jdl1TuPaTIu9QM=
X-Received: by 2002:a05:6820:1acb:b0:5e7:cb2e:dfec with SMTP id
 006d021491bc7-5ebee9974bfmr4343223eaf.8.1729779588339; Thu, 24 Oct 2024
 07:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241024135126.48781-1-brgl@bgdev.pl> <29bbf4a17cfa28fc45c0f3e7fe3b472170d6bdec.camel@siemens.com>
In-Reply-To: <29bbf4a17cfa28fc45c0f3e7fe3b472170d6bdec.camel@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2024 07:19:21 -0700
Message-ID: <CAMKF1spzk7ezwr1ekRq+NxoLFuT3gZ66-ARsc1_ZYfi0czwUgg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] libgpiod: update to v2.2
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, "brgl@bgdev.pl" <brgl@bgdev.pl>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 14:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113171

Thanks for testing and Review Alexander.

On Thu, Oct 24, 2024 at 7:10=E2=80=AFAM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hello all,
>
> On Thu, 2024-10-24 at 15:51 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This is a big update for libgpiod bringing in the D-Bus daemon and its
> > command-line client. This is why the patch is pretty hefty. The majorit=
y
> > of the line count comes from the removed patch that is now upstream but
> > the v2.2 recipe also now contains a lot of bits and pieces that make th=
e
> > D-Bus daemon work both with system as well as sysvinit.
> >
> > The project now packages the systemd service and udev rules that allow
> > the manager to run under its own user in a well sandboxed environment
> > but the sysvsinit script is carried in the recipe as I don't want to
> > put support for legacy systems in libgpiod repo.
> >
> > The patch also updates the ptests for libgpiod to run three new
> > test-suites: one for GLib bindings, one for the command-line D-Bus
> > client and finally one testing some daemon corner-cases not supported b=
y
> > the client.
> >
> > Build tested with various config options with systemd and sysvinit (the
> > latter with glibc and musl) on 32- and 64-bit architectures.
> >
> > The complete changelog since v2.1 (taken verbatim from the NEWS file) i=
s
> > below:
> >
> > libgpiod v2.2
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > New features:
> > - add GObject bindings with introspection
> > - add a D-Bus interface to libgpiod together with a daemon implementing=
 it and
> >   a command-line client
> > - split out the common shell test code for gpio-tools into a reusable t=
est
> >   harness for GPIO command-line tools
> > - add minutes as a new supported time unit for tools and allow longer p=
eriods
> >   for timeouts, line holding, etc.
> > - add a script for generating sdist and wheels for python bindings
> > - migrate C++ tests to using Catch2 v3
> >
> > Improvements:
> > - relicense C++ bindings under LGPL-2.1-or-later in order to make the p=
roject
> >   more attractive to users with GPL-3.0 restrictions
> > - remove dependency on grep from tools' tests
> > - make shell scripts pass shellcheck treewide
> > - use ppoll() in tools to actually achieve the advertised microsecond
> >   granularity of timeouts
> > - documentation improvements
> > - improve typing info in python bindings
> > - improve __repr__() implementations in python bindings
> > - make reconfiguring lines more flexible in python bindings by relaxing=
 the
> >   requirement to carry the ordering of the config entries from the requ=
est
> > - support casting of line.Value to bool in python bindings
> > - various new test-cases for improved coverage treewide
> > - align the test cases with the current kernel requirement for specifyi=
ng
> >   direction explicitly when reconfiguring lines
> >
> > Bug fixes:
> > - fix C++ bindings build using slibtool
> > - accept the new style automatic GPIO chip labels from gpio-sim in bash=
 tests
> > - fix C++ tests with recent kernels which introduced stricter reconfigu=
re
> >   behavior
> > - fix a use-after-free bug in python bindings
> > - fix passing the event clock property to line requests in python bindi=
ngs
> > - fix a memory leak in tools
> > - make sure the string buffers in line-info and chip-info are big enoug=
h to not
> >   truncate the strings they hold below the size accepted by the kernel
> > - remove buggy and unnecessary flags sanitization from line-config
> > - fix python bindings installation with Makefile build
> > - sanitize the return values of GPIO ioctl()s which in some cases may b=
e
> >   erroneously positive
> > - fix requesting lines by name with multiple entries in python bindings
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I admit I had to backport it to scarthgap to test (along with glib 2.80, =
etc),
> but I didn't notice any problems and I'm able to start gpio-manager
> (systemd service) and control it over gpiocli.
>
> Thanks a lot Bartosz!
>
> Reviewed-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> > ---
> > Changes in v3:
> > - make dbus a runtime dependency for the 'dbus' and 'tests' PACKAGECONF=
IG
> >   switches
> > - make libgpiod-manager a runtime dependency for libgpiod-cli
> >
> > Changes in v2:
> > - fix SRC_URI[sha256sum] value
> >
> >  ...cxx-Migrate-C-tests-to-use-Catch2-v3.patch | 530 ------------------
> >  .../libgpiod/libgpiod-2.x/gpio-manager.init   |  76 +++
> >  .../libgpiod/libgpiod-2.x/run-ptest           |  43 +-
> >  .../libgpiod/libgpiod_2.1.3.bb                |  33 --
> >  .../recipes-support/libgpiod/libgpiod_2.2.bb  |  99 ++++
> >  5 files changed, 206 insertions(+), 575 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-=
bindings-cxx-Migrate-C-tests-to-use-Catch2-v3.patch
> >  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-=
manager.init
> >  delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb
> >  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
>
> --
> Alexander Sverdlin
> Siemens AG
> www.siemens.com

