Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A08C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:50:18 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.18860.1708015817451443783
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:50:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gHIBwbkZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2185d368211so627153fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 08:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708015817; x=1708620617; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlQntC1c4IUuzdAwQ+Bi22pzavYztuj6D1tGEYoMCZY=;
        b=gHIBwbkZEMEt3e78xrmINr8+iJVvsnGS94n7xGqXpyp3s//SEn3V0fFjV5hkkR7e+v
         gWjeTa8A4q4FkVKKA+zBHXrJSte2Vvs6GnjIKmGhrIld+jegleiNnP405xLyoHh23NQk
         P7xbPpW236ozbzUbafu1lBn/SUe1RV1PwA49Ru3oV8xDJAN2en5cxTAXSQy2kHuVHmeY
         FBVc6YZ/QcCALTmTWoQKsTF6Z2XqDz4bWqZFYCEt+s3E1ODvzaDekovRU2AJkaSGe/jx
         kEF/+7NpSZwLRLgnpafsejToztE4LABHFx9iLIj/z2LIxD62XMMJqPBNU9eSKVs3bnC2
         P5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708015817; x=1708620617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlQntC1c4IUuzdAwQ+Bi22pzavYztuj6D1tGEYoMCZY=;
        b=CtVp5s2QjmwuCiwUdFG/BSLaUwBlnqOzXsQ1jn/yQkYfk2XT5++3DkSVdiJvi4FF3x
         lR+IpGGyvAQXmD61bRo4cddbA4JsDRYo482P3TGnQ16Vl7qt1EH6vZFtHDSGwkJkp9Jb
         DEKrf45OxeZrA6qFTPTX7vUrWzl8hRBhfO+oWlaMD/MVLctKUhJSxnDTjxNafGmCS9NH
         0d5MY6h2vv1Fd8KM0PYqpAdvAHOwYBAF82OovjBW2jVSdp11RSPCx227iRQXWSfZqFrl
         ixr2uN4LkUsQrf/HFtH0DvTklsU/RxhgAg891vToYhVPWQvzE073wt6CqrtIm2j1dQtH
         3DBw==
X-Gm-Message-State: AOJu0YwDdE1GfZ0LhhTh5dU8XAjh5av1E7bDL4oCdlzP6yIkUSSYM2LL
	5xjCrXuFrVmmfwJjWNKdcJHJhURCeBmVTUMVBcfjhLdrEgpm9EVUJQvdKGTCUMbfSFdgy0dt+xW
	VBAT0UoBJ/p8ybjOhxFdi6FFy1DM=
X-Google-Smtp-Source: AGHT+IG3UO6CeeaK50T+8JHcLhrqsvl+4nYUWbPDUc/Zo5fo895diI2J54fByy7JrxcGYtFPEZKgQ9F7nPX8GSCl8+4=
X-Received: by 2002:a05:6870:4728:b0:210:d1b9:dda8 with SMTP id
 b40-20020a056870472800b00210d1b9dda8mr2587919oaq.55.1708015816073; Thu, 15
 Feb 2024 08:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20240215141708.2108422-1-max.oss.09@gmail.com> <20240215141708.2108422-2-max.oss.09@gmail.com>
In-Reply-To: <20240215141708.2108422-2-max.oss.09@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Feb 2024 08:49:49 -0800
Message-ID: <CAMKF1sp-rDK-TOixzqMTBqqHwPNzacJdPwPM1AKQDg0+Nors2g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] libusbgx: uprev to the latest commit
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 16:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108756

On Thu, Feb 15, 2024 at 6:17=E2=80=AFAM Max Krummenacher <max.oss.09@gmail.=
com> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> Uprev libusbgx to ec0b01c to get following fixes:
> ```
> ec0b01c Merge pull request #83 from mgrzeschik/uac2-controls
> cbf1750 uac2: add additional configuration controls
> 81d7c05 load libcomposite kernel module
> caad244 Fix: Memory leak config label
> 51abbfd Automake: fix distclean of tests
> 3cc5af7 Added printer function header to installed headers
> adc45af Added missing extern C closing brace
> ```
>
> Refresh 0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> V2:
> - added the changed patch file to commit
>

Hmm I do not see this modified patchfile in patch. Did you miss it a
second time?

> diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/r=
ecipes-support/libusbgx/libusbgx_git.bb
> index 484110561..a20ff4eea 100644
> --- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> +++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
>  inherit autotools pkgconfig systemd update-rc.d update-alternatives
>
>  PV =3D "0.2.0+git"
> -SRCREV =3D "721e3a1cbd7e2b6361bb439d3959e7403e4f0092"
> +SRCREV =3D "ec0b01c03fdc7893997b7b32ec1c12c6103f62f3"
>  SRCBRANCH =3D "master"
>  SRC_URI =3D " \
>      git://github.com/libusbgx/libusbgx.git;branch=3D${SRCBRANCH};protoco=
l=3Dhttps \
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108755): https://lists.openembedded.org/g/openembedde=
d-devel/message/108755
> Mute This Topic: https://lists.openembedded.org/mt/104373086/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

