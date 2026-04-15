Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FBAFA0C36
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 06:30:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12954.1776234630666157388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 23:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aZTB7yql;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso104527185e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 23:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776234629; x=1776839429; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WcfSxgWDBhUTq+zqGNbzqxG9Oh7bptpAhE5IWkHZ0QE=;
        b=aZTB7yqljBOZjL54ZiZKbVU06pwWlo31Hi40rzxsoeolztl3fMQItNceqL1wfCB90I
         vqG8q1SIohSh48x7JZbTjEdGlO/mdEd8bb32CfNcLEMtD43Dq2TbgVewwwCATltVS8j0
         nSgkTDWn8tmB48yeNRTF7FkQ/tO8C9hUkLB9zHVmI5sGegPUwhI0rAUOurwBy13cjMgU
         AKySHovBzOIamSzuIv8udUh7MP0k23FKuCcnJhJw4C2hA8+a5cabQ5CI4lTeJ3amMtbC
         hCDuWe1nJb5QgJ3YVa9ln2byoZutxvZcyiCZz1m8OPCer6A6isfNEGyiKjXlyLh8WPJt
         Hq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776234629; x=1776839429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcfSxgWDBhUTq+zqGNbzqxG9Oh7bptpAhE5IWkHZ0QE=;
        b=TRkecDjTV+U671sQL2N8526WqOVPg49JQWost9iMyXQ8RokQE3WXYXCND/tgdh/+K5
         Ui9zIOLvb6fLMR6gmAqGaRPl74/mVHznbHrWRsp3Ufg8K4dPMCNpf36op4OGiB6zyJ0F
         ymrkVOL2DGQu3iqUNG7sdWTUO6cFipMaTgjtI/N64DUo3UrnUw7E4fHNy7AEJ9OYlfFm
         he4kondmnoJ1PLrQbPzLjq2z1ufiP7qRW6zOTT9Tt3uDutbODjjsi2HGJLXDZS03DFQt
         lY/KXvkMhyTh3wZxsZlexpHwBLbnNWbwsxhhij5E+htb9GJY6OBt+xHDuysW8sCENfC1
         Ipug==
X-Forwarded-Encrypted: i=1; AFNElJ/3TgEIkv4cHh0Sda0B7Jc7UUM9mstiMyx8JOkTarGvEOIzkpe7Y4L/j7rIqlme8aZY2GMNy1fkszETuU7umeM+bLQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMTABkfdHYyd0Au0XgQNWRwkDIj+YpESsh3NFkH9Q6EEc7RLAf
	DcN5lIG+nIo644a6ltKGwB65d0dNRWcaneQ22tE7KnBTIvi/n3i4gMf0
X-Gm-Gg: AeBDieswKWdWWiJ302SY9Kmh9XhvHPxPybUyx+q1n2sMBqfG+WVlsA6vVaZOmemLNJb
	3Jewu2/WQfOMXQCjvC6SoUmPOd4jmtpvcvZUDhHDdGtLYYk8yfLvtum0JhpjagqWjwLlhfar6rg
	SylaT25VKITkPKypqfCyIak5ncZBPLUJG7yFubCX+n28GJdndwUPgsbTNcwO/epSFZdRYFEutqG
	AWu0hdh4dFVKrb3UpIMuqoLGrYeVKpCuoCDlwfnnV2/z2B1tIkVvJWAotnE6JmFPdznRVtXeHGC
	ua9mb+hbr/mByR8NTRqhbCGovPDUeu2fPqCHDck9FkgY+aS+awqN92nl5/Y/LJe1Mwg3aQ5t9RV
	N7QT06FrJn9/+PIKHTgkCJrPaphFwLDn5wLanYFA/kLk1OoaLC2lBP1aGhC/uqyDNwlDYbpSm5F
	LSCrDc1WWQPNYlDmPYyJhP+2KYdHpKYTDZ1K+CohXmSQ==
X-Received: by 2002:a05:600c:3ba1:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-488d67c704amr292250725e9.5.1776234628816;
        Tue, 14 Apr 2026 23:30:28 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ee03897dsm100857505e9.10.2026.04.14.23.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 23:30:28 -0700 (PDT)
Message-ID: <6090fdc1-98f4-4f8f-aa84-40be55266c21@gmail.com>
Date: Wed, 15 Apr 2026 08:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [master] [PATCH] augeas: Add CVE_PRODUCT to
 support product name
To: hjadon@cisco.com, openembedded-devel@lists.openembedded.org
References: <20260413112313.1825573-1-hjadon@cisco.com>
 <134abd7c-df60-42a4-b836-c7984e62d1e4@gmail.com>
 <1426462.1776233646766468418@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1426462.1776233646766468418@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 06:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126342

On 4/15/26 08:14, Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE
LIMITED at Cisco) via lists.openembedded.org wrote:
> Thanks for checking and raising this point.
>  
> You are right that currently NVD shows only one clear CPE mapping for
> augeas, and at present we have not observed any misreported CVEs or any
> ambiguous CPE matches for this recipe.
>  
> This patch was added as a proactive metadata update. The intention is to
> make the recipe-to-CPE mapping explicit, instead of depending on implicit
> name matching. This helps us keep mapping behavior stable if matching
> logic changes later, or if NVD adds another vendor:product combination in
> future with a similar token.
>  
> As of now, this change does not alter current CVE report results. It
> is only for clarity and future safety, and it does not impact build or
> runtime behaviour.
> 
> 

The current behavior is considered to be a feature, most recipes work
just fine with the default CVE_PRODUCT (including this one).
Explicit CVE_PRODUCT tags should be added only when they are really
needed - when there are multiple CPEs associated with a recipe, or when
multiple vendors provide different software with the same name.

(Otherwise, if this explicit vendor:product matching would be really
desired, it should be done for all recipes, not only 1-2 select ones -
but in that case the change would fit the originating bbclass better)

