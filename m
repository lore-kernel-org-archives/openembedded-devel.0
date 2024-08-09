Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D20C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:44:16 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.87064.1723218247032334461
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJM4COpF;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-70944d76a04so1221039a34.0
        for <Openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218246; x=1723823046; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uxpx3YzUje30G9b+zd5UDGlG1yIBOCSYNz7vimHKzgk=;
        b=OJM4COpFbgYafxQ0n5NygWoV3LisxT0onayIQh3xm0CCr3AYzhyJmKwmi3daIq40/G
         a409a8ZAeo0fJ+X+7ben1e8jKbYv0ihWS9KQRAjATNGSKAjYLgIEQnsbjacfRDp9UNv0
         g5HLp7WS+2+mNQWiKOUGD3kwqZHK9WlAF0iprBHCZ1N7T3UbGaHO8ZHtwX7T4V98lv75
         yWYVPfwcPicY9dthpZNoqLel7x3h2D8HoTWO+kNKDdiB3wSDV0AdoVcWxuehTYGRlDLx
         vpLV7tMMc7twtyDyRZAT/6SgrKZbFqBXPGUaxxQ6Yy339oVLlNZ4wFoxsY989XAIrOSr
         5Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218246; x=1723823046;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uxpx3YzUje30G9b+zd5UDGlG1yIBOCSYNz7vimHKzgk=;
        b=FQ+HfSIv3DgKtWTA0yatb1kXEQPDG2RnGMPcJJSOR4obfSE+HXsRKB3Rg+TCuvoB8C
         q36JIFoYwi0Cl0vTp8ZU8YXD1pMf2WTjydl5P6yiXJgPzptIuENtBS5WE+DGGsqZhcUw
         Wcg9ajRzUVk5U/ltVyJ39fA7hgNkWJ78ARCVyblNG2arEPqfzet1BCazyjphp8Z/LInq
         9qGJjCwit25DlK4A69ey9z3VMONJ1LfJVEb+3aO6Un1tJWKN56ui2jaDw6vnyoXXn0s0
         WEfIvdi3JKZzbngy5qp5u8j1VIGw8/2hD9XnJwPY6ktgTt02U9MTgbNmXW1aSu8BetPY
         YFLA==
X-Gm-Message-State: AOJu0YwTA1tjNM0B1LAFbA3RG0FvqBiN+Vf1tQ3qR7idSxbskVfTYfCo
	HLbtW+gF4f5ZlStkrNCznVSeBQLn7fJhRz4xjmQcFNysaxCIwcQGu7IgWohaGjCUuBbtwGeMZId
	G8vN4jljtPFr5k7umZbyPEk4UdnEgyp6uGGc=
X-Google-Smtp-Source: AGHT+IHOrB2E7cLwdeUm5Je+pK8ct8Y7jD0ceKNLtVDl7HXZ0NCTIXjpSiSAvF7Uthc0L8Tjp/xajOViq6ntROpKNZo=
X-Received: by 2002:a05:6830:6a99:b0:700:cd0f:6cc5 with SMTP id
 46e09a7af769-70b50ae12aemr2469127a34.7.1723218245870; Fri, 09 Aug 2024
 08:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soNow9XQXcspm2w7JAXROmU8OTzxwj1tLNYWRPoyUduNQ@mail.gmail.com>
 <CAMKF1sqQyA2VQkjRK0bsTVM-yMoax8hJzLhqt02jxLL_3geZSg@mail.gmail.com> <CAMKF1srUeY0dJj2YL9JDfzSfArQOsyjin1BBWXhOtdcZkPDV4w@mail.gmail.com>
In-Reply-To: <CAMKF1srUeY0dJj2YL9JDfzSfArQOsyjin1BBWXhOtdcZkPDV4w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Aug 2024 08:43:39 -0700
Message-ID: <CAMKF1srfwg4yN=9A1HMboHQV8u2pW26GQWw0WQDZi=8oaGtRtA@mail.gmail.com>
Subject: Re: Buildpaths QA error list
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111696

Here is updated list which is down to 22 now

Summary: 22 tasks failed:
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-filesys=
tems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-crypto/botan/botan_3.5.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/blueman/blueman_2.4.3.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/lprng/lprng_3.8.C.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-filesys=
tems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa


On Wed, Jul 31, 2024 at 8:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> We now have 25 recipes left, keep the patches coming
>
> Summary: 25 tasks failed:
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-files=
ystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-files=
ystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-crypto/botan/botan_3.5.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-devtools/perfetto/perfetto.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> Summary: There were 67 ERROR messages, returning a non-zero exit code.
>
> On Sat, Jul 27, 2024 at 10:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
> >
> > Thanks for patches so far, we have made some improvements and now down =
to < 30
> >
> > Summary: 29 tasks failed:
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-fil=
esystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-devtools/perfetto/perfetto.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-fil=
esystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > Summary: There were 75 ERROR messages, returning a non-zero exit code.
> >
> > On Wed, Jul 24, 2024 at 11:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> > >
> > > Hi all
> > >
> > > Recently buildpaths QA warning has been promoted to be a QA error. Th=
is
> > > means some warnings in meta-openembedded layers has become build fail=
ures
> > > below is the list of failures if any of these recipes is important to
> > > you, please consider fixing it. I will mark the remaining recipes
> > > disabled via SKIP_RECIPE
> > > and they will remain so until someone fixes them. My plan is to clear
> > > world build
> > > as quickly as I can.
> > >
> > > Summary: 37 tasks failed:
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-gnome/gcab/gcab_1.6.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-fil=
esystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-bsp/fwupd/fwupd_1.9.18.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-gnome/libjcat/libjcat_0.2.1.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pydantic-core_2.16.3.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > virtual:native:/home/pokybuild/yocto-worker/meta-oe/build/meta-openem=
bedded/meta-oe/recipes-support/uim/uim_1.8.9.bb:do_compile
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/ckermit/ckermit_302.bb:do_compile
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/procmail/procmail_3.22.bb:do_configure
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-fil=
esystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/enca/enca_1.19.bb:do_compile
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-devtools/perfetto/perfetto.bb:do_compile
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > >
> > >
> > > Thank you
> > > -Khem

