Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9E0C5ACB3
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:52:21 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.19091.1700171536802588538
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VdNWrnCN;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28398d6c9f3so16647a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171536; x=1700776336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SDQ/NLQy3vcPJIlgSALDJcND4Q1xT+BHUVJJUdd3+A=;
        b=VdNWrnCN9dmRJ2uKN1lFYHsfY1D0VThWvWBPo+zpVjhVl4hShExujikiXtxkfI7G62
         /yhKuE4apo3CdXD1vUnPaiaQp5WAqOZAa4siwxUDh7poexLdXBC90r3DC21q86wxjpjM
         xZQGs/b7ohXkojJQ/f83oDjR3XGNPnbfynS3kbwWPiJ7rTFoHBYusG/jCew0Fun64VU5
         IBwrOaqfeg6q8r2B23L2O++VcRd1wqXXTudTCWYtV78DQgu3xDF/P/jcaJ6ihciqR5O2
         8sxhnT4raXDsBsUTLObnIb9LsH0K6ZalMrEED+LmDi3unBRiE+L90gVgDRtnwxMtQxhq
         UDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171536; x=1700776336;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SDQ/NLQy3vcPJIlgSALDJcND4Q1xT+BHUVJJUdd3+A=;
        b=oteX7M4SwMaUD7VZa+08X2G93tvIAIpgY7Sem25e/yVMiA7dKUbtPdTmtgyi7DznOx
         otNB4PUqLWmidPcxxnFM5ksry1Y4KMYMB+mau5q9W5j5qy7gfT7ZLkD7h5cDzhO365kd
         WqgvXE928xkItYs0zeTftPaFSEr86M8Rz8NeKhg7i5zJfYIm99HwzabfabdQTfPDeGn5
         RH9wh1LILTf5IX/ISX8Fyw6xpTORYN1SxzEk/OHi3xU3uej/jIZDNW8T8aChf6M48GnN
         0xkolZARrj3htwbdo+ZLRjS1ilbjO4JVUBufRbvaCp8ixNLWta78XdJCOIqJxpK+XkQ8
         CgWQ==
X-Gm-Message-State: AOJu0Yz/QQckXaOwZdW2i/hm/Uj8FLsEipa+mtuUewuucTVkdD5rMWPN
	2Zd1MXCdhXlFkrImvpUar0QjPcKJASO37A==
X-Google-Smtp-Source: AGHT+IE5wJHyq0dWX0W7yqJ07D5c0nSQZLL3JaUicdRW5UYAS0rCcLgjWh3EL6NnXh5UAjJUc8C+Fg==
X-Received: by 2002:a17:90b:38cf:b0:27d:3f08:cc21 with SMTP id nn15-20020a17090b38cf00b0027d3f08cc21mr20151130pjb.5.1700171536007;
        Thu, 16 Nov 2023 13:52:16 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id ck22-20020a17090afe1600b00279060a0fccsm181763pjb.9.2023.11.16.13.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:52:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Yoann Congal <yoann.congal@smile.fr>
In-Reply-To: <20231115165627.2225562-1-yoann.congal@smile.fr>
References: <20231115165627.2225562-1-yoann.congal@smile.fr>
Subject: Re: [meta-webserver][PATCH] static-id: add missing netdata group
Message-Id: <170017153509.250978.11366080137850164388.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:52:15 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106839


On Wed, 15 Nov 2023 17:56:27 +0100, Yoann Congal wrote:
> The netdata recipe does want to create a netdata group. So add it to the
> static id for the reproducibility tests.
> 
> 

Applied, thanks!

[1/1] static-id: add missing netdata group
      commit: 848520306e780136c5ead1236007bbef75522bb9

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


