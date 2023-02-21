Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691F4C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 17:21:18 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.47949.1677000073268924365
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 09:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AP9p+P2Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: peron.clem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id l12so4947237qtr.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 09:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vZQLPgJ0RSKQ2dpk0UpqaFEcowPs72QOQnc8tmJo6sw=;
        b=AP9p+P2Zl5K9RPpxXicGeZ+dUA81I7qnq9CDQ8I5nbB0bkFGC3Z4WHlwvLtMIlyIaC
         tATqhcR+HuJQdB0cIFrLjXWFfU81raSC7huKnd/j0g6loLwxlr2FGh8j5wyZr1Q6iVhP
         FApHMzGTIo+omi0kYRE35IWSBIPVFhJRzgeOMgOyAiD9mSoKz/19fz/96vUj3ffLAnwz
         YXGeVUfZeC31YubiSrYtUtw+UzwOnmKHdIFNFudPF5ydIJucv0iQfh2V5aienCPdx0Sa
         OMvO2R6FwvUCviNHW7LbRqCUet4HhwkPttId9+LAxkQDGFM2I5q02szJZiJfvDLWQi77
         yqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZQLPgJ0RSKQ2dpk0UpqaFEcowPs72QOQnc8tmJo6sw=;
        b=G0nYqP0FnQ2d7NcXHSg54JdZsU4Xj2cq1r1b3/zLnpx78SRoIkd+0jLZNZ6e52ljb0
         GspHVi+Ck0MrE4SJUws2LySLBcVK9hJhRTv/vDUuyEcepmxS1IvcPKSPzHLb5J7z2OQc
         5Q48iwqPM+r7HYPRZ73mZKIyCMFvRkdrt5PbwtB/kQ3eY9UiHP0m7DgxRUq+hbrpxX9M
         Z8hzeofxIzWzRt4njHmA813CrNorK3FlaBhBmqv+E5rWMGHlI9ILu/Y8H8doGztXwJVb
         GyTqBkEtFE55sz9DiwqBhZfQk0iw6NamXiDx/eTY2bhQkagUSmpLzRjrdQvzb60iH2AZ
         +OBg==
X-Gm-Message-State: AO0yUKWqQOBm6eOQ4MrbeGCkHfMWZu8fJmDsm2De/WEBqdI40jKrhUXf
	jihG13MyW4AtfqHk4Oqyxsf3kTMaOJmtU0SiQFI=
X-Google-Smtp-Source: AK7set/LaPb3ZM9H7ugCO5DDlYOUshiLM3c3K86bWLD5WFZ19C3OebUCvmg9hZticIAM787pDU68qAY5Ku68d3Ab8/I=
X-Received: by 2002:ac8:611d:0:b0:3b7:fda5:2632 with SMTP id
 a29-20020ac8611d000000b003b7fda52632mr670127qtm.13.1677000072225; Tue, 21 Feb
 2023 09:21:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675025970.git.akuster808@gmail.com> <06fb36d33cb35e48c07532a868ddc5ffc2244743.1675025970.git.akuster808@gmail.com>
In-Reply-To: <06fb36d33cb35e48c07532a868ddc5ffc2244743.1675025970.git.akuster808@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 21 Feb 2023 18:21:01 +0100
Message-ID: <CAJiuCccfTeMrbYYwd6sueTD=X6Usi4eS_y5UhQ+8U03MraAJwA@mail.gmail.com>
Subject: Re: [oe] [kirkstone 08/10] grpc: upgrade 1.45.2 -> 1.46.6
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 17:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101191

Hi,


On Sun, 29 Jan 2023 at 22:00, Armin Kuster <akuster808@gmail.com> wrote:
>
> From: Andrej Valek <andrej.valek@siemens.com>
>
> Backporting the version from master (1.50.1) would a big risk. So use the
> version 1.46.6 which also includes fixes of bundled z-lib library.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-devtools/grpc/{grpc_1.45.2.bb => grpc_1.46.6.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb => grpc_1.46.6.bb} (97%)

Should we not also bump the python-grpcio and python-grpcio-tools to 1.46.5 ?

Regards

>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
> rename to meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb
> index c2f952fc64..7cf27d1e05 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb
> @@ -20,8 +20,8 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
>  # RDEPENDS:${PN}-dev += "${PN}-compiler"
>
>  S = "${WORKDIR}/git"
> -SRCREV_grpc = "b39ffcc425ea990a537f98ec6fe6a1dcb90470d7"
> -BRANCH = "v1.45.x"
> +SRCREV_grpc = "af855eb64eea02d2f7b68d49c3d4d7a263649104"
> +BRANCH = "v1.46.x"
>  SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>             file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
>             file://0001-cmake-add-separate-export-for-plugin-targets.patch \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100842): https://lists.openembedded.org/g/openembedded-devel/message/100842
> Mute This Topic: https://lists.openembedded.org/mt/96613957/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [peron.clem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

