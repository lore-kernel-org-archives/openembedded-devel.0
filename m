Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C519BC433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 17:59:53 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.524.1652205591710284991
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 10:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LCWL54MO;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id w3so13781736qkb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 10:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihcvggbb6zUa5tOICCITFDSsIenaMsRzceu2gmHhplI=;
        b=LCWL54MO+XU19MevlaWfRd/1kVPBZ64PgIeS9yI9shC4cLWwJpZN/Cwmt/2/9tJCb2
         Jvx0Dtrr67Cz+WBDmcDtWZ6Csrk2tbpHc4fDJiiifTdMzwZCzHk2rHRQIMOuDyppI5Vm
         6mW1HGNGXzXA4qkTQgUn39oEyw5Jfkyrysaxvl+o6bH3P7RBAxzVCwHlT7sC40QP8XdV
         QadIRXen3k7t+8pflBUvhbp+w6ZnCdnhsBE1vdY/BetDRlAdtXy4ju1rIw++lJ5UtME3
         dVw7VD7o6lLSjL2TpdZ78eCKrDBY3fiRePbGFlUMAQUUb/iLg0z+E6QvEfpJ/XVHsyzm
         Nlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihcvggbb6zUa5tOICCITFDSsIenaMsRzceu2gmHhplI=;
        b=sam4WTGs18XkJLlj39+8ttWbHpOkjKufP4sIq3zfSz2ISy2ecG1JRIDrj1Sj9dM9R8
         ljY8VreXb91pn1o0Cuko7Ls/wHeHN2SHE1olM07tP0LPyb2SDsdhyuBenRU/wA6ybMyt
         ueK50DmWCBPfvf6Xiuo961byNESby3IAgQXE7tLisobu93aFreM7Z0fBMG2szJrb8TB2
         l00hrybcF0+h8xvy9Cnd21Jfli3csEDumfGGyxsnFlO8KfM2umAUw+gXGyI0ROw49cXQ
         ww24/rBwJCM1xnJm0OcmZZ89ceJ8IY19Yw5bL+eYc6LSalLPSq2MTZejMPcBtgtqVbgd
         GDjA==
X-Gm-Message-State: AOAM533RLO/6quvgPjXpH4uP/H2WV6e+iNjFFfiqlVDrfi3YG2SSsJOp
	ddR3z+EfR+fP76j99Nh17NW5so7wPI25LFCoWFM=
X-Google-Smtp-Source: 
 ABdhPJz6Bsay7UBdhw1JA4f5ZKRegbtHba1IA/Tlh/RbqNY5/5OcED6mEXA3/C1naeVIKCdFzkfPfT2e7Pq/iwTGLmU=
X-Received: by 2002:a05:620a:44d0:b0:6a0:3f5a:d810 with SMTP id
 y16-20020a05620a44d000b006a03f5ad810mr16698194qkp.72.1652205590753; Tue, 10
 May 2022 10:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <EEet.1652202105226865187.vgjH@lists.openembedded.org>
In-Reply-To: <EEet.1652202105226865187.vgjH@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 May 2022 10:59:24 -0700
Message-ID: 
 <CAMKF1srhT+=WBhGtuXyrQ59mNf7d8EmwpGwX38D9iWB9eWdaKw@mail.gmail.com>
Subject: Re: [oe] Question about Fluentbit upgrade
To: lravindran@linux.microsoft.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 May 2022 17:59:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97029

On Tue, May 10, 2022 at 10:01 AM <lravindran@linux.microsoft.com> wrote:
>
> Hello,
>
> The current fluentbit version with oe is very old (1.3.5), whereas the latest is 1.9.3. Wondering if there is anything prohibiting us from upgrading the recipe to the latest version.
>

nothing prohibiting, someone has to work on it and send upgrade to mailing list.

> Thanks for looking into this,
> Lekshmi
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97028): https://lists.openembedded.org/g/openembedded-devel/message/97028
> Mute This Topic: https://lists.openembedded.org/mt/91017851/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

