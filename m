Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8459EC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:32:52 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.72426.1701703969939194378
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ihk1EztB;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-58d4968c362so3001715eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 07:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701703969; x=1702308769; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1wEaSWKz6mnOqM5weWq4DLVK0ldvYDm0+QTyi/h2z4=;
        b=Ihk1EztBoQD2CL7TzD1fJkjCxnTI8bgFl52Y2UXTjbLt/5acZFVYeWPRcQX6t0X43Z
         gRO+58Tu5iLaMcS06NHMrWF+DXnPgNr//6p9Kvej8xTSLKtQCcLmEb95cbA33mOGFlp4
         4SR04euj0aocE8+QnVl6rib4C+i5/dKMIXzwEHmFKovpR/j4FHqYBWhFYwilN9PNFc8s
         rmTdalraQg5j3hCt7qSFfLqc1wLy9RO1vxHGj7RHPb9pXs20DDUiCcKF9/P7y/HahlPT
         CrJICdNfIKIOU5ICUFcaIZBZ2k8+diDzE/9zVDjwIfXX8xzDIn/bypveltkiVbDDB1In
         7K4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703969; x=1702308769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1wEaSWKz6mnOqM5weWq4DLVK0ldvYDm0+QTyi/h2z4=;
        b=Kqclp6RBStHvSx1R8kV9UpCvnpdrp4rNOgYqxJGkqNYMP6yT0G3PkMYBfvdk8fGcp1
         ZY0YfnDMY8aG4oxQhbe9Z6//p7VOnLBsAtMKSwltVNYtCoeJUu3MJje111M64X1nNXcG
         ejjr8k/t0BWZog4NWytFlptOpfjGOrM1lOKEIOllTPXDxW0LkqafRuHa2QYHQljf7Fh1
         Fy4q+Ibc5ocFpdOMoUkQqkyofKnUxxIRflujwIFfSYE5mHZqCfUfGBIme1VAT/5LT0b2
         CgKBlhLzdUoWnizlx7KNqzzff+kiN7DxsgSf1npOSQKHAziQsO3Ypx85TkyR8qw4lyAB
         kZfg==
X-Gm-Message-State: AOJu0YwIEAEgF2Bo1SePc3vn3ZfYAcax1IG2bqE9MwOsXn8fCqeNWTiT
	nYoksjv1ipy7Oy8qo/G+DjOjg7POOsOJSnDY71yL9kdJ
X-Google-Smtp-Source: AGHT+IESXEy3daRvsRPt9qc/DztfgJ3/5kTHMSLvCrVIwVq4Qr1/w6b7DJWN7viKi6zbKIqm20gqFwI3ZsdlOiIxhzI=
X-Received: by 2002:a05:6870:148e:b0:1fb:75a:de87 with SMTP id
 k14-20020a056870148e00b001fb075ade87mr5174626oab.117.1701703969121; Mon, 04
 Dec 2023 07:32:49 -0800 (PST)
MIME-Version: 1.0
References: <b724b5d5-0ffe-45f4-97df-9d0f1869c960@gmail.com>
In-Reply-To: <b724b5d5-0ffe-45f4-97df-9d0f1869c960@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Dec 2023 07:32:22 -0800
Message-ID: <CAMKF1sqAhZMukMQrs5pMpA1uqB+C0AQMbFDu2i5UUUPRqKhwrQ@mail.gmail.com>
Subject: Re: mickeldore merge request: Dec 3rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 15:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107207

merged, thanks Armin.

On Mon, Dec 4, 2023 at 6:59=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit aa5e8edabbc414d8ec1b2ad63c8743c7baf996=
26:
>
>    nlohmann-json: Add ptest support (2023-11-16 21:49:15 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to f29290563cb821fae95340ba959749641c69ed7f:
>
>    python3-django: move to version 4.2.7 (2023-12-04 09:47:03 -0500)
>
> ----------------------------------------------------------------
> Benjamin Bara (1):
>        libvpx: upgrade 1.13.0 -> 1.13.1
>
> Christian Eggers (1):
>        python3-gcovr: switch to main branch
>
> Hitendra Prajapati (1):
>        wireshark: Fix CVE-2023-2906
>
> Joe Slater (1):
>        python3-django: move to version 4.2.7
>
> Khem Raj (1):
>        gattlib: Upgrade to latest tip of trunk
>
>   .../recipes-support/wireshark/files/CVE-2023-2906.patch         | 38
> +++++++++++++++++++++++++++++
>   meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 1 +
>   meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             | 11
> +++++++--
>   .../webm/{libvpx_1.13.0.bb =3D> libvpx_1.13.1.bb} |  2 +-
>   .../python/{python3-django_4.2.1.bb =3D> python3-django_4.2.7.bb} |  2 =
+-
>   meta-python/recipes-devtools/python/python3-gcovr_6.0.bb        | 2 +-
>   6 files changed, 51 insertions(+), 5 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch
>   rename meta-oe/recipes-multimedia/webm/{libvpx_1.13.0.bb =3D>
> libvpx_1.13.1.bb} (96%)
>   rename meta-python/recipes-devtools/python/{python3-django_4.2.1.bb =3D=
>
> python3-django_4.2.7.bb} (58%)
>

