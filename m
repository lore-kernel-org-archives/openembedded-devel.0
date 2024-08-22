Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6089AC531DF
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 07:34:10 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.8147.1724312040226020080
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 00:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZqUoudFk;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-533496017f8so654056e87.0
        for <Openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724312038; x=1724916838; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DNSdbx9QRtldQiXszktXhMF3yn8/JEx3IUIWW4z5Nw=;
        b=ZqUoudFkVqFYz48oTCVVK4f7NHx/mlPN+aFRqXbxaY6rxokGK0TsrNtdbM5sbhhfaF
         3idbrFxRjPOvZ+JxPsgrdYNkBzFCwYkgrz7H+M1ysdA6Cv1KBqQMRh1FNkOiB1Ii3sc/
         ZK2PchhSTZiCpzcyVRrnkCoIIDqMlHuUYbWNdMN4BMTzpmc9MsZo1gDWMyMbZAe45QCy
         p658/LSJq07CYr+YREojBn54jHwI/0p8VLbNCBm4sbixiTXTO9PBoDJNKOSlqV+hO1mV
         dvP4eCMYSs+3sPcUIS4Y0iZtdiHLJzzopYP54Lky/2tnEaOdO4iG4dpo0jIzXy2hdaGh
         MgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724312038; x=1724916838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DNSdbx9QRtldQiXszktXhMF3yn8/JEx3IUIWW4z5Nw=;
        b=vY/WoHAPb8y5pvG0wW0o4+K2irgKAul5pavI2wz9U4uX0uj+Blh8YdJnVPZTpHRwT1
         1Sul7Uvymae4rX8vfTLzUGElGnEMkkpPbuTG+A2OoNugzi0SeYgiKzyeIufusFdXbW3U
         ZjfzD/9JaLHg7wbpXv7HoNbxMe0ptAiYn9FGgBIQ+XS2hZ2WsWlRKdzxgRnXnJCm8ADf
         7oXIydj7+Hsvdo+ZYBUsMyUGJQb8aC+ytFWonzKUfNUSXL24WxW3TU1pJav2ffmk0ikH
         CZiZijbVi+IZsej/AVDuoQv2KZ9rasnFcTbMFgnoFoCiZTCWs94RaPWo0o+Eg7dNicSW
         PQNg==
X-Gm-Message-State: AOJu0Yz4f6WY2KSwIRIe5LNX3SCM+mFVaa/rKVX01nnQ3Z5RBmTgCSAa
	yz7ZLxDD0HalSO8NLysamtnao/Rh2vju1CtQiLhhZlwZcZLVVF2LTdymb9Zx9jl5MvefqFep5wO
	IrsIFwRJSShzGPfmTCAeKKrR3QYs=
X-Google-Smtp-Source: AGHT+IG/cY6PzB47FxN+8cTgWKh0MQ5KJQ8d5jio5pw6IXASnM+Hu6qHUI5qVaCw2nxTWbg/hSqMm+KUV3pqRWqcZ20=
X-Received: by 2002:a05:6512:3a8d:b0:52c:dc25:d706 with SMTP id
 2adb3069b0e04-5334fd6cfc2mr517179e87.52.1724312037271; Thu, 22 Aug 2024
 00:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soNow9XQXcspm2w7JAXROmU8OTzxwj1tLNYWRPoyUduNQ@mail.gmail.com>
 <CAMKF1sqQyA2VQkjRK0bsTVM-yMoax8hJzLhqt02jxLL_3geZSg@mail.gmail.com>
 <CAMKF1srUeY0dJj2YL9JDfzSfArQOsyjin1BBWXhOtdcZkPDV4w@mail.gmail.com>
 <CAMKF1srfwg4yN=9A1HMboHQV8u2pW26GQWw0WQDZi=8oaGtRtA@mail.gmail.com>
 <CAMKF1so3TN9bYa80d9gvKBPFZkGD6UTVDzk+p1fSgqCiCNMTmg@mail.gmail.com> <CAMKF1sp9DEgHB4COy=yO+sKaKQrn8X9rj0WjRWRdr02dm+v7Ng@mail.gmail.com>
In-Reply-To: <CAMKF1sp9DEgHB4COy=yO+sKaKQrn8X9rj0WjRWRdr02dm+v7Ng@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Aug 2024 09:33:45 +0200
Message-ID: <CA+chaQfv4S7Gzr-F8XCVRT7gFuN5xCbtDPxPCOuvfAsQawE4_g@mail.gmail.com>
Subject: Re: [oe] Buildpaths QA error list
To: raj.khem@gmail.com
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 07:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111899

Thank you Khem!

On Thu, Aug 22, 2024 at 2:24=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> As of today, we are left with couple of recipes
>
> python3-pycocotools
> python3-pandas
>
> There are updates to them staged in master-next which should fix the
> problem but they are waiting for numpy recipe upgrade to land in
> oe-core.
>
> Thanks to everyone who contributed.
>
> Cheers!
> -Khem
>
> On Mon, Aug 19, 2024 at 8:22=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > We are left with following recipes to fix
> >
> > Summary: 4 tasks failed:
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/libyui/libyui-ncurses_4.6.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> >
> >
> > python3-pycocotools will get fixed once numpy 2.x upgrade merges into
> > master in oe-core. libyui-ncurses seems to happen only on gcc and
> > works ok with clang
> > so no idea what's going on. pyproj uses cython to generate .c sources
> > and that has encoded absolute paths so its probably fixable. I am
> > planning to mark
> > libyui-ncurses and fluentbit recipes for deletion and hopefully fix
> > for pyproj is doable if not that will also go out. which will clean
> > the world builds w.r.t. reproducibility
> > issues.
> >
> > On Fri, Aug 9, 2024 at 8:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > >
> > > Here is updated list which is down to 22 now
> > >
> > > Summary: 22 tasks failed:
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_q=
a
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-f=
ilesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/blueman/blueman_2.4.3.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-f=
ilesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > >
> > >
> > > On Wed, Jul 31, 2024 at 8:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com>=
 wrote:
> > > >
> > > > We now have 25 recipes left, keep the patches coming
> > > >
> > > > Summary: 25 tasks failed:
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package=
_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-filesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_q=
a
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-devtools/perfetto/perfetto.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > > Summary: There were 67 ERROR messages, returning a non-zero exit co=
de.
> > > >
> > > > On Sat, Jul 27, 2024 at 10:20=E2=80=AFAM Khem Raj <raj.khem@gmail.c=
om> wrote:
> > > > >
> > > > > Thanks for patches so far, we have made some improvements and now=
 down to < 30
> > > > >
> > > > > Summary: 29 tasks failed:
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_packa=
ge_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-filesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package=
_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_q=
a
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-devtools/perfetto/perfetto.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > > > Summary: There were 75 ERROR messages, returning a non-zero exit =
code.
> > > > >
> > > > > On Wed, Jul 24, 2024 at 11:51=E2=80=AFAM Khem Raj <raj.khem@gmail=
.com> wrote:
> > > > > >
> > > > > > Hi all
> > > > > >
> > > > > > Recently buildpaths QA warning has been promoted to be a QA err=
or. This
> > > > > > means some warnings in meta-openembedded layers has become buil=
d failures
> > > > > > below is the list of failures if any of these recipes is import=
ant to
> > > > > > you, please consider fixing it. I will mark the remaining recip=
es
> > > > > > disabled via SKIP_RECIPE
> > > > > > and they will remain so until someone fixes them. My plan is to=
 clear
> > > > > > world build
> > > > > > as quickly as I can.
> > > > > >
> > > > > > Summary: 37 tasks failed:
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-gnome/gcab/gcab_1.6.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_packa=
ge_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-filesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb:do_packag=
e_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package=
_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > > > > virtual:native:/home/pokybuild/yocto-worker/meta-oe/build/meta-=
openembedded/meta-oe/recipes-support/uim/uim_1.8.9.bb:do_compile
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-support/ckermit/ckermit_302.bb:do_compile
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-support/procmail/procmail_3.22.bb:do_configure
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_q=
a
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-support/enca/enca_1.19.bb:do_compile
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-devtools/perfetto/perfetto.bb:do_compile
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > > > > >
> > > > > >
> > > > > > Thank you
> > > > > > -Khem
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111897): https://lists.openembedded.org/g/openembedde=
d-devel/message/111897
> Mute This Topic: https://lists.openembedded.org/mt/107529313/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

