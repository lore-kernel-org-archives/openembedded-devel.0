Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B006BE7719A
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 23:29:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.7131.1736465390028770452
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 15:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nIVIqMXB;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2164b662090so22721615ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 15:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736465389; x=1737070189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4ocuRyUzgfMhotnEmUH2oBpHbbAbpMujxF3k5wzNF8=;
        b=nIVIqMXBza7fL5/7G34We+TCnpLTDWdDsMi6nrS0m1GRnU4uLe1JltRvq8BVtGCL/R
         8mw49RaQTFidK0ZvfuoGvbPZ+KaeY5SkgAUCXH2xSxHmeSXWCYN/Tgo3uafRHwmzOlqb
         sN/VpY3o955RyoVTZFvQHHn6d4Gjntownq/G0XFR+l99HTa9VOAh17JPuzWNZeYD6ewh
         JyQ0pKBrldJiw6mllGEN1Bx995tzGwTrG5ERX5GpUzThenk6l5qSFT5ARf0k4/lyRebi
         kTEcNFZNkSPtbrEmn4mLrOuUxwoZNOTLo1UwCcgy7KtCr8BABP8uiKy5/ANQrYaleS2C
         IeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465389; x=1737070189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4ocuRyUzgfMhotnEmUH2oBpHbbAbpMujxF3k5wzNF8=;
        b=J10r0nRr05BkZajqpVTEDSThClZVbl4t+X3ujhjAjXp1hGhPBmUvA2iN/voDXjjCSo
         2/81oaWbUU8+WARx+kntL7Q9gSjWPcOgpmDq7Gqosmcca1siMmB7e0miuVl75/5UfLl4
         kpi+npL3LAFvihf8fwv6SuozFgcNkmOV+1maydHl0CLr4ocohc0DrK6qkJE/406gpGit
         kUFCIqkq4Y3QVa/4+l4Q81WZP0CS/YUIQ5bpAEFGPNBim1+iUP+BdKWDGcdQZTR7LgiG
         Sq/2AWvUJS6ha45vTfWKI7Z0G3y8QOEbuudyczkb9o1pZ5okP2oaLACqZentXdxL7N1K
         id+A==
X-Gm-Message-State: AOJu0YwYb/njsuGMz44RZEtQFaclj/CEMDh7OgpUN7OfmraMN6WhBg2g
	QvqOOIvNWKMBeqsO8Si9+A9vDKDuLmi90zHh6DDBruPT5C3QTRUeCAZxmOQi
X-Gm-Gg: ASbGncvwguE2hAw90iNb5jpwSaP20wbSpbEOvNooUGwnn/r74lJ+2dzMeTilB+StDvb
	QzlBcWeX7ssR0MjvC4QoIdze1j1DCk8WN33KAELRD8HcDM86tmkeMpQgLy9GQIAGJCrK1qEj47s
	ca6nw6/Fvb+BsX9VQB0eIBYL8PxyDUYpvSpz1vR/B0mXByVeeoUTDvJZe5dyV0kISWlLGLhlToe
	mujrkzxp8HNFcvdH48XElcLCWpyfYevhD8tShM+oludXZGY
X-Google-Smtp-Source: AGHT+IFDQuuHI8qhQFKxHPS9A2tolrF7SUbiJQvVXtV5os3XHEb0/AxdgKw+fg8uN+cD4eXsIMPv6g==
X-Received: by 2002:a17:902:d552:b0:216:60a3:b3fd with SMTP id d9443c01a7336-21a83f4bbd3mr123620605ad.3.1736465389211;
        Thu, 09 Jan 2025 15:29:49 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::1344])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d6a0b140sm1804500a12.60.2025.01.09.15.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:29:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/6] gerbera: Upgrade to 2.4.1
Date: Thu,  9 Jan 2025 15:29:41 -0800
Message-ID: <20250109232946.1556083-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 23:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114757

https://github.com/gerbera/gerbera/releases/tag/v2.4.1
https://github.com/gerbera/gerbera/releases/tag/v2.4.0
https://github.com/gerbera/gerbera/releases/tag/v2.3.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gerbera/{gerbera_2.2.0.bb => gerbera_2.4.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/gerbera/{gerbera_2.2.0.bb => gerbera_2.4.1.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.2.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/gerbera/gerbera_2.2.0.bb
rename to meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
index da2953ef21..c12be91664 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master"
-SRCREV = "821d364d611dc30b3ef8a5e9beb0bf3e71b25199"
+SRCREV = "870dd32d42f626dc2246d34b2224ffb6fd73e205"
 
 S = "${WORKDIR}/git"
 

