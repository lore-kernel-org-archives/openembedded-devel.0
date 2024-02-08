Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1F8C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 07:59:34 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.13052.1707379173257360051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 23:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HP+U5gwG;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-216f774c827so783399fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 23:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707379172; x=1707983972; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/aV+r80L8uRcyrwcNWSlHOTP4eLsCC7gAfZgVZ2Ybg=;
        b=HP+U5gwGkZsGbCLaq8e47o2advP3rL1zy2xaS7CbnL9XbImxkJgx+ByvgBNE5I351p
         1Xi4Zf4/K3sJn/W6HsLm9wn/2q3AndcAoW5SQ8oA3aOT7WEKvy9lLWVhqEc8NITd6mGG
         WUKfghnXwMoWGpFZ8ORjFFqKl84B2nTxMYFD3ej5tRcHiGVzdHGKivg1aiqKLaE8HAUw
         WH32LPNBB+1coYM9ZF3Uj+ADjgelsnXWAqI0EvgvX+ouMi5ew/tkxUpkGXabAcm5Yp9v
         llbtLIgbyWG522hzRlqjQT2u/pWWxVlQpmkngm23+763Fg3tri3NIAxF0muNuYOYaClI
         WTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707379172; x=1707983972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/aV+r80L8uRcyrwcNWSlHOTP4eLsCC7gAfZgVZ2Ybg=;
        b=CpxHVz//gpjQZEVt55NOQrI8FXoc1zWBK1FBIMRzUZNHWe2Q6v+3Q4++4Xxys8cud0
         LDhKWlFfYtM+nL1E0QRWKpENfNmixvlGPMyLmMJbaWACsQXES0+H/Y1ffX6KLdjVJM+w
         Myy9Y+5UCGn3SbmLvFZ6HYNA8ftA9eTZkxLqQioQskJI0ahdIHK6ilv1dkVVMFCI/TyQ
         g242VciB9lG/QDp0GSGNS34md36SQf2O0jAA+y7vVz5P5zT92Jyfxqfog1I0OB6NEn14
         pOrNW2X5WW9J+lTfX4FLl8KNH/cDg5CcKipEcLgojPwEcSdchJE1B/0CCy5HkkdN1p9/
         j+7w==
X-Gm-Message-State: AOJu0Yyz7l35g4v6xrTAeoJz6IAww5mIa6Qb+jHkiSyq17Hc8aHOK1FS
	10VK1Vp/udygn+Xtg5FL9YBeP8F1+p3u6+xEdSfkumjGJN+Ih8jUjTSacemVntokF5V77AyNSbu
	tp6TtTBJnWI7FhKZ4wewTwFlsKWE=
X-Google-Smtp-Source: AGHT+IGAIwBTj0LHFWQAz/vCZnOCmlsIh/97UukdJQlFTAxujOiGLozi4TCq5vQW6d9qqKl1s7tY82bj2uO4dwQJ2+c=
X-Received: by 2002:a05:6870:6590:b0:219:7746:d886 with SMTP id
 fp16-20020a056870659000b002197746d886mr9057009oab.36.1707379172297; Wed, 07
 Feb 2024 23:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20240208054208.39929-1-alperyasinak1@gmail.com>
In-Reply-To: <20240208054208.39929-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Feb 2024 23:59:06 -0800
Message-ID: <CAMKF1sp4B0W-E-H2jKUtAF2ekh+FJ9yRDPi2Vfy1LVogRJWkvw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-strenum: add recipe
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 07:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108661

fails to build

ERROR: python3-strenum-0.4.15-r0 do_compile:
ExecutionError('/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-=
strenum/0.4.15/temp/run.do_compile.1048839',
1, None, None)
ERROR: Logfile of failure stored in:
/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenum/0.4.15/t=
emp/log.do_compile.1048839
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenum/0.4.15=
/StrEnum-0.4.15/versioneer.py:421:
SyntaxWarning: invalid escape sequence '\s'
|   LONG_VERSION_PY['git'] =3D '''
| Traceback (most recent call last):
|   File "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenu=
m/0.4.15/recipe-sysroot-native/usr/lib/python3.12/site-packages/pyproject_h=
ooks/_in_process/_in_process.py",
line 353, in <module>
|     main()
|   File "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenu=
m/0.4.15/recipe-sysroot-native/usr/lib/python3.12/site-packages/pyproject_h=
ooks/_in_process/_in_process.py",
line 335, in main
|     json_out['return_val'] =3D hook(**hook_input['kwargs'])
|                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenu=
m/0.4.15/recipe-sysroot-native/usr/lib/python3.12/site-packages/pyproject_h=
ooks/_in_process/_in_process.py",
line 118, in get_requires_for_build_wheel
|     return hook(config_settings)
|            ^^^^^^^^^^^^^^^^^^^^^
|   File "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenu=
m/0.4.15/recipe-sysroot-native/usr/lib/python3.12/site-packages/setuptools/=
build_meta.py",
line 325, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=3D['whe=
el'])
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
|   File "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenu=
m/0.4.15/recipe-sysroot-native/usr/lib/python3.12/site-packages/setuptools/=
build_meta.py",
line 295, in _get_build_requires
|     self.run_setup()
|   File "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenu=
m/0.4.15/recipe-sysroot-native/usr/lib/python3.12/site-packages/setuptools/=
build_meta.py",
line 480, in run_setup
|     super(_BuildMetaLegacyBackend, self).run_setup(setup_script=3Dsetup_s=
cript)
|   File "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenu=
m/0.4.15/recipe-sysroot-native/usr/lib/python3.12/site-packages/setuptools/=
build_meta.py",
line 311, in run_setup
|     exec(code, locals())
|   File "<string>", line 10, in <module>
|   File "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenu=
m/0.4.15/StrEnum-0.4.15/versioneer.py",
line 1480, in get_version
|     return get_versions()["version"]
|            ^^^^^^^^^^^^^^
|   File "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenu=
m/0.4.15/StrEnum-0.4.15/versioneer.py",
line 1412, in get_versions
|     cfg =3D get_config_from_root(root)
|           ^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/python3-strenu=
m/0.4.15/StrEnum-0.4.15/versioneer.py",
line 342, in get_config_from_root
|     parser =3D configparser.SafeConfigParser()
|              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| AttributeError: module 'configparser' has no attribute
'SafeConfigParser'. Did you mean: 'RawConfigParser'?
|

On Wed, Feb 7, 2024 at 9:42=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com> w=
rote:
>
> StrEnum is a Python enum.Enum that inherits from str to complement enum.I=
ntEnum in the standard library
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../python/python3-strenum_0.4.15.bb                 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-strenum_0=
.4.15.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.b=
b b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
> new file mode 100644
> index 000000000..1d2def79a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "An Enum that inherits from str"
> +HOMEPAGE =3D "https://github.com/irgeek/StrEnum"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dba0eb3de1df70bde0ed48488cfd81=
269"
> +
> +DEPENDS =3D "${PYTHON_PN}-pytest-runner-native"
> +
> +SRC_URI[sha256sum] =3D "878fb5ab705442070e4dd1929bb5e2249511c0bcf2b0eeac=
f3bcd80875c82eff"
> +
> +PYPI_PACKAGE =3D "StrEnum"
> +
> +inherit pypi python_setuptools_build_meta
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108655): https://lists.openembedded.org/g/openembedde=
d-devel/message/108655
> Mute This Topic: https://lists.openembedded.org/mt/104234619/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

