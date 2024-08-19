Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2589AC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 15:22:38 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.213500.1724080954914002655
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 08:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g6OIUunc;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5d5b1e33fa8so2793277eaf.3
        for <Openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724080954; x=1724685754; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjdsP26QjABpXXKXmh2skCNw3l2pFCHZaigAjZeilVI=;
        b=g6OIUunc/xBS+31I+FrQwpVj4oYMp+zGzRMtq09XiskJkfmIm1TgG5H/EAu+1PSfYR
         n2lVi2UQJ9SOwdjRIH0OBRY4qXV5MG8DDM/q4mUjlmQOltIomuFd/KuOEBYJMKZyX0xo
         6okyLerR2l4HV536PrArre86MCMWthnR0tBWf11td/JmPgWeVYISozHAfPMWlRYNCAN1
         GaR0P7RhNEKm2BPo65hWN82NBnzUsTa6h2Dsude4TXkmfZF7210UvCglAWShWCiRjIJS
         4WbjNrymN+wOWITeahyzVSS28x3SgRG33T1uwltWzrv6z0kaIhb6XuRFSd0JBxSvGycv
         AlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724080954; x=1724685754;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjdsP26QjABpXXKXmh2skCNw3l2pFCHZaigAjZeilVI=;
        b=usAC7GHxQfXSMmel3FIsLgyl6ovHaNlLV8xr82B6tCJYPHM88E1i0iaSTdwI6pMvtN
         l8ZMpYs1pg2TmXKtHSmFgzk0Sc8+IRdIXzpMWdxNHebxyGGbi7h8encpzopTxbk1wHdN
         z5irNyV4hdu2Jhow8sZon+lOeBk4e4m8MsgH6IPRIuFeDcJDJgV5Ed9cvOEUMdOHm8QU
         n1xRQbLynRyW3SDg8su6tJyWqWxrkX91RP1GFWX2E3zavcWoIPVF3ODEua/KZhpajlXe
         FaJoX/+4CL4gJHl+pWZAepZ572jL2D9GBmqZi0S32d5JO/xUAugEZu1S7RLQrZ2D48V8
         LXsA==
X-Gm-Message-State: AOJu0Ywx6ceUCXVyh6318f4po0H3e6a6A2an0NwP87FnVkodVM5pp84C
	+Rcn65Ugt4O8RW4u8qlwF+IwIM4o3pDZPbdKlXeiJ6HXthmpRuoFB8mpGah2+xTIbDC4BQuyX5w
	iFgLKNJewN9V7ETBlyKhvRuZQ0GMqLlUB
X-Google-Smtp-Source: AGHT+IH72i4d+oN+GF/Y3dY+lE4XXvjcLaJX17ywB3iEWjA6oTpHc2wx2Dz+Npm+4nP/5uLdK5WUkZxblFLjRbkomo0=
X-Received: by 2002:a05:6820:1c8c:b0:5d6:c77:fb85 with SMTP id
 006d021491bc7-5da97d1f98amr12422722eaf.0.1724080953780; Mon, 19 Aug 2024
 08:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soNow9XQXcspm2w7JAXROmU8OTzxwj1tLNYWRPoyUduNQ@mail.gmail.com>
 <CAMKF1sqQyA2VQkjRK0bsTVM-yMoax8hJzLhqt02jxLL_3geZSg@mail.gmail.com>
 <CAMKF1srUeY0dJj2YL9JDfzSfArQOsyjin1BBWXhOtdcZkPDV4w@mail.gmail.com> <CAMKF1srfwg4yN=9A1HMboHQV8u2pW26GQWw0WQDZi=8oaGtRtA@mail.gmail.com>
In-Reply-To: <CAMKF1srfwg4yN=9A1HMboHQV8u2pW26GQWw0WQDZi=8oaGtRtA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Aug 2024 08:22:07 -0700
Message-ID: <CAMKF1so3TN9bYa80d9gvKBPFZkGD6UTVDzk+p1fSgqCiCNMTmg@mail.gmail.com>
Subject: Re: Buildpaths QA error list
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 15:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111850

We are left with following recipes to fix

Summary: 4 tasks failed:
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/libyui/libyui-ncurses_4.6.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa


python3-pycocotools will get fixed once numpy 2.x upgrade merges into
master in oe-core. libyui-ncurses seems to happen only on gcc and
works ok with clang
so no idea what's going on. pyproj uses cython to generate .c sources
and that has encoded absolute paths so its probably fixable. I am
planning to mark
libyui-ncurses and fluentbit recipes for deletion and hopefully fix
for pyproj is doable if not that will also go out. which will clean
the world builds w.r.t. reproducibility
issues.

On Fri, Aug 9, 2024 at 8:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> Here is updated list which is down to 22 now
>
> Summary: 22 tasks failed:
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-files=
ystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-crypto/botan/botan_3.5.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/blueman/blueman_2.4.3.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-files=
ystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
>
>
> On Wed, Jul 31, 2024 at 8:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > We now have 25 recipes left, keep the patches coming
> >
> > Summary: 25 tasks failed:
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-fil=
esystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-fil=
esystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-devtools/perfetto/perfetto.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > Summary: There were 67 ERROR messages, returning a non-zero exit code.
> >
> > On Sat, Jul 27, 2024 at 10:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> > >
> > > Thanks for patches so far, we have made some improvements and now dow=
n to < 30
> > >
> > > Summary: 29 tasks failed:
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_q=
a
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-f=
ilesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-devtools/perfetto/perfetto.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-f=
ilesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > Summary: There were 75 ERROR messages, returning a non-zero exit code=
.
> > >
> > > On Wed, Jul 24, 2024 at 11:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com=
> wrote:
> > > >
> > > > Hi all
> > > >
> > > > Recently buildpaths QA warning has been promoted to be a QA error. =
This
> > > > means some warnings in meta-openembedded layers has become build fa=
ilures
> > > > below is the list of failures if any of these recipes is important =
to
> > > > you, please consider fixing it. I will mark the remaining recipes
> > > > disabled via SKIP_RECIPE
> > > > and they will remain so until someone fixes them. My plan is to cle=
ar
> > > > world build
> > > > as quickly as I can.
> > > >
> > > > Summary: 37 tasks failed:
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-gnome/gcab/gcab_1.6.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_q=
a
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-f=
ilesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-bsp/fwupd/fwupd_1.9.18.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-gnome/libjcat/libjcat_0.2.1.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pydantic-core_2.16.3.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > > virtual:native:/home/pokybuild/yocto-worker/meta-oe/build/meta-open=
embedded/meta-oe/recipes-support/uim/uim_1.8.9.bb:do_compile
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/ckermit/ckermit_302.bb:do_compile
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/procmail/procmail_3.22.bb:do_configure
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-f=
ilesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/enca/enca_1.19.bb:do_compile
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-devtools/perfetto/perfetto.bb:do_compile
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > > >
> > > >
> > > > Thank you
> > > > -Khem

