Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496ADCD12A0
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:16 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.82162.1712504588189492678
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bUlHMGgD;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so3012374a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504587; x=1713109387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/oi0LSLJDfzn0NGZgA/AL6e5MknOe9kwGRe28soGJU=;
        b=bUlHMGgDW4KFHZvPANE+/EoF4VrYZVtGZafJ4Xt2NYePv4ioqxrOvZJUOVYSMy5sLt
         fYuuTUiIlXycNx6i9FZ2zjOVIYpgbgRo2Z0pVuW2+X4A2q46F81JFj0yqT7tHM2Vtdpu
         w6mIdHhYeJHDtYlo7DGVVIhCrVrS+719TyoQvgooDrVnxFQAleERsM0JEUCOcZVbIssm
         ejk0isDk5oS5AGdp4QlOWL3XX7MZqa5Yb/KCzUWzQ3/y6cmupyi4Frs+kqxHOAXyVAqn
         EpLTzXI3wZw7oxKf3sgNv2XkoBnqbYg3O6yrtlthT3V5CSojAghwojAB1iJe1KWGt3Jb
         2Vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504587; x=1713109387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/oi0LSLJDfzn0NGZgA/AL6e5MknOe9kwGRe28soGJU=;
        b=C2beg3Jo+mVtiDtvtWKn4JsGrag0lE1aUZyTuVlmCTT7tt4/0vOBpBAiPL6HR2zv7P
         sui+grQEVLas6L1ZklKfIzWJS0U1B9GjNv6BGdcBhZVny+o9hrnhSaxCHK0upgMmKBR2
         t6v7gb3wolIiFDckCPsIdESX8SXyurZleTHYXgBGOxPuUYbL+ygpEtp1JlOZBwiRiETr
         pphUo6S7PDjhMBSByMliMdaJegMfk/FuYn3P7GFgmq9wL259BMQ30C8dRzWs3pj9zqjo
         17zaJqaBduytDsNS/WbrVV9rYodGzHxIp+wJYjacc51zLslCTmpIzbSuWw5a4935Og14
         37+A==
X-Gm-Message-State: AOJu0Yy/p9YaBDxx8/7VAYu3MPIZL9qk6VJdpme4gK/LEAVWIcN513k0
	COCnPvyvnKoL7MG4Eb3XtR0A/KQfaj4Np5qKomvSdAtEnuQUS1xy2mJRDMEz
X-Google-Smtp-Source: AGHT+IGd/8DcoC+InnthFGJBODxlJ1IojogXTxgHPuDoSzEdad6l7iUytIlMNw/x7VjpCpYOLtoQVA==
X-Received: by 2002:a05:6a21:3a83:b0:1a7:3b4b:4153 with SMTP id zv3-20020a056a213a8300b001a73b4b4153mr8204822pzb.58.1712504587420;
        Sun, 07 Apr 2024 08:43:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Beniamin Sandu <beniaminsandu@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-networking][PATCH] mbedtls: upgrade 2.28.7 -> 2.28.8
Date: Sun,  7 Apr 2024 08:42:53 -0700
Message-ID: <171250415787.900727.9124731266763282069.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405121308.41895-1-beniaminsandu@gmail.com>
References: <20240405121308.41895-1-beniaminsandu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109844


On Fri, 05 Apr 2024 13:13:08 +0100, Beniamin Sandu wrote:
> Includes security fixes for:
> CVE-2024-28960 - Insecure handling of shared memory in PSA Crypto APIs
> 
> Full release notes:
> https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.8
> 
> 
> [...]

Applied, thanks!

[1/1] mbedtls: upgrade 2.28.7 -> 2.28.8
      commit: 6c9a01f67003760ca72eedd510bac1f9f5eab8f3

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

