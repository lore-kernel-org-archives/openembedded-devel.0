Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEABC07524
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:01 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.3224.1699900438781456043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sc/hDUFp;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6b709048f32so4005200b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900438; x=1700505238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdSwdWhD+Af6fsicGIqN2ePy4lzOPnYlL3/wGNNjWF0=;
        b=Sc/hDUFpifCPQXuq8fNL/GirX4jjh/L7Vrxj6LjhwG/bGae4Odwz5kwXhYYyQ9BvNI
         ZHWq79V/eihCFW6ue9QVZSZ9hLd7zUSy5Zi9lD8+tV6fMNMTfm0dFjWo6DSz1/bNvfxY
         6S6idwhsggLlC6gzaxNI4uR8Vc7EDG6T6sBQYf89Kdkk5qxajaDA6PewYnA90RB7bWlV
         pB7W3vEIYxtNMWOmZm5qNjsl/PcL7+wX/ROa6HDrnxOnUNaUVvov650geKrq8txiZkes
         eZKf3xSd4oOZ6ItkTm/P/pu+Cd/8Pw1rxfrD7OhQ9eQ6Tgg/spM1UY07sW1X9oBA7qjB
         ACog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900438; x=1700505238;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdSwdWhD+Af6fsicGIqN2ePy4lzOPnYlL3/wGNNjWF0=;
        b=qlZW3FTZxgNdvHA2xnDPpjYe5eAThENBOVz+Btz/OaizwawtkaRiZWj6US1fQlygPS
         I94BM8175y/40sxzis8tnyqnoukOsxxUv3uqqmDA5V+eQTGNCjPAgnD6nKwgRjBQQ+L6
         auArrtM7Jgx6QIa+U0I0nbVSwdJa9EgvL6t8CuVMvoQYY5LD3T+r6kdG5Qm7xPlFiJkc
         P3N7nVYKsotj1neo2aNTPbXaGOVaRheEyuV6qf0XcaGEFzWLeADPSYW2lJenMs6Hm1u1
         OfZXIa/TsXkmySO+b1Do1rykVf/JzjwPc4MHee1OtUckmQFeYlpqX7twmv7JX6vs4+Sn
         e+6Q==
X-Gm-Message-State: AOJu0YzaAx4sGafpyxsYX36sEAZWM/SjKsiv0Tlxesc7K+scaMt9qyOd
	4ReY8DbLhGgVEVNPK33Bm2AvXpSRNpmU3w==
X-Google-Smtp-Source: AGHT+IGEa1cIbwHDVrIljNdPKx91ncgPCXQXl27zKPtg5euGP9U1im1DQY+2g0obPUW6oIaq2JUf7g==
X-Received: by 2002:a05:6a00:93a6:b0:6c3:3bf9:217e with SMTP id ka38-20020a056a0093a600b006c33bf9217emr6074506pfb.19.1699900438026;
        Mon, 13 Nov 2023 10:33:58 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112133706.195444-1-alperyasinak1@gmail.com>
References: <20231112133706.195444-1-alperyasinak1@gmail.com>
Subject: Re: [meta-multimedia][PATCH] libmatroska: upgrade 1.4.1 -> 1.7.1
Message-Id: <169990043719.4418.7182333832694222520.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:57 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106661


On Sun, 12 Nov 2023 16:37:06 +0300, alperak wrote:
> Changelog:
> 
> https://github.com/Matroska-Org/libmatroska/blob/v1.x/NEWS.md
> 
> 

Applied, thanks!

[1/1] libmatroska: upgrade 1.4.1 -> 1.7.1
      commit: 8b1805ff1b690f1db172d9c62ddc37162f3ded87

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


