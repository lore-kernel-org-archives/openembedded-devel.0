Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464D5CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 07:24:30 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.8293.1758180263937661627
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 00:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cPLWQCaW;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b042cc3954fso116746366b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 00:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758180262; x=1758785062; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hfiMQDejz9Yo/kSfo/A4meExVT4lMT04QV7TRMuPgyc=;
        b=cPLWQCaW0+00fCFPpQXtWA3SSPaErPbesJeoFrvWVUgj0yROPdklBNON/+c4D+OA19
         OLxyshb6AU0y7RkKxQGhPK1b6+aN66v104C3WxtY+3RVtV8asX/foX9kMKk6YKxzsACI
         Biwb5N/H5TksTCuV9Wx2mp1Ks0Ov8n4YI4sNumwrQyFfnaqbx97BbT8lUdETv85PRxRU
         /mJSWi3+Yha+oHvQlN5fORNL7enxeg4/OSs5RVtJob8bAantaQ1mmEg+zspltAtAayFB
         coRPnkgMmHxaE2M4+rFxI7OfUCDOJXvi/a2psaBCyJPVDl43mSk/wMF7FxVBTA1UqmSU
         fFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758180262; x=1758785062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfiMQDejz9Yo/kSfo/A4meExVT4lMT04QV7TRMuPgyc=;
        b=J0Z6H6vzZE43jB88NuHtFJOivDRpzBIqr3ikt4Dvei9aTa163mB9WjwfAUV3Iv+lNG
         YyuluA8d1A++XyBECKrtZE1gFwt9us+FN5MAbLeJSXCv8UEAIAAIZMwSmtFdM+azs7KM
         pCUdrRZcYqMh5peRnEe36T2RCqmR4pp0Ak5oixER6PfD21Ll5x4oJnFbdPVnEA/dXRC0
         QjSBd1X1DoIoz2AneHEHmXX6lpnrGq9wwE5DsnXexzOmldwetzMz1mqwuBb+VKb/85PT
         hAoEyIdKLcu8mGdt9PoQgisQKEHbC875zArwvL1Uwwxw0+W07aNQWh4f6fdcpptgMLge
         WkpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNvjfl8+VM28QFUvl6GLcQhtHsckxRnLdT1F5HU0q90Ilze9rrG93E7zKOKDm7Ak3+u5hjuac7+U+5Ki33RggjTME=@lists.openembedded.org
X-Gm-Message-State: AOJu0YybSWpQUacVokrGJJQlTXZWTIA0F663jp6QAo/hVqw3MJ11xmK2
	TityPcX3+ECackxs8qY8GN8+ZHm2ih5KSyxF9iStDZzw4WBLfcXnNhHY
X-Gm-Gg: ASbGncsPj62L6TVqZEZo8ojaFdLemCruJb9sP9KMP1YeNEucLxC7z5HpC4Pv6G2te9Y
	tvNiGZ8JWvWAp6pRdh5dcDxS3McGSXda2v7aVpeJlvuTHP9iZoOINOmKX4xZcRIYO8HhQh//5OB
	v3PZOXtSUYrjSlC/Jz4z2hJFW6j6zggiM3kRnnUJLdzUHNruK8sbpP0sLs5NzDTwX/ECSg+4xOQ
	nKVtcvVPUUDbCOItVbuWxA8A5DUcQxYyMIUk9whnfM1bwmP0NbIfqZZa7zaRIAjEnnMBhfB5WjW
	ZTHRmeQ3JFC/vPUtX7wQNgOv/l+J6IeobFDBpMfr3i/gGoOQlH2vypShEiBBuI4lQFylGn/Wj6y
	LJc5PpHbPUtZzZg2vhCTjklmiHztkdXBeldqAY3AgdVPskySIAw==
X-Google-Smtp-Source: AGHT+IElxlp+EUuiKCKJ3FrqfsmjOtaumuOA2f72V58Q4CnDIyIhdB0c/Id2ep7EkSJ3Z1v9d+busg==
X-Received: by 2002:a17:906:3b8b:b0:b1d:285d:1550 with SMTP id a640c23a62f3a-b1d285d305fmr404698966b.31.1758180262176;
        Thu, 18 Sep 2025 00:24:22 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd272061fsm131953366b.98.2025.09.18.00.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 00:24:21 -0700 (PDT)
Message-ID: <2b58a9ce-d94e-4572-ab2d-fee8ebe6b95d@gmail.com>
Date: Thu, 18 Sep 2025 09:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] Stable branch maintainership
To: emailaddress.ashish@gmail.com, openembedded-devel@lists.openembedded.org
References: <CAMKF1spy0PQ3Zpjm9YS-1beTO+Rp2ss7wjQL3+JqGGopvd2z=g@mail.gmail.com>
 <2403.1758179672054956198@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <2403.1758179672054956198@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119535

On 9/18/25 09:14, Ashish Mishra via lists.openembedded.org wrote:
> Hi Team / Khem Raj , 
>  
> I have an patch shared with community
> https://lists.openembedded.org/g/openembedded-devel/message/119396 
> If team can have an look

This patch has been accepted 3 days ago:
https://git.openembedded.org/meta-openembedded/commit/meta-oe/classes/image_types_sparse.bbclass?id=f5246b7df447ac76ec04c6e5add398862d1c9ccd

It is rare to get feedback for accepted patches. It is recommended to
check on the master-next and master branches 2 or 3 days after the
submission to what's going on.

> I can work on feedback and review comments if any 
> Sorry if this is wrong thread .
>  
> Thanks ,
> Ashish 
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119529): https://lists.openembedded.org/g/openembedded-devel/message/119529
> Mute This Topic: https://lists.openembedded.org/mt/115139938/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


