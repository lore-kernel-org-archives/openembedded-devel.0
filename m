Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F8FC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 22:01:45 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.7713.1743717702466737963
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 15:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OFvfYhEt;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-60219a77334so704808eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 15:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743717702; x=1744322502; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROhe9NxfMGIs/aCcchR1u4xSA5qSmEau+002B/PQJ7s=;
        b=OFvfYhEtF1QzqJ5XM/1CdnAHuaoDXQLcIpV/kfnmwcIHh7GkLb3yFoiUJL3pu9owDO
         IsxeV8j2tzcKNIG1nyGV3attWacgINL+NpAKiCcV7egPhQ/8MT2SbFRfQQb8u2D4BmN8
         gh0pTY03vpuVBkdX5ABC4UmCZ5TrL33TMSVr9xmdnaeohh6ud+45Q+1KcGdvQRQhs6Ur
         dekQvWT6dIfeOIuLpnPIHe9TThOKvDV9W0V146lZjm6vAru5tq9bteB7csunOrXnWUV3
         1uKJ+rx2WADma2ZBfAOOBAuctn8HzW/sQTmSoCnSw25lDoOLnlcrOFIELdpj6HDvJ5LA
         gU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743717702; x=1744322502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROhe9NxfMGIs/aCcchR1u4xSA5qSmEau+002B/PQJ7s=;
        b=wFgHGNus0S7/zTrOSWRuTxDYisLakKZT7rmTM0ybpRdCjaT3EmtKNCE2xLughQkYxC
         5ppHCK6mg82u8LLPYnbAMkvDE23+ZDweaD/onmc3p5z5n3OuwNZMjmlg0ez7iheOAZKL
         Qb6R1HnFTbaIBiEzTPfPDmta4Fqg6+Gj0bzY/2323U97sIg4sagnBIZkWQUvRzkSejmD
         bS38qVdQcuoffdEdGkZ/V80D2XyGXFmNH0421+476pl+0Xhyjn8zIhDF3o310odk0Zz8
         JUldSgKpgpc8p3d550gk2bhN7wXDoyHPhEvotR2Xp8/CXU0tiztPLeUWCiNR5CR8mkCb
         UuIQ==
X-Gm-Message-State: AOJu0Yyn3OGDcKhLmxcX7jc3frJfYNnooJqxYjhVie8c4Hr+/46DwBVn
	f84k+kWFDs9RgS7CTvIkrmXFFp5m1xlxNbnRPH4RlFWHN1dMjsV8MQYUGz/l8GTX1Fb57zdz/FA
	4JfDarF0L/RHfkFTJ1jmjvJOhXRA=
X-Gm-Gg: ASbGnctQtxMiaSgLD16Xg7WFQDqa1FVK88Trqm1l8nH5mqU0dlftx8h6NaFTNssf1tn
	Y6e4yowIE25/Cs7hAIL7EvoRadeYXEFcV+LPYjC/XJFx/swdRv7zPS+tlM9h5jqCR0vaNoVYpYn
	6V1yjcXVS5n1vTEQzVpT4kvZRU
X-Google-Smtp-Source: AGHT+IEqVozw47fneWl7jvCPkHNSuCLMVML7g9j951v1y99eb0vU2v6N/63yiPw9bYlAQboq1NYXnrlMbdqTEuaS88Q=
X-Received: by 2002:a05:6820:507:b0:600:29ec:7619 with SMTP id
 006d021491bc7-604164da5e5mr288798eaf.2.1743717701520; Thu, 03 Apr 2025
 15:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250403091753.1542471-1-mark.yang@lge.com>
In-Reply-To: <20250403091753.1542471-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Apr 2025 15:01:14 -0700
X-Gm-Features: AQ5f1JpvmVtZipd35eeHVy_jlUSYmdF18isjtaxw9XTt4-g7gQBDu5drx_rSaAc
Message-ID: <CAMKF1sqrRk=HmSyft9C4qooJSv__=gOsf8TpCaoF3QXeJwHPzw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libiodbc: fix build with gcc-15.0.1
To: mark.yang@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 22:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116549

This fails when building with clang

../../libiodbc-3.52.16/iodbc/hstmt.c:579:7: error: ISO C requires a
named parameter before '...'

On Thu, Apr 3, 2025 at 2:19=E2=80=AFAM mark.yang via lists.openembedded.org
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> * GCC 15 considers it an error to pass arguments to a function pointer
>   defined to take no arguments. This results in a 'too many arguments to =
function' error.
>
>   At the problematic function pointer call sites, the pointer is cast to =
a variadic function pointer type (SQLRETURN (*)(...)) to avoid the error.
>
> * see more details in http://errors.yoctoproject.org/Errors/Details/85031=
7
> ../../libiodbc-3.52.16/iodbc/hdbc.c: In function '_iodbcdm_SetConnectOpti=
on':
> ../../libiodbc-3.52.16/iodbc/hdbc.c:567:49: error: too many arguments to =
function 'hproc3'; expected 0, have 4
>   567 |               CALL_DRIVER (hdbc, pdbc, retcode, hproc3,
>       |                                                 ^~~~~~
>   568 |                   (pdbc->dhdbc, fOption, vParam, 0));
>       |                    ~~~~~~~~~~~
> ../../libiodbc-3.52.16/iodbc/itrace.h:113:15: note: in definition of macr=
o 'CALL_DRIVER'
>   113 |         ret =3D proc plist; \
>       |               ^~~~
> ../../libiodbc-3.52.16/iodbc/hdbc.c:583:49: error: too many arguments to =
function 'hproc3'; expected 0, have 4
>   583 |               CALL_DRIVER (hdbc, pdbc, retcode, hproc3,
>       |                                                 ^~~~~~
>   584 |                   (pdbc->dhdbc, fOption, vParam, SQL_NTS));
>       |                    ~~~~~~~~~~~
> ../../libiodbc-3.52.16/iodbc/itrace.h:113:15: note: in definition of macr=
o 'CALL_DRIVER'
>   113 |         ret =3D proc plist; \
>       |               ^~~~
> ../../libiodbc-3.52.16/iodbc/hdbc.c:597:45: error: too many arguments to =
function 'hproc2'; expected 0, have 3
>   597 |           CALL_DRIVER (hdbc, pdbc, retcode, hproc2,
>       |                                             ^~~~~~
>   598 |               (pdbc->dhdbc, fOption, vParam));
>       |                ~~~~~~~~~~~
> ....
>
> ../../libiodbc-3.52.16/iodbc/connect.c:2970:19: error: too many arguments=
 to function 'dialproc'; expected 0, have 6
>  2970 |         retcode =3D dialproc (hwnd,       /* window or display ha=
ndle */
>       |                   ^~~~~~~~  ~~~~
> ---
>  ...cc-15.0.1-too-many-arguments-to-func.patch | 73 +++++++++++++++++++
>  .../libiodbc/libiodbc_3.52.16.bb              |  5 +-
>  2 files changed, 77 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/libiodbc/libiodbc/0001-fix-bu=
ild-with-gcc-15.0.1-too-many-arguments-to-func.patch
>
> diff --git a/meta-oe/recipes-support/libiodbc/libiodbc/0001-fix-build-wit=
h-gcc-15.0.1-too-many-arguments-to-func.patch b/meta-oe/recipes-support/lib=
iodbc/libiodbc/0001-fix-build-with-gcc-15.0.1-too-many-arguments-to-func.pa=
tch
> new file mode 100644
> index 0000000000..54b966dca1
> --- /dev/null
> +++ b/meta-oe/recipes-support/libiodbc/libiodbc/0001-fix-build-with-gcc-1=
5.0.1-too-many-arguments-to-func.patch
> @@ -0,0 +1,73 @@
> +From f7529bffc8648a192bd98da0883b94ba86e7d2b6 Mon Sep 17 00:00:00 2001
> +From: "mark.yang" <mark.yang@lge.com>
> +Date: Thu, 3 Apr 2025 17:45:26 +0900
> +Subject: [PATCH] fix build with gcc-15.0.1 too many arguments to functio=
n
> + error
> +
> +* GCC 15 considers it an error to pass arguments to a function pointer
> +  defined to take no arguments. This results in a 'too many arguments to=
 function' error.
> +
> +  At the problematic function pointer call sites, the pointer is cast to=
 a variadic function pointer type (SQLRETURN (*)(...)) to avoid the error.
> +
> +* see more details in http://errors.yoctoproject.org/Errors/Details/8503=
17
> +../../libiodbc-3.52.16/iodbc/hdbc.c: In function '_iodbcdm_SetConnectOpt=
ion':
> +../../libiodbc-3.52.16/iodbc/hdbc.c:567:49: error: too many arguments to=
 function 'hproc3'; expected 0, have 4
> +  567 |               CALL_DRIVER (hdbc, pdbc, retcode, hproc3,
> +      |                                                 ^~~~~~
> +  568 |                   (pdbc->dhdbc, fOption, vParam, 0));
> +      |                    ~~~~~~~~~~~
> +../../libiodbc-3.52.16/iodbc/itrace.h:113:15: note: in definition of mac=
ro 'CALL_DRIVER'
> +  113 |         ret =3D proc plist; \
> +      |               ^~~~
> +../../libiodbc-3.52.16/iodbc/hdbc.c:583:49: error: too many arguments to=
 function 'hproc3'; expected 0, have 4
> +  583 |               CALL_DRIVER (hdbc, pdbc, retcode, hproc3,
> +      |                                                 ^~~~~~
> +  584 |                   (pdbc->dhdbc, fOption, vParam, SQL_NTS));
> +      |                    ~~~~~~~~~~~
> +../../libiodbc-3.52.16/iodbc/itrace.h:113:15: note: in definition of mac=
ro 'CALL_DRIVER'
> +  113 |         ret =3D proc plist; \
> +      |               ^~~~
> +../../libiodbc-3.52.16/iodbc/hdbc.c:597:45: error: too many arguments to=
 function 'hproc2'; expected 0, have 3
> +  597 |           CALL_DRIVER (hdbc, pdbc, retcode, hproc2,
> +      |                                             ^~~~~~
> +  598 |               (pdbc->dhdbc, fOption, vParam));
> +      |                ~~~~~~~~~~~
> +....
> +
> +../../libiodbc-3.52.16/iodbc/connect.c:2970:19: error: too many argument=
s to function 'dialproc'; expected 0, have 6
> + 2970 |         retcode =3D dialproc (hwnd,       /* window or display h=
andle */
> +      |                   ^~~~~~~~  ~~~~
> +
> +Upstream-Status: Submitted [https://github.com/openlink/iODBC/pull/111]
> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +---
> + iodbc/connect.c | 2 +-
> + iodbc/itrace.h  | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/iodbc/connect.c b/iodbc/connect.c
> +index 632827f..1259516 100644
> +--- a/iodbc/connect.c
> ++++ b/iodbc/connect.c
> +@@ -2967,7 +2967,7 @@ SQLDriverConnect_Internal (
> +             prov[size/sizeof(SQLWCHAR)] =3D L'\0';
> +           }
> +
> +-        retcode =3D dialproc (hwnd,     /* window or display handle */
> ++        retcode =3D ((SQLRETURN (*)(...))dialproc) (hwnd,       /* wind=
ow or display handle */
> +           prov,                       /* input/output dsn buf */
> +           sizeof (prov) / (waMode =3D=3D 'A' ? 1 : sizeof (SQLWCHAR)), =
/* buf size */
> +           &sqlstat,           /* error code */
> +diff --git a/iodbc/itrace.h b/iodbc/itrace.h
> +index 508359d..f3e6926 100644
> +--- a/iodbc/itrace.h
> ++++ b/iodbc/itrace.h
> +@@ -110,7 +110,7 @@ extern int ODBCSharedTraceFlag;
> + \
> +       if (!t_penv->thread_safe) MUTEX_LOCK (t_penv->drv_lock); \
> + \
> +-      ret =3D proc plist; \
> ++      ret =3D ((SQLRETURN (*)(...))proc) plist; \
> +       if (errHandle) ((GENV_t *)(errHandle))->rc =3D ret; \
> + \
> +       if (!t_penv->thread_safe) MUTEX_UNLOCK (t_penv->drv_lock); \
> diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb b/meta-=
oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
> index 644c3ba07b..0d2d9d5f97 100644
> --- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
> +++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
> @@ -12,7 +12,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3D8c0138=
a8701f0e1282f5c8b2c7d39114 \
>                      file://LICENSE.BSD;md5=3D5b36348a404e1d65b57df8d33fd=
6e414 \
>                      "
>
> -SRC_URI =3D "https://github.com/openlink/iODBC/releases/download/v${PV}/=
${BP}.tar.gz"
> +SRC_URI =3D " \
> +       https://github.com/openlink/iODBC/releases/download/v${PV}/${BP}.=
tar.gz \
> +       file://0001-fix-build-with-gcc-15.0.1-too-many-arguments-to-func.=
patch \
> +"
>  SRC_URI[sha256sum] =3D "3898b32d07961360f6f2cf36db36036b719a230e47646925=
8a80f32243e845fa"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/openlink/iODBC/releases"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116537): https://lists.openembedded.org/g/openembedde=
d-devel/message/116537
> Mute This Topic: https://lists.openembedded.org/mt/112062410/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

