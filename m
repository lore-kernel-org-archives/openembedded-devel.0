Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65851C3ABAD
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 15:01:16 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.841.1746025269110124772
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 08:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6PPGXh1;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-605ff8aa9d2so1929555eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 08:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746025268; x=1746630068; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzngLoaDS4dzok63QOQblWICpJDe/RAGUqmNj4OqDEw=;
        b=U6PPGXh1Z3488r4El7Ph6pb+U1gELDp7nOSIbMdyYpvE+WwnMg+bSC7cpYRyUhgF8P
         UP/PUurtGCDCUmeKbfedivMiWyXB+y8yA3ug4VIX6RXrxRSsz8GgwL/8aHvKid9XGJNU
         t2tN4IshthQua+sXp2paTbEE9VuJPOAGR76AvXp3bqCv3/6JhNWBWvQjCkAEPsLddoyd
         5U+QDYQczvZbhGLyv6JUCFJRx4Z6EMcgILYpZ2T3139MTdWKbq967SuPoXEu7x9Vs8ny
         8jyOifktmCWdX11XrL+QLqSdHngSstdwsPxePhqOjeDJObpzQXuCJHAY3ZWLsXm16yQt
         ctug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025268; x=1746630068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzngLoaDS4dzok63QOQblWICpJDe/RAGUqmNj4OqDEw=;
        b=hA8sJTuFLZv20eOJa1vNQNYZb7zDIHJZ4F4Hshw941zfQlSHBRsoOsfjxGpVuBj/dS
         7R5FqkZDBLv5ATBXCYDyRk3XI1B/Woq68coJxfDIMFhMZCitAURzMU56gsC7G03TRVdP
         ZK7simaVudMy4YsI7d5rR5k3MQsdHGVT2jpGxTtTLOLNot9pjbGb6CcN6vF0WJBAJ3eb
         b2c/gq4VRpuNmO3WI04pcJ5udkoPqPfE02Uigr+ctGv5VDeHtaMwa9VFM6IR0pZCp8NK
         aDFVWrc9of9XLudpbkI1+Fu4GDTBhFbePK8hwwQvyUWByuhwfXOKI6liY4BHlXAexcX3
         qzvw==
X-Forwarded-Encrypted: i=1; AJvYcCWdg0mVHpV8mqa1GPhZWg3aJC1t8YWvdBZDNOTX1J7RI+PlmV7j8PSlRuFgMA5crQfkpiHVTMjZSqtwkPOdPChPq6M=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyF+qJifNslXJZnH0qCMsNDKNvdL3RwT8kWvHGezCKM1D0hijSm
	lYAXlFu/O8RtnXrp2UfzNAX1+gSZjZoMu8yfhh/sQ1BUaXzRClARa/x95Eonb0aarfVb43t/SRZ
	UV9alGHZIx9/dfwgUgHm3u9+Gdjk=
X-Gm-Gg: ASbGncu6vg5ysezFOYgdjEzctt9PSC4QEsha7ajwT0ew6ycFM7eQ0m/7ov+9sblxsV8
	lNj9BpD2gRGW1SpzNozRsSS9rUR9lqtjojiTLQiPKGl45/EFYPUQLC7QtboLwWx2Vk3+dbkdCrR
	z+/uS65Tl3KInRgp9BVtzvGVc0B5F0ZG4RbRax
X-Google-Smtp-Source: AGHT+IFblNHD2m58wLDGvv9+gZsBt9x/MDJCUZVhQ86YaLFvo3dwM0e8S4jaRcaS2FnxzosGvQKDwJZdKAHz/8jglRo=
X-Received: by 2002:a05:6820:2902:b0:607:a412:10a8 with SMTP id
 006d021491bc7-607d56c1c2cmr1710982eaf.7.1746025268024; Wed, 30 Apr 2025
 08:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250425002624.1552609-1-raj.khem@gmail.com> <CA+chaQdNRDgj_tBjuHwQz_zO1Vw9zDdVGyT4Kb_9OLxWkR5okg@mail.gmail.com>
In-Reply-To: <CA+chaQdNRDgj_tBjuHwQz_zO1Vw9zDdVGyT4Kb_9OLxWkR5okg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Apr 2025 08:00:41 -0700
X-Gm-Features: ATxdqUHFRpI4TqdbYFTYykcRmlAZU_bfV0OYv-lRhyr3JsxPf-u4D8sctAVXyOY
Message-ID: <CAMKF1spH2oB=_CzbVgG92tNkSbutzgH0GYQs=1PEPZ=kYz4pqA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-posix-ipc: switch to PEP-517
 build backend
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 15:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117259

I have 22.04 builders where it worked ok on 4 different combinations
also on ubuntu 20.04+buildtools

On Wed, Apr 30, 2025 at 6:11=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> Did anyone see build failure with this like:
>
> DEBUG: Executing shell function do_compile
> * Getting build dependencies for wheel...
> /usr/lib/ld-linux-aarch64.so.1: No such file or directory
> Traceback (most recent call last):
>   File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1=
.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks=
/_in_process/_in_process.py",
> line 389, in <module>
>     main()
>     ~~~~^^
>   File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1=
.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks=
/_in_process/_in_process.py",
> line 373, in main
>     json_out["return_val"] =3D hook(**hook_input["kwargs"])
>                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>   File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1=
.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks=
/_in_process/_in_process.py",
> line 143, in get_requires_for_build_wheel
>     return hook(config_settings)
>   File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1=
.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/buil=
d_meta.py",
> line 334, in get_requires_for_build_wheel
>     return self._get_build_requires(config_settings, requirements=3D[])
>            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1=
.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/buil=
d_meta.py",
> line 304, in _get_build_requires
>     self.run_setup()
>     ~~~~~~~~~~~~~~^^
>   File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1=
.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/buil=
d_meta.py",
> line 320, in run_setup
>     exec(code, locals())
>     ~~~~^^^^^^^^^^^^^^^^
>   File "<string>", line 23, in <module>
>   File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1=
.2.0/posix_ipc-1.2.0/build_support/discover_system_info.py",
> line 409, in discover
>     d["QUEUE_PRIORITY_MAX"] =3D sniff_mq_prio_max()
>                               ~~~~~~~~~~~~~~~~~^^
>   File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1=
.2.0/posix_ipc-1.2.0/build_support/discover_system_info.py",
> line 238, in sniff_mq_prio_max
>     if max_priority < 0:
>        ^^^^^^^^^^^^^^^^
> TypeError: '<' not supported between instances of 'str' and 'int'
>
> ERROR Backend subprocess exited when trying to invoke
> get_requires_for_build_wheel
> WARNING: TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/=
1.2.0/temp/run.do_compile.2736023:168
> exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir
> TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/dis=
t
> TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/pos=
ix_ipc-1.2.0'
> WARNING: Backtrace (BB generated script):
>
> I get it reliably on ubuntu-22.04 jenkins builders, but cannot
> reproduce it locally (with ubuntu 25.04, 22.04 nor gentoo), so I'm
> wondering what's going on before this gets backported to walnascar,
> styhead, scarthgap as requested by Gudni.
>
> I'll try to get access to jenkins workspace to see what was trying to
> use /usr/lib/ld-linux-aarch64.so.1 there.
>
> Regards,
>
>
>
>
> On Fri, Apr 25, 2025 at 2:26=E2=80=AFAM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.=
0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
> > index 29e1b35122..b3da09c35b 100644
> > --- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
> > @@ -9,4 +9,4 @@ UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> >
> >  SRC_URI[sha256sum] =3D "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529=
ebc881cfb2aedb3838"
> >
> > -inherit setuptools3 pypi
> > +inherit pypi python_setuptools_build_meta
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#117120): https://lists.openembedded.org/g/openembed=
ded-devel/message/117120
> > Mute This Topic: https://lists.openembedded.org/mt/112443744/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

