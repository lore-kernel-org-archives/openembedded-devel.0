Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDB4C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 16:06:43 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.24998.1747757198806361861
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 09:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XW0Lt8cO;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-605ff8aa9d2so1818101eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747757198; x=1748361998; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN7KhpGlpDa5q061/biRm49/oy7XbI4KgGI3+BO24x4=;
        b=XW0Lt8cOjgKBjBWemNgvOQMUrLF6XXya5wVuGsSbHD7jppMTFX6vYS7XdnMmgT+RT5
         0hQPh2y2rKAd35dMIikwSSOME87ZY0LlrX6qqDJI8b7AmxjTd0mLljcFQRxGAIUZI79Z
         l5fKLdqlQ1F/8D7Eq5/EWWHiaH5NxuySGmaLSdbtdX1ozYbvEqy+Mgwfyn5PcmlrCW1E
         HTWKy5kmpl/TH+O1Gbi3mR5U2LzYSh+fQCozX1Tub6TOzJHpFAqUep3HFH2no4iVTNzh
         ICz3IQAycHaxNXCc9xmmXmQqyFwe6aUuM2z2lvvxedV4pUkiU73mO9tJt/iOukJZiPtE
         9HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757198; x=1748361998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN7KhpGlpDa5q061/biRm49/oy7XbI4KgGI3+BO24x4=;
        b=UmH1iee3Qu7qc9wsq2Z6n2794VyRTyt1uGoa2vSgxOT/VA5p+iUpl/UotdbfrXMYD4
         xB0dz1VKk+ePdrQ3grGHn+UAVzcol/KEXlu9PPjzbbYiNPIA8ik3KEU7gc7bTm5tixeT
         4A0dD19OG2uZ/I2VpJ5/jr0670g36I/U2O9U9b9vli7DUA3YmiY1odk25GLts3/skUsM
         4WBWUwSCbmI+Ra29QQJ91H99x9GP9TJiAiavxlKnu5jcaZNjQsOKkzhaBND8DCnSRtsl
         hOiA6VjoK2863KdEZ5bSlm6kaEHZB+DOhIMpS4j5+kjMcJUmK4Sq3RY3gN/AM0+Fb2xk
         fSZQ==
X-Gm-Message-State: AOJu0Yx96q5NUHpN0iLTx4BPoxIqUmGt4QTOd3fEjNPsV2sSpOOew/JD
	ONlWoleCOvLYSPKzdK4j0e7HWuhiadxPASMmJasem4uuPmBrkNbXByHK6G5Gmzzybe3DK8VWJJD
	YdXVk2WKxqbejVuhXm4ebM0bCapwcKIbHVOdl
X-Gm-Gg: ASbGncv8+ixPKAhWWd0N7PVA1nw4O2sZsQEgnjH/6CZEeE+nnUubgXxeheR7GE/ISgK
	JeJ6GYYFqsVUkC31FpKROVjnCNNncy3pRlPiUA9md2UAtRM0D5oRLGfrGLZeAhXG7LlTJQPWmVY
	Ocrnz4rhjGrTp5ZssckTI4D2J6oUHHu3FxBl7dOAEApw==
X-Google-Smtp-Source: AGHT+IEs3KUqbpczssI1Xy8cGawbLbjmAYfMaQdoRyrYWW3Z13lqxxqDrknLePp/uJAttlhyyEb3yJKdPLj3gG1InOE=
X-Received: by 2002:a05:6870:6f07:b0:2c2:d2b8:e1ab with SMTP id
 586e51a60fabf-2e3c82722bbmr9324298fac.18.1747757197567; Tue, 20 May 2025
 09:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250520160418.814173-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250520160418.814173-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 09:06:11 -0700
X-Gm-Features: AX0GCFtu2UBd32aMBCnuCbkZogCquhdO2UMfO9LfIcPrtJPdgQ1G5wkiKqkBs18
Message-ID: <CAMKF1sqy1pMCvotLvX=KbCKbjJ=WRVhRR56zBhfDoOokNXiz4Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libglvnd: provide virtual packages
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 16:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117516

On Tue, May 20, 2025 at 9:04=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Add corresponding PROVIDES in order to let libglvnd declare that it
> provides corresponding libraries.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta-o=
e/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> index 4094aa4fc613..53f422aff1d2 100644
> --- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> +++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> @@ -28,3 +28,10 @@ PACKAGECONFIG[gles1] =3D "-Dgles1=3Dtrue,-Dgles1=3Dfal=
se,"
>  PACKAGECONFIG[gles2] =3D "-Dgles2=3Dtrue,-Dgles2=3Dfalse,"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +PROVIDES =3D " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'glx', 'virtual/libgl virtual/=
glx', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'gles1', 'virtual/libgles1', '=
', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'gles2', 'virtual/libgles2 vir=
tual/libgles3', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} =
\
> +"

Is there a corresponding changes/documentation update required to
reflect it in Core for selection

> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117515): https://lists.openembedded.org/g/openembedde=
d-devel/message/117515
> Mute This Topic: https://lists.openembedded.org/mt/113213745/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

