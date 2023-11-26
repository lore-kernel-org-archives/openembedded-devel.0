Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B50AC07D59
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 18:39:42 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.61832.1701023981398807685
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Nov 2023 10:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DF9+ysn+;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6cc2027f7a2so708513b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 10:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701023981; x=1701628781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6li3glKRnN9KJYzkPpMLP8g7CvnVcnupdJHmBPgS/g=;
        b=DF9+ysn+hG7dORFbcv7tGiijdLDJmbDyfw/H3TB881kKvRlOpXV2SslrPt8iWN4E3/
         purJFN3/RyYo7riWYvaSAnnqCAH4IFv+kap9X4QB2H1d9iqX5wEnCKFsAaYZPYspkFKE
         uO46rSNZ5HQgw6AWWSb6gBHvriH/jBoeMLlDuVWfvpK1Oj8aISfJv0SAu7Gjcwq2/YjG
         vCxzgMGp1aHVUuAQnjh70Ul1xC7611yBBazmRVrMupJGsp4A0a+xlSqGJfLd5QDdRzgz
         HaJfWKgww/1+Mxjt8MUTKOD7lyKZGOSSe4iAaRlkwLrNwpbTusEgVR21NY4I/oHcFkRc
         EdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701023981; x=1701628781;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6li3glKRnN9KJYzkPpMLP8g7CvnVcnupdJHmBPgS/g=;
        b=WYxgA2l+a+RuXUctsxOVzYmT4jJjL16xbpCPh49cOr9tos2z7WCUcFWvcZ93Pw0ctl
         dzGKN3lJvo8evzveNIH8RT6OyICzia3EI5+NrrZ/ZoMv6+v8gHfsuyj2XwyikigSK+Kr
         Hh1RJy28sA1ppWZgSQZvWHlykbdIHlPuWKckWayozYGVejBwnLMZflOChNrCw1poJYPA
         xuZnGZtYUVIILfsr4QBiphmNSf9p6Y+PFlejjADSbcSanJL29VYXpyg6E6KtQhQpKhdk
         6jlA3sqFzJ9ADGV8k2qypVIzM81T2EXYojKg2WGO3f9vUFvjLa/AAhY81Q2dM/Qe/7y+
         fWIA==
X-Gm-Message-State: AOJu0YwRf1kBiU6NecGQvStVCVj03yPhZrA/DWoRVcQHA++xsTYgOJ3r
	TAzlxoNwH73I/TxveZGZuxFK5Ince79qvw==
X-Google-Smtp-Source: AGHT+IHIkMmvePdlCZk4NljymkIFEiw890R31WvAqizPGwcOuxm3JA52uHScw6XMYs5Ce0cBS5cY3A==
X-Received: by 2002:a05:6a20:54a8:b0:18c:3511:665f with SMTP id i40-20020a056a2054a800b0018c3511665fmr5776429pzk.51.1701023980751;
        Sun, 26 Nov 2023 10:39:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id ei44-20020a056a0080ec00b006c988fda657sm6157448pfb.177.2023.11.26.10.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 10:39:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231125140317.12111-1-f_l_k@t-online.de>
References: <20231125140317.12111-1-f_l_k@t-online.de>
Subject: Re: [meta-networking][PATCH] system-config-printer: Add
 packageconfig for polkit
Message-Id: <170102397977.3308314.5825464739197840614.b4-ty@gmail.com>
Date: Sun, 26 Nov 2023 10:39:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 18:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107053


On Sat, 25 Nov 2023 15:03:17 +0100, Markus Volk wrote:
> 


Applied, thanks!

[1/1] system-config-printer: Add packageconfig for polkit
      commit: 092502feedc45d3bf9b9a84dacfb9665d6322db1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


