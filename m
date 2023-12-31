Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034F8C47079
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:39:00 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.198997.1703983130951178414
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KELnoy8a;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3ed1ca402so60864855ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983130; x=1704587930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSxwSSYmDcNaKfl3lOu3ZNmgB2Ntq8eB5LekdfksJMo=;
        b=KELnoy8aC66/yr11rSyMZ3itq1Uv4PzD8GWBnMe2+E8AUTu/On+dfkYLDn/tFYUPzo
         zF5cN9B4I69scljwONsU2SL/x/nAZyiVuEdckQwsd7N0EIC1qqcztbrtlFgDJkLifA7w
         0w1p35kwwtFVD/slGqsSpcoDuM6GyRqZjNi2SLKZJ5THuWY6VkfghASh6T7qd/ijE4py
         ly3Yfu4O+/eoAibLrztOJk1442oNhNNIgEBKM3vUpom5VE7M8ylfXJmBNVp3UL+sH4OS
         0es/qzkfeC2c0VEoVrh6V3oiAgzbNxc+X1uj8zwTNQE6SCXuo1m/5iZFFevQ3ucvJzfr
         C6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983130; x=1704587930;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSxwSSYmDcNaKfl3lOu3ZNmgB2Ntq8eB5LekdfksJMo=;
        b=JsKAdtdEWBRmry9WPl2Kw57q/1hAXPbM04jxCkTUHEoiogs7j4fvG7VKizSgeaLT4W
         4GbaQpXQFP/pANwYDDs52wfo6Thv5moEiNAQKCC0Uq/DdN8InmOjit4MBIrvAXL6gbEM
         0LcsL2rSuDV4XIZAfjIwWRstR2mpdZF6V1dV9BDNnlokatOWtDMnlXyX9V19HissDZRE
         cq4GlXq+tCtipL2WwhvP7Q6mGow/XoLFS8d4ABFtl24lJHiv28PUXV/yDe/OWSzV0t4E
         lkV5Y/VkkVUQajYva8iTu/ol36nq+IvvqpsNX9OVed7f5KjVq0oNz2ycAcLmU5tP3qtI
         6NcA==
X-Gm-Message-State: AOJu0YwSztXB7qk4hpJO4HJTqGAQubos3dG6XfRs2lmPTHfhzhHbMPH2
	awgh2aQUTheslEpTcurljnl/rJ7cuak=
X-Google-Smtp-Source: AGHT+IE5k2uAgZGI/A8UGnBZhncz9zWXWnDzIp563DMk5jN1FdnaeMVeG+MThyAnEvA5Lmw/SHaR+g==
X-Received: by 2002:a17:902:eb91:b0:1d4:59ab:36a0 with SMTP id q17-20020a170902eb9100b001d459ab36a0mr15742541plg.99.1703983130383;
        Sat, 30 Dec 2023 16:38:50 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231229171235.2649336-1-derek@asterius.io>
References: <20231229171235.2649336-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-dominate: update to version 2.9.1
Message-Id: <170398312952.873206.1664142786441919663.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:49 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107947


On Fri, 29 Dec 2023 17:12:35 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-dominate: update to version 2.9.1
      commit: 2f4372ed707f281ee1d0f95ca1dc553de3ff619e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


