Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C38C5B564
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:36 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.43621.1700452287725382176
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XE3B+NEV;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b2df2fb611so2959547b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452287; x=1701057087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWMt3El9ZjuRRch0MaoJd1jFiv6mOX7v6UEe/IYxIcI=;
        b=XE3B+NEV0iOMrcCeQW0RSyMda0cjeZG6OIMpJfB6MZWEPTT5wKhWganU4Nd/V5k3by
         lX2M4HqQhfJ/HKpffaGaBJxBa966pakunxp3r7IQenWsjD69mQ0rG5RsQTwwTjnhHBI9
         lt7oyijALEotdpuvzPXgZ4uNvUwuvP0anupfBqm/T8GAAykY2gPcgNE9Wy9zK8uXqqN/
         BmbMdp5c/Hp7SiMuBtBLuX/V620ZNUAJcw6J9hIdg0MotQuhug2UYjFCPXtD9NM71oQf
         Jo3vfAgkTTguk0NhLD/iWU42WKZCPILJzcK0FsxD9AAHDbu4ERIFb7K/FCe8xvNpOT4V
         nlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452287; x=1701057087;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWMt3El9ZjuRRch0MaoJd1jFiv6mOX7v6UEe/IYxIcI=;
        b=YkQ8rPG9PBcrcA606VIZXL9y74foJptjQxrIayR4T0UnYFKKiqxQzwX/7o8GwSvXQU
         UWfUtDA1SA5E4uw9tBG9SNLh7Obt9lTvdajBNj5D1G8Colek5L7w8SOUHQ7n6Iai19we
         vyIiJEDKDfEqZCyfGgsyZ6uEJ4rBb+fcdFa6K5NQAdab5vyfJKhI/3RxAt2yBJCwvgZ8
         MJvc+1GdliMDsq7pSEnF+2mLowP0Dhf7xDeamK7cQbRDuGABnayYSaGE253/O5Qc+W8Y
         ST6FAwXmRwYPTDEAAB9c8yxPou4Hopi53DGeVFxtD840vtsbPx9uBm+eS1Ejypicw7Kf
         lwlg==
X-Gm-Message-State: AOJu0YyWzgG9m+VFBRfUFvu9/RQc+4DbW+XnjlddyLd5UYOgsKv9deH7
	i2WdiDr75cizJ+3uQLTuoQY=
X-Google-Smtp-Source: AGHT+IGlOGhyYH6AUXKANN+5tRs4Z3+am8dxb0csGli70cVrGO1az2uaLLo87jtnvlO98OyBgmBCUQ==
X-Received: by 2002:a05:6808:150d:b0:3b6:da98:4381 with SMTP id u13-20020a056808150d00b003b6da984381mr10313144oiw.33.1700452286969;
        Sun, 19 Nov 2023 19:51:26 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231116173511.113526-1-f_l_k@t-online.de>
References: <20231116173511.113526-1-f_l_k@t-online.de>
Subject: Re: [meta-multimedia][PATCH] pipewire: Upgrade 0.3.84 -> 0.3.85
Message-Id: <170045228597.1416826.16804559128613380199.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:25 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106942


On Thu, 16 Nov 2023 18:35:11 +0100, Markus Volk wrote:
> PipeWire 0.3.85 (2023-11-16)
> 
> This is the fifth (and last) 1.0 release candidate that is API and ABI
> compatible with previous 0.3.x releases.
> 
> Highlights
>   - Fix an issue where a link could end up paused while not negotiated.
>   - Fix an infinite recursion issue when finding runnable nodes.
>   - Support XDG base directories when loading ACP config.
>   - Fix MIDI event recording preview in Ardour.
>   - Many more small fixes, cleanups and improvements.
> 
> [...]

Applied, thanks!

[1/1] pipewire: Upgrade 0.3.84 -> 0.3.85
      commit: 87c8466fd6c0a8820b605739e30aedf2f0b1bab8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


