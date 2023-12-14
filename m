Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7040CC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:40:20 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.29167.1702575611935482526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K6GCfGpN;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-20306782371so1817519fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702575611; x=1703180411; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoHEdENhNZP5m7Zloij3Wr38v3U1TYd/Nxc9wMAMM40=;
        b=K6GCfGpNIQZqdV8bJz2s1C+QiP/UW2j5Mio/a6dWC2hkqyJZplTOKorteE4KXBxf0d
         kqBlFtai+COSxSMCAUh4YibiVM3mHeqkgaLXRq1O95OJyvF4l4zKZgE247p3SZZpP2L+
         urLOmkbMIMevw3nm2EdyenKSXTMqT7sqafIhIBJKRIeUMfUoxMayg57ZjEkPS1d4IE0y
         EJO3Y1+xXwFpasaQ3IVjRjbtth5dMOQhnJljovJB33akl5KaTXIjb9MichxmYZc2m3ZE
         oGnK90Yoofir03T3c9lQeZ9xcj/waq9SyNjGtl+rXUh1T9HH3iCk/fXhzdn407qt68CY
         4LOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702575611; x=1703180411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoHEdENhNZP5m7Zloij3Wr38v3U1TYd/Nxc9wMAMM40=;
        b=VJNDwnDBsotXGbUPEbq2rvttB3EnEGwK588YFXRalIThHot9dT7GYfkwzwFNOxtQrN
         I81380x4P1usfvAURdcN8D+e4nv2MtE5TSH9wub7fV4UyO2Q7TcZakwTTq+F8Yq1XGwW
         LXsneKZfzZlDWmFmzZ1lonIZIhLzm2hJYZ0m1iybLx2ch/5hJF97BckELpL9tCAD1V8l
         a90uIxvB7svuAh6hoiY8+VQCVc24xIgJTE3xeo3JGkIpjozQTulFcX42ep4GOd8Ub0ZF
         u+fEdhkpSwrT/ehSC6RSbL+O5D7u8v2gl1g67SfE6LyreBnqx8eAUZjglaJs2b5WkMAk
         d3EA==
X-Gm-Message-State: AOJu0YzF/UR0m+jy0e9slU3oRPsOxMPf7dRrlSUcv3nL5hJEXxjdNDhY
	D5pu1AgaGulYgtVa5ketdhbL0UBw+52CusazdaE=
X-Google-Smtp-Source: AGHT+IHPzlc/HRXwVaJgYh2Fz+p/b8T9U0qacgdgXvRu5KJrYCHorYFgxy3mo5fqWO9/TMPvNIJLfc4YRLGahxu6pNM=
X-Received: by 2002:a05:6870:aa03:b0:203:82b:eddf with SMTP id
 gv3-20020a056870aa0300b00203082beddfmr5035105oab.60.1702575611045; Thu, 14
 Dec 2023 09:40:11 -0800 (PST)
MIME-Version: 1.0
References: <1702544609-28337-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702544609-28337-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 09:39:45 -0800
Message-ID: <CAMKF1sqWFLfi+NYx5RKm6PLdTYuAFFr8uqFPc3nvxS-bkEQc2A@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 4.6.0 -> 4.6.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107456

duplicate of https://patchwork.yoctoproject.org/project/oe/patch/2023121405=
1343.1192287-1-derek@asterius.io/

On Thu, Dec 14, 2023 at 1:03=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>    https://www.mongodb.com/community/forums/t/pymongo-4-6-1-released/2557=
52
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-pymongo_4.6.0.bb =3D> python3-pymongo_4.6.1.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pymongo_4.6.0.bb =3D=
> python3-pymongo_4.6.1.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb=
 b/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
> index 18e29a17b..2704637d3 100644
> --- a/meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
> @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://github.com/mongodb/mongo-python-driv=
er"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
>
> -SRC_URI[sha256sum] =3D "fb1c56d891f9e34303c451998ef62ba52659648bb0d75b03=
c5e4ac223a3342c2"
> +SRC_URI[sha256sum] =3D "31dab1f3e1d0cdd57e8df01b645f52d43cc1b653ed3afd53=
5d2891f4fc4f9712"
>
>  inherit pypi setuptools3
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107445): https://lists.openembedded.org/g/openembedde=
d-devel/message/107445
> Mute This Topic: https://lists.openembedded.org/mt/103166888/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

