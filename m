Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081B0C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 02:19:23 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.6103.1645150761538648004
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 18:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mVf3/fYb;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id x3so12049058qvd.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 18:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DfHZDb26r7mJOivJXY/9uVThRenI+v16LPmiLz5JugQ=;
        b=mVf3/fYb+8H0jcaoowe1WdFmtKl+7ugQZGO93fHhhewvFdbKZMacpexggU7LsYj9Lj
         Xqejs7QZli9ehdfLoz7bzBF5tu++9dZiOhm3OouzBE7EEai8V22h6r3vEEdnX0z34hum
         te9Uoj55tiy6NULFxruaB+mdHkLAqfW4YecH5i35NlUF+BAt+tlUd+ECQlRrQGc63Ry2
         Iz/Rvsg+MmLNCCmctG3T6UmcrbPX+NlzCMGizg/yLh7l4hZgWTzcEj/bYGSQF7P+kUPy
         2r6Eo86kGhEE8nJlCdEHpgsQt+G4kZbX95RmY8zbEO4S6ZDQkYhqu5bw70mo4mXZzlZb
         FOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DfHZDb26r7mJOivJXY/9uVThRenI+v16LPmiLz5JugQ=;
        b=pTRm2gMtRBd157VExAyuHRA0JJaVFbUySzfbh3W9BUxj40enflCt5KvRPCY3Qx8P8z
         aP0gqNfF95f4jRFUnxaP+BDnURZ0jbrEmLVxpZ6+Xd2L1wRNeEzV1Rym098+eNkT6RCW
         RT3YlxQ82B2q6Fhk2ug4JU6ELMpaC6wQ0tXXRgkqG9FeN93UfK/R0sfs9p9X0lpAcKkW
         0Ns5GSB9RqWr2c2toP/Grdg3mKDfcYtgLZmSFFg2FGCuDJhC4UumRjduTcV5lS2YIpJn
         ZMkNeiIpJfN3iygP+IiOckvbHnPTzBMaj5YzJGBXhT7lOGzm8yBdZqe9WCbTGW/IvF2P
         IoAQ==
X-Gm-Message-State: AOAM530Jp0oZNEY7UaGjBIpEry5/xjF/6YrjTAKZdjWhTWROoNgecTUy
	JT4TpRKtfVb/m4indICo4vBUrlo1X/m/ahXeFYA=
X-Google-Smtp-Source: 
 ABdhPJyHVKJdBghjkN/rZYp+heCmGabqVSBv5QpZSAfm8UukW5E0tKl/KXZkLVA+jjjf+1+qfppGNivkzE9DWu1JSqc=
X-Received: by 2002:ac8:584c:0:b0:2dd:aaa6:7865 with SMTP id
 h12-20020ac8584c000000b002ddaaa67865mr247681qth.330.1645150760444; Thu, 17
 Feb 2022 18:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20220218011204.5913-1-pkj@axis.com>
In-Reply-To: <20220218011204.5913-1-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Feb 2022 18:18:54 -0800
Message-ID: 
 <CAMKF1srXFHYf1bxDG5Cm74CU55bVgzcg3n690nJyqPWuavN6aQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] syslog-ng: adjust control socket location
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 02:19:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95368

this is already applied in master via b57d824fdf822a4c3fdb153b92063f88705e3a6b

On Thu, Feb 17, 2022 at 5:12 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> From: Ovidiu Panait <ovidiu.panait@windriver.com>
>
> Commit [1] changed the pidfile dir to /var/run/syslog-ng. This also changed
> the location where the control socket is searched for, causing the following
> error with systemd:
>
> root@qemux86-64:~# syslog-ng-ctl config
> Error connecting control socket, socket='/var/run/syslog-ng/syslog-ng.ctl',
> error='No such file or directory'
>
> Update the systemd service file to point to the new location.
>
> [1] 00d1d63e4f7f ("syslog-ng: provide correct PID directory location to
>                    restart/stop syslog-ng daemon")
>
> Signed-off-by: lmorales <luisalejandro.moralespena@windriver.com>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> This has already been backported to the hardknott branch, but is missing
> in honister...
>
>  .../files/syslog-ng.service-the-syslog-ng-service.patch         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
> index 0e1d09492..733480030 100644
> --- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
> +++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
> @@ -38,7 +38,7 @@ index 0ccc2b9..7f08c0e 100644
>  -CONTROL_FILE=/var/run/syslog-ng.ctl
>  -PID_FILE=/var/run/syslog-ng.pid
>  +PERSIST_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.persist
> -+CONTROL_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.ctl
> ++CONTROL_FILE=@LOCALSTATEDIR@/run/syslog-ng/syslog-ng.ctl
>  +PID_FILE=@LOCALSTATEDIR@/run/syslog-ng.pid
>   OTHER_OPTIONS="--enable-core"
>  --
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95367): https://lists.openembedded.org/g/openembedded-devel/message/95367
> Mute This Topic: https://lists.openembedded.org/mt/89223977/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

