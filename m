Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3984C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:11:11 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.32919.1743019868626607045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Om/wYLpg;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-601e3f2cee1so129093eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 13:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743019868; x=1743624668; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLRP3cRMDyesB3LFCv0BTSVtOuFf8eVqZ7g1xvVHGS0=;
        b=Om/wYLpg1O1QWIrwl7txdsKY9FpOWCtwAc7sgn8ShGKRHX7HYHKXYKssad9iewKH2c
         c+wLxITHBBFhS+B5qPlf0zrluCCJTGOuEuuG/BCCyURuZxgIKNMsPI52mOBurNnrINDA
         ktZtvygor+wsTrCJQKqGzPjKgwMTej7pT5qO6ctGgjMfJAI27WKc91zunNRt93CT8fF8
         4QtG8Dy0bvfTHCRITmP4qnyLnZe/voTJ5BMVSheEQpvQptRXAcVbZZ8KhTHmnakYnv01
         6/5yxEL4G2yYsCHubaNOonv5ac54Dntz2PZqCrI7nXLjWBQHSmJzwwv+93fwaXPm71nz
         k0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743019868; x=1743624668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLRP3cRMDyesB3LFCv0BTSVtOuFf8eVqZ7g1xvVHGS0=;
        b=w08MTGF6FbfD2DkdYLNE4oGLJ4Kb7eEz6kok8sR75XfknQ/lYnuPsQEqi5FZgi1ZPE
         GLTJRmaMTF/BRoGFu45LxnT1WFTGh5FaKhwDg03ngHyu7QqQozOoUEt7HslV3L/gyUJr
         4WyA9nU8IjU3SFUZRCiwwUdTXmPIFrGjcHQospKnmtRRPSzIa+BzeLo0UD0TRWtmPByA
         0bG8Zh3aFbG2/070eOQMoNVWsdITf7gP2m2l3pm7HB7BB+XHG02QFIIohOZ6PuNq20hQ
         lOiaTKFoVJt3eipSccAS3FvZxuI8l/naop/kVVe768TbpizJdPzBObpY6D83p2daBE3G
         jAuw==
X-Gm-Message-State: AOJu0Yzq/6sldp0fDXkNObOGD+XwWdb95sRGJ56cicct9CfFWOIdgmqe
	tbkceDi9YqFavLlrLLvu8eqEWB9YSK507ouT0vIt8CMQ1DymTXYtLuf4Vmw+uSBiatf2Daa37a1
	NJzkR3piDTb+VSHyXgRTYvi64vE4=
X-Gm-Gg: ASbGncuMmfjpbw9Cr3XM1F1dp59gsOkN7FGDXvzVst1SSEnAlv4xCYtQd2Ca0QqSmlM
	XK1NDGMu0LfmEqUUt2LxH2BRNr1XU1vlahjz83IV5CNwX7GJrcf4jaBl4ogjKLlsHaLWZ5r1v1R
	720UPA5113EVteV14E94eUexV0kyEgeFGAkY/pvSx6aZVdL9SEjm2uqWBcQn1u0a6p
X-Google-Smtp-Source: AGHT+IEbNLJyjL6eTlODKXIyb49ByVKHm+q6zqXqEVP1cCtCq9k6G+z+CCeGxl3KSQaHthMhpTUa//OqQoqnW7Jtqzk=
X-Received: by 2002:a05:6820:4183:b0:601:adbf:1f06 with SMTP id
 006d021491bc7-6027865291emr581598eaf.8.1743019867663; Wed, 26 Mar 2025
 13:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250326111839.1206834-1-mark.yang@lge.com>
In-Reply-To: <20250326111839.1206834-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Mar 2025 13:10:41 -0700
X-Gm-Features: AQ5f1JoJbKfKSj5NWJwaEtZZCat6HhMsb7GN3YQqihQsF8CUO-DcPERCeZDQHLo
Message-ID: <CAMKF1sr8GYeGwgU6vxmXXVST-3dAWik3dZ6_A4_aN5GOztkAWQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] crash: upgrade 8.0.5 -> 8.0.6
To: mark.yang@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 20:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116303

I think this broke 32bit builds we need to backport -
https://github.com/crash-utility/crash/commit/2724bb1d0260f3886f8a3d533838c=
af80c7e61e5

On Wed, Mar 26, 2025 at 4:18=E2=80=AFAM mark.yang via lists.openembedded.or=
g
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> ChangeLog:
> https://crash-utility.github.io/changelog/ChangeLog-8.0.6.txt
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  ...sh-cross-canadian_8.0.5.bb =3D> crash-cross-canadian_8.0.6.bb} | 0
>  meta-oe/recipes-kernel/crash/crash.inc                          | 2 +-
>  meta-oe/recipes-kernel/crash/{crash_8.0.5.bb =3D> crash_8.0.6.bb} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-kernel/crash/{crash-cross-canadian_8.0.5.bb =3D> =
crash-cross-canadian_8.0.6.bb} (100%)
>  rename meta-oe/recipes-kernel/crash/{crash_8.0.5.bb =3D> crash_8.0.6.bb}=
 (100%)
>
> diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb b=
/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
> similarity index 100%
> rename from meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb
> rename to meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
> diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-ker=
nel/crash/crash.inc
> index cab4e178b9..3d712592df 100644
> --- a/meta-oe/recipes-kernel/crash/crash.inc
> +++ b/meta-oe/recipes-kernel/crash/crash.inc
> @@ -24,7 +24,7 @@ SRC_URI =3D "git://github.com/crash-utility/${BPN}.git;=
branch=3Dmaster;protocol=3Dhttp
>             file://gdb_build_jobs_and_not_write_crash_target.patch \
>             file://0001-symbol-fix-S-cannot-work-with-kaslr-detection.pat=
ch \
>             "
> -SRCREV =3D "ceacceef7d13134d327719a624cfafed99e90f8a"
> +SRCREV =3D "f13853cef53f5c5463a51021edbc81977e2b1405"
>
>  SRC_URI[gdb.sha256sum] =3D "b33ad58d687487a821ec8d878daab0f716be60d0936f=
2e3ac5cf08419ce70350"
>
> diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.5.bb b/meta-oe/recipe=
s-kernel/crash/crash_8.0.6.bb
> similarity index 100%
> rename from meta-oe/recipes-kernel/crash/crash_8.0.5.bb
> rename to meta-oe/recipes-kernel/crash/crash_8.0.6.bb
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116293): https://lists.openembedded.org/g/openembedde=
d-devel/message/116293
> Mute This Topic: https://lists.openembedded.org/mt/111914699/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

