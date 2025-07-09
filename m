Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C5AC83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 10:26:23 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.12184.1752056776707821813
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 03:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J26JjlNE;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae3b37207easo997275566b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 03:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752056775; x=1752661575; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FaeL6bOkD/5htIwDhUGj+MDbEjrOARJ6672YQQH2oKs=;
        b=J26JjlNESrZuxsFbv3NxVlhoc/mQWMkloHY3QCgdtHDMvypvhJA+wjANnmbGEnEPFC
         LGBV0CpEzVqhL3tGu+BU7ScnRQ2HMy99liEQdx6y0tcTiiEdZNXXnvyeRzwSvZ9/OZaJ
         mlchN+WemWiBMefVnNMZKffNbba7axRpVBXKk5TPOD7/Af/5JBW6VsYg2cadDsPZbtgX
         KmUaJULFHe4Q9uyLNWk7mKGx0nY61GcuZ10vo0kg3s/Tn1hxHusxUc2EDh4iRB/pAMMt
         Xz+j4S//aNO36AFOXOBTNdGZvwAaR6c2+dkEJ/XmbewKRxd6oIWp+BhsZWDpJCuwF7JD
         LTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752056775; x=1752661575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FaeL6bOkD/5htIwDhUGj+MDbEjrOARJ6672YQQH2oKs=;
        b=VjkW4zjhiC/86JkIx6A5J1QC+fx8NHHS2lZly+AYvDMbQZV3BC0i2rS9oqCNGrKMv8
         PTkaHb2svLldNxpLJGTzZEHZN8Um9uUjSiAYx1cuHupy7F6D6NVoKLCBM6ZK1lBIUD64
         o1qmjL1j1FKobUHHB7+qXduiLcoPrdumObGWx3MbmOkWMElPymy5XeGXTUko2cKysmp7
         1R3Sr2hP22FHuz9dz2VUvCinjD/Wu1+hWbcmCDPDBEbtuQ9to0jgLZjVhLqPBK2IiQbr
         /hhQVnZeXZnqeImLL3zcChjF1za+FOsNzfsTGpT0WpYh7pFzrF1MRk3Kr7UiJtG+5j56
         VkSg==
X-Forwarded-Encrypted: i=1; AJvYcCXv8HUdRBACDTNtGAqRujO5RATtTsL/2DxoIQ3sJytzSdEjEXsMuoVZYFXhYcQpS2Y2p+gLIcYPODGHb3knw/qbZ+k=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyzQNK41YKp+px1UPxs00VIk9qZ7nRFk6B/GgogToxcZMesHU7
	J1+Lmh2AnXWzDG/Yg+A7fbIH0bWXRfaR7mXo1oPyAqzs7zkRVHcPrtWr
X-Gm-Gg: ASbGncsFtcAvU2LCPfbJH2Ko8KYzOslGBCWp2xFP+z+tbvTZ2/c7e/xhgXGUzjlg2J+
	hvT4d9tzwuFq0fsIJwGnt6kkTMcDHVq8kGY0RR7zHP/FsDUdIDSkwpnDSJATucO0zKA4Jpd6zyV
	ptjF6NLBgNgj2aCmI6MrA5+WRCV0af/4q98ihHUBrHbDwFNm0E2riWVET9j0pBryAbfjHI8dKdE
	pa2oNGToJ/vaWDneSXt6+ANEiHNnGFDceznfIgjOEkOuHAIxiDR/Q6vohRTNNUMbq1BOZuwyEf5
	sOeQmBMUwduQSWlNPkcPZE1xp8O4+zS+FidHfXTAV9C3ZwLfz4h41VfdmZoEBLcNkrRILuL5UYi
	EhNHS
X-Google-Smtp-Source: AGHT+IFWo4JIv58fERk1JSqcDYUxH7MSF/naS0G8+zmkeq4YtIs+TIzOvyvxo9zXIo6y3U+PoOg5kg==
X-Received: by 2002:a17:907:c88e:b0:ae0:c6fa:ef45 with SMTP id a640c23a62f3a-ae6cf76d131mr204546866b.41.1752056774711;
        Wed, 09 Jul 2025 03:26:14 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae40eaef0a4sm875552466b.170.2025.07.09.03.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 03:26:14 -0700 (PDT)
Message-ID: <1e048d60-2558-47dc-ac26-e027926c32ac@gmail.com>
Date: Wed, 9 Jul 2025 12:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][PATCH 13/20] uchardet: Add patch for
 CMake 4+ compatibility
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
 <20250708195636.1678606-13-alperyasinak1@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250708195636.1678606-13-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118347

On 7/8/25 21:56, Alper Ak via lists.openembedded.org wrote:
> +
> +Upstream-Status: Pending
> +
>

Minor note: this change is actually present in the master branch of the
project, so technically it's a backport.

https://gitlab.freedesktop.org/uchardet/uchardet/-/commit/6e163c978a7c13a6d3ff64a1e3dd4ba81d2d9e09


