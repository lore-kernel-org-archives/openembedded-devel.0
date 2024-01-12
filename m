Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A148C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 03:49:11 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.224.1705031347677730467
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 19:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C3NJA3jD;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5ce942efda5so4534810a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 19:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705031347; x=1705636147; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2YH6BgM86cZ4jR5Bd3fMvWoWmUE1OkQBmryhe6k8ao=;
        b=C3NJA3jDcimF91mFhmV4vZPQsVZ3ouKduC/14GG1j9+qae81uwKVcXyDcklB44eWEx
         k+31P2nMgLMhYq6xmzUlhmDp/L0es8uHDkG2yrXVZJTYwGOsdXqHL7DXn7uJm6yLiyKG
         BZL/KlF8KjkcfK8mFY9Myioz4DCtn1UnccJU+XYXwzgytu5s7RufP0lrY4xMOI/DKQ8I
         4KVxPmFkIoUaJi0cofgejfWsJetbm/QGn/4KWJB9RI1JGJsqj0qDpKuoTkjcflgaiLbv
         NGNKFZqDmmVAv+9XiV1IQ7LJm26MEpm7iiAwKmq5q5ADjRVlicdc/fjGOMAmQyzzP0UX
         RBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705031347; x=1705636147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2YH6BgM86cZ4jR5Bd3fMvWoWmUE1OkQBmryhe6k8ao=;
        b=nDgRy1+M+HcedVQXvO7wsF+TeQA+YmKzy81fah5CSyx63zcTSdHVQ7X7nC8RVYp92e
         doq+okg2W7W5Vu6H9Jxu7ngIs+tm2ZTBefgQBXj+MC7uzNFoyiS2aBxxsv7Td3Hn4YEi
         ggGo28+tNSfzBx3klCZ/NX28RdX+CiU8jwSwRCO5W9TDsuB/O51g7IkZyFb+o/n/yIK2
         +w7lodR9tdzFMuJSwTxsXPmoqVLVflrizlzp1gKXm+wCuhCmkIrHt8IWJcL2K8x+YySg
         fMWLbxQ89+kTrhsHdc8kKx34rYIqya37k9VzcmoseFGYcevjcy1jrghDxEna6/eVSjWo
         N3iw==
X-Gm-Message-State: AOJu0YzVYZvcgvu3lsOOvjJ1ECU698j0/ifSrAb/2FC9UqUkJ1cVbvus
	yFmzyKsbBmtU/OEv4rR58aE=
X-Google-Smtp-Source: AGHT+IHi92G1oqX7BvwlTurRwVrVhkSN8QRmsfpwYCM72W4xrxCve1Rz049JAzmU4BnWO+hZhK+wmQ==
X-Received: by 2002:a05:6a20:da85:b0:19a:2d38:9572 with SMTP id iy5-20020a056a20da8500b0019a2d389572mr456963pzb.14.1705031346872;
        Thu, 11 Jan 2024 19:49:06 -0800 (PST)
Received: from ?IPV6:2601:646:9d80:4380:4c28:cbf2:ee1f:e1e3? ([2601:646:9d80:4380:4c28:cbf2:ee1f:e1e3])
        by smtp.gmail.com with ESMTPSA id f16-20020a056a001ad000b006da04f1b884sm2060621pfv.105.2024.01.11.19.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 19:49:06 -0800 (PST)
Message-ID: <b471f38f-89eb-4d66-a1ab-42598bf138a9@gmail.com>
Date: Thu, 11 Jan 2024 19:49:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] v4l-utils: Update to 1.26.1
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Fabio Estevam <festevam@denx.de>
References: <20240111040734.112703-1-festevam@gmail.com>
 <CAMKF1sp=0T4Ow_F=DwOL7BxZU=j8D4z2eaP9qXa44kwOo9Ha1A@mail.gmail.com>
 <CAMKF1somcAJpnMW9822wNy0M2a3Yd5SFCgeouSVUg_0HW0HdFA@mail.gmail.com>
 <CAOMZO5CF41YpSU0Zdz5PUpHvHpMuGFWt999+FBC_b2hcUe5x_w@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAOMZO5CF41YpSU0Zdz5PUpHvHpMuGFWt999+FBC_b2hcUe5x_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 03:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108233


On 1/11/24 7:18 PM, Fabio Estevam wrote:
> Hi Khem,
>
> On Thu, Jan 11, 2024 at 5:10 PM Khem Raj <raj.khem@gmail.com> wrote:
>> I meant to say without systemd ( using sysvinit )
> Yes, I have sent a patch to v4l-utils to fix this bug.


Thanks, I am expecting a v2 of meta-openembedded patch as well which 
includes the fix


> Thanks

