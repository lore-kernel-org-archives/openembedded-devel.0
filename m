Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E93C4743F
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.1823.1649128608248796784
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 20:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N3ftPLuA;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id d142so9362479qkc.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 20:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cP/9QvRjgJtBwbAopH4r8kKa2QLfakCvkYvUYTmdmPU=;
        b=N3ftPLuA26ti2HXbIfFOB1Tc3aCDsOGwWdrwb8tbuR+vc9vElppaayJ1omqcW/Oi8P
         VNmjMllSu48y4nK4NmAz5+5wVdLcW36dPS11egOsc72vemuVCkFcdUMGvUvOgNpg9QPo
         uQ536W+dQVzjAwwMgZu1hoZX85Qus5Y8JLMUcL5hBj0Lx2+LVGritX8g+pIDtJYplPB0
         qYpTOcVnIXv//abEqPb8md7kYOjCQv2IepXVmVFPoJm94cN3rxHeYi0gYsEP+djcP/GH
         S0YvT+jfXpiV2p/bk95OG6g37teBomEuZgrbS0GtPWfTydZTN4E0/3qGwPO40HF2Tq+i
         Ssvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cP/9QvRjgJtBwbAopH4r8kKa2QLfakCvkYvUYTmdmPU=;
        b=WbL29JhEPbdsQwZ81AKjXFWIaxciYXnE7hc4+mGp4hmQGFKN65vOFiPHJOmtBhXtM+
         9UrHEpSZNxCC/QjEbtuOu103wkCYsurrODY90UzYO3PBms2mDLTO+9NBe8Vu0e+j9ycq
         Ybe7HRr+gktYMZ64IzghndH5by3ZwG/fFxMIlmBZ9ubzUhz+SrAdwpBJ3cbl1bUy3vA9
         +wN35TyhFAssmzZuQ1BsV64Rs+YGwPQiz9dK3VMBXZ4XzOJyBbXAfOlQ6eUpYXGbuzme
         hm+4v4SQBhT4E6ddVXxSkH8GsE7y3ZLX7gEVN3j/lfhNhz3XaD/ZTzZEJikB0ubDKcEK
         +bMA==
X-Gm-Message-State: AOAM531F9rrmZRnNJRSEL+Len667tJkou42XwEvCW1y6//JTUMBIRvB4
	D8VNMNjT3p5cg0TsV2j2GpgqgmPcRvgc0LocoQ0=
X-Google-Smtp-Source: 
 ABdhPJzfohEPoJ3P/QbmDGnjj6/5wRXQ9lvs2krJOGlKPgKTsDoJGVm8+FZGSz/Y8/zpi/2vseySDahR8uiJ3TbR+Dk=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr987683qko.72.1649128607282; Mon, 04 Apr
 2022 20:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220404130354.2131131-1-stefan@datenfreihafen.org>
 <20220404130354.2131131-2-stefan@datenfreihafen.org>
In-Reply-To: <20220404130354.2131131-2-stefan@datenfreihafen.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Apr 2022 23:16:21 -0400
Message-ID: 
 <CAMKF1soas80msGDvw7zB7S=8rXuz2ni4L2FwbffXw=BJ1xNygA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/4] ot-daemon: add recipe for
 OpenThread daemon
To: Stefan Schmidt <stefan@datenfreihafen.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Schmidt <stefan.schmidt@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96392

fails on x86_64/glibc see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1610

On Mon, Apr 4, 2022 at 9:04 AM Stefan Schmidt <stefan@datenfreihafen.org> wrote:
>
> From: Stefan Schmidt <stefan.schmidt@huawei.com>
>
> The OpenThread daemon allows Linuxes devices to participate in a Thread
> mesh network without acting as a full border router. The device
> participates like any other child or router devices within the network.
>
> This same repo is used for range of different modes to run the
> OpenThread code. From bare metal over vendor SDKs to posix platforms.
> For this recipe the focus is on the Linux posix implementation and we do
> not pull in all the git submodules on purpose.
>
> There are openthread enabled recipes in meta-zephyr for people who want
> to also use OpenThread on MCU based platforms on top of Zephyr.
>
> Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
> ---
>  .../openthread/ot-daemon_git.bb               | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
>
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> new file mode 100644
> index 000000000..7bce46e22
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> @@ -0,0 +1,27 @@
> +# SPDX-FileCopyrightText: Huawei Inc.
> +#
> +# SPDX-License-Identifier: Apache-2.0
> +SUMMARY = "OpenThread Daemon is an OpenThread POSIX build mode that runs OpenThread as a service."
> +SECTION = "net"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=543b6fe90ec5901a683320a36390c65f"
> +DEPENDS = "readline"
> +SRCREV = "7dfde1f12923f03c9680be4d838b94b7a2320324"
> +PV = "0.1+git${SRCPV}"
> +
> +# We are not using the git submodules fetch on purpose. None the third_party
> +# components are needed for the plain posix build and we can avoid all the
> +# differently licensed code.
> +SRC_URI = "git://github.com/openthread/openthread.git;protocol=https;branch=main \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DOT_DAEMON=ON \
> +                 -DOT_SPINEL_RESET_CONNECTION=ON \
> +                 -DOT_THREAD_VERSION=1.2 \
> +                 -DOT_COVERAGE=OFF \
> +                 -DOT_PLATFORM=posix \
> +                 "
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96379): https://lists.openembedded.org/g/openembedded-devel/message/96379
> Mute This Topic: https://lists.openembedded.org/mt/90240938/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

