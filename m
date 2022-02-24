Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2A1C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 19:32:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.1023.1645731142285454179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 11:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=PKhyUxWg;
 spf=pass (domain: burtonini.com, ip: 209.85.221.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f41.google.com with SMTP id n14so1216738wrq.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 11:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=68iiE24NS9f53RL3QwfQ9tjUveZaC61TipoMQnAbGhc=;
        b=PKhyUxWgsr9jkDk+2/u47ntfrdif6GeZSflnoG0i9aKRLSQOCatL/AVVffVzQzwLm2
         +pzRPui7pacSa+p7Tj1aYHak8wxn6M4Q2VekZcP8t6A0tVwLqEK8Crb65jMA7bRUmcQT
         uCWQo1f8ch0YfavDK0OwjTbI1qtT5VssM9Lv7Iqa/huJKNA70esvmXK1RmVVQDm4SEp4
         ErD+m4AiwaxbSCxByAzcN/u3O9WhhXo8hNKvae7J3MbJtmGzO2MFGubu28Mhrkz6ay47
         lNn+0B0zwdL0WtmbrtSnaFn760bkz8i471r8iGOyaGrQufS/OfBN7HMvXjaUNm+zHshj
         i+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=68iiE24NS9f53RL3QwfQ9tjUveZaC61TipoMQnAbGhc=;
        b=gihiWu4umHkhN0f7Grt7d9g43U60hmb1HJzkNl78lB3mKUM0G5OWkWGJIbpz4ed3TI
         1z3ssU8OJLc9rwHhmAT1NZtlkU8medTB3yw1P0T9XInTR5SBUEKSmScn7IaY3i19xFYN
         YmywLPYIybGAg1dNPcYNy78enfSgxMdnKbfDUeQYi5ouZxYgaBydTaWjNWOFENatw2lx
         J6O3SCnVBB14CScalCL8LuBWGAFtxihTNLzX2dp8x6cAX0vbdW8jpU+a5mpG5HAscwFl
         iApuYcWQTk4IId33jNgLL4fJudcaDDuA2V4r4m4AjJln7/+R8mfwK3TxmH1N8y9cnCPF
         tJPg==
X-Gm-Message-State: AOAM530GsNIa+of+ipUPqsvIbAo6jwn+1vILr69ZBlbfkXpcR/X7JGlG
	8sW+5gsz0L5E9mjRQlMqOY1bPToHB+sw685ot5xqYg==
X-Google-Smtp-Source: 
 ABdhPJz5mvl543+7ZlcnNseiX4BUq8V9wY3BZGRgHKwP67/UurRlVwZybdbJrnNTMZdlZPFZ1MueWHrmR08es20k+yU=
X-Received: by 2002:a5d:584d:0:b0:1e3:2157:d85b with SMTP id
 i13-20020a5d584d000000b001e32157d85bmr3437226wrf.451.1645731140512; Thu, 24
 Feb 2022 11:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20220222184920.2310391-1-tim.orling@konsulko.com>
In-Reply-To: <20220222184920.2310391-1-tim.orling@konsulko.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 24 Feb 2022 19:32:09 +0000
Message-ID: 
 <CAAnfSTvUUqLgLhCYro7LCGG1uMeR38gHsqPRtf_93G1w9NAgFw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-wheel: drop; moved to oe-core
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 19:32:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95513

Can we have the discussion about moving meta-oe's priority so that it
matches oe-core and we don't have to deal with this sort of madness
again?

Ross

On Tue, 22 Feb 2022 at 18:49, Tim Orling <ticotimo@gmail.com> wrote:
>
> Because of layer priority, this recipe must be dropped before a build
> with the new PEP-517 packaging can proceed due to dependency loops.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../recipes-devtools/python/python3-wheel_0.37.1.bb  | 12 ------------
>  1 file changed, 12 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb
> deleted file mode 100644
> index 6c7a31db9e..0000000000
> --- a/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY = "The official binary distribution format for Python "
> -HOMEPAGE = "https://github.com/pypa/wheel"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
> -
> -SRC_URI[sha256sum] = "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND = "native"
> -
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95449): https://lists.openembedded.org/g/openembedded-devel/message/95449
> Mute This Topic: https://lists.openembedded.org/mt/89323966/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

