Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596C4C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 17:43:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.1693.1643391826245111677
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=4hCGC18h;
 spf=pass (domain: burtonini.com, ip: 209.85.128.53,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f53.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso4554638wmf.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+U0U7UVByqZiQnMLH9Y6oma1E5QWd7QsHKivsqnpzLk=;
        b=4hCGC18hNL/2F/uPoirsLP/+GWHUcSyeOw5NFrH+xA2ippAFFw0GHmG9XakYgMw/PR
         lQjZO1u1XFxkFkxaGZc1ps6BK+XoJHHv2sDRH2CRymWfQX8y6I5GdtkVf9JTnzkj0pBw
         nFuOzmEkqj3yVyUJMsCV6ARW22dGuHEI0UnI0hmlWcktjEOr6tDWyUd/RwXgQLOwhMeH
         zigchPvUQzA+2+JlwEmJRprYegzu+7ixIOs7kueWG9I/yedTpOlKFPArFEwzhxKqTczT
         W/GOa/YyMdcJo0DvKjnsXxqnlclGs4+dukknMG59Wldv151KNSeo/NT1KheYEi3nIdpl
         VZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+U0U7UVByqZiQnMLH9Y6oma1E5QWd7QsHKivsqnpzLk=;
        b=jNppQ0cJ7n+bt5F4k2m/vwEEobO8UDOFFmP7TB9dCacE/U9A69F6gBgokX0KTPuquL
         Kts1kK9daEMECQTsIifvXoy5eRxZnAICXPSqNaTOvjNzvuTRFJ1m3H4esJ6+6u4kJksh
         C0+JtZpz+vBTvQVPWZKGPNY3qEqZmodbGWEZXMv6S2mdIMLQD+bRfwNmJi6iuSrGErQH
         xHoaylhr9YM63bUkzA2636OAUpFDbw6XjvU0RaWv7Q4HbTzlIndY8pkRJmnoTdR3KvfM
         ei6zk4EweWSLcykZkIbmLAdc2WxkqUOhQ1wxyHoQUm/g3E7VIGV4ZuBScmAybfO1pxdu
         RKow==
X-Gm-Message-State: AOAM5333tMwP4H/Yt1lHMxdcxM2AGuWNuSK8rhnVRqyyz5hhxdYvKf3v
	BPMkkIuyJ7J9QHFB6XEY2843JWluCUiMW3ESPmd65Q==
X-Google-Smtp-Source: 
 ABdhPJyw0aBc09yuvrM/ORrO07dEm5aLnYdg8bErPbvJGizzFg/efu5E0vRb5aj2q3ds/POBaXAcErPxYq0lxp7ZeaA=
X-Received: by 2002:a05:600c:4fc9:: with SMTP id
 o9mr16463385wmq.184.1643391824534;
 Fri, 28 Jan 2022 09:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20220125181339.114315-1-f_l_k@t-online.de>
 <26359.1643390123448861343@lists.openembedded.org>
 <81dde554-b80e-43aa-cc85-033f858ff2a0@t-online.de>
In-Reply-To: <81dde554-b80e-43aa-cc85-033f858ff2a0@t-online.de>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 28 Jan 2022 17:43:33 +0000
Message-ID: 
 <CAAnfSTvvR+8fx1vLuFsKajg_umatsfCqEQ4WKei7TGFEXORzMA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] folks: make some dependencies optional
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 17:43:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95154

On Fri, 28 Jan 2022 at 17:35, Markus Volk <f_l_k@t-online.de> wrote:
>
> https://github.com/openembedded/meta-openembedded/blob/aa22894fa352986a62c4530ad8facd8868b2e535/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb#L24
>
> Doesn't this line explicitly disable tests until DISTRO_FEATURE ptests
> is set ?

Yes, but if the tests are enabled they're still not installed, so
there's no point in building them at all.

Ross

