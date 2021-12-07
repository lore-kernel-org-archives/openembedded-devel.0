Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2465DC433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 12:04:01 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.66214.1638878640155309548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 04:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cS8+NiZI;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id e11so26886163ljo.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 04:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8r/lNWKl41K+6LYaXQdGlANeTHnC+Urf1yvtIECCVOk=;
        b=cS8+NiZIioB7/Q1ahH8Q8z11B2ClFYyybbsPwx80MbhtQcwgRbENVDkW2evURInEN9
         nL3UTVHhTyP5izMaiY1qslRSPLNkSkfq9Ik0jLx0u0xLTbQ6w0IpB23KRmRy8putO7LM
         a8H+vcebPUy43/aSRieU2lot+BCy/7H+hw9XbRtYHkoWmKmb2pIHjQC1p9CKyzO/QBYg
         qTbU2Y1ZqcqvOiVs1UdP7mti6kThjrFsdWnl6xuNXt+QOAB/R/YBoGE90quic59fHASB
         FPn67KGI2dHV6R3zt0BitemdZoyxk4+LX5oGXP9QzzklVC8/g5f7iCFzwKlJXvyW8UW9
         yuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8r/lNWKl41K+6LYaXQdGlANeTHnC+Urf1yvtIECCVOk=;
        b=Xq1Z3rq5/xMcGa+vfP3PHSb1V2Jx/KXODtrHrJPL70QNKQtJBmLqRZ5wLoH7ZWb3vT
         sBeijvWUgtjawjYdXASyJDw8rSZ0dmCuY9q9l4Q2lC0iH25CPYMSjmVwVUA+SMcgNiBs
         NyyUGibbZhJMXYu/uT6AY1+05CTsvKPgULCJ3iX3NKF3se2KwUBr52TC3suxgoZe04D2
         X6hnY4Is2U0PPGDE+ZIPMK6K+RNZIED5wDzpO4+k0N/v2ThJ+pMuH6rFMRX7nUQ89FSj
         sjbna0JB+WXC3lNTk1jh/QQmJYnaonaqqOTFvxZIMUC6EvY5EmzJmaQWcOQLAm0dTyWk
         sJnw==
X-Gm-Message-State: AOAM532OZHlJ6+8mCTXkYiYnlZh14Lqb/HmCqBMLjTw/LPCOLXWd6zWh
	Hf8Sh33dYqAEmllaZaqB76g=
X-Google-Smtp-Source: 
 ABdhPJzB3LcDBBgLnr5Km3mYWp/Mipq2tarlnQWLOGavwRQiaKoUuUvSWDy9EhIEnRA1aXNEs7V+4Q==
X-Received: by 2002:a2e:bf20:: with SMTP id c32mr4331672ljr.53.1638878638322;
        Tue, 07 Dec 2021 04:03:58 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 h1sm1664878lfp.249.2021.12.07.04.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 04:03:57 -0800 (PST)
Message-ID: <968b00aa-5756-dfd0-51ed-72a462de0ff3@gmail.com>
Date: Tue, 7 Dec 2021 13:03:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, Alexander Kanavin <alex@linutronix.de>
References: <20211207113954.8959-1-marex@denx.de>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20211207113954.8959-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 12:04:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94228

On 12/7/21 12:39, Marek Vasut wrote:
> The build system might have put something into DEPENDS already,
> adhere to the recommended best practice and use DEPENDS:append
> to avoid overriding the DEPENDS set by the build system.
> 

Which document states that this is considered best practice ?

Jacob

