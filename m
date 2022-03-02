Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F16C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 01:19:51 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.2744.1646183991329929602
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P+x503wj;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id q10so352207qtw.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NZ8JFKF2BjH4ZRJVzE0X05Rug9M/JaEGP1vSB6iHJz8=;
        b=P+x503wj1cRzkl/tvwg6iJZ/Y2YbrH//jhSXlajaDBz7h0GX2AcuAMIcFHP50aIlh+
         tl6jJo71cgNesEN4/CRZwl6BUnlVB0uz40JSiq9s9JXZln/h+Y2t1YbRrmC8EC/wmAzy
         OcvDDhWf89R1YutIpwuHPCMIYPQhFuhlzoRlW9iI85Zc2KWFzGKFRr+UCLQ6xKGJV+8h
         pSh97Rao2TtR85HPVkVTSprwoglOnbEGs3ifhO/DQJMOXUjL5XNJ1MqGH0hQtu4PcWjB
         S5Cb1fcCQKKjWRrFG+i96bcXpClqqvHL250/oKYD84iq2ZYthgjpWmzhJzYrhxcs0U2A
         +n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZ8JFKF2BjH4ZRJVzE0X05Rug9M/JaEGP1vSB6iHJz8=;
        b=aObFZv5yaWSll9TJzCxW+fiij/+qJvDiuG5x2S3hzbNsn02q0mqIL24jjt0DS+uNhR
         oyypi1o7cLZfY/IBIXVp85JAa1EY0sg93mRrmFSl9Ul2gq/tV16hf5jR8pM51GmaclLy
         MVC7li7avBynUy3dLgwn2Twee9glHgmrGaUTfXKT/h66y2sNYUwHlOaiOkTg5C8YSzFF
         wpqI3KlbXani7hhguSdhB9IvvH6aPTeOaMaGj+yKUMWqrmICBQVbQI5pCHGRRNU6iruQ
         onxaSSE9Hm8ZieWANOMZGttruM44kXlolemqh3snXxjItmzssBeBQ1wjzau3My/2AjdY
         rGwg==
X-Gm-Message-State: AOAM533KJ1L1s2WyINXgD94+GA6Jqt9AN5V8iTnE0lSKwuxllcqHu1Oc
	JshKqiUxNmM3pjCJXMzHPU+nSZhXC3W/gWVZZy8=
X-Google-Smtp-Source: 
 ABdhPJynGaPdD/rnnIs49BkAWL8dynJRk0GHTtw3n+OOn6bCDG9YHgKNiXXeTySKB0KraJBTuetn1xfgR4D+UJ1S7mI=
X-Received: by 2002:ac8:584c:0:b0:2dd:aaa6:7865 with SMTP id
 h12-20020ac8584c000000b002ddaaa67865mr23085715qth.330.1646183990389; Tue, 01
 Mar 2022 17:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
 <20220301203354.3839755-4-tim.orling@konsulko.com>
In-Reply-To: <20220301203354.3839755-4-tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2022 17:19:24 -0800
Message-ID: 
 <CAMKF1sqU6scw+3zr+cPGb8t4Woif05k2295vNmxaAuKrnEM0ag@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/9] python3-pkconfig: inherit
 poetry_core
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 01:19:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95669

typo in subject line but I fixed it in master-next

On Tue, Mar 1, 2022 at 12:34 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> Use PEP-517 build-backend instead of setuptools3.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
> index 2d68a78e37..c5a74796a0 100644
> --- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
> @@ -10,7 +10,7 @@ RDEPENDS:${PN} = "pkgconfig \
>                   ${PYTHON_PN}-shell \
>                   "
>
> -inherit pypi setuptools3
> +inherit pypi poetry_core
>
>  BBCLASSEXTEND = "native"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95651): https://lists.openembedded.org/g/openembedded-devel/message/95651
> Mute This Topic: https://lists.openembedded.org/mt/89486858/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

