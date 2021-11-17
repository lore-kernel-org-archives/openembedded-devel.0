Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9359C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 16:58:30 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.9898.1637168309692504063
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o6H0Usuq;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id f18so11720432lfv.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3q5MdRvjh5GUjC8TVi9rKQOtE5BaiHQyoCwixMBAXiA=;
        b=o6H0Usuqb3j40KRYjiWxzHpUUM4dZpKbAgUTXixpgyAM8y0WInDGIPBNn0/3ngiIkk
         vM3TSZoRJdxSkSaq0q/pDpWejqFNO3sFZHx2Ee1JoSamy3jbeEG9nW/16d8RdiqLefX9
         TynJHMUs/WtiBnfSDUM0Ia8GvwznYbVZtgFT1NMMBDhAH18mgra/UE745polK2/jPABp
         caco502KyhtSvB8fsCy+QRxEkcw5mXqnDTqqTYj03s/cgtqNGUBRBJLnmmaH/yGO1auH
         zJlGbjCjK69KaVGugLUBZkwAA0CftDwe6R8etRrw8p5ipu1XKqPDM7f2G+iHemWX15z6
         90sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3q5MdRvjh5GUjC8TVi9rKQOtE5BaiHQyoCwixMBAXiA=;
        b=kO4u0uP5Yb6Kp0LdpV6AXi8d/Xu99BaSxJxvk52SeXztWng7fhoQ1gB2CE/7sy8wvj
         UN1NuqNnjP5R44EeTKq5Nu5h0ya14erLrM1p6aiQecqQ4IRGR+0KS6JhrF4CbWxJ+AcG
         4wrmzOpxa/D7Xyw2k0gig2mektNZo3tG8Z9LQItdFkZxvaX3XED/21FRh6WnPX9NLaW5
         /ronSvkR4DjrOgLPIf4ukq5iYvlTTJaVan2B/5mLzzhPqy/42uFmRPD3ygYBsnCUA4sg
         CMGFZnMi2n3Lfya1IAfUkgEjnG+dsPw4mdzOhELAP1DjVtrSXaZWm0aYhcRwLVyPT9xe
         rHMw==
X-Gm-Message-State: AOAM531RXQCtlgkz1K29zZstViXYnspOaOwJKZH0Xz9qaWrGdoUqWCtt
	yRlJLnNhO16ZWdh8Uws5yMU=
X-Google-Smtp-Source: 
 ABdhPJzr7vSXLxJQGE4I1iPlapGIJBrnc8bmdLBt16qIsTm9X0B4B6Tkr2P7xmYmK30z43OsPhW6JA==
X-Received: by 2002:ac2:4e14:: with SMTP id
 e20mr16560903lfr.165.1637168308084;
        Wed, 17 Nov 2021 08:58:28 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id c6sm41010ljn.84.2021.11.17.08.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 08:58:27 -0800 (PST)
Message-ID: <c9c3e984-21d1-4547-abdd-2defa9e66bf4@gmail.com>
Date: Wed, 17 Nov 2021 17:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [oe] [meta-java][PATCH 1/2] jamvm: Set git branch
Content-Language: en-US
To: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20211117070958.64782-1-jacob.kroon@gmail.com>
 <YZUrtnrEbKpjceM2@ltleri2>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <YZUrtnrEbKpjceM2@ltleri2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 16:58:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94004

Hi Richard,

On 11/17/21 17:20, Richard Leitner - SKIDATA wrote:
> Hi Jacob,
> 
> thanks for the patches!
> I've just added them to master-next.
> 
> Another question as you might know advice:
> How may I apply those messages from groups.io using "git am" without
> having to adapt the "From:" for every single message? Is there any
> "trick" you know about?
> 

Hmm sorry no, I don't use the groups.io web-interface. I figured 
maintainers usually use their local mbox:es when applying patches from 
email ?

/Jacob

