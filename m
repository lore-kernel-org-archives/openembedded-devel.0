Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99D3D59D6B
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 20:38:16 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.29197.1732567096197992045
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 12:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DB0mXRUL;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-212581a0b33so48294005ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 12:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732567095; x=1733171895; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCzF3BFpnEAcoMlFzqTiF0DyuCgjfLKD5xcASNApO3o=;
        b=DB0mXRULwxQuDalnPp+Wh05IrMntqgcAXWAn0/nj5KlklZOhki3NSL1tGh0By2TqCa
         CLaYdiTjCmb1smtltq+RyCfx15mIEe5tmy/b3teWTy22fWsJvKypwkUH8RtbMiLup2c6
         hNTAYkotMdQqfZKow8eJxJPJZPgYyIcyn2hkTLLSyTdqn8SYzU+CN5OFkvbooeeQ9hJP
         nGzrBGzt0fwdSLXaMagpgU2v6p85cYo+AqXHJbcrWulSUslNnEbdtZcjqsOsWSB5ofUy
         SuyPno//nzEqZ5M3Fa33yzYgmukZ0qZ3GWABjl2G85kfqR03mZtN0kxybnlMpH9YvrzJ
         zPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732567095; x=1733171895;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCzF3BFpnEAcoMlFzqTiF0DyuCgjfLKD5xcASNApO3o=;
        b=KTzEJBVnpbZH47klyLBy2+ppImKHSdVZ8psShc2xSAd/9TgfguJYKAA2xRdu5rZbnM
         arCVI9hmBeUtcMK+HE/Qafdb1T1HGmgXxRpTW0ZulNTLf8mewDxcwrA4vfslzONEs7iz
         yyjoqO2jz3/uIoGC+OT9F0F5l1miOMSDo4xbKerMg/0sW8aPpuS3NbPyvgh2D8n3FKBx
         Oi8S0cAZE/qHqOJUzm74LCf6dDk5/L3ZQqN5BZp9n4KYqg303faoqBm7Q0H6XEBJEgMm
         /SqaFbkAciTMhTqslJ82rz+/48qPONW2w0yOAAxwBhRNJhBNFL+IIYwyiMsX8U7sdq2t
         0l6g==
X-Forwarded-Encrypted: i=1; AJvYcCVRt/D7RmY1E9umuGVbiF7JLbi3bKCTmn60BDONCW7wVAK5TUDuoSmajFw3l8STjj+nmdPz1gOnIMdvT4zIxzuG1LM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwyELKxGMuQpgQWNqLX1fI4fxBs1CD9PngoZxS6tQ394Bjw+nmH
	FHGWoPFeSkEtg22h31CGuY8iJwKykz3vLvDmWWeRuU8hS/KsSlIx
X-Gm-Gg: ASbGncvvG/XGF6qtWHD9LcU7xSXXZoe84LjhsobUjWsLq3RMmrSrwnfUu6x7aEutOqi
	Nk6Gyz7GfF17bHx75gUSEYttK4khsiLDwDED2+NcffBWx7Jhm0J5TkjNjlpkAHpCZFHD/x5HIlG
	468JbYuHr9W+pTcCGHV0RjZqT3bSmz7Jxgl49B24kTltb6vOXi6Ba3he+lP6qS4lABsUfqXs7SL
	l0xah0l844R1SaIoDdDM2JoMzGD/8WmcgIuShXCJPS7pyLEik6K1TqgWvrXODsruRkgOOo9nd/u
	CInCcqQ6UKcl5VvBIOcO7+Aj9g==
X-Google-Smtp-Source: AGHT+IHse89ePontgjjnxcoYUmquZ8FOiKISJ2+PIxgQKpzLiBVsuzt6PBT2X3CRgdP0iL9N3B5AHw==
X-Received: by 2002:a17:902:e746:b0:212:38b7:1584 with SMTP id d9443c01a7336-2129f2a477bmr153442795ad.55.1732567095496;
        Mon, 25 Nov 2024 12:38:15 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:4d1a:5586:dcd6:8931? ([2600:1700:45dd:7000:4d1a:5586:dcd6:8931])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc147c9sm69527005ad.211.2024.11.25.12.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 12:38:15 -0800 (PST)
Message-ID: <a4b285f6-9655-4516-a027-78ab642368ce@gmail.com>
Date: Mon, 25 Nov 2024 15:38:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: stryhead merge request: Nov 25th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 20:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114052

The following changes since commit afbbe81df6425805392b62b6f153acf740782e8a:

   nng: Rename default branch of github.com:nanomsg/nng.git (2024-11-09 
14:07:27 -0500)

are available in the Git repository at:

   https://git.openembedded.org/git/meta-openembedded styhead-next

for you to fetch changes up to 7cd38212e73e0e9f42f4d92defb16dd81f71221d:

   lvm2: Remove the lvm2-udevrules package (2024-11-25 15:32:56 -0500)

----------------------------------------------------------------
Fredrik Hugosson (1):
       lvm2: Remove the lvm2-udevrules package

Khem Raj (1):
       python3-pdm-build-locked: Add recipe

Wang Mingyu (1):
       python3-alembic: upgrade 1.13.2 -> 1.13.3

  meta-oe/recipes-support/lvm2/lvm2.bb | 16 +++++++++++-----
  meta-python/recipes-devtools/python/{python3-alembic_1.13.2.bb => 
python3-alembic_1.13.3.bb} |  2 +-
  meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb 
| 13 +++++++++++++
  3 files changed, 25 insertions(+), 6 deletions(-)
  rename meta-python/recipes-devtools/python/{python3-alembic_1.13.2.bb 
=> python3-alembic_1.13.3.bb} (80%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb


