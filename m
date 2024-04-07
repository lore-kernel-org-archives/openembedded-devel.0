Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49883CD12A1
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:16 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.82164.1712504588949848383
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eDG+25a0;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ece8991654so3359487b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504588; x=1713109388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebProocIhIIUUbXOBId5gC/i7SXCvYQUnlCiJ+kCap4=;
        b=eDG+25a0pwGH4lyK/exG2G0Bd1l1cUk0KHFDRkKDIsbTa6UiNuQQ/fDieXfIz26hID
         vSoSKptq9hjp1ZDywmUK2loZEnx0YROWnewHGc2PqKH1Xz/0gegermanjj5QZ1zuVllk
         Eql+VnLvRBfcZMQ8vDXpSva/tpLV1LzM1NILIatwYjuVMCQ6N5PP7OmiLLufDtGOb9Tt
         GyrSpP9AWiL9AkGcAvVksqrIN9dd5NGoOGlxsci+obHq5PTGIGkm2/befu86RA4qikSr
         Dc61voaPkxv9XRftSHHuuwptcjQe46+Ps5cBLnWdTLkKlRbBHKJ06iZkln7F6ic6+9yl
         2tAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504588; x=1713109388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebProocIhIIUUbXOBId5gC/i7SXCvYQUnlCiJ+kCap4=;
        b=GnIWE4bVdHKIg498u5LDQNUzQ3e3g7LCU/27yRbFVy9y7W6DI0+KIKXC+RvfDXpt66
         766eFwygevFp83UP9Lb0yD7RACTRtqgLuaVm4sNY37bG2Ydym5Bhq5c8ARkQwBtD4CHy
         AUoh7lNODPSzVFcht1M3t7nAyop/8/wJAWUUChTcvZLJeY46wehfw5xVj+dK4fVREEDU
         iPA5gVbNew5aezvy0S8bVPYhQXbzSJWRPE4xHzSYwOJ3qN+ty1dev9uzC/HN5lIQSu7k
         6lgv6WI3ivPQSxhllxkDDR2h5X0nqOcTB3P+9xiBjgku6Ku2cXYrfpJU6fNqLLJjZ6Qr
         H1UA==
X-Gm-Message-State: AOJu0YzKjq08JOuFHzRAxjPyM+FhMG4BqHPKGvx/tsFbvesEIYMluytn
	bik5Y29kumdDL+GiKksLvR2b55YLDebJED2yZ0WyRrj/b0GOyyUe5/9Nca2f
X-Google-Smtp-Source: AGHT+IE++6+DAxk78Au7JR3kozf5QecEY+tLtv3RzOAbhHG7f1Eog54Ap+78v8Il1NZRkZByB0gOig==
X-Received: by 2002:a05:6a00:23c3:b0:6ea:b69a:7c78 with SMTP id g3-20020a056a0023c300b006eab69a7c78mr9055893pfc.14.1712504588185;
        Sun, 07 Apr 2024 08:43:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Beniamin Sandu <beniaminsandu@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-networking][PATCH] mbedtls: upgrade 3.5.2 -> 3.6.0
Date: Sun,  7 Apr 2024 08:42:54 -0700
Message-ID: <171250415787.900727.11360296446322397478.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405111053.35069-1-beniaminsandu@gmail.com>
References: <20240405111053.35069-1-beniaminsandu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109845


On Fri, 05 Apr 2024 12:10:53 +0100, Beniamin Sandu wrote:
> This is an LTS release.
> 
> Includes security fixes:
> * CVE-2024-28960 - Insecure handling of shared memory in PSA Crypto APIs
> 
> Full release notes:
> https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.0
> 
> [...]

Applied, thanks!

[1/1] mbedtls: upgrade 3.5.2 -> 3.6.0
      commit: 36148978f6acf9dd015cceedcd604e0a1bfda37e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

