Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0E2EEAA48
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 14:28:50 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.13830.1694701728464513948
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 07:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DjPkhMnM;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1c50438636fso520929fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694701728; x=1695306528; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO2nQnexsB37UzAY7OvEWzREKRPBrUWLXMSLZeBB4oQ=;
        b=DjPkhMnMlEfYKRWXYOmgbEBRrv+KC5QQqQkwVx5T7oUxfOVclbC44p8mzQqwQsCEZQ
         8d1kbTxQhSnwLOdEnCwKjwAAMfKGCwQ7ZLuwP2dmdCvO3NL2KaSC86ZoH2NQjgm0imV+
         Tp1LIeLkEvQzIQKTjQoaO4wAD2e3hD71DF/1vH6ca23geURZz7WbdroA9OhuvxgPTGyo
         K0myA+nTsp542m9iNpaq7TbfU3O69t6qml6wV37aD+MB6RoADW98fLHrz/dTHKVfgGDm
         662iJzaJB6pP3QHN0KhhIgHwCgnu3NAhi4zhestcvSivrwgZtAaxl/F830CwddOzTQEJ
         jmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694701728; x=1695306528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gO2nQnexsB37UzAY7OvEWzREKRPBrUWLXMSLZeBB4oQ=;
        b=hVj2q/Ry+Lbh9DkFl4Ys52G0W0wLm6rtkk4uJ4Gn1JULiolp9sQUGsoDvwEUNrFL4D
         BNG1vhQUgcCtvSiWiGydawPF3nOMyfdKpYUtfURuAFBvrWn0qMYZTWqkjy3tko8ErF66
         ltq0HD8ga8Lfs3RhXsuDa8z+27ioMc7AbCn1Ti9xOUgBnZ444Uwf8hSzl0Y+whHS4STb
         J4nt44wJuSK8r35ogNSXxIqssVROa0Sp5R5QnjlxX8ApAFyjdjEHTmxi1HeHlgMtVmuT
         pMif1vAGzNgwcOa1NR7eS3tLcOKgoe+//Pa0nSwvJDnG6HFtpkTSPpcm6X6jopKAX7OP
         mX9Q==
X-Gm-Message-State: AOJu0Yy2szmeuIj7Kc6If92cIrM834OYW/RIn44zNNfEHD+yJspcHROE
	nLkcH+RUTbH8C055zoe6KXX9FcFvlsA2Vr35Q3EVKiO0
X-Google-Smtp-Source: AGHT+IGcB73+W3Oe70vijBlG0d1KdkBH1FLjn1Iid1qZlr0nMetma6TMQ3+5GJ7RR9ExYzrbvxuRWN93YHJ3POlwFZ8=
X-Received: by 2002:a05:6871:a7:b0:1b7:2d92:58d6 with SMTP id
 u39-20020a05687100a700b001b72d9258d6mr6252329oaa.32.1694701727693; Thu, 14
 Sep 2023 07:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230914130631.182859-1-f_l_k@t-online.de>
In-Reply-To: <20230914130631.182859-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2023 07:28:21 -0700
Message-ID: <CAMKF1sryxz18v8wavJc3hAxG+RQVD-51oEwfziKOVxHzBvVtpw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] webrtc-audio-processing: add
 recipe for 1.x
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 14:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104869

On Thu, Sep 14, 2023 at 6:08=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Starting with 0.3.80 pipewire has a minimum requirement on
> webrtc-audio-processing-1
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../webrtc-audio-processing-1_1.3.bb            | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-proce=
ssing/webrtc-audio-processing-1_1.3.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/w=
ebrtc-audio-processing-1_1.3.bb b/meta-multimedia/recipes-multimedia/webrtc=
-audio-processing/webrtc-audio-processing-1_1.3.bb
> new file mode 100644
> index 000000000..d07772f1b
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-1_1.3.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "Audio processing bits of the WebRTC reference implement=
ation"
> +HOMEPAGE =3D "https://www.freedesktop.org/software/pulseaudio/webrtc-aud=
io-processing/"
> +SECTION =3D "audio"
> +
> +DEPENDS =3D "abseil-cpp"
> +DEPENDS:append:libc-musl =3D " libexecinfo"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dda08a38a32a340c5d91e13ee86a11=
8f2"
> +
> +SRC_URI =3D "http://freedesktop.org/software/pulseaudio/webrtc-audio-pro=
cessing/webrtc-audio-processing-${PV}.tar.xz"
> +SRC_URI[sha256sum] =3D "2365e93e778d7b61b5d6e02d21c47d97222e9c7deff9e1d0=
838ad6ec2e86f1b9"
> +S =3D "${WORKDIR}/webrtc-audio-processing-${PV}"

This setting S is redundant so remove it.

> +
> +LDFLAGS:append:libc-musl =3D " -lexecinfo"
> +
> +inherit meson pkgconfig
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104867): https://lists.openembedded.org/g/openembedde=
d-devel/message/104867
> Mute This Topic: https://lists.openembedded.org/mt/101357605/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

