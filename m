Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715D0CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 17:26:10 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web11.225550.1697563566415691812
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 10:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQJbYdgK;
 spf=pass (domain: gmail.com, ip: 209.85.222.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7b5f28da928so2229158241.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697563565; x=1698168365; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gqpn7waQNONgxamYLqrbnx0Jb1hWM4FrVix7AbaNcM=;
        b=JQJbYdgKktw2ThytzXbYkm7qYadNBZpZijFEh5HveXzHiA4Wg+vGEuaqxWtdnFpiuV
         E0SQqoGIsRit33bkWYDRAzWylLpjbJ794NrZt+QhprCU2a8MqaTfWYpJ95BNO1qmnt6V
         H59b8HVTjzXGIZnHFfQulaAoFpPg09hvGDCh5aomtlo6AqNEXEGX7P7HC+YNjbz9stXG
         3s1ED26TLLNoF5Iujhh+8/WFH+6Xqvtg6mXLvqMyvhUeqTpIO3wl7pqAM4bPb6b/WOuF
         y7xCIO7g+D9J8+8WJKjtOHb0ULpbDi5wcJdo3dqn8/JZ88To4sWrVjl1V9LLPX5jpTAM
         vtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697563565; x=1698168365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gqpn7waQNONgxamYLqrbnx0Jb1hWM4FrVix7AbaNcM=;
        b=EOekPBs/Se1s9qDq5so++0BL/KqUSXbJKnzZ0DToLqTQI81XYRv015qFIGmPEh/ERg
         wdzusBFAAK89OBMAGfW6ZZYt4yDVeLjJOyg1BhAW14HZJqThINZRbFjsK+oisIoTw/y2
         fKQOoxvdZtckmHgOj9Ch4TWKMiGS+htVwBkfsPL6G7JQLEDLOHpkLZAiWe3FR+oyCYWq
         BgyDE8MlNM+ZgL5fJ5UJfl0vY5UDlEOel6EEjJBavKFmIxdVChGJGhT07oXPTSRW4uut
         8l+ko71sVrl6tfsrK+cKTmbHmfL/HTsisnBT4JDK+XkhcSv7b/dpOOGhwxTBKHBiN53X
         HZmA==
X-Gm-Message-State: AOJu0YxOGSye/kitdbS86+iykPO8UoYlBvz7FPJcshDSWXmISTtdkW+P
	d1ujr4Uiqk+m7d/C2/7W6YU/MxHWx6R9GfebwNRA0A8+dR+cpw==
X-Google-Smtp-Source: AGHT+IG1NWHSJp0QQWLPfFZNBv3u6KICjxP7hhycE+F7mmEufTi8YIAui/37+tHr4G/UI93F8IRFm24hd6d2vF/AZCw=
X-Received: by 2002:a05:6102:34eb:b0:457:e822:60e8 with SMTP id
 bi11-20020a05610234eb00b00457e82260e8mr3095105vsb.29.1697563565256; Tue, 17
 Oct 2023 10:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231016090604.2306962-1-mingli.yu@windriver.com>
In-Reply-To: <20231016090604.2306962-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2023 10:25:38 -0700
Message-ID: <CAMKF1srxhYu1Cw+4Am34LkMA1gkSVzYebmS_jy5jM+seQgGnQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Remove the buildpath
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 17:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105557

This patch is good but it fails now to compile with clang see
https://errors.yoctoproject.org/Errors/Details/739936/

On Mon, Oct 16, 2023 at 2:06=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windriver=
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
> index 8e9013824..c478ac62e 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
> @@ -24,7 +24,7 @@ S:task-patch =3D "${WORKDIR}/${VBOX_NAME}"
>  export VBOX_KBUILD_TARGET_ARCH=3D"${ARCH}"
>  export VBOX_KBUILD_TARGET_ARCH:x86-64=3D"amd64"
>
> -EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build' KBUIL=
D_VERBOSE=3D1"
> +EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build' KBUIL=
D_VERBOSE=3D1 CC=3D"${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=3D${STAGIN=
G_KERNEL_DIR}=3D${KERNEL_SRC_PATH}""
>
>  # otherwise 5.2.22 builds just vboxguest
>  MAKE_TARGETS =3D "all"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105542): https://lists.openembedded.org/g/openembedde=
d-devel/message/105542
> Mute This Topic: https://lists.openembedded.org/mt/101992179/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

