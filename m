Return-Path: <robert.berger.oe.devel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED713C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 17:17:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.2135.1690996636006493715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Aug 2023 10:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SstzNE1+;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: robert.berger.oe.devel@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe24b794e5so1001735e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690996634; x=1691601434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIhGwVDogY54E+t48X8/gY1j6Qe4+nO+blUP1n1w2Lg=;
        b=SstzNE1+t9Hnb/lCuum0Ux3JZf+yiBDTYht+GlqXwlvJ1sMnLwzjseo/e/aAaXJDbX
         wtGUq+oYRQmMCwFFJbdWa0AhVhmPVXwyG5OKEHdBHvvmiLQMywj5TvAARuDYBgEZ1s8V
         4vW+ZApdqnfJO2Q8v/gjO3ylyYNiSqfBTfZggVhH1FCGxjuyS6W2GWP4EGLyyafRogO/
         cuFqkibEgWn+MDfOL8wc2eWC+lpe4i6JHfLDPcTPL6zFsNr11CtLA/Eye2iVIsbzwsoD
         6dS+Mu/dARgOVs0MoFFyYcfv6ZMRXI1aTcAMv4GmhkTja59CwWktghz7x9CKKzhuDfZB
         aLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690996634; x=1691601434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIhGwVDogY54E+t48X8/gY1j6Qe4+nO+blUP1n1w2Lg=;
        b=ITgRrN6gKjiBb4Ka55tEXcd6u/RYodQoBRCsCvCjSCy/oUAqZqTAcq4NzC0wMUcT2k
         mg6cvcB2gRHYqatyecAGtlL35hDRQNYTE2N1/jlmThGLSG4GT/Oi0K7NW14KsRdhMRlq
         eY5L3lUDo9udhIwn24JS95kXykAyWRS6X2SHrArJVNTMXFmJm4vfeuQzEFRX4pajRWSe
         r6958Ie9TXNOcVKdZzZtfabUCHbXsK1hpiU2G+JpADn1bPAQaqGuvkMaW7pEYLNfpNh3
         Msce8Bq256WUCvtG/bRdfSuxBg1p3RjOVwj1I7bWjftwfxTVlydHEy1vGK94laCYq3Sp
         wBBw==
X-Gm-Message-State: ABy/qLa3sH/IvqkXLrxiRMNecosil0K04ftuj8HUNB7Jy1jJf/PblqN8
	G7nmbu9zk/n24fow/k1PUt4=
X-Google-Smtp-Source: APBJJlHu7FwWtPE9u0StbUOaHRdv78kzeTgmBBM4KZlAjG2qv+Hxf10M+L0fjkOPbTP/ZfPo9THEjA==
X-Received: by 2002:a05:600c:2253:b0:3fd:3049:9496 with SMTP id a19-20020a05600c225300b003fd30499496mr5524469wmm.33.1690996634238;
        Wed, 02 Aug 2023 10:17:14 -0700 (PDT)
Received: from [192.168.6.52] (089144205002.atnat0014.highway.webapn.at. [89.144.205.2])
        by smtp.gmail.com with ESMTPSA id y8-20020a7bcd88000000b003fe2b081661sm2213246wmj.30.2023.08.02.10.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 10:17:13 -0700 (PDT)
Message-ID: <5b3a1c91-c013-bfab-d8f8-c7500cfd6c6c@gmail.com>
Date: Wed, 2 Aug 2023 19:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-oe][PATCH] replace /usr/bin/env python -> python3
Content-Language: en-US
To: Martin Jansa <Martin.Jansa@gmail.com>,
 Robert Berger <oecore.mailinglist@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Robert Berger <Robert.Berger@reliableembeddedsystems.com>
References: <20230802170036.9288-1-Robert.Berger@ReliableEmbeddedSystems.com>
 <CA+chaQc-bPFrjQTgJifGf7KF3wo=Uf6V9ibKrDYQeTFi72sJ3w@mail.gmail.com>
From: "robert.berger.oe.devel" <robert.berger.oe.devel@gmail.com>
In-Reply-To: <CA+chaQc-bPFrjQTgJifGf7KF3wo=Uf6V9ibKrDYQeTFi72sJ3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 17:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104206

Hi,

On 02/08/2023 19:07, Martin Jansa wrote:
> Does it work when you re-execute do_configure or do you get python33? I 
> think you should anchor the regexp with '$'.

I think you are right - Let me play around a bit and I'll send v2.

-- 
Robert Berger
Embedded Software Evangelist

Reliable Embedded Systems
Consulting Training Engineering
URL: https://www.reliableembeddedsystems.com

Schedule a web meeting:
https://calendly.com/reliableembeddedsystems/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--


