Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B8DC5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:15 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.43605.1700452265430957369
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ws81k0kX;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6cb7951d713so530469b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452265; x=1701057065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIzBVG9wVQRufcAmkenHJ9NqWoHT7U2EYkSJYyeejws=;
        b=Ws81k0kXhyWd22yRCZPANFI+VbhPMJczsvoK7laVC8KE6FRseCnDYZEyc/EQATTfzE
         /6ZPSHApgOBQd1vof5qACgxtACf2YCi3faPiBijCQRK3eowitejhNBHOtarD1VHW0G+P
         WC4AFFXXcNx+t4iB23j670wQ9a/IkoOOlvJOfG4cXbC48hWG6P1XW6MrLck7i+qtJbuS
         Inl1nJ1fgdcnt9pa6OTF8I01aatrUFMqlEvTP26sX36vJwV6tg5WPqSWw8MSODFW6j9d
         VrtAFoHQkox2REqsmNDsW+rR9v4BfBQ4mY0I9JSEzok2hQ7sCBiTL2Fyt9s8NuDLq4lR
         avzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452265; x=1701057065;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIzBVG9wVQRufcAmkenHJ9NqWoHT7U2EYkSJYyeejws=;
        b=Irga08qAPQbIDIDnMMKPwnP9eucAgkflo6WRDpNO79hHCxtERDm/PbLRCMsouGg6K/
         OZEAetL7g9yHkJCn2hReFkH3BXzgZ0x4v6zLIakK5o8mI2DeIbmv5Sy6X85fXHJQmKG+
         msRB3+Gf/5uqgIJqXq4YarSi1mPB77pnFKSFkXdlA5/Uz4pZY7Ks98UPenLPi3taj702
         vdz6zaftVxwNuI6K0BloDOnx+ocudEQkFxz+LbTUamU3BObCE9RwyP2iJkmdHfzVnOux
         V+U4hA5uniaNHnPqxfNBtqENDrgfgNKW/JTZlOy/w1qbENLQE49jjCCaekXFNYIijzvp
         hPqA==
X-Gm-Message-State: AOJu0YzGX1ENGSUNYymLiBoYiqYcaEk8nkLBI7WUsBaKoX1Ei3xZLLpn
	/Wo01bZpuLPzUWhrivI5IVvQNPq6hFhIZw==
X-Google-Smtp-Source: AGHT+IEmLYY8jxeOaEnnQjihbewBy/ETha3rChhms8PW5BfWSfGrA6mECQvJpf4mCs8JWzb+Q+Ni1A==
X-Received: by 2002:a05:6a00:4c84:b0:6cb:4361:773c with SMTP id eb4-20020a056a004c8400b006cb4361773cmr8907767pfb.5.1700452264803;
        Sun, 19 Nov 2023 19:51:04 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700123464-22460-1-git-send-email-wangmy@fujitsu.com>
References: <1700123464-22460-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 3.3.1
 -> 3.4.0
Message-Id: <170045226364.1416826.5249249619612924104.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:03 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106921


On Thu, 16 Nov 2023 16:31:04 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Wait for workers to finish reporting when test run stops early.
> -Added support for Python 3.12.
> 
> 

Applied, thanks!

[1/1] python3-pytest-xdist: upgrade 3.3.1 -> 3.4.0
      commit: 4f31001c57698d87e342832c8fd0bdc07109f4c1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


