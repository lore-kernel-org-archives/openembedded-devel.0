Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33553CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 06:35:00 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.10583.1758609295205234207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Sep 2025 23:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OnfZBKsL;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b04ba58a84fso886665666b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 23:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758609293; x=1759214093; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ku5WcE3tqKKSNvDs/c5SWCXMCPLTQWgAw+wrxZLxKf4=;
        b=OnfZBKsLu5kNsW6Vzrcr9AivtP2risNWjkKdZajxJSxPIadcma41pmG9iE93LueK3D
         1el1y4ErzMSofQcyCyfdbNDlHcALGI3Xk2y+2U1HDUS+ZXwo0rNgFPm6ywwfYu5xzph/
         LURabLcXU688qR+1icSl+OVXTkdcdJwIg4qFZPWTR8c3QN1kd/hNNn179+SRDqzuwlob
         dmuOknfvEH9Z1VaJv+tRKSWGk87L8g5R9EkVluLFegqSOmh7emPlfh2qIeCHPJsTOB82
         314q+d9BjA5cvWdPOi6JIM479iSGfG+EzkBig79WqDGaa5d0rWQ7mXeIShDuutx/Rs4z
         FvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758609293; x=1759214093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ku5WcE3tqKKSNvDs/c5SWCXMCPLTQWgAw+wrxZLxKf4=;
        b=h5+K9U3CeRQP+XYo/I21hrICuZqOvodiX/GwWDMKJhvtnmxDb7a4THLdWt5qb5U1Gv
         xwPzOUN9M7viOtOLYeTYkbkufxkO4vYcfyyX27GUcUf9CIVGAoAA4a1uYZEVE5TGCXzu
         6ACVzW9JqHE/B0eBDWzvao2s+VQ4Y8soKpzCB1omGmtpSDlJhbAvLrAnc1YYrbBU/ohG
         GfQ5fYtrMiz+4QmyZdmonv/zxb5wuvdCy1Oxu7n6AI39yRcdxmmpj+rV7bXSMO83rXeV
         VUmM2ZMHQskux9LG9fazqP4vXHhb4ITbOikswnVHjDlqMByAAem9V5dRno2PpPMCHfyI
         s98g==
X-Forwarded-Encrypted: i=1; AJvYcCWrHtdNX1S2RA0Sz9ukxcF5E4Lw1qs/ElViEOU06+7IrJM7uF+ReeSKlBNK0K9uPIukIRabpSjNZeFs20+GrEmgbyY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz36HDFsw1rmgsS2dMZzITpJzyTOjWjVH+sKNuZ60hrffHsDhBx
	PN5yVJlLXBham1a/Qz+ohGIGnGpqKPuX5+udXSMmWUj6i855NQc4QuI/
X-Gm-Gg: ASbGncv7tcevac8eJOkUG2/w6nVXnvPBveDg0u938JDZv3g9p+PXDTwqedAU+hHQ9B8
	/YLogzfSIAow10BmirXjTZj1qvPlbDqlDJJj5V5tvfiCBhntEKdo5y/VcTPaWK/a9EFEhmwQiHq
	udkp69bMDPojGxv3Ap62Aypod+gRya5k7VBiA/VJSF9ibz3Xe0Wip4w3zrsk1+SxcNh0reXeIxE
	gkx6F/Ov43/uohUFYHihDNaiw1n6IJX3yBGweEnKShawKwLOYQe826TY1uwtMsOM6NHNEV7gGJ0
	rL+uGRKgfcuIO1d9ugOJiONVQEtJk8A8DbkBquiE7/a0BuxaaZdFJOxBT/9LL0rtSVQq7zC3B/a
	C2JSwVRSvThN1OXIIyAP3RbkrSvewtxzA8grfv2WaTQ==
X-Google-Smtp-Source: AGHT+IF52fpxvesDEZ0NF55kPKbDZF8EwWY9OP69/tLWu99SAVwyO7GBHUvCLVZ4xiINaL6ThBZ1KA==
X-Received: by 2002:a17:907:3f92:b0:afe:87bd:da59 with SMTP id a640c23a62f3a-b302a07b5demr133041166b.42.1758609293284;
        Mon, 22 Sep 2025 23:34:53 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28be3fa38bsm708240366b.46.2025.09.22.23.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 23:34:52 -0700 (PDT)
Message-ID: <f8c56600-c174-4431-a62d-aa1df57ee9bc@gmail.com>
Date: Tue, 23 Sep 2025 08:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][PATCH] image_types_sparse: backport fix pad
 source image to block size
To: emailaddress.ashish@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250920173742.3449291-1-emailaddress.ashish@gmail.com>
 <32288.1758609141663082748@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <32288.1758609141663082748@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 06:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119653

While master branch is updated in an almost rolling model and is updated
frequently, named stable branches follow a bit different model: they are
updated roughly once a month. But testing and reviewing happens
continuously during the merge window, and if there is a problem with the
submission, you will be informed.

On 9/23/25 08:32, Ashish Mishra via lists.openembedded.org wrote:
> @Gyrogy : Can you please share your comments on this patch and if
> possible consider for merging 
>  
> This is part of changes i am backporting to have
> https://git.openembedded.org/meta-openembedded/commit/meta-oe/classes/image_types_sparse.bbclass?id=f5246b7df447ac76ec04c6e5add398862d1c9ccd 
> in kirkstone also 
>  
> - Thanks 
> Ashish 
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119651): https://lists.openembedded.org/g/openembedded-devel/message/119651
> Mute This Topic: https://lists.openembedded.org/mt/115347745/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


