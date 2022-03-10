Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF49C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 05:02:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.6388.1646888561939719221
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 21:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RmBYY4M/;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id n2so3863550plf.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 21:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=1MSE7/4NBGap+W1j2UbRCLpLl00e/5q4mcZh2q9c7OY=;
        b=RmBYY4M/pAUF3OB5mkedgO5yIXHC1W/xPR700rlJipWX1aJ6CEoZI/CH9G7sMC0e7e
         3R7JgdYwFql8o7kcqfw5OjZJn8P0j8VGfYp6NA9kWJoiVsLO9gR2urOU1wuwumhYg8Uv
         6fQxF4+KJQLPumHZhxfvl2i90vTJxWwq3dfL5rZyffGQkXopKKmSvvF1+i37wy2dcqSt
         /Ju/GfnUKu4moI5m9/J/x6BNV93GeLOpJdOBERM1cF3PaqYKTPIaldvO9BW4XMwY6gCA
         jljB1btnW5bhNeBPtvzK8RZmLCW4Je8sLUR3XTotSeiqrxFDf6sE/ce0B1jzUeIzJKyb
         Arhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1MSE7/4NBGap+W1j2UbRCLpLl00e/5q4mcZh2q9c7OY=;
        b=pgIj3ND7oIfxi33jagRrk3o0s41biaPEMciHunFG3dmW5ACV6A5OYbAXJgHQaSVdsR
         M43Hd5T2VCi7vIP6uDQnSZ2Ztr0Pur9jdBlWY/Ro0/L74dLJbm+adVudonlXzqpPqPFe
         uJYsea03bN+ZIbKp4AW9k6D0Y3tuydwWtWnDOgH/wmW5OuXAlwJZ8W/30+DUAvCMrTUr
         fwGoz4qvryf/ERxGW9o8sYw5jmUJ3e6VbilojLsVeAU1sPe4KvA4MDxnRNDqzxSZtWBG
         YSPUm8b68F+d9u0aDyGdmyw+KkzjADvFrbB2YPcwMHzgrsmgY3kVsZhoT2wP9+uxhFb9
         +yaQ==
X-Gm-Message-State: AOAM531cbQNkZeFuX6SQNVLQng0AyTJLPM0GLSZwMzS/y/DyQL4j1AuM
	5hyQ8VzOoG/hn2qjpk1DEyc=
X-Google-Smtp-Source: 
 ABdhPJzzqjzxRf6ag0YCmkhh2QHp8C7Laq4gm8Ii3ScM1Niug8TG0IokEJ/sExZeCFs6qVszwtZUOg==
X-Received: by 2002:a17:90a:faa:b0:1bf:b996:42c0 with SMTP id
 39-20020a17090a0faa00b001bfb99642c0mr3114817pjz.197.1646888561480;
        Wed, 09 Mar 2022 21:02:41 -0800 (PST)
Received: from [10.21.12.132] ([12.186.46.6])
        by smtp.gmail.com with ESMTPSA id
 k22-20020aa788d6000000b004f73278d1aasm5051237pff.138.2022.03.09.21.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 21:02:40 -0800 (PST)
Message-ID: <cb279bf8-bcbb-16cd-5e42-078ad181e4c1@gmail.com>
Date: Wed, 9 Mar 2022 21:02:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][dunfell][PATCH] p7zip: build and package lib7z.so
 needed for fastboot
Content-Language: en-US
To: akash.hadke@kpit.com, openembedded-devel@lists.openembedded.org
References: <777eceb3-6341-21ef-34f4-00e6c552d96c@gmail.com>
 <28973.1646633028649902215@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <28973.1646633028649902215@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 05:02:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95917



On 3/6/22 22:03, akash hadke via lists.openembedded.org wrote:
> Hi Armin,
>
> Do you want me to add 'Upstream-Status:' in 
> 'change_numMethods_from_bool_to_unsigned.patch'? Its already present 
> as 'Pending'.

If only I could read. I just saw it

- armin.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95832): https://lists.openembedded.org/g/openembedded-devel/message/95832
> Mute This Topic: https://lists.openembedded.org/mt/89497302/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


