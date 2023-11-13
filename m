Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B250C07548
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:33:51 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.3141.1699900425411142276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cqHfhQjT;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6c4ed8eef16so3112183b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900424; x=1700505224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LYNegpAvuQN93P5cqFVyRYOGYUw0UlPB3pENiAeEiU=;
        b=cqHfhQjTQtTMPOIUHueuBdpWc1PfNAOvzmtQMA1hsYBoaxga6BJZOLXPJDoacBmgJu
         cwIoQyk59vGzIFRFjsweGwAst8xmF98qs1uuTceh0grT26zBhNUumHz2juY8TpaVFhkt
         3kCdQ0m6Y2uyUNfO3O+22z0400ovv2W0hcUWYHRQ1l20gFvDZ2zd6ETO96D/MC1KyFcr
         P/yWDSO5gffG80NHl3+Z0IZ4pftCOcuzj55zvP67od2UlduYpEIufbpPNMSaBDDZ3hVb
         S0Q69FFktYjrTv61t8jdZwdzVEi8VUVKnjbgnKFStWg3wHZXlhHymrsVa1BS02DN5jn+
         mHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900424; x=1700505224;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LYNegpAvuQN93P5cqFVyRYOGYUw0UlPB3pENiAeEiU=;
        b=VBKyRulX8tKm08nu2+OExVuc+C6AA7tbVo9tpPHx9f+YYHj6MbrFl8W7SPVHJLomP3
         bFSNZddzt9tNCa77WUEZNbSz5cgib7x51VZj9MJhau/abY8mLF2ltmXZtWvqQLIwCwHb
         v+fry/Trhr7KMUYXBp/cupuK7/Ct8rnUsp1vmCprtNyWTmAkSEVug0UVDL8a+utsLiyX
         OZz7HUO6HI3CQNcVCfxjRWbSwyp1eDNuZOw2dWE5nn3fsV+uj0wgyNU+MZI+0kAV9J6H
         CId3GVXbONeze5IQXdDekR8Ibh5MPLp7rV5P+2rTy5zbjKrO8N8uIVVq2gmXpS9VEpUc
         q4cw==
X-Gm-Message-State: AOJu0YxEZd0MD+Zy2PyP1hN90C9IeRdHouqGIa6R5RkGKqCl4IiAMns0
	vFAT811cO3ktTdoUYsg9Jmea/M9Q5nxB9g==
X-Google-Smtp-Source: AGHT+IH4R+iQbYh7WpK9dFfsqHQcIZ8pLYjeTLNTcu8dIIQv90BVw9QEhIlRwy5ayLzGiK7/3Irwpg==
X-Received: by 2002:a05:6a20:da9a:b0:186:aac2:26bf with SMTP id iy26-20020a056a20da9a00b00186aac226bfmr3063365pzb.0.1699900424459;
        Mon, 13 Nov 2023 10:33:44 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231111201224.879226-1-f_l_k@t-online.de>
References: <20231111201224.879226-1-f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCH 1/2] gnome-console: Add recipe
Message-Id: <169990042330.4418.18086260996014996257.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106649


On Sat, 11 Nov 2023 21:12:23 +0100, Markus Volk wrote:
> gnome-console ist gnomes gtk4 terminal emulator
> 
> 

Applied, thanks!

[1/2] gnome-console: Add recipe
      commit: 6408ebb96495752cf8d23be68ade863c6bc9c0a7
[2/2] vte9: Fix build with api-documentation enabled
      commit: 017c56d47ee003ea8106dd94d21d45b8432bc05a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


