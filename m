Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3412C52D7C
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 00:24:47 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.2753.1724286285469753113
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 17:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pu6rJfmX;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5daa683b298so217144eaf.0
        for <Openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 17:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286284; x=1724891084; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm+Xw0zs0J7KJV/PDf3T69k4OdJvQKl+2XgkYetvt4w=;
        b=Pu6rJfmXMsYX2S8wpeN+RqzX7DYrdgAL00A30DJZM4WmCa9O67z1SMovs4r6mLZYvQ
         2rpnMcTdOoDoVYAxudkglAe2ZZ6wTAnTeHXIWpoZYIs+5H90eueEnOdB0zgDI7uFZdf7
         MDDgVutxo+I3GCOFvTFNXF89hSNjVYUWsSE49g+NQ0dcaDhc3rupOd0oodgu30C/LhH7
         EpqjkQ9nXweWLSCMRPwWe8bbO/McZ9LGkeWN0J7txN4S/ErrjFLjE4EnbLLlDr/fq57g
         //yttFNsjBWQ/EVVE6Lp5E4oj3ltAZkt04wGWyaE3+AubPhStv1ldckPGgWSO6Uz0iKq
         mZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286284; x=1724891084;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qm+Xw0zs0J7KJV/PDf3T69k4OdJvQKl+2XgkYetvt4w=;
        b=Sg2YaeY0HCQrcdLDiBtLzP7iXSfids3p2QcCm7H30+rx7rPoV5zPbj+Y8izBkPrvYs
         8s6zNMuK/oncFGiogUtSeqMG1eohmUUYdwWZFvNx18gdocn2kuyesl+Nan4a5K0MGx9m
         9/xl6LZAqZC132RJjnau+6mYojh+B0EY5hRHUeCAwkTIL3I4LEQdfNj6WvVd53wYbwyd
         KUKyRC3d34GK38LW4DK+WnOB3bUZ9Xi6/CmSDlwFqvHDPy/EdBcWgM3Aozz7sxaV6YOF
         a7N4l/fuc11b+VKpdpRsx4dITKmhicq+ehtMl2p5l6f5zQ1v8oagw+rGF4TQPBmIG+nI
         tSZQ==
X-Gm-Message-State: AOJu0Yx+icsq5zP2nFnZuQDrZN9mPsxafq+RJtIAZORsF8Cc/1jag2p4
	TgTW1jIwLcfhwIk5XXGjxP16VYslOJry2Z1ez5O0GP026ZEm9cJODdTnthetf47lBX/l8tm0S4R
	TmIpmGxBtVnDvKzs5ioDea1UlWIkqIo2t
X-Google-Smtp-Source: AGHT+IGrDQe97FFFdoDO87bCu+hFnTFKJA0yyL63DSfYAhBgUmCZPY6qlQOQf5y+VJTHSCopfUjS/ucy3XCVgh5ITWw=
X-Received: by 2002:a05:6820:1ad5:b0:5da:a358:98d9 with SMTP id
 006d021491bc7-5dca05f704dmr4696891eaf.5.1724286284250; Wed, 21 Aug 2024
 17:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soNow9XQXcspm2w7JAXROmU8OTzxwj1tLNYWRPoyUduNQ@mail.gmail.com>
 <CAMKF1sqQyA2VQkjRK0bsTVM-yMoax8hJzLhqt02jxLL_3geZSg@mail.gmail.com>
 <CAMKF1srUeY0dJj2YL9JDfzSfArQOsyjin1BBWXhOtdcZkPDV4w@mail.gmail.com>
 <CAMKF1srfwg4yN=9A1HMboHQV8u2pW26GQWw0WQDZi=8oaGtRtA@mail.gmail.com> <CAMKF1so3TN9bYa80d9gvKBPFZkGD6UTVDzk+p1fSgqCiCNMTmg@mail.gmail.com>
In-Reply-To: <CAMKF1so3TN9bYa80d9gvKBPFZkGD6UTVDzk+p1fSgqCiCNMTmg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Aug 2024 17:24:18 -0700
Message-ID: <CAMKF1sp9DEgHB4COy=yO+sKaKQrn8X9rj0WjRWRdr02dm+v7Ng@mail.gmail.com>
Subject: Re: Buildpaths QA error list
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 00:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111897

As of today, we are left with couple of recipes

python3-pycocotools
python3-pandas

There are updates to them staged in master-next which should fix the
problem but they are waiting for numpy recipe upgrade to land in
oe-core.

Thanks to everyone who contributed.

Cheers!
-Khem

On Mon, Aug 19, 2024 at 8:22=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> We are left with following recipes to fix
>
> Summary: 4 tasks failed:
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-graphics/libyui/libyui-ncurses_4.6.2.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/re=
cipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
>   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pytho=
n/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
>
>
> python3-pycocotools will get fixed once numpy 2.x upgrade merges into
> master in oe-core. libyui-ncurses seems to happen only on gcc and
> works ok with clang
> so no idea what's going on. pyproj uses cython to generate .c sources
> and that has encoded absolute paths so its probably fixable. I am
> planning to mark
> libyui-ncurses and fluentbit recipes for deletion and hopefully fix
> for pyproj is doable if not that will also go out. which will clean
> the world builds w.r.t. reproducibility
> issues.
>
> On Fri, Aug 9, 2024 at 8:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > Here is updated list which is down to 22 now
> >
> > Summary: 22 tasks failed:
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-fil=
esystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/blueman/blueman_2.4.3.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-fil=
esystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/=
recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-net=
working/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> >
> >
> > On Wed, Jul 31, 2024 at 8:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > We now have 25 recipes left, keep the patches coming
> > >
> > > Summary: 25 tasks failed:
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_q=
a
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-f=
ilesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-f=
ilesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-devtools/perfetto/perfetto.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-n=
etworking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > Summary: There were 67 ERROR messages, returning a non-zero exit code=
.
> > >
> > > On Sat, Jul 27, 2024 at 10:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com=
> wrote:
> > > >
> > > > Thanks for patches so far, we have made some improvements and now d=
own to < 30
> > > >
> > > > Summary: 29 tasks failed:
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package=
_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-filesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_q=
a
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-devtools/perfetto/perfetto.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > > Summary: There were 75 ERROR messages, returning a non-zero exit co=
de.
> > > >
> > > > On Wed, Jul 24, 2024 at 11:51=E2=80=AFAM Khem Raj <raj.khem@gmail.c=
om> wrote:
> > > > >
> > > > > Hi all
> > > > >
> > > > > Recently buildpaths QA warning has been promoted to be a QA error=
. This
> > > > > means some warnings in meta-openembedded layers has become build =
failures
> > > > > below is the list of failures if any of these recipes is importan=
t to
> > > > > you, please consider fixing it. I will mark the remaining recipes
> > > > > disabled via SKIP_RECIPE
> > > > > and they will remain so until someone fixes them. My plan is to c=
lear
> > > > > world build
> > > > > as quickly as I can.
> > > > >
> > > > > Summary: 37 tasks failed:
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-gnome/gcab/gcab_1.6.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package=
_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-filesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb:do_package_=
qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_q=
a
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > > > virtual:native:/home/pokybuild/yocto-worker/meta-oe/build/meta-op=
enembedded/meta-oe/recipes-support/uim/uim_1.8.9.bb:do_compile
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-support/ckermit/ckermit_302.bb:do_compile
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-support/procmail/procmail_3.22.bb:do_configure
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-support/enca/enca_1.19.bb:do_compile
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-devtools/perfetto/perfetto.bb:do_compile
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > > > >
> > > > >
> > > > > Thank you
> > > > > -Khem

