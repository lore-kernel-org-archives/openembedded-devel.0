Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68EAC5B55F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:15 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.43608.1700452270215236784
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DSzht+oT;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b5ff072fc4so2615133b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452269; x=1701057069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvGNRE+GIYm2VfVqp0UU9TC8viAL37GMvfRtrcn9MRM=;
        b=DSzht+oTxFVJMbM3xp7L0+ORR8ojm4bnA7maBSa2Jtl+u5EdUh6lx8PxQwtliAsX9p
         Y1y8huekTTDV7GCdYXD9J49wd/nRWA19aygn2ofShrJwAjEavsT+NyIAGtQXZOjuVxYB
         itG/IF3WJlPbZZq/Uxbl9OHleKj8zrytlSiurtgkrHSjFFb8MZup0JiZNsEOYuH+PghC
         HLYxajmbU9v/8Z+umBPE3nxf5JBLO/MfdemWlNhpAa3iicH1P0KkTvbtb87Crb/AvVpn
         Llo2aiXF9TdntAus4xZJpp3+uDFVrkGhyDAkA252IfQOx0hdNPim2egOeNnn8T5KmhgT
         diSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452269; x=1701057069;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvGNRE+GIYm2VfVqp0UU9TC8viAL37GMvfRtrcn9MRM=;
        b=V6+HeBIS/BAJWlzhXfCPzmP7HmXwUc3uFzS4hAcnHfwkiZoVv0lrROmXDI4pYcHOX3
         UERcII4iHT63GmgyNyjN7fWReorhXcU7mPsuvfTIHtsSLc5o5ZqMuzktXk82Gkin2JNV
         QJiXk7CtldT8eCmf7wbHhx4XYsEmRKkBlB0H7pHyU2uBlkH+e23u5qZUmqpPzYty29UX
         CIayHZ2tuMnI/lFNPrTPHp4eyGz3e/EdLeJn8VjOABYBBKhqahGj6K5rWqD/wCtnY8sa
         b9Tpk+6hQ6Y3g0q1zLtLc+fcbhV8cF+Ht3rFqsxrTYJSI9v6DevfGFSsB0ZCiRdU6LRF
         V+yQ==
X-Gm-Message-State: AOJu0YyO6TcuV6pbmtkMLJc8iVHG6yQEccUbLHN3oyzdLtzSAZuYuIbr
	NNatPupSFRHnjwra6zI3c8E=
X-Google-Smtp-Source: AGHT+IETMh+hmxS6el4ErC/3MLr5VpL+Tq54UjLEUGFMltfLaDsreIYGDz/wBwGR+B3oQ+EqQzYsVA==
X-Received: by 2002:a05:6808:140e:b0:3ae:4cad:91a0 with SMTP id w14-20020a056808140e00b003ae4cad91a0mr1166861oiv.6.1700452269517;
        Sun, 19 Nov 2023 19:51:09 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700123891-22651-1-git-send-email-wangmy@fujitsu.com>
References: <1700123891-22651-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.11.2 ->
 6.11.3
Message-Id: <170045226835.1416826.2205978344106973795.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:08 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106925


On Thu, 16 Nov 2023 16:38:11 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -When coming back through the middleware onion after a request is made, we have
>  the response id. Use it to match to the cached request information and process
>  the response accordingly.
> -Adds Discord bot template repo to Resources page
> -Additional contract abi documentation to make it a clear requirement for
>  contract instances.
> -Fix type annotations for web3 constants.
> -Add upper pin to deprecated dependency lru-dict whose new minor version release
>  introduced a typing issue with CI lint builds.
> -Recompile test contracts with new Solidity version v0.8.23 to ensure compatibility.
> 
> [...]

Applied, thanks!

[1/1] python3-web3: upgrade 6.11.2 -> 6.11.3
      commit: b48841d0776c5c8ac66130c082d3071c01d92343

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


