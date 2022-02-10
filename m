Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45E0C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 17:37:26 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.13477.1644514646066208822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 09:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lE08RYCJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: festevam@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id u18so12192423edt.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k9QBqB9pF6zoizqIks+zwI5wIImmoyCCvVIVF+5TxoY=;
        b=lE08RYCJ8rd/jlUYUnUBZZ/e+VsshWXJTErdcmd+oMLL3JNY9Hev6+c70/wkYkXIW+
         a2U0GJdoMnIcWQwOOv1lP892LP1cqqKYmry6/HFb+JDL2rBDELmWzgygyAd/Beuqv4Fs
         ncE9qE1X5Izc8VL1mlbx3D+12R8mZUiXUWbSB+gvx4fxqEfdln+iXCRas9SZKdMm+FgX
         Nck95WNc0hB8IE2I3hJ7yOdt/SZVlri1Jim4iDthDziD92Nth3CpRikm5vP4cRqjEXr8
         9hs8t/H/hY9JYb7qyArc1+U+dOf/H8E+2kRYOkePPpvWpVZUTyIZwJjX+UyudOfyXZPR
         HGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k9QBqB9pF6zoizqIks+zwI5wIImmoyCCvVIVF+5TxoY=;
        b=K4NJATeB0C/6eWs7cSceeNzmoXrObaG9tRbOlO8Paz+3xD49cAaxSI4P9cK1XaHIBq
         bv0VvMwneI9COmM8Hn3aUDNIJHMMA7lDMbPiQTayrR8NScQkN60k71RVE2Ubin7MWCD2
         rGFlybBn4GvlYl00upMrian+bxDTf5Ii84egLx/T25Qobaj7BE7ZS8IDN40eIVbsgwNo
         ugpjk/d3yeFElw0FETW9lTEZXIpWlCPosnHg2Wvep5oT6AUqPmpoYnO732pSe+ME1kDF
         Lkz9Vu9SVzybnyOZBdidhz3fLPgmnlNM4wGFFQi8BPKToReQv2ug9CF0Y8RUMkgvplBV
         hPEw==
X-Gm-Message-State: AOAM530wGYoiiR9H6FiMURgUB39WI8Buk2fU9SgQqhqKgsiwwFGhR8p/
	1IrECwcQDstrp6tKQj/HnM6SLq9KgHAPKRsch4c=
X-Google-Smtp-Source: 
 ABdhPJzW0IpZYx+FEk/4WgbeoHWd+UrU1Biu4TyR0ZyEunrXpSbPo2+nR7P70XcE/zGkwM//LToLsskJbqlyV8Hgh6M=
X-Received: by 2002:a50:ab16:: with SMTP id s22mr7850660edc.287.1644514644613;
 Thu, 10 Feb 2022 09:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20220128195459.216370-1-festevam@gmail.com>
 <CAP9ODKo=OPqMvbuP1p6zJSPFObxskdaBPjVW8M2LKLQ3rzwHgg@mail.gmail.com>
 <CAOMZO5BJfkfo0vecgy6bHBJCfd8vGHb34zpcqTs9WXZUVW2q-Q@mail.gmail.com>
 <CAMKF1sotEuza4_SjKEHqGQXSN=Xq6mL2pJjJV66S9WsWCFjpfA@mail.gmail.com>
 <CAOMZO5BtUFYKMGcYS_Byg9XXmtQsd-1PKxWkB3K6KikxEWXX+Q@mail.gmail.com>
In-Reply-To: 
 <CAOMZO5BtUFYKMGcYS_Byg9XXmtQsd-1PKxWkB3K6KikxEWXX+Q@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 10 Feb 2022 14:37:14 -0300
Message-ID: 
 <CAOMZO5Dj0yFLDOq7_kT6ZOB1Lt5obPLArb44CTjFu2WoN7-b6Q@mail.gmail.com>
Subject: Re: [PATCH v4 meta-oe] rtc-tools: Add a recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre BELLONI <alexandre.belloni@bootlin.com>,
 Fabio Estevam <festevam@denx.de>,
	Heiko Schocher <hs@denx.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 17:37:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95292

On Mon, Feb 7, 2022 at 8:31 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Khem,
>
> On Mon, Feb 7, 2022 at 8:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> > Yes it should be in master
>
> Sorry, I don't see it in master yet:
> https://github.com/openembedded/meta-openembedded/tree/master/meta-oe/recipes-support

I can see it in master now, thanks.

