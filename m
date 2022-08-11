Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE23C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 18:10:00 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web12.1128.1660241391156578995
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 11:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HnvmlbdQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-32269d60830so180977377b3.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kFv1/j1b+mAwmU6BRe8zOS3J30UhCxy7RUE7MXcjYU4=;
        b=HnvmlbdQ9C6ccCP6zHbDi2yb5bx1/++BteHPsxJsU46XuHoQOEUKEvyVqQkmrNii2L
         LSdUikEmBaYz+IZCtbIEAtM2Sa3woSGxCt9tI+p9jcFOsCfKJ1IapXztYYPafifnc1LJ
         902VV2Ab3k/m+SLjnlevqWPbAxJsmGj1g93k8irllJhadVtfvVg/U7sAkPAvhNbpF2lV
         2Jb3FuDvFtl5CuOiUf0jLkBpnl4Kb6Bp9y9RtrxdCiD2d0GLLOLaQrSv9wlwTsI5Hi0C
         dR7vKF9lAPAd7HDDG61C7LGUcZquSaQOWzyCstjOmZDnOICVjA/uh7JOia4qBnyqspIT
         kBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kFv1/j1b+mAwmU6BRe8zOS3J30UhCxy7RUE7MXcjYU4=;
        b=WOgVJBqEolQGkpqWS7Hub/wl/gSBhpyEOyOV/OH0LPWFleH2oL8ZiU2B57iQMtcEjD
         MXSE2tWnD8QRprM+EhNoCO/CdJcT5jfYGwI6y5S8g7DCB2JnTAdTmVoaPX/ql5p1HW5d
         PbVDwasOY+PhqKW737f+wjQY7soLytRE3YXdqCYfRRLkoKlddb79th/qxjAeewqqWyop
         4MXX2jieRvHeEZD5aSqnONt0pGwK1S4VYVGqMaIB/ZvhM/NdkKk8Vs9ODWHTzJ7ncNpA
         BoyTMAQvxUmTkfV8MJKfODMfNoHS11Afra85kqGW9Wo6Ki6wwhAvX3KVH0P/ecj8Io2Z
         9bnA==
X-Gm-Message-State: ACgBeo3scL+z6g+yiQGtPjft0G20CcYDymdPxiYbk9F4KyLdlK4mtHoX
	u7bazMInCMgVTtwFS+duN0ZrYgq5qASTId6wZLc=
X-Google-Smtp-Source: 
 AA6agR4RvxZlFksRHvkiZnnobfEIOCfzPeW2wzQzTpxmV9cmT14/qXj3ooLX8BAprHB1iJKD+2hkbXjnBnuNyACXjOE=
X-Received: by 2002:a81:490d:0:b0:324:5fe9:d637 with SMTP id
 w13-20020a81490d000000b003245fe9d637mr441205ywa.162.1660241390279; Thu, 11
 Aug 2022 11:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <1660218106833.79133@amazon.de>
In-Reply-To: <1660218106833.79133@amazon.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Aug 2022 11:09:22 -0700
Message-ID: 
 <CAMKF1sptrUh13qQExaTXJ8ttm+ezWV62eP4TNQjhtrzDhq58TA@mail.gmail.com>
Subject: Re: [oe] yocto-check-layer errors in meta-python (gatesgarth and
 hardknott release)
To: throos@amazon.de
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	"Glimsdale, Nathan" <glimsdal@amazon.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Aug 2022 18:10:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98198

On Thu, Aug 11, 2022 at 4:42 AM Thomas Roos via lists.openembedded.org
<throos=amazon.de@lists.openembedded.org> wrote:
>
> Hi,
>
> we (meta-aws) like to get "Yocto Project Compatible" status for gatesgarth and hardknott, but yocto-check-layer errors on dependend layers (meta-python) do not allow us to get the status.
>
> - is there any chance that they will be fixed in gatesgarth and hardknott?
>
> - do we have other possibilities?

We only got the compatibility requirements implemented for few
meta-openembedded layers including meta-python just in time for
kirkstone release, anything before that is hard to say what the issues
are
and fact that gatesgarth and hardknott are EOLed releases it makes
things a bit harder.

>
> Error logs: https://bpa.st/BTNA
>
> Cheers,
>
> Thomas
>
>
>
>
> Amazon Web Services EMEA SARL
> 38 avenue John F. Kennedy, L-1855 Luxembourg
> Sitz der Gesellschaft: L-1855 Luxemburg
> eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284
>
> Amazon Web Services EMEA SARL, Niederlassung Deutschland
> Marcel-Breuer-Str. 12, D-80807 Muenchen
> Sitz der Zweigniederlassung: Muenchen
> eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98196): https://lists.openembedded.org/g/openembedded-devel/message/98196
> Mute This Topic: https://lists.openembedded.org/mt/92956260/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

