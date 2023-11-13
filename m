Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64BEC07545
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:01 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.3154.1699900437917132438
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rvc1TIzd;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5a9bf4fbd3fso3791254a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900437; x=1700505237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLwkXY6ZLCND/aFWSGnm0ulIASnDUOKC7z2OoO+Glfk=;
        b=Rvc1TIzdn8nUtuXlX7EfP7OUSecdINcGRgsZMQ34AXjaDoUN8vPBn5RFSmVa0ArDbC
         KY7J1FozvQrxnROoB11A/JXXYL29aaViSkZNAJpNDH2gCbReokOSgSEGgeoLANjd4Kz2
         G3LskY4xkZTtPQBKzTvxpy/eGty+mswYPXGMF/q9cGI9OY2D1Z7ZG5vsuDygTkZ8WpXS
         4tWMej/EVhEx3aw8Nn6x7QKYkoRoPWwUZmyIukNW5ZCa1AS7J6wliJ/+ObVD+cz1RiQX
         JAI45cj5S6ZK+xaKI00fGwNjBUXUkPYDlKmkyLwFICEOTvqJ70tSmKGQAcfLSyuC+GoT
         cJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900437; x=1700505237;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLwkXY6ZLCND/aFWSGnm0ulIASnDUOKC7z2OoO+Glfk=;
        b=fvXaAewWmofUXkKfjZM0uFHmgzXZ/3xMnXXx+KaSnWE0qwcHOWHa/OfV0y+YwkUBVz
         LuzxiWNf9ut+qOB7ePJEojxJWO8wszPlswjoWI+ozavKfFrrQxd/DTVgF1USDoJ0ZgVE
         +GYQJYME1Enf4VTxQg4dXrw9D3p/Bjfg94pAsK8tBSvOexz71Gjc4GfvlAGuNz1Med7P
         /1mnxhcnqL2Szu3CA5kWUVOSDskqkPDXHeRtNj+1qcDWtaKGEpDxA853LOV0M6kLVYUX
         5G9m+8KWdP2kqGZGqeD5B/boxnUrpfBCLQfQafUH8N2Ga3EEkU5FxyzvfUEs3mfenMy2
         kBGw==
X-Gm-Message-State: AOJu0Yw9qkmGdD71nQZUwqnzMrHyG7P5euBW2iGH0AawHpVcrSm748qw
	63YqPA3PkXbxIRWCfJOGbh9Lq6pA9hXSPA==
X-Google-Smtp-Source: AGHT+IGqyWjLclRALWpyksVo/6ZhvANqxu7rxzb7DhMqXjHVZ6jI+i1sMkb/3ckfN0wrSOd8xD7luw==
X-Received: by 2002:a05:6a20:7292:b0:177:690a:7978 with SMTP id o18-20020a056a20729200b00177690a7978mr8972295pzk.33.1699900437105;
        Mon, 13 Nov 2023 10:33:57 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112131355.189550-1-alperyasinak1@gmail.com>
References: <20231112131355.189550-1-alperyasinak1@gmail.com>
Subject: Re: [meta-multimedia][PATCH] libebml: upgrade 1.3.0 -> 1.4.4
Message-Id: <169990043623.4418.7053029550355734291.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:56 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106660


On Sun, 12 Nov 2023 16:13:55 +0300, alperak wrote:
> Changelog:
> 
> https://github.com/Matroska-Org/libebml/blob/master/NEWS.md
> 
> 

Applied, thanks!

[1/1] libebml: upgrade 1.3.0 -> 1.4.4
      commit: 7d1a0cd654ecaa68e27e09666744901e21b775a9

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


