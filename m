Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686FAC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 23:31:15 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.4118.1644276674260286698
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 15:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lMuZA6gl;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: festevam@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id f17so16495731edd.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 15:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgsH5QzJYEiNdTyJfkNdKJZ8bb/EX4PPfs8ILZaC690=;
        b=lMuZA6glm/dUWV+65/hRwrfhTcFTWwwFcMcmsb2T2iXnKXSyA6ojgz3rpzwiuoxjRS
         29pm3844zryEqF6nwzmkXFLrLJkWHlhNdU3E+OnPgXVn1P17sJkTbrqIlDuXgqo8lX61
         30yVK3Xf+7U0RP7NoLUoCmJPCPton7nY/S39FeLKzxjZfUcf+R3HbwVWCslYsydIKBBY
         Q8ii/iJcEucaYJ7Vlu8BQ8swAHqEKKTOzbC9bx9aKZunuAxUN2mgACiwySy0YjT1lukL
         nnCUASyVsITx7Y397S/3Lmr/vfeXnuJN6m0BR/gM/QNMeFVsyL9ftrvqHpGQylThE56j
         JuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgsH5QzJYEiNdTyJfkNdKJZ8bb/EX4PPfs8ILZaC690=;
        b=pUEF1RfZLVeTkguTNqm2OpRUOgZ+wP+XQZf6inU9qnr4H0JFQ2h3l94aL9ARUEfxB1
         mPyjL+GFuxQ0879iMfPVKoOuOp4VtQaaxMDNbvcanmRHTv5Z9g2aWQ8brMnWDQ4qf/PW
         LJEbmLUxrnZpX7W7wkcMGg+ajWjGxKmGn76NU7RmcAkLhMB7EH4CDa/TqrflTLZfJ7Ka
         HzlVQOwftBQfm1eH8k96vnfD0vGOwxnd3l6MzXUo/BY+6Ilub6sdWX/K6kn/33tFWQHM
         VIBooUQgKydPrTFXQ6GN0LWlvCtc5AnUZd6sER5WyG2RV8eOUSiLM/Gb5H1qMw44uDFQ
         FwFw==
X-Gm-Message-State: AOAM531Hcmt9CrQ/z73vnalulXC5MSF7MQtkx0ZyngpkSbScl23+o6Fe
	lXS/bBkIK8fPy4zGvGeJ4NI7NQ7r9XyqXPBj5g4=
X-Google-Smtp-Source: 
 ABdhPJzbbeReFopXY51kQTWr1gYthi5Onwpta9/IKMVIi3/lPIw+EDRGInDHfgkR0cPhgKfvvqI+uelyFX+0vEsDo/w=
X-Received: by 2002:a05:6402:358e:: with SMTP id
 y14mr1844766edc.136.1644276672724;
 Mon, 07 Feb 2022 15:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20220128195459.216370-1-festevam@gmail.com>
 <CAP9ODKo=OPqMvbuP1p6zJSPFObxskdaBPjVW8M2LKLQ3rzwHgg@mail.gmail.com>
 <CAOMZO5BJfkfo0vecgy6bHBJCfd8vGHb34zpcqTs9WXZUVW2q-Q@mail.gmail.com>
 <CAMKF1sotEuza4_SjKEHqGQXSN=Xq6mL2pJjJV66S9WsWCFjpfA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sotEuza4_SjKEHqGQXSN=Xq6mL2pJjJV66S9WsWCFjpfA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 7 Feb 2022 20:31:01 -0300
Message-ID: 
 <CAOMZO5BtUFYKMGcYS_Byg9XXmtQsd-1PKxWkB3K6KikxEWXX+Q@mail.gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 23:31:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95250

Hi Khem,

On Mon, Feb 7, 2022 at 8:21 PM Khem Raj <raj.khem@gmail.com> wrote:

> Yes it should be in master

Sorry, I don't see it in master yet:
https://github.com/openembedded/meta-openembedded/tree/master/meta-oe/recipes-support

