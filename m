Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FCEC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 17:29:04 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.19514.1753205340732519715
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 10:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NG9Kr9Jo;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae3b336e936so1081613866b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753205339; x=1753810139; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmOCDTfhkGdDTzA7vVqmTJsgKZXFlc4bISqepO2CXYk=;
        b=NG9Kr9Jo8SMth7xSCuQfvrBDFRlGo5y11LEOvQrzlYNbJJ17Q2rru5e35M2tm30SXI
         5Kd1D2WkZFos6MIqSPKNvc4Qb4bWPNJd93awk1LRpfCJi+qHtAB05A1kCJkEgXn2TLRQ
         tnuFoQqQ9ceSWLhSjdwbLtIFoPrHSXzWDcxdLjXVWIUSIdsebADMn5DMyLJe2e5bL0yi
         z+INaDRaWPR85xxkwf9ypKbUpOavaaRWJ+Cqp77X/fY4APK9XYxQvqrGwS56QisPpTTU
         m4t/+KfLuZFiPHXV2FmxbgIXCRnewnOP04AdYtT1RCon4wUbfxsLBEIwVd9QPBU/lucI
         bZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753205339; x=1753810139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kmOCDTfhkGdDTzA7vVqmTJsgKZXFlc4bISqepO2CXYk=;
        b=ZCfpTLd8M4vDdFyzrLNHh9PPOryh9Wceun8Xbw+VYUXENP/xYv3PVEm50QM6b8SZk8
         S0q8Lw+f4jGxD0xEUsCcbzbZNeyTUyF62IaYpi+kMHqsAYLWrdGNP1sVRJqA1gTVU+JE
         gPturXNFmDomKEG5A0frRwWWptaSIvj0kRSnwwO6iutnHn9fWmtS9Vl0mAWf60Zdk4c+
         q7PBog/R5ESAdS52QTMB7ks8Pt9SxWxP/0TG59HwwmvBUeD7cB+JU0ipmDGwFUMJI5uw
         t63RvaAO5xLxfXaDqJOf6D6Ke/yHpOzp3y5Jp1lcms5P5BrcVUiKvg1u/mWJpGpbffbk
         S+pw==
X-Forwarded-Encrypted: i=1; AJvYcCUFvuFJjGyz4mgUk05aQayQXGncMJF+eqwsijzQ6YWM3fiCeznt5TFK6zGYnEEUNf/dMmmKSoceXELtDd8XgrXeAW0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzBZsF9fo8EpoUj2KNYBqe9njhwWbcKb2Dof5H6IweDAvqNGysz
	TxrkrgYanHoG11fFI+7njOqtb9ZE1L5yLDVt2BrLaLJli4Ke4dk7iieJ
X-Gm-Gg: ASbGncsrInyCnHASv17u14fFmd8ieUoE+bAWQfhzcTQv2yWtpkWBWfTB4BeQe1Spy7u
	Pyv42EltRbviBV1MNmD+EnDWdwhlOWAMxpkIgXLFE9VkFNHR0hpPGClpFSlydSZsJBuIzaQ19Y3
	e4eFoiUH/AIkWuEtlh9PTSPDSjifgb3ACkdOI+3/2cSBWu9vsb8663h91rcPYNBJ4ZGoWgnY2h4
	J8aLC+G4jm5eSWY1z9+fpI5+DsJBheUYh5w+hkdal6EsBb5/7aKNo6uFJXZP4SSmWCwIipGC5f3
	pqYXFWP/6ddk3XLMICtAAX1ARiLeX8W+4Okc6PBQZkuGvGWd75+JZtATWV/uYxFu4iJXcYcE7MJ
	COANcnIoPxCNeJ/G3NCFds1ywv8EPnA==
X-Google-Smtp-Source: AGHT+IFrOQg5aUGTcD76PlrLWtT7yDwiAVN2EGwQDAcwlGvQ7m7JRc8b6G0X/gCgQBdzdvHgdkyq6Q==
X-Received: by 2002:a17:907:80b:b0:aec:5516:239c with SMTP id a640c23a62f3a-aec55163f91mr2035086166b.58.1753205338705;
        Tue, 22 Jul 2025 10:28:58 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af11411f1b5sm239986266b.48.2025.07.22.10.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 10:28:58 -0700 (PDT)
Message-ID: <165f85b2-64cc-4fc5-ba44-c2d876b983f4@gmail.com>
Date: Tue, 22 Jul 2025 19:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][PATCH 3/3] gnome-shell-extensions: uodate 48.0
 -> 48.3
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20250722165344.105075-1-f_l_k@t-online.de>
 <20250722165344.105075-3-f_l_k@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250722165344.105075-3-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 17:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118700

On 7/22/25 18:53, Markus Volk via lists.openembedded.org wrote:
> ---
>  .../recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
> index f2f3e8654d..5537b3521e 100644
> --- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
> +++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
It looks the original file name is incorrect, it should say 48.0 instead
of 48.3


