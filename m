Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA802C369AB
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 00:26:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.1091.1745540787582406635
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 17:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FhYTe5Uk;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7399838db7fso1784522b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 17:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745540787; x=1746145587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2cNpaiMDvzJ3Q7vpTUDMInlmD2s7UJiecpdkM3Wvmc=;
        b=FhYTe5UkEHB9hPXrGQsG1fxpKT2fj6czNCXu82kMS4uBY97s3pI/BsR7F5QyZOn3Ro
         Rz6pVCD0l4m5DBQpW+kGPjBuXzEoQQH9CYfQRNYdvBdgYbLTY3avMk4sRhrUbiWEIXuv
         Tc1R0A7uBvXvkBImd8cM5uc7wvwhoLWJZApraAY+X4AWm3ZP/oQTKWbMXVjFRMWgeft5
         bcZJQJOdwdAv8uRD2+8tfk5UTCMTA6wKip58b/2uqffK1vq/RygSD90owyBLqBcQeagE
         y1dU6Z6fywQInEzeAx5x0VUTLK4GTWjoWYRsWLU+JU4qLbExwGK+YWvHsH80fPimgHKb
         TdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745540787; x=1746145587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2cNpaiMDvzJ3Q7vpTUDMInlmD2s7UJiecpdkM3Wvmc=;
        b=Rr+GTO8rYSOqtH6Z387ZUvsEJlEfDARaSMuR9MVPN8USXPSvgzG6Yxh9cfCaWQGA2h
         1CL7IFj5oWOTIc9+Pi3yzc6dLigwVgdJENTsmELSqNUHyKEivCRBip1XPayq2VXeeSMy
         2FeJY6Nj12JoB+WIpxH1gahYHvUFIaGtpt+k+MZi6y6MxxeFIXYZto/pTwD0rvWgisYe
         gqMx3CFk/WCyg0PuXBvyCPRvrabdsj4VpkJvebUzB+CerR0RAODOTSIJicFuRAI+66n5
         R5nmj60DIyxPuOPxpWqMD5u1TCJSibmpLElLSv4i6T7RjIUBC5IzGuxJci7C0D0HfqTC
         R0og==
X-Gm-Message-State: AOJu0YzcX6jT0/NcSGj0UCWRUzUaGFO3h4NPjpZgLdj4bQyOW5vgwEjp
	0hRYbDyMIJ/T4fYYOU8rkSmqIB719kKsOcWfEg/hq1w8wIMAr/gtI43adLwO
X-Gm-Gg: ASbGncvhLYV8Twe8Wb7SmU7rmGxvGNSLpSSIpySOolPoi9+DvF6fxcqSrNYsYrb7fyr
	7S3wTdi/IqsfHDNQ7GbcdIUlwEEq57GforPC9ppiiGoXymEpkikZOjF0lfTf3TFI3ZKWCNvZDeK
	aOq2UsuRtOa/YBvXLo423kfOawX/W4Mk2inSOmyDNroVDED2a5RqwzYO/6sYyIpJYcq4qo1Xr6a
	L7/cVCDZP1umhOMzJdO+1JTMbMIIdQNZ+b9psI7yltb3PLi5/s8QzBJM9ShDEfH6Z+ytzLki9kZ
	OXhF04nRN6/7EATU+7xniGI8ZeP1+qys
X-Google-Smtp-Source: AGHT+IFK+17KUOA8WgtJbvjfMaFVBSwHaIvgFDf9RqOuaw7WZ19agWRptjRN+c77+jRNv8YbmbCEcw==
X-Received: by 2002:a05:6a00:3be1:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-73e268ef408mr5402637b3a.12.1745540786697;
        Thu, 24 Apr 2025 17:26:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941387sm2027988b3a.70.2025.04.24.17.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 17:26:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-posix-ipc: switch to PEP-517 build backend
Date: Thu, 24 Apr 2025 17:26:24 -0700
Message-ID: <20250425002624.1552609-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 00:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117120

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index 29e1b35122..b3da09c35b 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -9,4 +9,4 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529ebc881cfb2aedb3838"
 
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta

