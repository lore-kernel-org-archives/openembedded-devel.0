Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5102C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 07:12:52 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.25226.1643267572110927531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 23:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ogzq9FqW;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id z20so2914326ljo.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 23:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=jZV//HSZ5k3J1x8eNvALZTDIHIkL4yBCEvS8y3MHr/Y=;
        b=ogzq9FqWOIxJ0pF/8PKghTA+yHkKtcaQBAxM0zniFN5pmPhH25aHnoBmIlFnrH8G1Y
         rasq4x5VIBraEl3UpQH6GiBbM8k+EIKLXV8tvD8NOg1/zDTfiGX+/3Zd8g7cc6nKt79c
         zR3UNOj1OJwWtUYypHCA3yOPYPomAIhcH5e+E2/BHRaotYrun07oxImn2gIDtcAef1TT
         9dlMUix8Wn4OyvOTuD67yimGtDd7SEioklikuiyN/2979sJr5Fz6aCNg3UKClG0jIp+5
         J3a373Ap0iv71vOZw2xwbfFqc/rOykDUZtxPG3eLVuRothmny5d5MHFDjK4n9XBLx+qH
         TF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=jZV//HSZ5k3J1x8eNvALZTDIHIkL4yBCEvS8y3MHr/Y=;
        b=C3PrGYCUhKsmq7fDqmv7NoK+m34K9pmbhQKTXx1l0pJGY0XCI+YFTzhlgOgC8VYtfZ
         svBIgivaY3GDx3DFojW5NefH8tetXH2J3VGnGSwacfn+XYkexKvKpFTcCGNjD8RkWggC
         mKamKufJkDE0XUFgip9JRlQjbvuEYwHp5qbLDMtNZQJWNwmHT//QCjvfU7h8ouXhZ6Rg
         jbQuOsuFODIwSalNJ/Wf6a8vOQGcrc70aZPhk/9sMSVwpccRFTZlSj5PvETUUMmA2n3C
         oHX8Ea4RjG1nLGcpcRXGh34nLAeuWezAYTJpwrNuJRJIRBJ+Rf3m4hdb/CZZ3MB/aAZq
         wFUQ==
X-Gm-Message-State: AOAM5339I6zbrkljaY8hujOFLLxcTHU7NzExHi8aswTIHQ4Sexfw5oS4
	qFlcgUabYs74xhDVtsh0DDWhACOvHUXd2g==
X-Google-Smtp-Source: 
 ABdhPJxKG/IyjwKHiDeGa5qdaWxRWOcYDSFFd2zzzQyJIdizRJoxynHUKOvi6qCVI+yd9xZ6pv581w==
X-Received: by 2002:a2e:8689:: with SMTP id l9mr1942660lji.417.1643267570232;
        Wed, 26 Jan 2022 23:12:50 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k2sm1678985lja.104.2022.01.26.23.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 23:12:49 -0800 (PST)
Message-ID: <42b3fb2e-fe47-aac4-4375-66af366ed794@gmail.com>
Date: Thu, 27 Jan 2022 08:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: henning@itconsulting-heinold.de, otavio@ossystems.com.br,
 Richard Leitner <richard.leitner@skidata.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Subject: [meta-java] Merge master-next into master ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 07:12:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95115

Hi,

Can we get master-next merged into master ?

Thanks in advance,
Jacob

