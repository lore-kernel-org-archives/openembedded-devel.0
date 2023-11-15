Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB975C47072
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:19:37 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.8067.1700032776819322130
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DOruDaVF;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1f066fc2a28so3892773fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700032776; x=1700637576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f71DiiH7pnxBDNCFLdoDRIx5Pmlqj3il7r672bgVDKA=;
        b=DOruDaVFr+5BbgjT5LxlLjcyPrB0ylqRPEUjBXA4hwfk5t+oR6BXrd25fzjafN6tvl
         zchNTO0W8swx7iu3hIXq/bzrCRZXExgAvxMAhnPkR8EEHkzj+rXgd/BksS5HR4s9jXPy
         8af2VC43jADQAr/HzaomGusVWfKPwSa9pJZNtOTGA2MuUWK6aZ/0s11j035TzDsWCWEX
         Tn73fdt2DWLxpuzSQ7pvXUMsdwJnX6GMUaB452ddpkPMTjyDX4I+iek9kQ3660D1fyZc
         DfWXck42MW9koCjZDWNeTp1ze5m5sNt1aAYXv4ZHZ9D4+SXsuJNpWXZCm+aOyymTff5Q
         blww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032776; x=1700637576;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f71DiiH7pnxBDNCFLdoDRIx5Pmlqj3il7r672bgVDKA=;
        b=k1yPvvBAgG/nIYVThkm3eKUWLxeNWfz8jZV2mZngpisPQv/e/hmTAgqwRxUBzIEBCc
         LWJ8sZKYiy9k3hrZzGuOiQRPpS/HpwybAIm7OLfx+T9/qiokqs9LZlIhVCrqtFzri7Kq
         1fCGOvegZAsoa1JN0IJj/c4GDiS7h8CEEoHymcQNWQStCvQe2TEWo+1hbVK07w1AC5An
         If/uMKeIs37G5BBTpJwYYGytCKhUX41Yyf+8O0vh0Ak9eyvZAd1wHEfChjcw2MsI4jkA
         XGfFzWpL2ygFzppUX3vMIa8I4IDIGYyrsuAV3AR9x8zbU/zF+bc8Ro01L244hSrS6d1h
         Zl1A==
X-Gm-Message-State: AOJu0YwtRzcQP8eDf2yiLNdN/gCN8GhUfB3+rVep1tGne5/JvIplqdSO
	rKqMaYWaVOxzxKru+LMGILKBKd6hO0L0QQ==
X-Google-Smtp-Source: AGHT+IEGMQZWPTfrJEFgbUqpgIRZ2cZsYtOB67F1pNmV68agsRUgAVKQdsXTiDDwxj6rAZE/9xgtNA==
X-Received: by 2002:a05:6871:328e:b0:1ef:bf3a:3bed with SMTP id mp14-20020a056871328e00b001efbf3a3bedmr16904960oac.46.1700032775812;
        Tue, 14 Nov 2023 23:19:35 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id e3-20020aa78c43000000b006c4d4d5a197sm2310492pfd.171.2023.11.14.23.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:19:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <20231113142909.3093632-1-leon.anavi@konsulko.com>
References: <20231113142909.3093632-1-leon.anavi@konsulko.com>
Subject: Re: [meta-python][PATCH 1/3] python3-file-magic: add recipe
Message-Id: <170003277468.3928366.15123783385806610351.b4-ty@gmail.com>
Date: Tue, 14 Nov 2023 23:19:34 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106737


On Mon, 13 Nov 2023 16:29:07 +0200, Leon Anavi wrote:
> Add file-magic version 0.4.1, a Python front end for libmagic(3).
> 
> This work was sponsored by GOVCERT.LU.
> 
> 

Applied, thanks!

[1/3] python3-file-magic: add recipe
      commit: 5f2bd05add2b2ffede9cdfb714a859341397a1d9
[2/3] python3-wrapt: Upgrade 1.15.0 -> 1.16.0
      commit: 1c7691712f185aff821689d65a49d1cd085f54b6
[3/3] python3-bitarray: Upgrade 2.8.2 -> 2.8.3
      commit: 078646e1b51274295fbbabc340fe02223017c76f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


