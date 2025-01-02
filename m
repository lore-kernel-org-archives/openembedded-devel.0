Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BBCE77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 17:12:50 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.12617.1735837967485348551
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jan 2025 09:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g54gKE2N;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2689e7a941fso3687032fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 09:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735837967; x=1736442767; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4hCSBLNSU6ZxLrsHeKqdvUTPZmIql+g6b1KvchDvAE=;
        b=g54gKE2NhgXutlAYxn+IsfF1UtskM6u1AP1zYHhJFsLAIlfZpx/bdKHn5CvMwO9tIH
         CfofLlqSbUKHLKUEqkt4sGaip7aqwvDknROaF2qRe1xL5Dyyx79gQKyyBC6k3xiTjJUK
         kRf2+nY1o06JiCYtQoPgvcWBtRLUHkaqzgwF6tTsCYE9ar0owqdPaa1KbJ140cQvrJuv
         eLHzdEXCM95dI8gqYQqIBlWUEpbnBcLT4TUnMZyyxWV77Gnc/+I+ybMHvziKFNaDZP7o
         v4ybJpuYlSIR/FYjqpNFcmSR8/nXI5rn8e1fBW1mZQfv8Pk7e4t90Y+cxzQNlF4Me6Uq
         yFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735837967; x=1736442767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4hCSBLNSU6ZxLrsHeKqdvUTPZmIql+g6b1KvchDvAE=;
        b=JJNoMQ1MEWeNliakpkSqhuyMl1awhLCK/iGV5OpMsVXSCdNfktpyt7ZvmYkUMyn1Dq
         o59TMZlBrkHthq/1lmwqDSq2db7LfwGUT42NCeOqWUBLoJZIGVa+29SoQA4NwYyWXrM2
         geb8VB4kQfJoJQ4axpjaIjIYbdBYXNvBH5AGvj3nk8EoRBFxcqdSnmcFeVYdQl25J++6
         wwn99uDlOoCp7RmJ+agTrvxjG+MKnezAo/glAZbDxrPq2MB3bLkrVX0jJJqK23Cdhx/n
         MvmrM3QCkWc+G8Zhrcf7tnqMP5jZ0KMZ/yGtj27NDSwEm3hS7wfWdJScHhhhwieDu50Q
         Oywg==
X-Gm-Message-State: AOJu0Yy5LVZ0mEVUDVOW3ywE4yHBQI7vJFyZ/yW8sn58T9F834n66B4W
	mpmUc2YZrycpQdZjvC51dcUCklVcKwDCzVnVOOXWr1d+W3ag6A5WGZjxjDOfX53tIUPbYCItvLz
	9lGAjlInOZpeZh/fLFPfmFmpkNeUXwLU8
X-Gm-Gg: ASbGnctkvS2P4oGhOnHmLjog6c1Uym/t5ZhUyyOnnnxihtuhSBwSo4fO/ZRBcDhD43L
	QLrlxQqhQ6v8bBYL0hQWq+tCVx+DY6NU0SkViZA==
X-Google-Smtp-Source: AGHT+IEnoI+O9r4SHEXoRHpTX0A0hPvUITc61lhglbHRFZE0QpxcxDASotL6ZfIq9Sq7E7KUHuXTgW7iS03FEZzhU2k=
X-Received: by 2002:a05:6871:7c18:b0:288:c045:6e4e with SMTP id
 586e51a60fabf-2a7fb0a90b6mr24225657fac.14.1735837966747; Thu, 02 Jan 2025
 09:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20250101233112.2219927-1-yi.zhao@windriver.com> <20250101233112.2219927-2-yi.zhao@windriver.com>
In-Reply-To: <20250101233112.2219927-2-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jan 2025 09:12:20 -0800
Message-ID: <CAMKF1srTV2rT9J2ZW6D9QnFd2wVx=to7kMUzczKLT3NBVLQt5A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2] snort3: upgrade 3.3.4.0 -> 3.6.1.0
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 17:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114621

full compile log

https://errors.yoctoproject.org/Errors/Details/839166/

On Wed, Jan 1, 2025 at 3:31=E2=80=AFPM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> https://github.com/snort3/snort3/releases/tag/3.6.1.0
> https://github.com/snort3/snort3/releases/tag/3.6.0.0
> https://github.com/snort3/snort3/releases/tag/3.5.2.0
> https://github.com/snort3/snort3/releases/tag/3.5.1.0
> https://github.com/snort3/snort3/releases/tag/3.5.0.0
> https://github.com/snort3/snort3/releases/tag/3.3.7.0
> https://github.com/snort3/snort3/releases/tag/3.3.6.0
> https://github.com/snort3/snort3/releases/tag/3.3.5.0
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../snort/{snort3_3.3.4.0.bb =3D> snort3_3.6.1.0.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/snort/{snort3_3.3.4.0.bb =3D=
> snort3_3.6.1.0.bb} (95%)
>
> diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb=
 b/meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
> similarity index 95%
> rename from meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb
> rename to meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
> index 0f3d0e986f..622ab56ae9 100644
> --- a/meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb
> +++ b/meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://github.com/snort3/snort3.git;protoco=
l=3Dhttps;branch=3Dmaster \
>             file://0001-cmake-Check-for-HP-libunwind.patch \
>             file://0001-cmake-Pass-noline-flag-to-flex.patch"
>
> -SRCREV =3D "5598e8dd87829cb1bbb478a7b6d4f6fb8b5dabfe"
> +SRCREV =3D "2f8c230d6605279b19dac8fe59e27f034ee81510"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114611): https://lists.openembedded.org/g/openembedde=
d-devel/message/114611
> Mute This Topic: https://lists.openembedded.org/mt/110381845/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

