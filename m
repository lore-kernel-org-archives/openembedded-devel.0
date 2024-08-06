Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E169BC52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 20:05:53 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.16664.1722974745046170194
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 13:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WfKXyhwd;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2689f749702so555586fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 13:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722974744; x=1723579544; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynswb2vqSbSaEEometwsBQRKwccYe6rop65W1k8vjzc=;
        b=WfKXyhwdmfzgLvok55CN4CWAPHYhIp0jHl51LpbmQ3U/24xX4vzWFG9dXQ0p3HOlss
         33gD6poq8vBcvYcmQgEvc5op8l8Q9YXL3B1beGUqiA5qJe7JAu5SVe+n9dr+ITIGNTib
         fmjAhVMSYcQYgVvEPDHlsIKHOCUtpVDgDSr0JtW+9alM7gR/Zxe0x6WpEWRCisgztHJX
         aJh/JV9MYbVurlpn+BTIn0lxTCfzUYMp2rb9sNDf6J7DHyIwvnC5BpldTRD8y5vAzAwg
         wJzjWfx60f9qLkbZsd+XEOaZj3QfpG/F4ULMYAkHTXq0uJKN2GhODeCTxtgulga4XAkR
         /acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722974744; x=1723579544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynswb2vqSbSaEEometwsBQRKwccYe6rop65W1k8vjzc=;
        b=XQHWbzFKus7cCwUqjEvTf1wHSZJas4WT1MZsTBZ2h180/2+UBoPvHK1Xj4hmdNJZJe
         HO+UjEZ6bNDPXW4w+TUc4Ga/sweQ6sUUMeq16yro+taM3C8HF2lSdzD/nt1gxeiK+NVc
         MD2jJtFSPWRv2/wL6/sedrN573YHJBNIAd94WytHOOD2GRALOkwVwJeC7YTLK1+iUbp6
         QAbZRmqHObsCFsD/ju+5E2cf/lSYLaeZuUU3n51qnjOLT8GEMAxZ9KqPu0tnU2Rpi5qK
         ljBMv6ausJEsUHln3XXUip8ObeQ6i4oQ0lS6JRzxQhhmuwMuTWXhBcMUBtlJDm7g4QZd
         0nlQ==
X-Gm-Message-State: AOJu0YxwWJAhkYl8nsmll/YcCgh0GZfS1FqUJG8UJU9AChmVT6F3/BwW
	Fx+6XJdIrJs2Wwq0UAazxs9BvOEd0CKbhiz5YxHJr0vcrttoJvv3kicAClMDXj6Mf1u1SZGAPqG
	PDWb+I1XuVXkIEy8DMhJgncqcccRe0wK0
X-Google-Smtp-Source: AGHT+IG/WbEweWqjiw2kUHuGHxywbJ7koJ7iotBGpLyxtOK5ayJx3OjtESIKtZGU5gO6Xz36h18qb9LGFyMIuVYRR5E=
X-Received: by 2002:a05:6870:d109:b0:260:ed20:dcb3 with SMTP id
 586e51a60fabf-26891d4b0f2mr20197779fac.30.1722974744227; Tue, 06 Aug 2024
 13:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com> <1722933994-32549-31-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1722933994-32549-31-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2024 13:05:17 -0700
Message-ID: <CAMKF1srR46LBjjYRmi9Ks+HTgfucqEwkcBE7Xqxw5Z_mMWKtOQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 31/60] picocom: upgrade 2023-04 -> 2024
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 20:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111594

On Tue, Aug 6, 2024 at 1:47=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../picocom/{picocom_git.bb =3D> picocom_2024.bb}              | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/picocom/{picocom_git.bb =3D> picocom_2024=
.bb} (86%)
>
> diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/rec=
ipes-support/picocom/picocom_2024.bb
> similarity index 86%
> rename from meta-oe/recipes-support/picocom/picocom_git.bb
> rename to meta-oe/recipes-support/picocom/picocom_2024.bb
> index cc0d88fac..e05f2a7bb 100644
> --- a/meta-oe/recipes-support/picocom/picocom_git.bb
> +++ b/meta-oe/recipes-support/picocom/picocom_2024.bb
> @@ -4,10 +4,9 @@ LICENSE =3D "GPL-2.0-or-later"
>  HOMEPAGE =3D "https://gitlab.com/wsakernel/picocom"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3000e4830620e310fe65c0eb6=
9df9e8a"
>
> -BASEPV =3D "2023-04"
> -PV =3D "${BASEPV}+git"
> +BASEPV =3D "2024"

We can drop BASEPV and use PV in the VERSION=3D value in EXTRA_OEMAKE
>
> -SRCREV =3D "12537df0314767d5af35bddddbbca3694e6a0342"
> +SRCREV =3D "7b6acbd421a2d4ca99376b7b427828dc1bcba4d8"
>
>  SRC_URI =3D "git://gitlab.com/wsakernel/picocom;branch=3Dmaster;protocol=
=3Dhttps \
>             "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111547): https://lists.openembedded.org/g/openembedde=
d-devel/message/111547
> Mute This Topic: https://lists.openembedded.org/mt/107747846/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

