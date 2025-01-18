Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC631C02188
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 16:01:33 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.12673.1737216086470074578
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jan 2025 08:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MDiUzPDU;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so4775016276.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 08:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737216085; x=1737820885; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEhmS+9Upszq6Zc+utM0r9LCYvhUC4MjteRm5T7KjUk=;
        b=MDiUzPDUEbFrZTRJ70XcyBB+alHK4AKyyT9nVotirpbcFE1oT833nQvPN2dHhFuL1z
         wQTszvSJafS58GpKYHKxANgBecf4PDQfs+8gwKAOyb1VAsaOkZwNV/7kxkx3fJIZufNy
         uR9bVp/JfzNoRb1IiwDwRGPNm6/aL8Zp1/vaANIPQQ+mO6HuZ8PVxd92LZwRXtG1kDRY
         7zdMao/slIA7aYP1ZtEP0uHzCL1PCrOuYk4HjmKiDHJMEGfvzT3eymRn2zUFkq85RSaO
         1yrV6e1CkYJMoybSYIBSZsl9xnjEsvYOEj1TR7My4kqVIpbEOyVDmCuoAL7KknSboxyG
         rJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737216085; x=1737820885;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dEhmS+9Upszq6Zc+utM0r9LCYvhUC4MjteRm5T7KjUk=;
        b=sxxAWDONUPv70YS7QITvZ7tgvhVLJZxzQ7yjDVJHUOGTYOS+WT/GFNrgvdj4FoAnv6
         ZE24ePtjf1egcrUiVpd4YhF6bMtHAhtWkHFhKMQSXiXyfjTggoOtOYWIYgnLoAC2DpOz
         FeNAUuC/sAqH7WT4soGBkbMN/c3QnOUtzXvfWVMNtmPjzZ821MCLE3DdxUpm9SwJZ4TK
         ZbDMxtweGcfE2m36IITm9vmUOChZ0l9vCxgsWguDDVzHoK+Xs61wJJxrEpwRFUiYWra5
         ARMuaCScZkT5cJIPg+VJRvuvODrjOkrf3NL/LJfRuuVrRDWykoK5CR21JK/0OAEjoGyo
         Hwow==
X-Forwarded-Encrypted: i=1; AJvYcCXR/ni2r9Dsw58YLqcl2cyKZSViG62RK8B1W3Og+FnYHeEmLppG2Bglyiwy67AGVIEB3CPNQtqwTEBLkYuJuhIspiw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxpgl+3pOzRVePuChcEzIFDxPv8UFlJg1rtlI+p3n0Z4BpTmVrg
	bYUysJdCibIv+2uev9CXNDKOA2liS1G9qXaHSKH9KoKthpZucI+w
X-Gm-Gg: ASbGnctGaR4FCoDgtzJToKFKOXlHQSsqwGlpNyCvFFYe3KuE6bPquwNCl2x3QjQAGmJ
	WYxjazY1okPQ9OK8WcM6u1CLvb9LBictO4G/5gBdLYN1f0KkPTKUGHVJx7PTmhmd33yStJ0aizt
	c9McdnWKIAmmvQApMf/rTBUAgyr+r6QHbqRWzvKphl0j51jF9WRz5GjoxN+K4PmRPGBWMIZ6Ass
	+0gFjcza7dGK0UPhfYXeMhBTjG0j2U/ZVt8//VSUf5+zSEM/4bGJRi74U2vScx3URq1YrI+4Rsx
	zcmux5MMxnNxQvF0KaPwNC7dBcHXs1LI5fLFufDUPUiPsA==
X-Google-Smtp-Source: AGHT+IECjbAWTnudXH4LlJLb6Kxn8JuRN4Zc0Xz7izdA10bfVmrED/3Ra7vZrd0wl5H4eNIau0gMMw==
X-Received: by 2002:a05:690c:4b0c:b0:6e3:fd6:6ccb with SMTP id 00721157ae682-6f6eb67bcb8mr56026907b3.13.1737216085457;
        Sat, 18 Jan 2025 08:01:25 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:852b:a3f6:a3fe:d827? ([2600:1700:45dd:7000:852b:a3f6:a3fe:d827])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f6e66f7217sm8195117b3.111.2025.01.18.08.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jan 2025 08:01:25 -0800 (PST)
Message-ID: <dc27926c-b702-4bb0-888f-1641611961c3@gmail.com>
Date: Sat, 18 Jan 2025 11:01:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scathgap merge request: Jan 18th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 16:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114949

The following changes since commit 3c293e14492f01e22a64004e2330fb620c27578a:

   python3-tornado: Upgrade 6.4 -> 6.4.2 (2024-12-27 09:24:53 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 5f9f741193f55bb4bb3c974e913d169dd23e40d3:

   ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native 
(2025-01-05 16:46:47 -0500)

----------------------------------------------------------------
Khem Raj (1):
       ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native

Markus Volk (2):
       geary: add itstool-native dependency
       eog: add itstool-native dependency

  meta-gnome/recipes-connectivity/geary/geary_44.1.bb        | 1 +
  meta-gnome/recipes-gnome/eog/eog_45.3.bb                   | 1 +
  meta-gnome/recipes-gnome/ghex/ghex_46.0.bb                 | 1 +
  meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb   | 2 +-
  meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb | 1 +
  5 files changed, 5 insertions(+), 1 deletion(-)


