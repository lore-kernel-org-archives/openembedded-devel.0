Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEA6C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 17:55:40 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.38519.1698947733189707048
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 10:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Glvmb6Lb;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1eb7a8e9dd0so701683fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 10:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698947732; x=1699552532; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTef4og5SeHnwX2rFlTbq/O8p7hQ038hbs3imx8coiQ=;
        b=Glvmb6LbEDHVX8LCmtWCzVBRs1xnzwORBmTeHCVip4fTFfOIAqSoef21H5G4qfcs4f
         OgIFAF0HCC5jQwXHLh2LO6Yute8WlJrsj6uHx1CWwReMrEhLtKrvcawNr9y7U8kCHDF9
         v2uQJnkC/+Xf/zsdeLN+5Y3af5YcNKvX9mmgLXyH7JWnEpgysv+46+b6JR7f7WuOpdh1
         5WZdsBp5m1fugGriw5B0E1i+QRtmUZ/YxLI6BTQDMPprwENJ34KinMUZfoweMlcXWkUW
         MhE5huic8rIuVRVk+bEnvqOAoWK/gGZvia0J2z6WSVhC3qKAgu/5lDNyV5/SKIRvs4u0
         6feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698947732; x=1699552532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTef4og5SeHnwX2rFlTbq/O8p7hQ038hbs3imx8coiQ=;
        b=gFgDLOBwK3RtVQ77nTI72925Gy9M21nC/JdLUXN171onMLXIvQoanqejVdYBqfW9hG
         sXQk9Ielhr5GaL3u6hztSiSCE/Wp9iusvoOdxpixPK3XzR1zMitiqKfpDhujjjK5RSwU
         4vXAYLelKwAjR5H6hiWtFVZqdqDjetuh1SHc2DhT8iaVr/59UA5TiPhTN768QLOVfx0B
         Wl0uHgLcigX9Z6TtBXfG0b7MYQehj0r4iPJfVQ74EcyyhVxzT3y5NzIxdiulZ9t6N1yk
         0inNdVi0jyTNv9hLDRnxOdzmz+Fj3uJVqsTGRPYYvKM/bMA7aKnlpZ1ZNwirrWb9rURk
         I2zw==
X-Gm-Message-State: AOJu0Yz8gZ5+1cuqfa+UrZBhO1cP2A57l3i/chBMAEUo+oGjwhgzEMkF
	NXOykChCWpUiTdQh/0z5UTfE8Iqkub+/OkvkwspQ18u9eM0=
X-Google-Smtp-Source: AGHT+IGYgM3IMUdEFT7wUbj3Ch51ImW3w9IbrWp8HDGrtJIAcx3cxMyKPOQQMr/6g/03Enor/WTrgts6z1qJSAroOLQ=
X-Received: by 2002:a05:6870:7996:b0:1e9:8ab9:e20 with SMTP id
 he22-20020a056870799600b001e98ab90e20mr24313818oab.58.1698947732404; Thu, 02
 Nov 2023 10:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sp424KMAuT94jxXAwJ1YaSS6DvskRQu1X_9Y9w+tZuL2w@mail.gmail.com>
 <20231102061923.810849-1-mingli.yu@windriver.com>
In-Reply-To: <20231102061923.810849-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Nov 2023 10:55:06 -0700
Message-ID: <CAMKF1spOjpT3ZCVatbuObYJKaH8=FNRprvGuJqJo_krByXWrdQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] vboxguestdrivers: Remove the buildpath
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 17:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105845

please rebase it against master or master-next and resend. I can not apply =
v3

On Wed, Nov 1, 2023 at 11:19=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windriver=
.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fixes:
>   WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File /usr/=
lib/modules/6.1.51-yocto-standard/kernel/misc/vboxsf.ko in package kernel-m=
odule-vboxsf-6.1.51-yocto-standard contains reference to TMPDIR [buildpaths=
]
>   WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File /usr/=
lib/modules/6.1.51-yocto-standard/kernel/misc/vboxguest.ko in package kerne=
l-module-vboxguest-6.1.51-yocto-standard contains reference to TMPDIR [buil=
dpaths]
>   WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File /usr/=
lib/modules/6.1.51-yocto-standard/kernel/misc/vboxvideo.ko in package kerne=
l-module-vboxvideo-6.1.51-yocto-standard contains reference to TMPDIR [buil=
dpaths]
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.=
0.10.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.=
bb
> index 8e9013824..ed2dc54d6 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
> @@ -24,7 +24,7 @@ S:task-patch =3D "${WORKDIR}/${VBOX_NAME}"
>  export VBOX_KBUILD_TARGET_ARCH=3D"${ARCH}"
>  export VBOX_KBUILD_TARGET_ARCH:x86-64=3D"amd64"
>
> -EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build' KBUIL=
D_VERBOSE=3D1"
> +EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build' KBUIL=
D_VERBOSE=3D1 CC=3D'${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=3D${STAGIN=
G_KERNEL_DIR}=3D${KERNEL_SRC_PATH} -fdebug-prefix-map=3D${STAGING_KERNEL_BU=
ILDDIR}=3D${KERNEL_SRC_PATH}'"
>
>  # otherwise 5.2.22 builds just vboxguest
>  MAKE_TARGETS =3D "all"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105834): https://lists.openembedded.org/g/openembedde=
d-devel/message/105834
> Mute This Topic: https://lists.openembedded.org/mt/102336760/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

