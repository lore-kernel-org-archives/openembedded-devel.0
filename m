Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F396BC531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 13:08:02 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.15630.1724418479116115462
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 23 Aug 2024 06:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B62bPzb7;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5342109d726so907533e87.0
        for <Openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 06:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724418477; x=1725023277; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/Z/aIxhTmBEsPhHesP3YNBDNzpaJ3jZciEywvIJA9U=;
        b=B62bPzb71TXB3x5iMZEuCye5rqlxIKyKAWwusj415RnoyFK58ey9G4Uo8K9nlv6acB
         TTHx/Jg++xAUPsd/MEjnrnRt/McuqMN7CgiVJvoQ4cIxgU/oLOGAhFUrGG3SLaoIjTfC
         uyYO8i2kcj8K46Bc0W90HywgBb2Bzv9gY3GZkn00aNFwrsnG2qobZTpdb06K6/bAtSfz
         sD2MHyv8l9S5CvfiDDuvIENedH/bxS5NkyLfBn0NEHw6DviYYNcWYKaXz8AXS+SAImRw
         few/AlwaSHQ1Z9Sn+Nb9JbIv5WpcmEmp1Bsxc0c2WlOJgMWfJAocmz/TtaLeF69kBI3E
         TnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724418477; x=1725023277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/Z/aIxhTmBEsPhHesP3YNBDNzpaJ3jZciEywvIJA9U=;
        b=g2eNhvKjlprROaamh0KU8s9r43vfP3nlxX8Oj7GrOiI24nXhHz5V3DP4sxt3ynEd1K
         yYYMD56+zlsYdcFav3lggEOcG0Nisp5q6PedndrgnLMEA85fK2DlELV3rdx7scIBd8Gu
         IFWXgea1ESpEP0B/oencvzg7qgbW4/54nsWf2ih6HFyW17S9T9ub3rtJsWgw/LOmkFdj
         Q/rDcsQbPwWtM01S9mo7f99OhAtng1RchY3ZVT1tZGJdRaz8Kp3sjjBkWNJB1htGxhA9
         3GNcmTsjBcKCcUCsyAAbQtUlZJRAu1rqvMbE/ealmlrMDWRzEUAROQqVYa9MdeW3yxXi
         KGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+LfosK3JpFYCOVRDZ7KzvH3Ysnqhuw+FwiB4TvnaJP8gHQ/hvETIq21Kxy0I4kPzu8UUJxgr5tQXEUJRZepzFC34=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQSyLNxuUbyzuk0/0FwnOIzBW7u5LUHeuCxyfMhwmewzGdG2MD
	DUp8X8aSNx/Ba/h6O7jR3xdqo4BbZH+ekXg+g8glmkWLxSmE6y+9LjOeNxYRL72Hn/PVmSqGJqi
	GWTSZaTbW+8OB98Fiy4t5Qy0xSMw=
X-Google-Smtp-Source: AGHT+IHH7t8ZptSeBmh/SoEZAzdi5MDxI0CEyu0Z/g5HavQdk3DMZfNNo7qOoSsG8HoqMRiqdnmGAgwoC/KTxxRZzvo=
X-Received: by 2002:a05:6512:a8c:b0:533:4191:fa4a with SMTP id
 2adb3069b0e04-5334ca84f1fmr2236492e87.15.1724418476492; Fri, 23 Aug 2024
 06:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soNow9XQXcspm2w7JAXROmU8OTzxwj1tLNYWRPoyUduNQ@mail.gmail.com>
 <CAMKF1sqQyA2VQkjRK0bsTVM-yMoax8hJzLhqt02jxLL_3geZSg@mail.gmail.com>
 <CAMKF1srUeY0dJj2YL9JDfzSfArQOsyjin1BBWXhOtdcZkPDV4w@mail.gmail.com>
 <CAMKF1srfwg4yN=9A1HMboHQV8u2pW26GQWw0WQDZi=8oaGtRtA@mail.gmail.com>
 <CAMKF1so3TN9bYa80d9gvKBPFZkGD6UTVDzk+p1fSgqCiCNMTmg@mail.gmail.com>
 <CAMKF1sp9DEgHB4COy=yO+sKaKQrn8X9rj0WjRWRdr02dm+v7Ng@mail.gmail.com> <17EDFCAA52428D4D.29141@lists.openembedded.org>
In-Reply-To: <17EDFCAA52428D4D.29141@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Aug 2024 15:07:32 +0200
Message-ID: <CA+chaQdOLxHUeDJfY=eNUvkVx7XJ6rnBmumdUKBH8uU6OhgK2g@mail.gmail.com>
Subject: Re: [oe] Buildpaths QA error list
To: martin.jansa@gmail.com
Cc: raj.khem@gmail.com, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 13:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111913

FWIW: in my world builds I'm seeing few more failures (all outside
meta-oe now) from buildpaths:

    meta-virtualization/recipes-networking/openvswitch/openvswitch_git.bb
ERROR: QA Issue: File /usr/lib/openvswitch/ptest/tests/atlocal in
package openvswitch-ptest contains reference to TMPDIR [buildpaths]

    oe-core/meta/recipes-extended/mc/mc_4.8.31.bb (only in some builds)
ERROR: mc-4.8.31-r0 do_package_qa: QA Issue: File
/usr/libexec/mc/extfs.d/uzip in package mc-helpers-perl contains
reference to TMPDIR [buildpaths]

    meta-clang/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.29.1.b=
b
ERROR: QA Issue: File
/usr/lib/bcc/ptest/tests/cc/test_libbcc_no_libbpf in package bcc-ptest
contains reference to TMPDIR [buildpaths]

    meta-clang/dynamic-layers/openembedded-layer/recipes-devtools/bpftrace/=
bpftrace_0.20.1.bb
ERROR: QA Issue: File /usr/src/debug/bpftrace/0.20.1+git/location.hh
in package bpftrace-src contains reference to TMPDIR
File /usr/src/debug/bpftrace/0.20.1+git/parser.tab.cc in package
bpftrace-src contains reference to TMPDIR
File /usr/src/debug/bpftrace/0.20.1+git/parser.tab.hh in package
bpftrace-src contains reference to TMPDIR
File /usr/src/debug/bpftrace/0.20.1+git/lex.yy.cc in package
bpftrace-src contains reference to TMPDIR [buildpaths]
ERROR: QA Issue: File /usr/lib/bpftrace/ptest/tests/bpftrace_test in
package bpftrace-ptest contains reference to TMPDIR
File /usr/lib/bpftrace/ptest/tests/testprogs/CTestTestfile.cmake in
package bpftrace-ptest contains reference to TMPDIR
File /usr/lib/bpftrace/ptest/tests/testprogs/cmake_install.cmake in
package bpftrace-ptest contains reference to TMPDIR
File /usr/lib/bpftrace/ptest/tests/testlibs/CTestTestfile.cmake in
package bpftrace-ptest contains reference to TMPDIR
File /usr/lib/bpftrace/ptest/tests/testlibs/cmake_install.cmake in
package bpftrace-ptest contains reference to TMPDIR [buildpaths]

On Thu, Aug 22, 2024 at 9:34=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Thank you Khem!
>
> On Thu, Aug 22, 2024 at 2:24=E2=80=AFAM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > As of today, we are left with couple of recipes
> >
> > python3-pycocotools
> > python3-pandas
> >
> > There are updates to them staged in master-next which should fix the
> > problem but they are waiting for numpy recipe upgrade to land in
> > oe-core.
> >
> > Thanks to everyone who contributed.
> >
> > Cheers!
> > -Khem
> >
> > On Mon, Aug 19, 2024 at 8:22=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > We are left with following recipes to fix
> > >
> > > Summary: 4 tasks failed:
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-o=
e/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-p=
ython/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > >
> > >
> > > python3-pycocotools will get fixed once numpy 2.x upgrade merges into
> > > master in oe-core. libyui-ncurses seems to happen only on gcc and
> > > works ok with clang
> > > so no idea what's going on. pyproj uses cython to generate .c sources
> > > and that has encoded absolute paths so its probably fixable. I am
> > > planning to mark
> > > libyui-ncurses and fluentbit recipes for deletion and hopefully fix
> > > for pyproj is doable if not that will also go out. which will clean
> > > the world builds w.r.t. reproducibility
> > > issues.
> > >
> > > On Fri, Aug 9, 2024 at 8:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> > > >
> > > > Here is updated list which is down to 22 now
> > > >
> > > > Summary: 22 tasks failed:
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package=
_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-filesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_q=
a
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-python/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/blueman/blueman_2.4.3.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta=
-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > >
> > > >
> > > > On Wed, Jul 31, 2024 at 8:20=E2=80=AFAM Khem Raj <raj.khem@gmail.co=
m> wrote:
> > > > >
> > > > > We now have 25 recipes left, keep the patches coming
> > > > >
> > > > > Summary: 25 tasks failed:
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_packa=
ge_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-filesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package=
_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_q=
a
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-oe/recipes-devtools/perfetto/perfetto.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/me=
ta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > > > Summary: There were 67 ERROR messages, returning a non-zero exit =
code.
> > > > >
> > > > > On Sat, Jul 27, 2024 at 10:20=E2=80=AFAM Khem Raj <raj.khem@gmail=
.com> wrote:
> > > > > >
> > > > > > Thanks for patches so far, we have made some improvements and n=
ow down to < 30
> > > > > >
> > > > > > Summary: 29 tasks failed:
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_pac=
kage_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-filesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_packa=
ge_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package=
_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_=
qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-devtools/perfetto/perfetto.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_q=
a
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > > > >   /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > > > > Summary: There were 75 ERROR messages, returning a non-zero exi=
t code.
> > > > > >
> > > > > > On Wed, Jul 24, 2024 at 11:51=E2=80=AFAM Khem Raj <raj.khem@gma=
il.com> wrote:
> > > > > > >
> > > > > > > Hi all
> > > > > > >
> > > > > > > Recently buildpaths QA warning has been promoted to be a QA e=
rror. This
> > > > > > > means some warnings in meta-openembedded layers has become bu=
ild failures
> > > > > > > below is the list of failures if any of these recipes is impo=
rtant to
> > > > > > > you, please consider fixing it. I will mark the remaining rec=
ipes
> > > > > > > disabled via SKIP_RECIPE
> > > > > > > and they will remain so until someone fixes them. My plan is =
to clear
> > > > > > > world build
> > > > > > > as quickly as I can.
> > > > > > >
> > > > > > > Summary: 37 tasks failed:
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-gnome/gcab/gcab_1.6.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_pac=
kage_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-filesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb:do_pack=
age_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_packa=
ge_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_=
qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
> > > > > > > virtual:native:/home/pokybuild/yocto-worker/meta-oe/build/met=
a-openembedded/meta-oe/recipes-support/uim/uim_1.8.9.bb:do_compile
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_q=
a
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-support/ckermit/ckermit_302.bb:do_compile
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-support/procmail/procmail_3.22.bb:do_configure
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package=
_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-support/enca/enca_1.19.bb:do_compile
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-devtools/perfetto/perfetto.bb:do_compile
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
> > > > > > > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/=
meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa
> > > > > > >
> > > > > > >
> > > > > > > Thank you
> > > > > > > -Khem
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111899): https://lists.openembedded.org/g/openembedde=
d-devel/message/111899
> Mute This Topic: https://lists.openembedded.org/mt/107529313/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

