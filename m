Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C51FC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 03:55:25 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.23683.1698897314944135640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 20:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V6YRZ6jJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1ea82246069so282701fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 20:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698897314; x=1699502114; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQUL2Qm8FU56FiRBZsQM9HKOVZ0Y81VX9POSkm7ZMjo=;
        b=V6YRZ6jJ3rGUmuE2o8XMDcfNXNRdTU3wDCyyFWdbfpbtCbOcUNJgzJ6DGi/XHsUgfj
         AafpUYVgigYy2lDRVw/iLpJb+uVUDpXNbRkXA+1E82NlCyskoRBkVzOAyvXnJBbw8vCP
         tmyt2V6LMCHkknhhFJ8y5YhdNbsKlLkYjNmm1pJuuhB3v+MD3RLSyWx5hrx/Wvk0qtnM
         q2eVybXulUF6LSq6qg5eIJtH55wDI5tdwMNcU7PV0t/VhtpkwrBWSrn76oS2k583Q3gd
         u22L+lZi5ltcrBa6XwdZjhSjAdQ/qR/SWGf07dfo0Uq0ijZmteXZZK6OlrTUOMzZQaSG
         J3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698897314; x=1699502114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQUL2Qm8FU56FiRBZsQM9HKOVZ0Y81VX9POSkm7ZMjo=;
        b=a0+5gjrbgUtzBDjMWhbIOtksTJUHaDlnKuRN+/x5s24iwZlJ1hYK4s9TtFzvZJSjcD
         WCddyxuecwkE2N88VVuAIcrlVbG00M9vUHWF+tjB6b9A7+/txfx/RWAlG8jIdHkCq00F
         X9lHIEi8Xoe00tIdr3Wz+rx4eYKKMMcMyZP4MF1oKK0s1XzR4eKt7RXMrfKFUXgRMx+p
         7CqcTfdv2AYE56Wob/lPt+X7mJkvgc3gShXALYjYp0Gp5UfW81s+RpS7st7jJfBtG5pk
         spXQhOW6F9jl5NSN8C9sM0FKT91yiTv/fMHsAlUC6w6/tahUW0/EoooMDtfElo9Cv8l1
         bdbg==
X-Gm-Message-State: AOJu0Yy00fGdMQ7qwhQjW+cKGyl5FQDqgIbSuQHfkmBQWEp2l1WNlc1E
	TWSpf6pPguvr8lJ7fVcqxRzcw98S8f3Mt7j/tINtJQwUHPsH6A==
X-Google-Smtp-Source: AGHT+IHvCRqY8X0Af741GkrsDGab1U2DJ1w6sMvlqiQ5TblPNmrbVR5bgp2SXVplcZpQDVph+TG4jAN0RiyLWqW+nVk=
X-Received: by 2002:a05:6870:1145:b0:1ef:acfa:4447 with SMTP id
 5-20020a056870114500b001efacfa4447mr12816559oag.34.1698897313997; Wed, 01 Nov
 2023 20:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231102032939.3447809-1-mingli.yu@windriver.com>
In-Reply-To: <20231102032939.3447809-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Nov 2023 20:54:48 -0700
Message-ID: <CAMKF1sp424KMAuT94jxXAwJ1YaSS6DvskRQu1X_9Y9w+tZuL2w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] vboxguestdrivers: Remove the buildpath
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 03:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105833

On Wed, Nov 1, 2023 at 8:29=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windriver.=
com> wrote:
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
>  .../vboxguestdrivers/vboxguestdrivers_7.0.10.bb                | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.=
0.10.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.=
bb
> index 8e9013824..847458645 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
> @@ -24,7 +24,8 @@ S:task-patch =3D "${WORKDIR}/${VBOX_NAME}"
>  export VBOX_KBUILD_TARGET_ARCH=3D"${ARCH}"
>  export VBOX_KBUILD_TARGET_ARCH:x86-64=3D"amd64"
>
> -EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build' KBUIL=
D_VERBOSE=3D1"
> +EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build' KBUIL=
D_VERBOSE=3D1 CC=3D'${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=3D${STAGIN=
G_KERNEL_DIR}=3D${KERNEL_SRC_PATH} -fdebug-prefix-map=3D${STAGING_KERNEL_BU=
ILDDIR}=3D${KERNEL_SRC_PATH}'"
> +TOOLCHAIN =3D "gcc"

I think its better to move it to conf/nonclangable.conf in meta-clang

>
>  # otherwise 5.2.22 builds just vboxguest
>  MAKE_TARGETS =3D "all"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105830): https://lists.openembedded.org/g/openembedde=
d-devel/message/105830
> Mute This Topic: https://lists.openembedded.org/mt/102335456/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

