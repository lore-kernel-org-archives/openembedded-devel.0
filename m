Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E46BC3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 15:21:29 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.45502.1722439281828436410
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jul 2024 08:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nP5p/ozc;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-260f1664fdfso3244858fac.1
        for <Openembedded-devel@lists.openembedded.org>; Wed, 31 Jul 2024 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439281; x=1723044081; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpSyLSKvGIwUTRhrg+SXz95WjvQ6tx6AUCq3cs+lRhY=;
        b=nP5p/ozcKlzyAKo8T+jZaKiVkGz0Q0gWPtBgkwIH6SiUce2UUprUOQl/25o8S+GPGl
         qV2uo74DuS6/VYCPqZfozvAqppeb/1L8MdaTvt3lS6s2H4vwdWihxS+R4inmmWvx37DI
         9mS0Sw4RtyZvWnMFIXDH/XxAeyn/ARjFGhaMny3U8Z5T3esZTJfKgSPMe129wM0qDUjB
         7TAKqV0QQSXzd43cMt+ImvZUCGvMlgYQkXGoEBbWNjDMzExEYKjbLzcugzyqqFGzEnZB
         LY7znuIvAvnYDW/880s/D4AeVY1fURei8ggWRAW5WWz78IuI43T575U4MG8u0EKW06Wt
         S66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439281; x=1723044081;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpSyLSKvGIwUTRhrg+SXz95WjvQ6tx6AUCq3cs+lRhY=;
        b=mSJrMmR+c3U4ENcJovNCvPtWM1pBSrBwVoq9H+qUaHWNgdidXEPymFc5c120iCJo8L
         U1aqGIGVyg0ML4q+9U+lfOXUcY/ujvLwyiVnI/Li3lx/JpDcps7dv3FW/X+MMUwUHCP2
         x4d6JQG1XtcRnRpI0mHlB0DhdizGLY59ie0up/iR+OYta9ubFRo/NBqGRYZ/82NlmoxA
         KKDncE9t3bmUrHue//rJssIb/TSncWktB2+7zIQTgdF+cKozg+9A1QGkWx6tLkMERg1K
         lGAEumOw05ju4oNlsPC3vKCUWbr+TggxerDK5beILj7DQTuWsbciyE5UvsB3c0F5SQnp
         NnCg==
X-Gm-Message-State: AOJu0YxDs2TcEiwbd7CP9b9ZtT3Rv/AJVrNyc0KLFKXn+OS0m6I/QnJk
	/YPQfAU299gYNU6OKwQ8TEqFzZD5pT8OPAQoCTtxPlb+ZZ2zdx2nLilSXKfiOXs4eGH7eEVf51/
	sjp5q8fEOHuho/0IB2Uvypjbt98xp7Agznnw=
X-Google-Smtp-Source: AGHT+IHw8w7LrfYN4RNxFImX0khQZfnLNy1Fv2IwR+v3qgyj3SzLDqjtVlsTkMF7PEqrFQW3m95lgvgj67nIZ1wPcQ8=
X-Received: by 2002:a05:6870:3323:b0:261:21e9:1f0f with SMTP id
 586e51a60fabf-267d4ef943cmr15621590fac.36.1722439280701; Wed, 31 Jul 2024
 08:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soNow9XQXcspm2w7JAXROmU8OTzxwj1tLNYWRPoyUduNQ@mail.gmail.com>
 <CAMKF1sqQyA2VQkjRK0bsTVM-yMoax8hJzLhqt02jxLL_3geZSg@mail.gmail.com>
In-Reply-To: <CAMKF1sqQyA2VQkjRK0bsTVM-yMoax8hJzLhqt02jxLL_3geZSg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Jul 2024 08:20:54 -0700
Message-ID: <CAMKF1srUeY0dJj2YL9JDfzSfArQOsyjin1BBWXhOtdcZkPDV4w@mail.gmail.com>
Subject: Re: Buildpaths QA error list
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Jul 2024 15:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111486

We now have 25 recipes left, keep the patches coming

Summary: 25 tasks failed:
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-filesys=
tems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/lprng/lprng_3.8.C.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-filesys=
tems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-crypto/botan/botan_3.5.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-devtools/perfetto/perfetto.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
Summary: There were 67 ERROR messages, returning a non-zero exit code.

On Sat, Jul 27, 2024 at 10:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> Thanks for patches so far, we have made some improvements and now down to=
 < 30
>
> Summary: 29 tasks failed:
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-files=
ystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-devtools/perfetto/perfetto.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-crypto/botan/botan_3.5.0.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-files=
ystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> Summary: There were 75 ERROR messages, returning a non-zero exit code.
>
> On Wed, Jul 24, 2024 at 11:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
> >
> > Hi all
> >
> > Recently buildpaths QA warning has been promoted to be a QA error. This
> > means some warnings in meta-openembedded layers has become build failur=
es
> > below is the list of failures if any of these recipes is important to
> > you, please consider fixing it. I will mark the remaining recipes
> > disabled via SKIP_RECIPE
> > and they will remain so until someone fixes them. My plan is to clear
> > world build
> > as quickly as I can.
> >
> > Summary: 37 tasks failed:
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-gnome/gcab/gcab_1.6.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-files=
ystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-bsp/fwupd/fwupd_1.9.18.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-gnome/libjcat/libjcat_0.2.1.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pydantic-core_2.16.3.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > virtual:native:/home/pokybuild/yocto-worker/meta-oe/build/meta-openembe=
dded/meta-oe/recipes-support/uim/uim_1.8.9.bb:do_compile
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-support/ckermit/ckermit_302.bb:do_compile
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-support/procmail/procmail_3.22.bb:do_configure
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-files=
ystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-support/enca/enca_1.19.bb:do_compile
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-devtools/perfetto/perfetto.bb:do_compile
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netwo=
rking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> >
> >
> > Thank you
> > -Khem

