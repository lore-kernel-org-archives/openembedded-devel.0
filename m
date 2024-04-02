Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC26CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 17:07:23 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.582.1712077642442946378
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 10:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LnAQOUNP;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-222ba2a19bdso3623958fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712077642; x=1712682442; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg9Uvw+RFte59Ez8v/HMGuUDt8x8BJ36nUTel5oLUk0=;
        b=LnAQOUNPGercLnib/bSmPJxgmsxsrjIufIqJvPd3Yj7jhXz0IQPjkDv9OvMbEGo+Ny
         NWeJXfSVdDuC1/6hiErr7eJl1zVwrbccxYEcHc11MjJaKUXsCxcHfrPO+2YvBqnswlCh
         ocDUDWdfgiK173o5pylpfUDgHuenV+AU0ht11F+XOCiYU57Dp7TM6OXr15QG6gufWgvw
         eBSkO00U/VaUoNUZU4Hgnrw8NAygJBdIzfALWVkKHlR5oeZ+YZcB5Qg3jyxTxg3Kp++J
         xTft50GgbAXLucpQ328bgrEX3Ptn0aw1QEmTrqK1ooA3ygqNyNNg36L4MczfoiG7BXok
         wv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712077642; x=1712682442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wg9Uvw+RFte59Ez8v/HMGuUDt8x8BJ36nUTel5oLUk0=;
        b=TYUAyLlkNNUNOYaHt7yBSck6C+xlP5lYMLS8b9fiLV7uei8pr2wKgRO3JXk0DXDvdU
         N5Yts7PI0btl2H3Q0StT1NhYO/G3XlyBL/mm/cu7r3RSRBzp5IjlPfmbN+Ks6kFyD8ug
         e/qguNxBuxK8TULov94T1uoAYXZGG4o5RZZe5erxlZzOXTQyRmzmB8tChFwTH6AXfeDH
         N4l0rR/SWctuB6PfJswNBYhUrwxhvxKRPKs67FpLWnOVBEW+p+Bo1+LN/CJgLQYWfaIu
         CqrrHiXXXEW7Db8kRq7MeGWyJ1RUmcYNeZFaYqOLwaEzGQg/bYy8zfwha2YpN1n3Kra8
         GW1w==
X-Gm-Message-State: AOJu0Yw76wNmIr/maWGHls+pg456KH3koiWA6FkCJ9LZ2d3TeS8z3pkp
	PPKNvr8v/Z0gLXNfxuSqxo3tg2drn5SunWb5mfqhY/t9C5o9SNPBVodnxIR9BCRa85ug4rX4PT2
	M+ziWgQejaGfkrpY5y3PPHZmeIL7aQ0y4am4=
X-Google-Smtp-Source: AGHT+IGqjqGdlad3dmjDUWgDrtYAkXRWxihTWWTBAwAGIAC2MwAs0vb+/A6mVJFZRec37sxK3IpQIKH2iEu+mjrW6A8=
X-Received: by 2002:a05:6870:d0c3:b0:229:f948:ab32 with SMTP id
 k3-20020a056870d0c300b00229f948ab32mr14210009oaa.57.1712077641619; Tue, 02
 Apr 2024 10:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <KEOBBS.B6BGV9A2K5PV@t-online.de>
In-Reply-To: <KEOBBS.B6BGV9A2K5PV@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Apr 2024 10:06:55 -0700
Message-ID: <CAMKF1sp7G0spAO3xz6M=gAh5XvMe+TgJBLHOsaFwxBXdhJw5vg@mail.gmail.com>
Subject: Re: [oe] Reproducibility of mesa with opencl feature enabled
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 17:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109784

Can we inject LLVM_LIBRARY_DIR from recipe ?

On Tue, Apr 2, 2024 at 8:59=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> I have a question regarding the reproducibility of mesa.
>
> When mesa is built with opencl a lot of .so files have buildpath leakage.=
 Since I finally looked into this, I have gained some insights.
>
> 1. The leak comes from CLANG_RESOURCE_DIR which contains the path of ${ST=
AGING_DIR_HOST}.
>
> In my ninja.build it looks like this:
> -DCLANG_RESOURCE_DIR=3D"/home/flk/poky/build-hypr/tmp/work/corei7-64-poky=
-linux/mesa/24.0.2/recipe-sysroot/usr/lib/clang/18.1.0/include
>
> 2.The include for this happens here:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/frontend=
s/clover/meson.build?ref_type=3Dheads#L69
>
> 3. This include is wrong in any case
>     dep_llvm.version() =3D 18.0.1 (and should be 18 for current clang)
>     Setting a different path therefore probably does not break anything a=
dditionally
>     but helps to remove the build paths from the binaries and the source.
>
> What I have done under the assumption that this include is not needed for=
 oe:
>
> --- a/src/gallium/frontends/clover/meson.build 2024-02-28 19:29:18.000000=
000 +0100
> +++ b/src/gallium/frontends/clover/meson.build 2024-04-02 13:10:38.351443=
132 +0200
> @@ -66,8 +66,7 @@
>      clover_cpp_args,
>      clover_opencl_cpp_args,
>      clover_spirv_cpp_args,
> -    '-DCLANG_RESOURCE_DIR=3D"@0@"'.format(join_paths(
> -      dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 'lib=
dir'), 'clang',
> +    '-DCLANG_RESOURCE_DIR=3D"@0@"'.format(join_paths( '/usr/lib/clang',
>        dep_llvm.version(), 'include',
>      )),
>    ],
>
> Not vaild, because dep_llvm.version() still !=3D 18 but
> Because the path was already wrong before, mesa compiled without errors a=
s expected.
>
> Is  setting CLANG_RESOURCE_DIR really not needed in oe or is this a bug a=
nd the missing headers have simply been silently ignored so far?
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109783): https://lists.openembedded.org/g/openembedde=
d-devel/message/109783
> Mute This Topic: https://lists.openembedded.org/mt/105290484/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

