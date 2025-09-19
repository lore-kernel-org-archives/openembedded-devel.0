Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FE7CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 19:24:50 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.web11.4884.1758309882883380243
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 12:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lc3XCdw4;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-60f4678ceabso1625720d50.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758309882; x=1758914682; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3plmDK4TtlVsvs1heoRQrtJGk6NFILytHuS+lD8xNQY=;
        b=Lc3XCdw4s/AJDQTcT43gzp3m8weRnHj23MCu/F3vnS/JSIJJQU98qzAFsiFAAviNdS
         aBiim+BulIChfpCDX75Gpu5jYCW4g2DiRY7u8WlcePUlflaMgYXwZ5ifU+uBGRMH39j+
         JcBDV0In3Cn119ufaT8gmovzdEu/AVvkG0TEDjJQnR8aXMvANUBthVDjAIuZYsLTgXBM
         f91h7PjLRQbZLUv5bL0x8ZHnRGcgnGTsuzOZ6fN6hGn2up8Jd2HQOK0WnJ1RpbKKLgLN
         Z0JT1K7PgQ3vdIChvWTD/58tBRcmE1Fo8D39kO+liuAfFjScLABGmftDJAI++hoH0/fR
         /sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758309882; x=1758914682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3plmDK4TtlVsvs1heoRQrtJGk6NFILytHuS+lD8xNQY=;
        b=Fm0Zm47KFnU7jmHLL8294TD1g+3A0FjhufAR8wDWx+IlLlYbf9Ic2XZnxUo3ucMvRA
         iRpORrwQBJqSahg+W3gTTax1Qqh5ErpZI6f5IyJteKw2AHbrOVMlgeBdlzSmZR5sKHTi
         6nlAHXIWxJQxleUXDSR3mIrYda6SWwvSb/0er09/BGurqehUm8j7r8LyDpc4Oa03oMrP
         S6Kon5Kjdd6hCVin/1mU6u1jB/w0GytROoeZuq7xGO1IU7r31YqiUfHcQJn+QexivjnL
         T6KozXlB1atccJivO6TKYVrNGWz1xHm8IjntdUvqzphkNrbn4VRRenYhV2N3LyvETEFw
         lbDg==
X-Gm-Message-State: AOJu0Yx6uApEmeZ2oYtwsGTAuM3GgvJ9LCxPtoWcnQcjVYowAnA1Qy8G
	nosqeeBq50NrcBRi+GGBrh4Lr4MDjsLxO2g719mx6gwzVd73V70Gl/d2CGSqXRG2tsYEn/g8esE
	JlOwg2aeb74d+FM4xOnt2kupS2K11eoA=
X-Gm-Gg: ASbGncun645K4Ih2FBLxMKTotRz2I2LuMvSR+0TcRjI8+jURiNniHoJU6gQYQgZ9VGn
	paJaGZ3mzHZWtUsqSc4vUzEvoMrCncZLfPREia5YCZPnK7f4GHamODs+0WWZ+cWJ/51o1VcCPcs
	Pqz95dXGFP2pomwgIot5I4ZD/obPFSurfU6kLqc/2pHcEpGSorOV+niDhJp6vXrYAJL82jxK6fi
	MtrdBqcLJERGdgbW6CLV8186VIEdvWxPWl+VRkhTHLS7p+zFs4Y8l0Lgw1of62ltbQIPXDsdDLu
	Cql+23ZkEmW3Osg+d13+xCfj
X-Google-Smtp-Source: AGHT+IFLZVdIj5AkbjglyM8iQcjJbcLC/chF4qdJ2N9J/POd5uey0O5x1Uz0UhXw43T2ab5EylgQMB3uOioT6nJfUCE=
X-Received: by 2002:a05:690e:1584:10b0:5f4:55cb:80d4 with SMTP id
 956f58d0204a3-6347f560dfcmr3325208d50.17.1758309881748; Fri, 19 Sep 2025
 12:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250918071548.3934769-1-hongxu.jia@windriver.com> <20250918071548.3934769-4-hongxu.jia@windriver.com>
In-Reply-To: <20250918071548.3934769-4-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Sep 2025 12:24:15 -0700
X-Gm-Features: AS18NWA2ffCbIEnkvVrLybsxLzJ1qua5-WSgc9iaQZYfGKDMpaXdTt-hLAmbR4U
Message-ID: <CAMKF1sr5AR-aS5yUZ-+zCfB4NiAOwMDbHgCaXv+iiVkf-zf7uA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-yarl: support reproducible
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 19:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119611

On Thu, Sep 18, 2025 at 12:16=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> In order to make the generated library be reproducible, build wheel
> in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> option -fdebug-prefix-map could work as expected
>
> Note: To support reproducible, it also requires oe-core commit [1] to be =
merged
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/223604?p=
=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C115291386%2Cd%=
253D3&d=3D3
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb b=
/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
> index bbf9e3d782..6eedcf0f82 100644
> --- a/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
> @@ -9,6 +9,10 @@ PYPI_PACKAGE =3D "yarl"
>
>  inherit pypi ptest-python-pytest python_setuptools_build_meta cython
>
> +SRC_URI +=3D " \
> +    file://0001-build-wheel-in-place.patch \
> +"

This patch file is missing.

> +
>  DEPENDS +=3D " \
>      python3-expandvars-native \
>  "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119532): https://lists.openembedded.org/g/openembedde=
d-devel/message/119532
> Mute This Topic: https://lists.openembedded.org/mt/115306110/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

