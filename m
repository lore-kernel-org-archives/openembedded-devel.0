Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418CBC2BD09
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 18:20:28 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.3292.1719598819262777254
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 11:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICrn8ILj;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-700cf7e2779so543752a34.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 11:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598818; x=1720203618; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f54CEkV0/jWXk4QH9t9zH329b/E52x/d+Dkbi/YqRFc=;
        b=ICrn8ILju26yR3VvDlnkAwzGDF9u9OnyQ4CxBQh5+Y46skFzWM8oXJf3Uf+bmVCBWf
         T9z2m8qT+a5Zlpw1OgRA0Sj9clLafihTzGK0qC2IcoyxYc3AwYFPR3MuigWRmjrkBmEh
         ZNtFkbZ49onMIaYpesy1J+BBxMWOakECjkdUXXALKVq9QFRiRoJMFZE/K19nwZojs4GB
         Y/dfC9vlI3p/uBKkUwIaMSKRBeZn0bKFUm9zU/mkntNoj3Zn6pETivb1DoMUmuZoHR+c
         qNgfs+gVtSHVFq0Y/SkI17O07iR1n4+rvKhpkhuhN3lV2rHXKa4oAv880CfC9Fe4i2YQ
         p65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598818; x=1720203618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f54CEkV0/jWXk4QH9t9zH329b/E52x/d+Dkbi/YqRFc=;
        b=Iz6bSDlvH+CRkBM8AQ5PvzIPCJvMXQQvO2q592mPymRwL2bmeTjRKu/9outE17Ir8n
         +GQx2uRZ22jE7Y3pqiKDbazcbXPXuIwQV3iXzQvwqo0294YtOCR3icSn+upY+SDW+Suz
         sFOqY6xFWZ2RXppuJdNJRzIFGdEyLODyuppzUcfDZKgPkMC8Lotpje/tH7XD22ebrxK9
         gZvPKJESiHBDPjuK+DJfaZBnHMW9NeT0+NsXQ+kG5jZPm4TCkXphCTR38Kb1bKsgV8OH
         pxIsOgBChj58BxNl3A1Qv2KzyuUTRhJ0rIT70Nbdd5oWIGY95dJHkd8iwCFs+AKDruaR
         Bwpw==
X-Gm-Message-State: AOJu0YzFUPOxBsv1tUTDKrVyoiJ6lYHOkFz6M2KyxTe5GG3NZcdY5kEA
	nh/KXBlieCnqSoWC/nnAgpzMyfXqUtgHipYj7NG7yjPv010tv+20IzVdbfvhKso2Opvq/AjAYEW
	+9n6xwoYkGPYM8X9v7DM1K8kJNZM=
X-Google-Smtp-Source: AGHT+IFOm9/Bh4q+Oa89T69mZueGpRTGjcwn344SowZc9Hle2hV1wUgqh4K5EacE7mLbAx1Tarcj7xgByxxpQak8El4=
X-Received: by 2002:a05:6870:c69b:b0:251:2755:5a33 with SMTP id
 586e51a60fabf-25d06e57bc3mr17026042fac.39.1719598818422; Fri, 28 Jun 2024
 11:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240626084916.2791454-1-ross.burton@arm.com>
In-Reply-To: <20240626084916.2791454-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jun 2024 11:19:52 -0700
Message-ID: <CAMKF1spcwTxg9PsxsLbkLqhAzZ_==_h=uhRoSRP2LYjmDJkK9g@mail.gmail.com>
Subject: Re: [oe] [PATCH] libabigail: add recipe for the ABI Generic Analysis
 and Instrumentation Library
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 18:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111154

fails to build on musl - https://errors.yoctoproject.org/Errors/Details/788=
472/
I guess we need to add fts to depends on musl and maybe few other tweaks

On Wed, Jun 26, 2024 at 1:49=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-devtools/libabigail/libabigail_2.5.bb  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb
>
> diff --git a/meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb b/meta=
-oe/recipes-devtools/libabigail/libabigail_2.5.bb
> new file mode 100644
> index 0000000000..26161c43b8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "The ABI Generic Analysis and Instrumentation Library"
> +HOMEPAGE =3D "https://sourceware.org/libabigail/"
> +
> +LICENSE =3D "Apache-2.0-with-LLVM-exception"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D0bcd48c3bdfef0c9d9fd17726=
e4b7dab"
> +
> +SRC_URI =3D "http://mirrors.kernel.org/sourceware/${BPN}/${BP}.tar.xz"
> +SRC_URI[sha256sum] =3D "7cfc4e9b00ae38d87fb0c63beabb32b9cbf9ce410e52ceeb=
5ad5b3c5beb111f3"
> +
> +DEPENDS =3D "elfutils libxml2"
> +
> +inherit autotools pkgconfig lib_package
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111085): https://lists.openembedded.org/g/openembedde=
d-devel/message/111085
> Mute This Topic: https://lists.openembedded.org/mt/106886235/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

