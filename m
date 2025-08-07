Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7966FC87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 10:28:29 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.48347.1754562498984492648
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Aug 2025 03:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ax0sE0XD;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55b978c61acso810436e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Aug 2025 03:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754562497; x=1755167297; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSAGiQW7OnWLFa75KX0dfZHvjorLlob3ApplOZ/CrrY=;
        b=ax0sE0XDAJaf/HCxIa2FMlVOpvYciVTjxpM6BFrPiPEXn5RVYAKGF/VqueIWALBD27
         UU0b/hXqZs4TPUbvH7NqTY6XKBcKV8cOcNaEyJ9KYolz/J4Kczjjshco71BtdFFESXBB
         C4q0sWwQNkbr00yBvVLcKWG1uc9rFlWKjVA7TjuaLwqZcfu33WmcDcNTaDrkVzZE83hu
         iId4ei8xMKNHMV5E98VRL3yaN1SEZLi/FhTa/QwHf/Ecrv5YoN5unCuiDfyQXrTDIz0g
         Jc2ekWexnn7Y0BQCIF3pOZ7AjdadwigcIPVNJbxOxU6zk5GIqmFmONdcCNNRsXtD90kT
         WNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754562497; x=1755167297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSAGiQW7OnWLFa75KX0dfZHvjorLlob3ApplOZ/CrrY=;
        b=TkCYekIdNrOrSJLgotCZrqvY/wgLI6RzJ/hYze86xcXhtaYma0d9I66c8gjm/6YrW2
         nj3/OaAjayzwcvxi7PyLMszSvCzCUwQr58U6rs4XSFSTivruzYEjw8A89Geux754b3zE
         L1AR24mE75HroR+64Kmx+loQcMz/ZAjY3X9J3iHk1eWHRJluK5BuWjclOw0+sKu9Ts9w
         ofOZjId9XCHmORy0ifj2UFSPT6YOeSNKkoI6cg8slNZ3OvB6w0OOQQRMd+ys1xvvyEHR
         APPCWkUkj2VyJ4JYALVjQJPhkNmpbSW3fGRpr5HHK5sGPG61oRISgFkLeYSESCtgdRw6
         DZ5g==
X-Gm-Message-State: AOJu0YzaAmh0Amb21Bv7ToYE4u4ZXkSMw8LHtkfRECsk+7T2a8Trz7Om
	ho1yBv/zMolb+nVynXXZg1odZ+v2WOtlKwNmvUoY/L/iDz92hkDFSzodt32yrRlwljNpPZtc0tD
	WiSlkMN3eu7F9kZRnRP46RXp1tf5wVE544nhm
X-Gm-Gg: ASbGncttTQaBngEP77eIAa2xpr8CPcMH0hDfZymuMDh8LWaptvAC+4MAqg7sGrwiXTq
	rmiMHyibYd4x+j2N51e6zkJ/9hJ3PQElnkf0AYG7mTWzquCo3rTSJkAlfatBx7X6fMFjc+m0DEy
	SnWGHECCP8OFSzkm1+e+VG8iB9V8+JOskVysPRHdlwTB/IkUDBHYfNJOk1Cg8wsiSLI1H0vA0Yh
	pfMjIUldA==
X-Google-Smtp-Source: AGHT+IEOl7IJiBCbEmkTYXopYC/eGDvaFvkvngCRyuP4KIl3pkpyfPjp6I85Y1SJNyHiWLVJFzIiGwRtF2x6kzmhblM=
X-Received: by 2002:a05:6512:3d21:b0:55b:95a2:d70f with SMTP id
 2adb3069b0e04-55caf564b32mr2319683e87.18.1754562496762; Thu, 07 Aug 2025
 03:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250807102104.263783-1-haixiao.yan.cn@windriver.com>
In-Reply-To: <20250807102104.263783-1-haixiao.yan.cn@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Aug 2025 12:28:05 +0200
X-Gm-Features: Ac12FXxjPHYbr4ADq-GjeFnyCdhL0v83YtnZHt56y3PdkP_tsh7K-_UfgExgLzY
Message-ID: <CA+chaQfw=3nT1j8pdi=uLbe8FHaz22iw6GtWHgGZmv75X8s7wg@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 1/1] python3-posix-ipc: fix
 runtime error
To: Haixiao.Yan.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Aug 2025 10:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118899

Please test it with newer version where some of the .patch files submitted =
in:
https://github.com/osvenskan/posix_ipc/pull/77
were replaced by:
https://github.com/osvenskan/posix_ipc/pull/85

If it still doesn't work then report and submit it upstream.


On Thu, Aug 7, 2025 at 12:21=E2=80=AFPM Yan, Haixiao (CN) via
lists.openembedded.org
<Haixiao.Yan.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> Fix follow runtime error: ./build_support/src/sniff_mq_prio_max:
> /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required=
 by
> ./build_support/src/sniff_mq_prio_max)
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>  ...ndle-runtime-errors-and-return-None-.patch | 57 +++++++++++++++++++
>  .../python/python3-posix-ipc_1.2.0.bb         |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc=
/0004-build_support-handle-runtime-errors-and-return-None-.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0004-b=
uild_support-handle-runtime-errors-and-return-None-.patch b/meta-python/rec=
ipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-er=
rors-and-return-None-.patch
> new file mode 100644
> index 000000000000..f4608e6443b5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_su=
pport-handle-runtime-errors-and-return-None-.patch
> @@ -0,0 +1,57 @@
> +From aea0522262cc7e2374131f25116a59303fdca8e5 Mon Sep 17 00:00:00 2001
> +From: Haixiao Yan <haixiao.yan.cn@windriver.com>
> +Date: Thu, 7 Aug 2025 08:13:06 +0000
> +Subject: [PATCH] build_support: handle runtime errors and return None fo=
r
> + invalid max_priority
> +
> +When cross-compiling, test binaries may fail to execute on the host syst=
em if
> +the target toolchain was built against a newer glibc version than what i=
s
> +available on the host.
> +
> +For example, on Ubuntu 20.04 the following error occurs:
> +
> +./build_support/src/sniff_mq_prio_max: /lib/x86_64-linux-gnu/libc.so.6: =
version
> +`GLIBC_2.34' not found (required by ./build_support/src/sniff_mq_prio_ma=
x)
> +
> +This change ensures that such runtime errors are gracefully handled, and
> +max_priority is set to None when the test binary cannot be executed.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> +---
> + build_support/discover_system_info.py | 15 ++++++++++++---
> + 1 file changed, 12 insertions(+), 3 deletions(-)
> +
> +diff --git a/build_support/discover_system_info.py b/build_support/disco=
ver_system_info.py
> +index f6e6c8cbe6ba..a0be60e51e24 100644
> +--- a/build_support/discover_system_info.py
> ++++ b/build_support/discover_system_info.py
> +@@ -73,12 +73,21 @@ def compile_and_run(filename, linker_options=3D""):
> +     # Utility function that returns the stdout output from running the
> +     # compiled source file; None if the compile fails.
> +     if does_build_succeed(filename, linker_options=3D""):
> ++        debug =3D False
> +         try:
> +             s =3D subprocess.Popen(["./build_support/src/%s" % filename=
[:-2]],
> +-                                 stdout=3Dsubprocess.PIPE).communicate(=
)[0]
> +-            return s.strip().decode()
> +-        except Exception:
> ++                                 stdout=3Dsubprocess.PIPE, stderr=3Dsub=
process.PIPE)
> ++            stdout, stderr =3D s.communicate()
> ++            if s.returncode !=3D 0:
> ++                # runtime error
> ++                if debug:
> ++                    print("Execution error:", stderr.decode().strip())
> ++                return None
> ++            return stdout.strip().decode()
> ++        except Exception as e:
> +             # execution resulted in an error
> ++            if debug:
> ++                print("Exception during execution:", str(e))
> +             return None
> +     else:
> +         # uh-oh, compile failed
> +--
> +2.44.3
> +
> diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.=
bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
> index 8147e4108b72..cad140381344 100644
> --- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
> @@ -12,5 +12,6 @@ SRC_URI +=3D " \
>      file://0001-build_support-use-source-filename-instead-of-foo-for.pat=
ch \
>      file://0002-build_support-handle-empty-max_priority-value-as-Non.pat=
ch \
>      file://0003-build_support-use-does_build_succeed-in-compile_and_.pat=
ch \
> +    file://0004-build_support-handle-runtime-errors-and-return-None-.pat=
ch \
>  "
>  inherit pypi python_setuptools_build_meta
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118898): https://lists.openembedded.org/g/openembedde=
d-devel/message/118898
> Mute This Topic: https://lists.openembedded.org/mt/114580342/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

