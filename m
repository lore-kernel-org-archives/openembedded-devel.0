Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326C3C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.6825.1702967255351575392
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjZDwDYA;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3aa0321b5so19909975ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967255; x=1703572055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4k+qMBTwHMo5tlwZKC74Mw35EORFKvbxZ8Uq5D1tqk=;
        b=mjZDwDYAMZR0yVpP0j9TUZAqIolRtuHGdRvUg3AHpaw4cMk+VA5BrZMfA/vJGLM5MY
         /jTYtYMhoW6iBNLtfqsWLtBQ8UDiRT+6lm0HneX1KfzqpGkvrfcRum+51VOWUrHzwBhf
         1qgbYa6l8+4aDhalV6L3Y9+3KlZqNIquR+3U1cLA/1ktYYmg9scTo1hvGkVavP9riBAX
         HuJwGjkQv4zqzMbNh6yTKo+gTkMJ/XuChOymP/VAlUBwshfwr7lMw37oR9v9lXMxx45e
         JoqebKx7fcfpgGdsKI12eaqj6PmIsZiWipD/g/JC6rKu3aubn8Ws+iEq+M3O2zY0atMo
         ZaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967255; x=1703572055;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4k+qMBTwHMo5tlwZKC74Mw35EORFKvbxZ8Uq5D1tqk=;
        b=P0U9IpfrshDQxV1ktAz160Nh7HxOJeyJ0Hp5xruDvDGhPNxzigy/BpPbX+qC4oPFtv
         /kmZe3bQLEJR3QEWy2pO+xH6tymnnQ9/iXAbuQYYr3HNViD+jMKm8+MUgOXt7Lmwu0w5
         Y8rPdQtS6zcNxWsHIqVeAMb+Vesq/vZQa10gDAuS0PEVusf0hhQe9yGBV3fil5R4s045
         S1kAQbVjJ6UMeVsFHtaeyAVKtbxO+YK9TTjD3qUAsoc1wQK7LFyRT+mTKBQufuudK0nv
         LF8wfNEWqkZS968iYIP91/lUj4OKENg73FEioisgPiL4WNCHJ8MMNoBAf6Koi/PkcMoF
         bXUA==
X-Gm-Message-State: AOJu0YwvdGVH4KdDHl6zHvdK6OtWNC1vBbFNsZgcbEgbfBjZjyCMZ6qY
	7RH9F3w3bL+QJTRzxOoRwt0=
X-Google-Smtp-Source: AGHT+IFJ4hEK9LtEbdL8pYTjO8atmic9YSMdKcFapFyz5h7OdS2nW+19LbCnbSsFtmSe3rQhSNW33w==
X-Received: by 2002:a17:902:ea04:b0:1d3:b4ce:f8d4 with SMTP id s4-20020a170902ea0400b001d3b4cef8d4mr3330711plg.54.1702967254750;
        Mon, 18 Dec 2023 22:27:34 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702543692-27565-1-git-send-email-wangmy@fujitsu.com>
References: <1702543692-27565-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.8.3 ->
 2.8.5
Message-Id: <170296725379.1627685.9127061666665804114.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107594


On Thu, 14 Dec 2023 16:48:12 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> * speedup unaligned copies by always using word shifts (in combination
>   with builtin byte swap 64 when available) when bit-endianness and
>   machine byte-order are opposite
> * add 'HAVE_BUILTIN_BSWAP64' to header
> * avoid misaligned pointers when casting to '(uint64_t *)'
> * add tests
> * simplify 'copy_n()' (remove special cases), see #d2d6fd53
> * add [word shift example C program](../examples/shift_r8.c),
>   and simplify 'shift_r8()'
> * improve documentation and testing
> * add [roadmap](https://github.com/ilanschnell/bitarray#roadmap)
> 
> [...]

Applied, thanks!

[1/1] python3-bitarray: upgrade 2.8.3 -> 2.8.5
      commit: 02e05067e82646b9b6e9ea44d491a6c859427b1f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


