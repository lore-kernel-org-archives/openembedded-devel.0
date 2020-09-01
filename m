Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.5512.1598932654067601202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 20:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZYJ+5ee1;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d27so6483698qtg.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 20:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S8i3o+9r9D2p+27Ym/IfxN96sL2UeIZ4bIw1hxor97I=;
        b=ZYJ+5ee1cmnEYWZO8mwfvnUNHzRfI5SQ07x3+2AzPzvKSOZ/cJoZIeJSrxoH9GENt8
         JqlJzEn9584XawXMLazTSgVRRxAFZUrjHm7RPN3hpBPTa80gN+eU57U2i/2Zthve3+TQ
         oESEFXYF1Iv+kz3K6kfyPnroNwCcSPT+Lh+URQD5WJ9Tv7oe00zHuPZgUit1xPYSZiSC
         AOsjlJHNcwQ5DQJQbUhLVe9tJ8QcLnZsiyJ8vqLC4SNjmJU4vqmfNysd2Q6w7YBe12y9
         czTpo/3Ui8NlUGcpZGzpwkk0ZTd2J2HMKnT+WH6+2yOsaOxYnadVDnIXGc6qjS10oejR
         LLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S8i3o+9r9D2p+27Ym/IfxN96sL2UeIZ4bIw1hxor97I=;
        b=QJwJ/CMG1bIBqTPOfASSFsYfrygUbjuX+gfXEjo/pB4xZx3nkQf7j4ItAJhnG7qXL0
         f7omXd1YvqGVElPU0d6fEJnoQg0LyUpwAp8dfELtSZgB2g6NhyG+NUGxIoStlEbtGJcv
         d2mwL4A769K906hbbdoJ0MLDeQPznTpLioWzm0ZityAi/2ka/uUPsfNiUDbGFmX9/FIt
         hcsJuN0b0KaF1tWs21wvvAXnqNoglUu5pEuf8XceAqDGJToOBr9Kj6Cnk5CHcfqu+YVB
         Zvyu2ja2jA+RVhsD79ZV/k4rIRV8o/p3Q9eTT7vfeuckFch/qOn3NcsV0B/xEqzYrw8R
         Jq+Q==
X-Gm-Message-State: AOAM530E35n/fL+BUKeAYuM6IkRYvZBtLZJqSn8bsg2t5DLw1iAHIzJs
	zqAVLz3FbQ8Zz0xgewFliIm74I31UHUMESF7el4=
X-Google-Smtp-Source: ABdhPJxj34LqX6mxmzbrvELiutsjwfPWCBZjesSa/WSTSH6WeoD21dVSa7S3QVLxNZ1MvsK2bDyqKz7vjw2h9n1XDR0=
X-Received: by 2002:ac8:3fcb:: with SMTP id v11mr4237559qtk.80.1598932653131;
 Mon, 31 Aug 2020 20:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <DU6o.1598926318374495688.aMm2@lists.openembedded.org>
 <CAMKF1sodAsUxSE6TDT61mTgG=PjdeOs9WDzVWE-aEp_3xvTRWg@mail.gmail.com> <CAPC6feebJHcUFQOuxm=KtR3+8yrDVFzMZYY-y1H3QKu15NGDnA@mail.gmail.com>
In-Reply-To: <CAPC6feebJHcUFQOuxm=KtR3+8yrDVFzMZYY-y1H3QKu15NGDnA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 31 Aug 2020 20:57:07 -0700
Message-ID: <CAMKF1sqiUTTov37tOU42JWOTc87at2DGce=4TU2J=yx5RG6BSQ@mail.gmail.com>
Subject: Re: [oe] Iperf3.7 SRCREV and License file MD5 #oe
To: Anand Sridharan <sri.deep07@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I would recommend to use devtool to do recipe upgrades

see
https://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html#devtool-upgrading-a-recipe
https://wiki.yoctoproject.org/wiki/TipsAndTricks/Patching_the_source_for_a_recipe

On Mon, Aug 31, 2020 at 8:11 PM Anand Sridharan <sri.deep07@gmail.com> wrote:
>
> Thanks khem,  thats very helpful!
>
> Do you know in general how I could get that srcrev and lic file check sum? say If we would move to 3.8?
>
>
> On Mon, Aug 31, 2020, 7:26 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Look at this from zeus release
>>
>> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb?h=zeus
>>
>> On Mon, Aug 31, 2020 at 7:12 PM <sri.deep07@gmail.com> wrote:
>> >
>> > Hi OE users ,
>> >
>> > how do I find SRCREV and LIC_FILES_CHKSUM from iper3.7 source? I would need to build it on OE using BB recipe.
>> >
>> > I would appreciate to know general procedures to find that out.
>> >
>> > https://github.com/esnet/iperf
>> >
>> > Thanks,
>> > Anand.S 
