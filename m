Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FB6C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 13:57:38 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.47632.1669384657890310739
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 05:57:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XfwEGcF0;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id a29so7020214lfj.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 05:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adEJ8nhGZ7X9oHuWI6iAumymGyo1EBKa0AUm/Qdiv5k=;
        b=XfwEGcF036UuBQ8edwaYcoIbZsQhHf6bvWigcPMxFnaee3dlVPVyOH7R8meAXyy9ce
         2nlWjSif6kbPnERY80b0jq+3cVhtP7kgiYRrTOzviPfGQZekgk65SoaaRC/Wz6E7+JMW
         hd9d3V7mCFvMNrzFn33Lt7IHq9AH1RcKVsIid38bKdk5vTKyRs/nbTQcqp+Az9lgnYKE
         51nwStRHwlxrk2rc7HxlKh4zmG2biabBsqHrPOpGY9I1oqdYgjXFnl2mGFKM+EF/b9KH
         Fu/Gxqf4VxbSuIQoFc6/AJJzKJdHZ+Cll+Rbbf9LvyqbZnLAxH34E60nwe1uJcDiX/GQ
         awGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adEJ8nhGZ7X9oHuWI6iAumymGyo1EBKa0AUm/Qdiv5k=;
        b=0ZZ3V1/Bh6pk/eTSm3poxpGtuAFK22ukBHAvBCsxS0e2oRuCHMfdLTqCZ7T4VLhTN6
         EQ7Va43dI3kXP30Ijv2YrMCH9WfXpPQjLepBveevDtumXLDcNwTfNORa7APoHPEzI+8d
         2Nk3nO0IVeAcuaCqilNeQUuhgxTQ9upIwKbPsd7o+Fluhk78tSkR78IfG8Au4V2PaH/W
         Bj+/fSyFlAhUqvtgwX98prUOWy6FaaDnrH5zvwZgZl5KdhWtsz6BB+h79T5WY7dT6AlF
         yNEkLU3TJLQhopcd9hthoreyTjygat0wZRXN8ZaPEV+Wu6jQ0mTX1tj8Q2JWYCq85i6V
         NgRw==
X-Gm-Message-State: ANoB5pmJxQEj5VeU/pI2RP6SlhTOxSB77sDBFa2+VCgze/XhZVJcBTUQ
	urFqxyI495/ePOuS/O75++0=
X-Google-Smtp-Source: AA0mqf4UVRwlJKx+QGbWi+u9t6NWSY8rgnbp8FLlRg/N9VAEAQ7rUzP0zPfessyyjroJQsVT/D9Vjg==
X-Received: by 2002:a05:6512:b9a:b0:4ae:611c:6549 with SMTP id b26-20020a0565120b9a00b004ae611c6549mr15069034lfv.231.1669384655900;
        Fri, 25 Nov 2022 05:57:35 -0800 (PST)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se. [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id m21-20020a197115000000b004b4b5bde0c2sm523659lfc.279.2022.11.25.05.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 05:57:34 -0800 (PST)
Message-ID: <14384172-6b21-6a13-5896-c25c081ef08b@gmail.com>
Date: Fri, 25 Nov 2022 14:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [oe] [meta-java][PATCH] jsch: switch to inclusive language
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>,
 openembedded-devel@lists.openembedded.org
Cc: Henning Heinold <henning@itconsulting-heinold.de>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Richard Leitner <richard.leitner@skidata.com>
References: <20221125123532.938920-1-u.oelmann@pengutronix.de>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20221125123532.938920-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 13:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99731

On 11/25/22 13:35, Ulrich Ölmann wrote:
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> ---
>   recipes-core/jcraft/jsch_0.1.40.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
> index 07d5b9e3108e..259712661f4d 100644
> --- a/recipes-core/jcraft/jsch_0.1.40.bb
> +++ b/recipes-core/jcraft/jsch_0.1.40.bb
> @@ -25,8 +25,8 @@ do_compile() {
>   SRC_URI[md5sum] = "b59cec19a487e95aed68378976b4b566"
>   SRC_URI[sha256sum] = "ca9d2ae08fd7a8983fb00d04f0f0c216a985218a5eb364ff9bee73870f28e097"
>   
> -# Whitelist the CVE because it only affects Windows platforms
> -CVE_CHECK_WHITELIST += "CVE-2016-5725"
> +# Ignore the CVE because it only affects Windows platforms
> +CVE_CHECK_IGNORE += "CVE-2016-5725"
>   
>   BBCLASSEXTEND = "native"
>   

Also your commit:

3161106f0879a6be0a016df3a8bb8fa800bd6044
openjdk-8: refresh patches

seems to have *introduced* fuzz warnings, rather than fix any on master 
branch ...

Jacob

