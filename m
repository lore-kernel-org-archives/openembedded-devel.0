Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518C1D735E6
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 23:28:58 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.125040.1732922934904828029
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Nov 2024 15:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eAGbwsQ3;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3ea55d16d73so791612b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 15:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732922934; x=1733527734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuhQ5iDT3Lqi8ca8zil0q9L+YSNQCv1lnzGazEhjoQE=;
        b=eAGbwsQ3AJO84LCi7pKY4s3fBiftA5ggneQyyYYfQnDzADui2eyuPhCML8GhQ5dq3i
         P1cyvEChSAasR7U2hhyTAyrBbKDH/xqeqv1n6IO9t1PK6X3Dk0alFQjKsW6h1t/EVZ5T
         2NminKSvsbKzmel5yZHHGEkRNA49sGio9dPUU0rZyRZ4LM56hQ9p27LKYFw8fPuxEjGN
         6zeXrj/ZLCvxgoM7TQCDeEtJw+gWy8VpmvWAXUzwzm9qnNYCDnhh2bnZ3BLtPKvkXVdS
         NvEWqlM2cK/A1iJPMbsumxkFUHdRbrvw02zNVDsN2OthMZC4CSxqZizRIVi5u45IxfwU
         CPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732922934; x=1733527734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuhQ5iDT3Lqi8ca8zil0q9L+YSNQCv1lnzGazEhjoQE=;
        b=WHjFg11RZOgZAuaxXWC+tByZ7xBIpLUoB0VB1Kkk/BZHIjukJSIdvcavpITyq7l0Jm
         JsZ6C2XCvP0sa4DNfYZGX7dIkQjITkS3IzACZkXG3GlKt7x4vKxhR9nRLdGZpbwdIhgM
         HVYOMzzJCp8QbarUj6YApvkyiZLGEA/oxfSL1huc1+3HVGaRW2MIwZgpc2HnMvE/pAn4
         xzpOyrqV9Qb/5SzCYmI5TcYylenPHnB/5Z2oVDLRa8hg5xIG26baIj0WlUBflDDC3HvZ
         3HaU01PMqskUkOxJEAY8VMwAMO7vA/RAcdnOSNmglGvqkqaVex0a4DeaoLiu3Ip38JUm
         fhdw==
X-Gm-Message-State: AOJu0Yz3HUoU3Bwg450h9eHLdPVvfSE5Yb4Xy2OT3K4SRyBZ4OrbXAW8
	zpm41L4D4r/VbTlnPlOHxQpDHaH4RLEJEIuA8L7JdGQQ5qGNLzghQUj4YMILY6AFJiBXDWt/xjN
	IG24CIStx/bGbx0U8G9t6MX2eqss=
X-Gm-Gg: ASbGncv/5Ke4l9pkkjQmAXDZgWjX1LGuAigifTcWFMIlCHc2gpgOzv+0XRHYvt2r6VQ
	qeHdgcsQQkOq/E/hzJV3+N2FpSQOf43DjKCBk+Fp5wTXm
X-Google-Smtp-Source: AGHT+IGt4u4GrnxUmzWArulYksQJ/Dnf0pYtqDarGuThW3eNwMLjFaqRBFs3WO9VlFfP/k481n4myIHLIB4r2egXD9c=
X-Received: by 2002:a05:6808:2f07:b0:3e7:59ed:d7f8 with SMTP id
 5614622812f47-3ea6db8ed7amr13711514b6e.2.1732922933989; Fri, 29 Nov 2024
 15:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20241124165419.24549-1-ethan.twardy@gmail.com>
In-Reply-To: <20241124165419.24549-1-ethan.twardy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Nov 2024 15:28:27 -0800
Message-ID: <CAMKF1sqq7iu2AiQxBX2eqQX0P_sO1of_5ioCp7u5nj2hodYxcA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] pipewire: Add glib-2.0-native dep
 for bluez5
To: ethan.twardy@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 23:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114125

Thanks for the patch, it is not done on top of master it seems. Please
rebase it on master and resend if patch is needed for master
otherwise mark the release branch in subject prefix. This will help
route it correctly.

On Fri, Nov 29, 2024 at 11:57=E2=80=AFAM AmateurECE via lists.openembedded.=
org
<ethan.twardy=3Dgmail.com@lists.openembedded.org> wrote:
>
> The SPA plugins for bluez depend on D-Bus bindings generated using
> gdbus-codegen at build time. Some PACKAGECONFIG combinations appear to
> pull this in accidentally. Add an explicit dependency to ensure that
> it's in the sysroot when PACKAGECONFIG contains bluez5.
>
> Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>
>
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
> index c8ac04d59..1c51fcc15 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
> @@ -96,7 +96,7 @@ PACKAGECONFIG:class-target ??=3D " \
>  # as being in conflict.
>  PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib ude=
v,,pipewire-alsa pipewire-alsa-card-profile"
>  PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3Ddisabled,avahi"
> -PACKAGECONFIG[bluez] =3D "-Dbluez5=3Denabled,-Dbluez5=3Ddisabled,bluez5 =
sbc"
> +PACKAGECONFIG[bluez] =3D "-Dbluez5=3Denabled,-Dbluez5=3Ddisabled,bluez5 =
sbc glib-2.0-native"
>  PACKAGECONFIG[bluez-aac] =3D "-Dbluez5-codec-aac=3Denabled,-Dbluez5-code=
c-aac=3Ddisabled,fdk-aac"
>  PACKAGECONFIG[bluez-opus] =3D "-Dbluez5-codec-opus=3Denabled,-Dbluez5-co=
dec-opus=3Ddisabled,libopus"
>  PACKAGECONFIG[bluez-lc3] =3D "-Dbluez5-codec-lc3=3Denabled,-Dbluez5-code=
c-lc3=3Ddisabled,liblc3"
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114119): https://lists.openembedded.org/g/openembedde=
d-devel/message/114119
> Mute This Topic: https://lists.openembedded.org/mt/109839311/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

