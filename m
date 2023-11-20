Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1426AC5AE5E
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:55 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.43624.1700452249459208696
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=leEdORjW;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6cb7951d713so530385b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452249; x=1701057049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nd2U4Y8BWoQnYxhyhBDkHY0O70MWqmUyY8QzepANsi4=;
        b=leEdORjWnjgck2sOkYEEmdo4PgIVuI2sXyiPzUAkyokAwI+8/EcKw6qIjxKKdZinoS
         eaq1w07c3tWVdwY86+VYcgJ/M3ISOvg/rTXH2tWje/Yk+pixZQwZOBUFPYY3F4rj2c1j
         aBlKzuT+21w28oQoKndoYsPLNjb0OgLVNCE5C0fmnoEBTmemOsiQR7W8bfy8YV5xtNVx
         y5KtmOct1yW49bCeMJSmLuVQO8gNDE9bxcanOCmcD6nusBCPu9sboyfXTCoQ2Gb/U/JZ
         O+7bgPrBFi5b8zOijtHMdiQdW/HMzh4eROUdSaO+9bOy7sHT56j8yC9rUKYbTHjDqYMk
         gICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452249; x=1701057049;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nd2U4Y8BWoQnYxhyhBDkHY0O70MWqmUyY8QzepANsi4=;
        b=kMGrFYwuvYq1FWp2Dm2wNUFlX0wVhoM0FUg3YjNOwpYKigDs5iHsshzUqs28RMyRFc
         ceH9U5H+0doul07UGDiIHAJxmQpdXULQhpHp3cz0+sO7UY0TMwG4B2YQhWnPWCAu+q7U
         m84cuAufJBNFIW3UGXptRG+PTsFp5DXni2YKBCUr74VKPx6TBrfFOXMsIc5WOwaUfote
         TKhPgeFeNmAU+U1qulVoLXUlH5Hs1OY9KdB+TLvDtsb8xliI0ga5537tmRF5GW8AoDir
         apLiOwx6jSV1w0OUeZEBRc89W9HZS/8ExbBg1cGW2+8PQauBXUvuttSAgyhtCRSXir7+
         qPSg==
X-Gm-Message-State: AOJu0YzwrEjIh4SXR2uJYUEI6/O3uK/brZxPKinu146S2r10W2nrmtyr
	c5J7WK77nSrKgQ3WOQ4SSZ3OIFkhVIXY0Q==
X-Google-Smtp-Source: AGHT+IF2ig4slG2xefhYpfJ3nHKquUi83IrRfaSEdUUX5peo2Ox44svUzek/0/il6XMzjszzavuL7g==
X-Received: by 2002:a05:6a00:32cb:b0:68f:b015:ea99 with SMTP id cl11-20020a056a0032cb00b0068fb015ea99mr8384465pfb.10.1700452248823;
        Sun, 19 Nov 2023 19:50:48 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122130-21834-1-git-send-email-wangmy@fujitsu.com>
References: <1700122130-21834-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-argcomplete: upgrade 3.1.4
 -> 3.1.6
Message-Id: <170045224781.1416826.9706124261850585033.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:47 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106906


On Thu, 16 Nov 2023 16:08:50 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> Respect user choice in activate-global-python-argcomplete
> Escape colon in zsh completions. Fixes #456
> 
> 

Applied, thanks!

[1/1] python3-argcomplete: upgrade 3.1.4 -> 3.1.6
      commit: 978cd2501b4d602f212bad890cc349c1cb3114e4

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


