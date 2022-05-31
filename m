Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F817C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 15:25:58 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.50997.1654010750036214293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 08:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b/XUrEH+;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id x7so13522756qta.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N1mG2NwU5jzisqOxSAi/nskF+mSn0UzqqdQlUk/bmN0=;
        b=b/XUrEH+MQ2ysSwjXsigkXVhm3NE/AAuBYR66xqQPFJbBkUf8Kvr+v3QlZlgIlUm/y
         0zZjG8EpDrI3Sd+aTAVykLtaDIcElSUdKG6hvny78jn97RC3y4Z8XcRJSSYDQMhshj+6
         wp259O+QffET68pCTYtDGvdwpFTgx2UyHvYda5COzshLtIM1xETlCN+PzpLWbZsI7hwr
         6qIR8o/o6Msc8HEs8Q3aJ5o/JMX8N0Llxq9CTPdnRrd4sYlhMVM84a1wTeNuHgwsyL8d
         zl3OYeR89aoapn3t1ljvm03we3OokcVziUe5tQkNW0/zLp+VQt0llUd98KO92azR7CVx
         x8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N1mG2NwU5jzisqOxSAi/nskF+mSn0UzqqdQlUk/bmN0=;
        b=3lXQ3mJdNC4P16ZJHeTIOgraea8r4MWqQoTIqSPRIQpkzwacdiCwzZ9MKqIMUKaj+3
         TFZ8kt5XEILa+FD340Mi0gFJoUy89d+WQN1A3ZbLU667my+U7Sd9dTCM4RMld9lwtLVV
         iJlklZLfUGhsWwU6dSyeqr/3ivNMteHhNynNY5wGU4Ga1AThePRFTg5p/usVMTBuPLhN
         B8VjOVZIBk3Edp7JKQKWTC1RNAwhpjuV5lZkW/jlbI8rUoE+7MjOUQFOoD1M8bkwKzbO
         RJmLMb78sEQ5xgQi0TkrWmSWpr22KxdkJDkf+dXL/CDgDUT3IlPSxoODWnVT9l6BZ9lw
         F+gw==
X-Gm-Message-State: AOAM532PcW+IhMhyyrDbIbM7MNxsskDmBgiOVt+SqkWEaOMBLZQ9tTlE
	yAN69/z8W1AslNszuu1m/yEI+xiCWfnnvMrT0CiNH6wHdF7WzA==
X-Google-Smtp-Source: 
 ABdhPJzupvXJmCu7kF2vjLNXI9RwvqO/zK9wkqoRtzhKQSDdyc6yKfFAFbnqiVnjIG0vkvE/ZMaRgjZcWIJHCLaF/xo=
X-Received: by 2002:ac8:7d48:0:b0:304:b3d4:8eef with SMTP id
 h8-20020ac87d48000000b00304b3d48eefmr7039129qtb.634.1654010749029; Tue, 31
 May 2022 08:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220530123922.7311-1-jubalh@iodoru.org>
 <20220530123922.7311-2-jubalh@iodoru.org>
In-Reply-To: <20220530123922.7311-2-jubalh@iodoru.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2022 08:25:23 -0700
Message-ID: 
 <CAMKF1sp=W2xWvpmsq9wVc2qu8pEYVv=WkJkSGPx9dscmNJuZ8w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] jasper: upgrade 2.0.33 -> 3.0.3
To: Michael Vetter <jubalh@iodoru.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 15:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97352

fails to build see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1794/steps/14/logs/stdio

On Mon, May 30, 2022 at 5:39 AM Michael Vetter <jubalh@iodoru.org> wrote:
>
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>
> ---
>  .../jasper/{jasper_2.0.33.bb => jasper_3.0.33.bb}               | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-graphics/jasper/{jasper_2.0.33.bb => jasper_3.0.33.bb} (93%)
>
> diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb b/meta-oe/recipes-graphics/jasper/jasper_3.0.33.bb
> similarity index 93%
> rename from meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
> rename to meta-oe/recipes-graphics/jasper/jasper_3.0.33.bb
> index 4c17105a9..87608b231 100644
> --- a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
> +++ b/meta-oe/recipes-graphics/jasper/jasper_3.0.33.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
>
>  SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
> -SRCREV = "fe00207dc10db1d7cc6f2757961c5c6bdfd10973"
> +SRCREV = "020ec588d59d6ef13aef73aa0d86343ddda600b5"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97330): https://lists.openembedded.org/g/openembedded-devel/message/97330
> Mute This Topic: https://lists.openembedded.org/mt/91429624/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

