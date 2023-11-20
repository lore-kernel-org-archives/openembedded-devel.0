Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C97C5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:45 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.43595.1700452242559649335
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dgKi6o5f;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-da37522a363so3715025276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452241; x=1701057041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GP1vFuvIH7D4h0y3J1QoH0aYpxqRkt0TrT0AspHsonQ=;
        b=dgKi6o5ftUxda2wNmCphCYK/MVFILDJygaiIhGgWEdnk85IbG3nQSSBx2wPWYeMNW9
         9GhahsmPArecVtAi6UgREdzgK2FImlJr+HkVgPAG2Kljof/GS5ElLn59cZF0tEAXSEr0
         yt/E6QadXoX8kP6C6P2SZxms2+EO6ztmQVWR6WaeXF+bkM/aWiaCuE2R3ej7eWzhFVHv
         Y/Ran2yFp/aVqdlNyDRBMYuTZp1b5qzAn8UxSZXK50LhAsFmjP4KwfNFAh35BQpWhrHk
         hCIrLG2+CWiNBhlULmtc/TTH/ZbqCOHfuWVwr6VIVDR+vSBM2mkopLZ8DZdO17Petht2
         idpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452241; x=1701057041;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GP1vFuvIH7D4h0y3J1QoH0aYpxqRkt0TrT0AspHsonQ=;
        b=EGmd23Leijqso7o8qB8Y7LQ7PuMs6ZG4aKuMJQCnjgu5mVhvIpaKcWeIk8FOtHr0AH
         xkXvgBOiCHMmvpuE/xMFjxtAoVY3MWV3s28yphD88Necd+3bUSetQfQioPlXO/IBX0as
         N55KlfMJWOg4UXYU6Ce3MA1vzerQKrqGYQBpCjOnqBgpggS7kk3dgos2TQTy/qu3PzwP
         L2qr7wwIcUKsYjqHPzg+MMrXf0mHRolU4EIwzRHvS97SsUCUdNttyeEIu0NdDsZl1VcM
         8NRbeJkTfmAo+qXJd63nXlC1x7HRvx7fMwoFLyXvOJ7X4yIz2NfGiNo1mzPAa3UjzodJ
         bkKw==
X-Gm-Message-State: AOJu0YzMVpHQ/1t6NqaqfBPxYPNMFYUj+HvgDFS9fNhqEtA+OJ7C0mNV
	/yzDWiag6tNqBYgpBFlJp6E=
X-Google-Smtp-Source: AGHT+IG2M0ibcuwRKDK/m/Kh6+MT6MdHTWAfd5gC3dpCpk5cLJho1Ndx2XDM4mYnIy3YoPgcrmJIqQ==
X-Received: by 2002:a25:69d1:0:b0:daf:483e:a65f with SMTP id e200-20020a2569d1000000b00daf483ea65fmr5603580ybc.56.1700452241436;
        Sun, 19 Nov 2023 19:50:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700120812-21410-1-git-send-email-wangmy@fujitsu.com>
References: <1700120812-21410-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.21.0 -> 1.22.0
Message-Id: <170045224063.1416826.13084721592873986224.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106899


On Thu, 16 Nov 2023 15:46:52 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -ares_reinit() is now implemented to re-read any system configuration and
>  immediately apply to an existing ares channel
> -The adig command line program has been rewritten and its format now more
>  closely matches that of BIND's dig utility
> -The new DNS message parser and writer functions have now been made public
> -RFC9460 HTTPS and SVCB records are now supported
> -RFC6698 TLSA records are now supported
> -The server list is now internally dynamic and can be changed without impacting
>  existing queries
> -Hosts file processing is now cached until the file is detected to be changed
>  to speed up repetitive lookups of large hosts files
> -Internally all DNS messages are now written using the new DNS writing functions
> -EDNS is now enabled by default
> -Internal cleanups in function prototypes
> -Randomize retry penalties to prevent thundering herd issues when dns servers
>  throttle requests
> -Fix Windows build error for missing if_indextoname()
> 
> [...]

Applied, thanks!

[1/1] c-ares: upgrade 1.21.0 -> 1.22.0
      commit: e712c01d177c3c30595203f73b9b7a5003cf9dd0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


