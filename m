Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB527C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 18:40:42 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.859.1646160041924787080
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 10:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cxs/kZnJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so2646892pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 10:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bv4mWmQkGbc04e1rNvHOD28ZvdRBAJoJT4wUmlbeYZg=;
        b=cxs/kZnJ6dZEa00L05vRzfDKMWqndBSKAm6PkS1PTaBRsIZCeqvl9v1kVGViBA1M6q
         Q+m8pnGAAH/QdkmWxm3bz0PbUAWXOu76MWjYjG2bd0oYhniYQ8F/QSBOlzeSndasOYIg
         08u6p9AJdyMVhhi72Uctvc8cu2ZNzNykJQttGTl49cTe8MDDTo+rkG9NSQDVOgCKLb+W
         mAF6nm0K9bVKbb7ONuOiT4BKM/0zFCR808X5QqPoFm2xHjEKcZwVEVenACRia5QzW0Sc
         FYYqyyPa9gCnpEU9cJybaSWahCcnFw3sWVQYQr7L1sGPAW3ngtKf/tmio15BXsvD6ACg
         a78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bv4mWmQkGbc04e1rNvHOD28ZvdRBAJoJT4wUmlbeYZg=;
        b=0LE11nbYpJ07ui5msB8zrRwTi95Xiz85rxicgZ2lA25Kpv/qVpzRVuDgWrtafq+Tix
         rCfJVHTvEfRjdMDppeqdtTQjOanlKEGb/jUNJZovj0Gr/XdwD5GEuEnC6T89ZXne26jH
         mSalNNEK+LJUTfEaj+Byip52YUWj/6oXIrW8so11PGJFRc8F+f1FfJm44jSL850ccdjL
         eExYSt3cZcbuGZvUuAl3G8xMAegDbYgxLoDCgGnFFa03UPtnR5hY7CjangoXqDKPmRps
         KebnRgCex6eRTQt/NDXao3nC6UIw9rcLtau3aGYTXDuhtPrvgdS3heL2stmuXuGmFIpY
         PlwA==
X-Gm-Message-State: AOAM531PWYQ8F1MEnZMy6qjKNcrnJFLeY+yOuZWormjHeltgixEIYu37
	BmyXjjB5EImJIqrgRkj1vyWNCvIGGq3uepLVORU=
X-Google-Smtp-Source: 
 ABdhPJythloFx7KpZX3sz0nCTVHdfSZ3dysAi2qkwoAsS6T49HsEXUCxDthoRF9Fl6oaUVF3W1Rc+igEY0/mjS1hMAc=
X-Received: by 2002:a17:902:d4d1:b0:150:1d1c:30bd with SMTP id
 o17-20020a170902d4d100b001501d1c30bdmr25167367plg.1.1646160041258; Tue, 01
 Mar 2022 10:40:41 -0800 (PST)
MIME-Version: 1.0
References: <20220301161346.700028-1-adrian.freihofer@siemens.com>
In-Reply-To: <20220301161346.700028-1-adrian.freihofer@siemens.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 1 Mar 2022 19:40:29 +0100
Message-ID: 
 <CALbNGRSuvB0i-T9-_8m6Cpw698ssHEK0QSbOQs5VuP97tyvN2g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] networkmanager: switch to meson
 and git
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 18:40:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95644

On Tue, Mar 1, 2022 at 5:13 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> - Switch to meson build-system
> - Switch to git download (was not really possible with autotools)
Why switch to git?

Cheers

Andreas

