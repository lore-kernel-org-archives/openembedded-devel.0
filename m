Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C769C369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 13:11:21 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.16552.1746018678117620597
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 06:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Va7cQ2XB;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54c090fc7adso7654128e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746018676; x=1746623476; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5PXiIU09iqGvyeNVwSaU/r/mew6pXLT/Vrk/PUJI6Q=;
        b=Va7cQ2XB3N5qA74If/jxvezC6qcTzkvpCn1XYU1Cvui3KXQ6wmD6XubJQH757CGtwl
         lN6uE2FQJ24DkrLPn2YFtQv62HDotC+5ppITfa7iL//HwniLkCfO2zCAw9rfUWrviLIq
         /0B3S1Id0M28cvKz7CwYFNi4foCxFoyrWt6bqgt2NgH9Zp6LUwrQQbkB1PdzQN3PY4FT
         k0kaqQy/ZY0YDj/5l5DsZhMPM1OwsFyRVQ/ld4g+Pxrpwt97mdGUteV9f59VKFsOXpho
         BjgOwtntmXLFdxIhiElRJgjT5ewrQvkYFDyYN0oCmU0fjTAJewYqehac9I+ARGrfHtfv
         wpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018676; x=1746623476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5PXiIU09iqGvyeNVwSaU/r/mew6pXLT/Vrk/PUJI6Q=;
        b=S57lm49WyqydhpMNON6HISmS3iTqY/LySNsS6tySZQzXtKAmoIqPWqKKz9u70ntr1v
         246XsMTNcLVQHSvChuKYcp43rrr+tlDFwFS09lHeWhUdLoGzgCH99IAM05KvOiKv2Dmw
         P2nFsIVNCACV2iCpF7z4hKBdzm2Fwp25h+6MynYUlsY41YZH7vVko09NPuLGzs3Orx64
         jCrkXn1QX3W3Cou9tQJLwuLSQdQxvJorgGE0V4qgKhMWWjF5of5HZtUQzQ02Ay/U5FP6
         Ao8xhl0L1u4byYhhDCd931AbY73NpJr/ShM0cKwLgNRTriRXVNY35TpEXUWkO0OxY80x
         BfuA==
X-Gm-Message-State: AOJu0YxeN+BuGMEE0w5rdnU2YXpkunnF9VzeYuiT+FZMQWf8dNs9vLCN
	GX7WUzL7sXThXN5tgRedtmPa9KONJN0CUM4K3r7Hy00UlLL0wMG4eUkxejGUfPkTzw1kTBX2NV3
	Fe/oXcqXYcHaStOMoRgMo0zaZpfg=
X-Gm-Gg: ASbGncvvUfS53+YeOmB7P1JlFDax740/uyVSifBjGKNH9AvIHwHoChMkcbLvQ+pZZn3
	rklVhU94HEi07jHYq0CZjIasWazm6iWbviRvc92I8zp25TO6eXje6PNDKPfmbqg6BkDTUhQZNXL
	rGHIHwqrR4t4fCqPmHTy/Uy3aw
X-Google-Smtp-Source: AGHT+IH8OeNtbmXRgfWVxarrsgD0z03PbLKKMQoT5/b1mr6YjxinDIuWnSU0M9abJt2Uh8aO7OJy6SKJUlzc9CXgpLs=
X-Received: by 2002:ac2:4c48:0:b0:54e:a262:c960 with SMTP id
 2adb3069b0e04-54ea3355b32mr1062677e87.20.1746018675538; Wed, 30 Apr 2025
 06:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250425002624.1552609-1-raj.khem@gmail.com>
In-Reply-To: <20250425002624.1552609-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Apr 2025 15:10:58 +0200
X-Gm-Features: ATxdqUGqNEi-b1h2gYll5mPlUmE_QGUDk6dz0oJ3uDGDySRba1SpmymAOamsPQI
Message-ID: <CA+chaQdNRDgj_tBjuHwQz_zO1Vw9zDdVGyT4Kb_9OLxWkR5okg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-posix-ipc: switch to PEP-517
 build backend
To: raj.khem@gmail.com, "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 13:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117255

Did anyone see build failure with this like:

DEBUG: Executing shell function do_compile
* Getting build dependencies for wheel...
/usr/lib/ld-linux-aarch64.so.1: No such file or directory
Traceback (most recent call last):
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2=
.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_=
in_process/_in_process.py",
line 389, in <module>
    main()
    ~~~~^^
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2=
.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_=
in_process/_in_process.py",
line 373, in main
    json_out["return_val"] =3D hook(**hook_input["kwargs"])
                             ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2=
.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_=
in_process/_in_process.py",
line 143, in get_requires_for_build_wheel
    return hook(config_settings)
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2=
.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/build_=
meta.py",
line 334, in get_requires_for_build_wheel
    return self._get_build_requires(config_settings, requirements=3D[])
           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2=
.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/build_=
meta.py",
line 304, in _get_build_requires
    self.run_setup()
    ~~~~~~~~~~~~~~^^
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2=
.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/build_=
meta.py",
line 320, in run_setup
    exec(code, locals())
    ~~~~^^^^^^^^^^^^^^^^
  File "<string>", line 23, in <module>
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2=
.0/posix_ipc-1.2.0/build_support/discover_system_info.py",
line 409, in discover
    d["QUEUE_PRIORITY_MAX"] =3D sniff_mq_prio_max()
                              ~~~~~~~~~~~~~~~~~^^
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2=
.0/posix_ipc-1.2.0/build_support/discover_system_info.py",
line 238, in sniff_mq_prio_max
    if max_priority < 0:
       ^^^^^^^^^^^^^^^^
TypeError: '<' not supported between instances of 'str' and 'int'

ERROR Backend subprocess exited when trying to invoke
get_requires_for_build_wheel
WARNING: TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.=
2.0/temp/run.do_compile.2736023:168
exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/dist
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/posix=
_ipc-1.2.0'
WARNING: Backtrace (BB generated script):

I get it reliably on ubuntu-22.04 jenkins builders, but cannot
reproduce it locally (with ubuntu 25.04, 22.04 nor gentoo), so I'm
wondering what's going on before this gets backported to walnascar,
styhead, scarthgap as requested by Gudni.

I'll try to get access to jenkins workspace to see what was trying to
use /usr/lib/ld-linux-aarch64.so.1 there.

Regards,




On Fri, Apr 25, 2025 at 2:26=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.=
bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
> index 29e1b35122..b3da09c35b 100644
> --- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
> @@ -9,4 +9,4 @@ UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529eb=
c881cfb2aedb3838"
>
> -inherit setuptools3 pypi
> +inherit pypi python_setuptools_build_meta
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117120): https://lists.openembedded.org/g/openembedde=
d-devel/message/117120
> Mute This Topic: https://lists.openembedded.org/mt/112443744/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

