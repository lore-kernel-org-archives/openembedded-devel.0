Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E4BC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 04:55:54 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.18445.1636952153153297169
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Nov 2021 20:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cX1nlO+O;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: geoffhp@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id n23so13463534pgh.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Nov 2021 20:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=D9FcHIoueSDwHk2HVWwM63dZdEgDNMR00gg166jTWts=;
        b=cX1nlO+O/rip6LX7/EeMG2iW4WjDROqImPpgkGo/WexxV4O99j62ZqkKMwvoaAcZAe
         hKeohb5LUiipWl5cFOEuE9joRLqIGOLEYAFIvKW/WnhaN8pL1TQ+nv7zxnDyz8spCb/g
         6oh5vY9lfNa7J8wxbmV9/6aP3f01F/tDD+6oVL2myc93Tzsfw9dZXhpy7FBbgMjx8JLd
         9o4BLWavLqmlIXU6FH9GXdsUFb3xgYnjSTMH932s+jEiGW9JoEIXTz+Zdl05//aY8+VV
         8FWbS+BP8LF8beLqMq8QSUPiwdWgv2cUQXMywkruUtxG4dZBVWPlK3QOPZchFvz8RuEc
         s50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=D9FcHIoueSDwHk2HVWwM63dZdEgDNMR00gg166jTWts=;
        b=XxiLypQcS1FOwwh3BiHsHvxb57TGsoUufI1Z9bHk+blAMxsOz+ex8wbbwSDrNtZkSw
         Q7tlUlTeAdMqkciqDZW5/JZ6UPWaxsWECnrHO1dZiYzhtMffeRFFYzRBNOUDAe8thJFr
         9TPEbOrY/Hc3b5EGFyR9pMXoS6GN6KC95X/8sTFmNJUdrlcorhfEKlba4qftstNWTwfR
         yE7j2qKGw+4yeJ05Wkv5eC193NHkzDbppQkiiKU8J9obz5kAo/7CcoWbHzeheLxSesp+
         JoyJUqVdjMfB0DP2vyXgPjWexiLVM9zSyDZ9CgVjSTj/nWqqYV6zW7MkCNdHMtTEiWBv
         KU2Q==
X-Gm-Message-State: AOAM532uY75FVJrR0LubIEvzgawSgQr7UsoX4iaSiVb0+C4O4/Jvbj2f
	TDl3QDwZ4CcbJOj/KEwIcZulu027P0ANASfn7ZQm8Wo5
X-Google-Smtp-Source: 
 ABdhPJwM20s1JP8MwAuZ9OMzGnaj0RJU89d28Qfnc3CSxTBtdimRXgC7S5y2w1TKuSv1A0Z2Pnfo+X78Yxsy30ikckg=
X-Received: by 2002:a05:6a00:1883:b0:49f:a8be:af29 with SMTP id
 x3-20020a056a00188300b0049fa8beaf29mr29779800pfh.22.1636952152265; Sun, 14
 Nov 2021 20:55:52 -0800 (PST)
MIME-Version: 1.0
References: <16AE031C14A64EBB.21980@lists.openembedded.org>
In-Reply-To: <16AE031C14A64EBB.21980@lists.openembedded.org>
From: Geoff Parker <geoffhp@gmail.com>
Date: Sun, 14 Nov 2021 20:55:41 -0800
Message-ID: 
 <CAHNuFG+QkyytMAp+9LGLtoBmFX3ztug2od6OBqCcwvR_=T5nUg@mail.gmail.com>
Subject: Re: [oe] [meta-java] Request to pull honister branch and override
 syntax commits from master-next to master branch
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 04:55:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93944

I made this request a month ago, still no change to the master branch
so that builds can be made using  meta-java with honister or master
openembedded layers.

On Thu, Oct 14, 2021 at 2:32 PM Geoff Parker via
lists.openembedded.org <geoffhp=gmail.com@lists.openembedded.org>
wrote:
>
> Request that these commits that have been in meta-next for a while get
> merged into master of meta-java  so that builds using meta-java can be
> built with master or honister core layers.
>
> 147677c layer.conf: Update to new honister release name
> a1eb2b9 all: manual fixes for new override syntax
> b71a986 all: run convert-overrides (0.9.3) script to convert to new
> override format
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93304): https://lists.openembedded.org/g/openembedded-devel/message/93304
> Mute This Topic: https://lists.openembedded.org/mt/86325514/141655
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [geoffhp@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

