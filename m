Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04858CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 09:36:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.12365.1759308982103288537
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 01:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J3QaR/Kz;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso47289995e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 01:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759308980; x=1759913780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUVIxDaxSVLEuZHiy7XE0DLCXKR28V1M/C7syxjPOGw=;
        b=J3QaR/Kzjjai9NCTb82NdI04n+UlIVWwf/wkSpyhzgegsRlRd7x0/nsnBz27QeujP1
         vGrzDUrIVld++KgvwYSYGBl3zelt0pgIlEBi3NXkXXyCUFbUbTk2g7OeU1nXZJCRjIi9
         cznvEyqxKrDtuWa4cKtlkbjv1VM7p0n5n81av3bXwhTixCvfCzV+iV0bt2SYlTqFqTGB
         H7hIG6PUj42fSDjUGXrnyhq9IOIPyKvAWom6O3/Ho5NuZh8RnqVbwwLPaxg/G6G1K3KU
         7snZke+8PY4gLWCtU6tYzWpZdjevnetiqhgawdLCYkzna6xRjMs7zRId8Z0LbfIUCK51
         O8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308980; x=1759913780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUVIxDaxSVLEuZHiy7XE0DLCXKR28V1M/C7syxjPOGw=;
        b=Ue6mmmFtiFOJJzko/0IpvD3qGXK7iPrsmxWkCYFq4HEGUsNKmdSE7ngJtstvKC0ihH
         RRy+hPfK7pJBTawDeLNJPI7D3LOM9xLi4sHjH9armaHBYbrrdTuB7bNLkD+PnCZw5WQ4
         duSSPJ8j6OZBI1eg4QsMdCmC/yFdmP71epTDlmKgcnVgEn6WNVjo4ON+ihFmjqpckMKF
         8it159ZAOkMv1UXBFpfFOsi0Ohv7cY8FLm5diHEKtTDdsUmF75IEgPlRxaYm3pCmAPt8
         x/wbD5sfStwY9p9Kt4dzguO0DNqjKJrskBmEMsk/uV09QVbxSTpPehEaVJqgmTYxrZmS
         xn3A==
X-Forwarded-Encrypted: i=1; AJvYcCUhOJm99AerFNJ8wmsVOkENs/8oeCEF3G/gJh3TGTEwL6TGb+9GgdQ5GQFg/Yum63jdc97QLH9fjQzpli876jyE7DI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz35t3mGuqb+LDGkc0CiTN88nlOYa7W/So24dFYql2wmPrQZx/F
	ikuYBqGxKghClLeFdrKH9F+JyWIr55EdBDh84KRMSm0mikS+UeeQVG38/lMD63jG
X-Gm-Gg: ASbGncvcztTnu5c9ZM+61f1ljcvWoXXLiRP6p61SpcESUMKBDieSvUHNhtbeyS+GjXv
	lJnKOfiUvvoOaZ7iJADhAH9I1NioP8THLXl48WHHpY2RXK5GIOFHLfxTCtXsYNFCMGnCw7uNTZ3
	TySsaF0hecUlQR7/BCqutVjsX9qBGnKljoYP+Penp3U6I2AfotU+cwYBtoC7bHvusFEd5IO9NcP
	tcEe739DrpPl+Um/0HotPxjhaSHafZcdVQSMGa2S2mmKCCSTl1/UlXPax38TMONDHI7GBCDjit/
	PgPA8kvhbtZOb1um4AtaJucShutpFXIsluPJFZStoV3tIUwmAJaPlTqpB/6b4VDjmhanyWHPhsF
	+hRPJ/9O4Goy2xDrXO0fs0yGQrF4e29kyfBh496HaKn0F0ZorSZIppevGaLeUGmyJ3uBsYjywJp
	tXpY2aMqhCcCUoAS06q2FhSLyzEQjRXpd88LLaGFXaO4PubQ==
X-Google-Smtp-Source: AGHT+IFwucxQQ4xF231CEaJOQrIcW8cZPj7/rHtrt0ZFkMB8O+MVGAXKIYlhCnAzYXFJA6oZ/LzHzQ==
X-Received: by 2002:a05:600c:4e53:b0:46e:3dcb:d9a3 with SMTP id 5b1f17b1804b1-46e6127dfb8mr24183705e9.12.1759308980454;
        Wed, 01 Oct 2025 01:56:20 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a25dbcsm30033185e9.19.2025.10.01.01.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:56:20 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: ivitro@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Joao Lima <joao.lima@hbkworld.com>,
	raj.khem@gmail.com
Subject: [meta-oe][PATCH 3/3] openocd: enable dmem and jimtcl
Date: Wed,  1 Oct 2025 09:56:13 +0100
Message-ID: <20251001085614.1634-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120094

From: Joao Lima <joao.lima@hbkworld.com>

Build configuration:
   - Enable dmem adapter driver (--enable-dmem)
   - Enable internal jimtcl (--enable-internal-jimtcl)
   - Add both features to default PACKAGECONFIG

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 846d2f62c5..b39ca5c244 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -55,7 +55,10 @@ FILES:${PN} = " \
 
 PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
 PACKAGECONFIG[remote-bitbang] = "--enable-remote-bitbang,--disable-remote-bitbang"
-PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
+PACKAGECONFIG[dmem] = "--enable-dmem"
+PACKAGECONFIG[jimtcl] = "--enable-internal-jimtcl"
+
+PACKAGECONFIG ??= "sysfsgpio remote-bitbang dmem jimtcl"
 
 # Can't be built with ccache
 CCACHE_DISABLE = "1"

