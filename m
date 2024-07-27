Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA80C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 27 Jul 2024 17:21:04 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.20580.1722100858393605916
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 27 Jul 2024 10:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZfymIJ53;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5d5c7f23f22so1025783eaf.0
        for <Openembedded-devel@lists.openembedded.org>; Sat, 27 Jul 2024 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722100857; x=1722705657; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77r4dGjvceK43zuxn7IJaHKxCAwW3GpNan1YFpwsfUo=;
        b=ZfymIJ53ofI7gSy02RK4WrdADKn+jDO/loAx5+ruu9TTgaeGs6tfGO5MVSS8adFY8A
         fytbIi9JZqrn8WAByRDWuwPBvpeywMVOZPlY+HKBsHzswiOPNVh6MFQcDozZF2BCDE3Q
         aWVPzOqKjo6Xsz6wRV2sC4iOitzgtfayQ3qzVFeyxvxp+FLEACIZWk9fGGRJZHO8yep2
         WFzyeFziDhCJgIMEAQiobOgCGITvbINtIJF/xxiaOo/gK8Wg4csA/EnlJ4j2UeJuEA10
         Y2C8vAMHdBYMTMZEWbGjZLk7twGl8QiDP53WkZqmADRxcF5BzUt468MxSVKeWN6Lvy/q
         LGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722100857; x=1722705657;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77r4dGjvceK43zuxn7IJaHKxCAwW3GpNan1YFpwsfUo=;
        b=EewJHTai3WbeXwJU9e3e22MR8+dL5FkyOcMZYMewwqMxt5R9qsiJEV7XtRDgzyCGsa
         u/TN9tpWUGSyTrUDfSY1BnPo1abTKyaOTZDIrIK14kNeVLmNiadgz7jQ4RJW+eG+lXOT
         0xCJQLlQnAW2+KH+R5rIGnw3VWAqOVVgfV6GQYgL8BJxLZ+Y8WyFuUK+2rUEP/p/90kk
         94ILr4PXcyfAYkEJYu7kRSbuQD7vZcMvFfvDElrcet6SCFM9/gnzwT8k2LyOVbBewz03
         fU1rFNaJIptJJ9Q9ggRwkTX53yBDu7rDTH9HYYIuAKHixIqTDcw7E1PwrjHu71ZIHsoc
         SVLg==
X-Gm-Message-State: AOJu0YzdTZ/ivYcXBLlH2+WDy8SJFI223aLjOhNfPJZLTxCNbBiOY9OY
	45PjBMehJ3QvMmEYxpGzlq14tX9y29AZEDtFvRaSZ4LHGjFjWzbq/oeUmA2SfqHgGdFsQ7AAm7N
	fejgn4zk0mzFxuIHg+Xd+xFrSEqhnIHgAg5Y=
X-Google-Smtp-Source: AGHT+IEi56z9S1Y/M5AnkATS40sTQlKaY2+ZkpgdAU6Tyhz/kJCMif11PQX829dwXssqLuyrVnaezcvbGTrvDlKtiMA=
X-Received: by 2002:a05:6870:910a:b0:260:f43e:7d89 with SMTP id
 586e51a60fabf-267d4cf9c39mr3663060fac.2.1722100857093; Sat, 27 Jul 2024
 10:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soNow9XQXcspm2w7JAXROmU8OTzxwj1tLNYWRPoyUduNQ@mail.gmail.com>
In-Reply-To: <CAMKF1soNow9XQXcspm2w7JAXROmU8OTzxwj1tLNYWRPoyUduNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Jul 2024 10:20:30 -0700
Message-ID: <CAMKF1sqQyA2VQkjRK0bsTVM-yMoax8hJzLhqt02jxLL_3geZSg@mail.gmail.com>
Subject: Re: Buildpaths QA error list
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Jul 2024 17:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111446

Thanks for patches so far, we have made some improvements and now down to <=
 30

Summary: 29 tasks failed:
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-filesys=
tems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-devtools/perfetto/perfetto.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-crypto/botan/botan_3.5.0.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/lprng/lprng_3.8.C.bb:do_package_qa
  /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-filesys=
tems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
Summary: There were 75 ERROR messages, returning a non-zero exit code.

On Wed, Jul 24, 2024 at 11:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> Hi all
>
> Recently buildpaths QA warning has been promoted to be a QA error. This
> means some warnings in meta-openembedded layers has become build failures
> below is the list of failures if any of these recipes is important to
> you, please consider fixing it. I will mark the remaining recipes
> disabled via SKIP_RECIPE
> and they will remain so until someone fixes them. My plan is to clear
> world build
> as quickly as I can.
>
> Summary: 37 tasks failed:
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-gnome/gcab/gcab_1.6.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-filesys=
tems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-bsp/fwupd/fwupd_1.9.18.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-gnome/libjcat/libjcat_0.2.1.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pydantic-core_2.16.3.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> virtual:native:/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedd=
ed/meta-oe/recipes-support/uim/uim_1.8.9.bb:do_compile
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-crypto/botan/botan_3.5.0.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/ckermit/ckermit_302.bb:do_compile
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/procmail/procmail_3.22.bb:do_configure
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-filesys=
tems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/=
recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/enca/enca_1.19.bb:do_compile
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-devtools/perfetto/perfetto.bb:do_compile
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-network=
ing/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
>
>
> Thank you
> -Khem

