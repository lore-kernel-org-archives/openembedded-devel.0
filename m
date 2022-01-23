Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3538DC433F5
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 20:04:38 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.13960.1642968277023484244
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 12:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bP6deUeH;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so18377848pjj.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 12:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TZcOq7hKxXx3xUNt3liO4J9aAze+y1vbTw2JaqLhDlA=;
        b=bP6deUeHwrwrQcBBIj9fj7JIptaDVXiOFMxWT2NPkV2akx4LTjAl+MGK/kttknk9ib
         opYWOiDJvSII1beqNOnpkQPE0GEKzUKBu62sLKrjMpE4kQv++h74ocmBVkmQCz1Yd8dc
         LuN3cT6rv98mw1RxXgMt8XOyMIatnUTq2Y+OmNBiJa/FG0PfVUPjZYc7EaFbrezpoJ4T
         djxugK7zQ+mrhjA0Xh6fg+1pkuJzJfGefeRrl1pswvYbLQsevZi+yTc2RXxchiAEmve4
         YmLEMa3JuoaNzoIvEKIWnTNIaRDxr1fEXXgMQP2b++1QUfx+YfGnxJq26R01qPeZT8uS
         64fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TZcOq7hKxXx3xUNt3liO4J9aAze+y1vbTw2JaqLhDlA=;
        b=ZkoqSRltMh6WZuEDa/DzEQel5c/3RnmMSC4u8dMRibDtLPAYZh42XpDtbyjAVV/riu
         zG3m4fjO1IxCSOiQTLUYdpnM2REVL5o43wdrbb9F9+j+Pf2xuBI/XaCnaOyJMtxUQQuR
         cC9Y7gztfz00xmEHT7P2+kSbMi0Ayfj2lylSI3CaIJnivG3AkL7jxde63Wpt7493Ij8F
         AbQC6tXJgAmcfLQrFrzLQuj3mnl/C9ovzPKtwBhQXvnbSVNVMkz35e9v1mOkmfGJ1C0V
         ur/Dh1iYCQCLKvRUmeQBjrqd/fmxOyLwZ0NIouHX5SSM4zlEeeukaVyB43xdENukv61K
         od1Q==
X-Gm-Message-State: AOAM5308lPl7Ak6/HeDeg7HsiFVod4izmD7x43u2zCdgnpTYKNCnU++g
	1ppOGCUo3ql6KZnPwcn/RzuoK1Wm1b5agAVQNcs=
X-Google-Smtp-Source: 
 ABdhPJzpIvtc/odWChYgYFdSy2A/PUQ6eakSVb3od/UiGSqIOZhUVNbST4eYV935lhXEC3E9FAisPyCNjdTDNlPOOMo=
X-Received: by 2002:a17:902:8307:b0:14a:8dc0:8fed with SMTP id
 bd7-20020a170902830700b0014a8dc08fedmr11597408plb.53.1642968276499; Sun, 23
 Jan 2022 12:04:36 -0800 (PST)
MIME-Version: 1.0
References: <20220123120326.37863-1-f_l_k@t-online.de>
 <20220123120326.37863-2-f_l_k@t-online.de>
In-Reply-To: <20220123120326.37863-2-f_l_k@t-online.de>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 23 Jan 2022 21:04:24 +0100
Message-ID: 
 <CALbNGRS5BhZZvRCPhQeh_FZ8Gqo0iAthcq==Cf2YA5HWne4vYw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv3 2/2] packagegroup-gnome-apps.bb: add geary
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jan 2022 20:04:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95023

On Sun, Jan 23, 2022 at 1:04 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
Thanks

Andreas

