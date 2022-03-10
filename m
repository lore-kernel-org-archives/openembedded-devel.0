Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035AEC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 07:27:22 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.7054.1646897231805607679
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 23:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jd2lO5m8;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id b67so3750850qkc.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 23:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L27pTWDsGjQSn+tCwJmyg1yWjBW7YMtQIjs5YSQwePg=;
        b=jd2lO5m8rlmRtbvp0XePH6zipTmFYy1ZzNBP7drz0ddTI/+XwLuXzjAx58bfCJOMYl
         NgTNBEUXNa5M4k7+SO0LXvWskdjH/Y4elGHd9q9jjSfMEI29lPQINOE20Bsg1QkqHfj6
         XxWOu3ZbvFshq3FaUzN4/Kzcl17onzuLqpHC16gNDDVQUT6WpU/OSXkU+mTQ9BglB3wE
         VHgLrkGlk9sL91KsRK7E1GEjdc8KBQKCSSCigWdvWJ1nKHInkCjvPk2Jx+03j8Ry4HeS
         gD5OYl7SOLsh/ZZFmhs1f2LAU/xMqc/jA48srlM24YWch8+3qFgRwEHKJrJLkbTlxARr
         B7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L27pTWDsGjQSn+tCwJmyg1yWjBW7YMtQIjs5YSQwePg=;
        b=2PsK7BeVhBtAOXVTE71Mb4ggiug2XQV9TgC4P3qdZQSgseCjtWNTRSQcRb2ePmckHX
         +pylh7M/e2jfokZJfDhGmX2kferp/uWRodzcrnA9ZZB1SziS4OJ48PzVrTVCnkKAqJf0
         DyefVvxGvJwV7ZRY9xTNtM8p0UwZ3Lw6bQlo9BHXWBBpS7Ory/UHeYagxjkR+PvlKILm
         2iUOoYLuLVnK3N12h8Lb+CoUUT03qYXp6aqAY+3JaSi/V1gnm0j54frDRbV0U48yW2Gv
         IGCNfLZ++5FacJvmErAhs4KdT24yiwGiRDsW+6szKpmxacZQJ7MmTf+j6bXnvzThngSj
         JuCw==
X-Gm-Message-State: AOAM53234i5IxZuGbC9paeH+JrDwcB6O9K/c/ROhUKOEZNxI77BDCfz4
	AyC7msSfkkBkGNCeH2SxUZoxZ/2byPft+woaA4CDRSQuqbQ=
X-Google-Smtp-Source: 
 ABdhPJx1QN8vBFxAZ40xdBMyWMNKUOaGd1U69+4IH7u1hRafaFF7nfxkpLTMC+JnWzznrbXASFk+vAXQdDJlBsWwa60=
X-Received: by 2002:a05:620a:4626:b0:67d:1857:cdd2 with SMTP id
 br38-20020a05620a462600b0067d1857cdd2mr2105203qkb.227.1646897230679; Wed, 09
 Mar 2022 23:27:10 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAMKF1srriviyq9VC7WCjwXha-t8=PGiq9vSqTHX2N4sNi50Xfg@mail.gmail.com>
 <32273.1646896766680224354@lists.openembedded.org>
In-Reply-To: <32273.1646896766680224354@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2022 23:26:44 -0800
Message-ID: 
 <CAMKF1sqCDd7ZwNGOqbYJY_n+pTRBsyRH_kb8oByvubNCnYcRwA@mail.gmail.com>
Subject: Re: [oe] [meta-python][dunfell][PATCH] python3-fasteners: Revert new
 override syntax
To: clemens.terasa@garz-fricke.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 07:27:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95921

On Wed, Mar 9, 2022 at 11:19 PM Clemens Terasa via
lists.openembedded.org
<clemens.terasa=garz-fricke.com@lists.openembedded.org> wrote:
>
> You are total right, my bad.
>
> I checked out the poky dunfell-23.0.11 tag, however, the BBSERVER was still running in the background and thus using the old bitbake.
>
> But shouldn't meta-openembedded be as compatible as possible? I am sure this habe been discussed dozens of times and I am ignorantly not researching enough.
> At least in this case I do not see a compelling cause to use the new override style, that might potentially break older poky/newer oe combinations.
>

meta-openembedded does not get tagged for point releases, so its left
upto end users to integrate it with a given point release, however
maintainers always make sure
that latest release branch work with latest core branch tip.

> Nevertheless, this is a non-issue for me now and the patch can be discarded.
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95920): https://lists.openembedded.org/g/openembedded-devel/message/95920
> Mute This Topic: https://lists.openembedded.org/mt/89666632/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

