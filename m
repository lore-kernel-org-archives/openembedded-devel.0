Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FD7C021B3
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 12:24:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.65235.1740313443505023165
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Feb 2025 04:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mPPXoR7/;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso35248635e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Feb 2025 04:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313442; x=1740918242; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4XWobOcKOAAzjCNtIUnvrxSChZ9Emfcf1rgmC4WPaXs=;
        b=mPPXoR7/1LReKFnPVKfaaBDRS9k3tN/o24bzPvyubxk06Dy1NbafbiaRyib7SEKIsH
         c+2mK+hdB+5w80YaAW3Y896QUrwY3gbidNo8nhSImcCjzbr4kVeGr8K6lIl93NQAfN2i
         KCd5mzuOpAIJkI8Yv08+P2Kpc9US3gbojK0GEgZiTrn41UHR0dtBAKYl15/8PeUd+Upz
         YxruhKmTwun9wBvc4tBias+F0Hw5DnKy3MSFvviwD7WlTNCOGSBZhBUBhvkuHw/1wWs6
         KIkiX7W7dXhuDHhkJkzEJ6qCwcGlKkmGJMqmXGD066lGXOHnGNKO2esFxn16001tsoAr
         jn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313442; x=1740918242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XWobOcKOAAzjCNtIUnvrxSChZ9Emfcf1rgmC4WPaXs=;
        b=nXtMbSn312bWXxg7ziKGuHkYGOGXJJ3NdnZfPGul5fTEbkwxuJgyYmytOwSsLxpBV3
         Oy+UwJ5aP6/2wFrRInkL0GwZ/3FNEBMMd3p8E5W6+A/NUvwJpxKn/7X43SjBRhH8G09H
         yVf1UtDBYCZTUS/IWPkpWbItM8DNzNYk2jTEVo/KWrqek9mP/KrjCWlzRHtdr1eMzfOD
         WhBfeHL+rDutiLinjDgtEPmylVdy6H/W9W4J5c2RudAxmu8hxFxLxEQa7OE5H0/P1fkE
         ynocEHRkpmvuUYTPocjz0yxPHEAIfV+cIGqCV+wPGHNa9QzqG4h9y4ncQbfBPjqHWrZm
         nsXA==
X-Forwarded-Encrypted: i=1; AJvYcCWae83j05/wY/U1RoFJ629YcvWtA4+ZHGzp5nHobLTpKw+TtIzBG7RvmLUSf5+w41Ztm/64mIQgSumHXiTiFsW1Atw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyc3dIKaGvO/hDs0NWmPb4YahbTQml2Q6e8mvbodEkFN4ShRnGO
	x6GK4b7KbthXsjWIike7ypl2bhVeBbWH9MkqnG5PbuCW6k5yOja5
X-Gm-Gg: ASbGnctRz/z6Tr/pqjF3YuDUhm+PTKouTwPJ6FiKYoT3azIptKniG09hHykFx5gGAvG
	io+TmOXe7H76hUslcOy5Zz+iRBy+XbRqSSiuOWQDlg5tOIqdwKfQrioHgTjlzPhRStMwAyR+U5c
	hoJrBVPdtDEB2jKVSREAEylR4Bz5hrxnS+D2osU4WE94sB3J4Fv25OoOglkn3sPS1gE1bJeNOdH
	1GrWVZnn+h6aq9zFMCUWV6nOtaAeFWOHhi/gNdcBNDvPmBn/ESxOMJAKR7fvZn1px8I2xqe9aWl
	rQswZKDln75w26bW1GtZlYPiqwopbtyxVw==
X-Google-Smtp-Source: AGHT+IFdpkMlzoGDvvkdrddLJ52plEnOo9tQbvZv/ikXVGGaz32W7cKc7IGQ1MWFOWyRC3+vPeMH4A==
X-Received: by 2002:a5d:6c63:0:b0:38f:4f62:7e29 with SMTP id ffacd0b85a97d-38f6eb6bd1cmr7846745f8f.26.1740313441531;
        Sun, 23 Feb 2025 04:24:01 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f771dsm28584587f8f.81.2025.02.23.04.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 04:24:01 -0800 (PST)
Message-ID: <1876f871-5f8b-4365-8fc6-4e1904dc6fed@gmail.com>
Date: Sun, 23 Feb 2025 13:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gphoto: Fix the sed expression to remove
 --sysroot from config.h
To: hieu2.nguyen@lge.com, openembedded-devel@lists.openembedded.org
References: <CAMKF1sr5_pemR2VogAwgbopYDudLSvi0Yvy4dYX4eydVndOjFA@mail.gmail.com>
 <23323.1740301221091041675@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <23323.1740301221091041675@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Feb 2025 12:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115547

On 23.02.25 10:00, Hieu Van Nguyen via lists.openembedded.org wrote:
> oh sorry, I understand this patch is to fix your commit before:
> https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb?id=bdbc71f61a86b598fc72bcc167e6bf1f7cc33b08
> I meant do we really need to remove "--sysrooot="? What happens when I
> remove ${RECIPE_SYSROOT} only?
>
>     #define HAVE_CC "...... -Werror=format-security --sysroot="
>
At the first sight it looks like it used only as part of the string
output when invoking "gphoto2 -v" - otherwise this macro seems to be unused.

