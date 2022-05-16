Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B0AC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:11:17 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.155.1652717471865290843
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 09:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EAv9rMpd;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id n8so14897855plh.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 09:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=mclgrOaQ5716Rw/X0eqJt4SHp6oRmgi1X1+e/TdD8vU=;
        b=EAv9rMpddwU3A61kZSkCad9oMLAFmQZB2M40v8CVdbV4jgF/Sq1MeVzQ8+Md0SesrN
         9jiMbEfsuZURqz9PPdY6GTm00QJROKT8az4faMMJ2Ekxji827xjcWy8XviWHUg98x+5w
         PAZkfj5l0jgs1XAk+8DZSnTJ+Sddu1yDQNiS7MMHoDZeDiaWGpJEkJsF8JOVWBurPdM1
         Rtyaa4P0dRpftIjw16Jz3b0o6xU8F20mRpgn5ZgpeubOEKC6vRpcL6W1M3uTZskX/HjY
         F5H09S45/rWP3QCG82VZS8MBzwnktZqmfmaBxKaS9eDWJ5pBak/Nfb75CUqt/fUhLQ4r
         H50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=mclgrOaQ5716Rw/X0eqJt4SHp6oRmgi1X1+e/TdD8vU=;
        b=v4wOQTmikSNvAfdfL+Qasbcuv0sWS64oD8oT+tRwiejOvMFsBHfrfIUDGXDHxiWj/a
         0kYu1Spz8V0HE+SXl+Jv8GorwwUM9NartrMnrdn9Q0Ys4B8lwB06JBT1P155nsq+3Dp5
         XqsFf8OZXNugk1wsPeDrsOoRYlCXpnqjFNn/iAGtS/UluKPdkvPGWV9yoJbX+wFhvOgh
         GFPZ72D2WQTcvnAeovzDMqwEhQKKh3eCj2aWyON+p2epkCpfoKWg9lEa+lsoeZB4KeQz
         oOo++cowVR369AaFCfYm65JLQI+g8C7mm5rG16iqcvjPdQb7uGXsmXiJChD352QXxu+D
         j0ww==
X-Gm-Message-State: AOAM533TSrzZfhFC5crEimEQrFvRoPwxlElbSHas/p2F0XooTmNSRk3M
	URC9tInX2VWwvEX9N0M1iLZ+gQTOIIzekw==
X-Google-Smtp-Source: 
 ABdhPJxDd1BAP8zNwlOaKvG2WZTCfXQPONXcai90znOUoBdcoLXm9M9L2Pv1qevGgNLlBvF1AsNdag==
X-Received: by 2002:a17:902:b703:b0:15e:ea16:2c6e with SMTP id
 d3-20020a170902b70300b0015eea162c6emr18134182pls.100.1652717471330;
        Mon, 16 May 2022 09:11:11 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:c8de:10c7:fa38:24ed?
 ([2601:646:9200:a0f0:c8de:10c7:fa38:24ed])
        by smtp.gmail.com with ESMTPSA id
 a29-20020a62d41d000000b0050dc7628160sm7112306pfh.58.2022.05.16.09.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 09:11:10 -0700 (PDT)
Message-ID: <c322396c-5608-8229-61ef-386b5eb8ea99@gmail.com>
Date: Mon, 16 May 2022 09:11:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [oe] [meta-python] [PATCH] python3-cbor2: upgrade 5.4.2 -> 5.4.3
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>,
 openembedded-devel@lists.openembedded.org
References: <27367.1652715703703621650@lists.openembedded.org>
 <12467.1652716628672205912@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <12467.1652716628672205912@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 16:11:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97139



On 5/16/22 8:57 AM, Ross Burton wrote:
> So this breaks silently because we don't yet check build dependencies when doing the build, which I'm working on.
> 
> The recipe is missing a dependency on setuptools-scm, and our setuptools recipe needs an upgrade.
> 
> Definitely revert this until those are fixed.
> 

reverted.

> Ross
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97136): https://lists.openembedded.org/g/openembedded-devel/message/97136
> Mute This Topic: https://lists.openembedded.org/mt/91054361/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

