Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE493C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:44:26 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.4761.1752086662530855080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 11:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KuY/B2Uc;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade76b8356cso22938766b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752086661; x=1752691461; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8sXG3NUiHtG1LR2oGDQGxaRacS9vDuYCAcfUin79Xg=;
        b=KuY/B2Ucx+f7aaSo0uS3knnETEatG10IKLH1ufykL/Bo5IfGiZPktOqQhBygcmASdj
         6/anb70oXFTSXFEibKR3np499LSLSZPY/MgmrLyPEKzAagf7W+wO1Nn+HS5Ivdb7CJbe
         O0+ucGvsHoRvHm/SK8QiSaKCDVh8ulJteaFwWnB5mD7s1oBsGRnfOSG3D3HGD1Eu2eAC
         1eYfoO6Zn8HCTNgeFgEnL1I2TBYLmsubVYEoFhd9NimXa4Yatv+7lzagrXN0u54hvFJ7
         0zroV+nYUek+pLYXnhQf0KEKrsc92ukx32ZMpYiSI4r8ds3YiDT6SfIXuOu2TEGrfpGv
         dKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752086661; x=1752691461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8sXG3NUiHtG1LR2oGDQGxaRacS9vDuYCAcfUin79Xg=;
        b=DBXWB1MQRCHV69kw2FkDfzaC7JDhA+SSXDBa+sSCk48g/aKmUPFhTyAROMLjnn9NQg
         KOEmQtpiZZSZcfoKiiTDbhwERd96w6S3d8/2KLiMiacBel1yIEFZLnEfmSlzWOiGWA9v
         SyNnIPnX1296gKLaa1xl1mIKgOg2kyDNcNkzBasQ6g6MbP28LDvmR/z7csqGmJQ+4n38
         Mkpc6fuFAhkAdtqMxsgrIHau5VwFR3BojvyXmdVjUrYNlYUrqgWx8BSWiOb6m4akDaul
         v9QEUvuXOPimNBAWqpayBcpFQdqPn5kNb2QbhMGyfIEAq8xtvBAqEr7l5wXUGSAKKkeV
         IOlA==
X-Forwarded-Encrypted: i=1; AJvYcCWybUBpRZEryOAeAwzT+NMvrj6IbUHEZmV9SAR2LmuYQYlHJb0i8GQqMdA3Po2zLlZgy6C2UwSjEIphDS7a02t+W7M=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxdo/4EER/EnMZUQKHeOpO4hQ8q2AX+ECvUskFJq7mnm81uLghM
	ZLNusAytSeS+X76CC61/F2IiX4Ibq6+Z2ra9sPgGQ5IFy+FH0d9dVXyZ
X-Gm-Gg: ASbGncsn9oBwVzweOLxdQN0BCWS1Ud22sPzQLQQZVuhPQq889OKH/zLzCzPFzX9VCsW
	ouqoQ114wdXgqmixbrYD+PGZmBUoP5lqwmPvB4A+oCDnKYrTFxHlQsJyWditFAmL6Ym1XGvF0yP
	QSsX7+CTVyx6TLUCYwG9pHxuMe7LBe/y2Ek0abWS7r5mPGlcO4hNxJw4xXKXQ3DC5I1v735BJUL
	Ijqw+QR4DtTx4Bq7sJ7pY9UllhqZmkwCq1te9ivvXu15TbFH/0i0QArOq0Lq91zxEMR/ASN5hh/
	2ULunHdr/DN0pI3hlyVsdR1UQd31s5OoRbg/hCwazoaNt79+TIuBGPrDy+11J+lS/eteLw==
X-Google-Smtp-Source: AGHT+IHcGQV88NidIHnWdfn3y4txIFwgJBwZoE/GgjIJptykTRPglzGBFaGIWG+79Zi6QxMn8qKjcQ==
X-Received: by 2002:a17:907:3e1d:b0:ae0:ce59:5952 with SMTP id a640c23a62f3a-ae6e13f6d06mr76255466b.60.1752086660467;
        Wed, 09 Jul 2025 11:44:20 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5474sm1147547066b.77.2025.07.09.11.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:44:20 -0700 (PDT)
Message-ID: <7d94e8f3-71e5-4046-98cf-330a9df9ab07@gmail.com>
Date: Wed, 9 Jul 2025 20:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][PATCH 03/20] ade: Add patch for CMake 4+
 compatibility
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
 <20250709173054.605430-3-alperyasinak1@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250709173054.605430-3-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 18:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118379

On 7/9/25 19:30, Alper Ak via lists.openembedded.org wrote:
> +
> +Upstream-Status: Backport [https://github.com/opencv/ade/commit/8b24d5f1286d178fd0d3a22d584e1a798f5e9a6c]
> +
>
There are multiple new tags that contain this commit (v0.1.2c ...
v0.1.2e), unless we need this specific old tag, I think a tag bump would
be better over having a patch.

