Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1CCC47072
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:57 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.6774.1702967270938005649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Femz2LOC;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d32c5ce32eso35863085ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967270; x=1703572070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvzYkYCHVO0cgciyvmluCCcQTCSJnk0TTSc1qc5ygok=;
        b=Femz2LOCVhtTa1KfCUKuL7rhPrjgoVVkHblceZ59PfDdvJFean73+0rANgXpZBYz6A
         YdhAITscKxvE+9poyMwTIF0JE3YHlT1qExBaMkeSnz9zqUt63DPQOh45choll7p0ETlu
         znC8xtvYkXbqGIWg1YLUkC8R7xh+ywYUaOOl7tkwiQrqYAD3UpGb8k2Cdi1xEhgpRAUi
         kJYFVpxXuyBZwWijVrXALjx3dhGfb69RyS+S+X4x3J/LHJquVPnhDn40bgeLm5AbYKUA
         MX2F4UEvozqqQKWMrDMN6V5dCqwplpTqyBk/ETTu/AMO/yN+SCP+Jim6qc1qcX162FJG
         vp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967270; x=1703572070;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvzYkYCHVO0cgciyvmluCCcQTCSJnk0TTSc1qc5ygok=;
        b=CEqV92mcgEaKfMNSGloV57GtMTT0ywJPdv6QW1T5bWNfx3aPqoYYq0l/zkxO7lqF2w
         c+Ki1Mw97UjNFTXV2IcGrCoO+mK4PMEhdUuxGOFlGUKD6CcFxDhtlrj8295q++AHp6XE
         Xgb7HJ6gfm5Wes0NbhgecqywsxVq13QF6YwtF3B6rkKBBquO6ZvaeXJ4zEdpgmoffXlF
         927yT7M4c76lPnpo8eOuXA/Q9BgixzcF3/8CGsYBhA4FgTZQrZTAmU6EQenZFsVSAkTT
         SOOWxI8zsPcLby2cj0ECLiyn7UOHFMF55J8Jl/+brFhUStUMishIBH7D45atCyhbkFz3
         JwIw==
X-Gm-Message-State: AOJu0YyRH5bMW0lLJ0I/qwch3O96bLlocaGixqgGX5UAONaXedCELW9r
	vYKACb++pz8SUvp7mz2Oi0cky3hqU9U=
X-Google-Smtp-Source: AGHT+IFNO4+sImwQJesFOJHgnxU0nXDo9WtLhn0bTQcTBeSAIj6fnXLF7vciViVdput8R9Rywy1hkg==
X-Received: by 2002:a17:902:ce8e:b0:1cf:f868:5b8c with SMTP id f14-20020a170902ce8e00b001cff8685b8cmr790915plg.8.1702967270371;
        Mon, 18 Dec 2023 22:27:50 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702612074-3294-1-git-send-email-wangmy@fujitsu.com>
References: <1702612074-3294-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] lvgl: upgrade 8.3.10 -> 8.3.11
Message-Id: <170296726980.1627685.15866309073257338444.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:49 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107611


On Fri, 15 Dec 2023 11:47:54 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  https://docs.lvgl.io/8.3/CHANGELOG.html
> 
> 

Applied, thanks!

[1/1] lvgl: upgrade 8.3.10 -> 8.3.11
      commit: 3f441ef0d172ae92a41018049ece50ef6bdcd6b8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


