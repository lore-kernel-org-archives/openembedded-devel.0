Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8D5C47074
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:19:37 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.8080.1700032775365590244
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mmQouhGf;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1efa01323b4so3970979fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700032774; x=1700637574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3WBW8vp0aDCHnd1yH8kAA3rOHXzbJM35qo16iR4Epc=;
        b=mmQouhGfYiJbU8XtGLBm8X35CTbK+bQXPpEzNJDPLjMukLVa8Wex3g2qACdh8+fAng
         K3lStdW8mJux8GiCYNL/XuH+CNNmVDMQxO/FUrMCQn+v1kcRoju19u/ENoJe4MmfWktA
         K1zB1iccW1nJBdRb73dZu1o5G2eOC6GdYZZc9RMtJ1iu+G+NVwCxpqzfzdCySBp+dtm4
         WaKNyy+Lmnh1enecwU1zRMILVzULomZ9rqx3TaQtT0A99jilZ/ijwuHXy/8M88lG5nGj
         hwLrW78xukutHlCw+sctfC8PnbFMFf9G+2Xt3gAsjEJp1MwP2t+4cIw5OeXNFZ6GbWw4
         4PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032774; x=1700637574;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3WBW8vp0aDCHnd1yH8kAA3rOHXzbJM35qo16iR4Epc=;
        b=TitNoHrFRP8G0R+igq4djjTRZFtaxCFbBKi/YTBpEM52fK8/JHvLi8ln9z8QIejlCc
         etDA2kVkLMqVhxaYpxaSPxsr8kHEmgi+3yNC7sycGqkkfvQ25WeJrbgSQF6uualV+yHn
         5ktBTAqp03HQHZ+uv+RO0PjRN7ZOQn47R/iYbzyxNCXGENWmsDcq6c/N/L9ZXkQ9NdXc
         AbQlIYRg4sL0MUe4HzTxJbSV4XhgECgFADwxgXeuZ6aqW5ZTX/LOeosf3dtY6WbiYFxz
         m7dRtscn9tWqf2Xsb6ugPJuBQqmyipVxKvBIrh0XkadTkgtyHs8AFBmD5rqxgBC38rJb
         j1QA==
X-Gm-Message-State: AOJu0Yz+TeOS3RguBRiPgPCeLGGOcEoq1eBVdZEXytXNy2XgW6aTKo9O
	auqcIhBJQPv4PVPj3SkASfHKhkYzdmxctw==
X-Google-Smtp-Source: AGHT+IHlY64ggGqJxUiDnjHoOiQvMhCC2DLcxB7jsGN857N+NWR+y+J1d17iJ779/w42utQUX48oog==
X-Received: by 2002:a05:6870:2dc5:b0:1e9:f69a:1302 with SMTP id op5-20020a0568702dc500b001e9f69a1302mr15717140oab.48.1700032774536;
        Tue, 14 Nov 2023 23:19:34 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id e3-20020aa78c43000000b006c4d4d5a197sm2310492pfd.171.2023.11.14.23.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:19:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
 Gianfranco Costamagna <locutusofborg@debian.org>
In-Reply-To: <20231113113942.112938-1-costamagnagianfranco@yahoo.it>
References: <20231113113942.112938-1-costamagnagianfranco@yahoo.it>
Subject: Re: [meta-oe][PATCH] dlt-daemon: cherry-pick another
 upstream-proposed patch
Message-Id: <170003277333.3928366.3389984963048775953.b4-ty@gmail.com>
Date: Tue, 14 Nov 2023 23:19:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106736


On Mon, 13 Nov 2023 12:39:42 +0100, Gianfranco Costamagna wrote:
> 


Applied, thanks!

[1/1] dlt-daemon: cherry-pick another upstream-proposed patch
      commit: e080b9d718a3e01cbcdefd03dc9da1535f6327b5

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


