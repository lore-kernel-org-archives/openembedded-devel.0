Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BB5CED245
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 02:55:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2962.1763434499661574102
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 18:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ia7ahubj;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2981f9ce15cso63538275ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 18:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763434499; x=1764039299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFuA/nt+hNhAkwC7Zf9bixgoLzyF2qSLqRyu09duLz8=;
        b=Ia7ahubjlkWC4CfuwWXRkIjVETaOL+bzWhXgLxxat94xGkFUlpAKlw0ilxMZS5n3iu
         4Vq67gxj19WcBPzBRUZSqDlV2G9vnYLjXOGr9E4RoyDZUZ0gkDmcA7F7o0ligzvtasAL
         hB2mh1JZSST1FYRIuA8XRko2TqzaU4Rn+bJMG0sy6IQmbldUF8SlU5b8toYWnpSDZ3xv
         f0YinJYTQhn++e3WTm5y0AgAwm1XRnZbCeswkatL8xIMD/f5ULxuSeA1HzaLLlrXnMvE
         m28iS+c4XpTg0utOs+4Z+uokT5ShtNrd0dTWRvxEIYEQ8Gfz3epNsBBXmVrfQpTCw0LB
         pMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434499; x=1764039299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFuA/nt+hNhAkwC7Zf9bixgoLzyF2qSLqRyu09duLz8=;
        b=mzjx7nSvoCl7fxKdODehd8p8pzCXasOR2oXeu4vgV+4sfZvebc2Mb4IyZqmvbZw7Ho
         aCWLnuHlgMUbulDvSGUK9yAoq13AEO7AWlYo//iGk70HbEEdI+6TnbgfTlQdA3MMbWA4
         ihyizV3sSs/wnCcTuigKcelaog9IbLkT8NPgIDwEVWZ0CrhDYSzbFDxM4nPVZva0hP2s
         bQqTidCC1A/+Y3GxRnMFmbh+X8uoClFsxHL4houuvwpOZKwBdbuVpxQO2CLhZbgKt716
         WR/PjC9/DnG5t66NtdKA/jLI1YFlJDYxVcLHKiunCfBqfXo6BXHTgRrbXrtZmUUJxXWD
         UNQQ==
X-Gm-Message-State: AOJu0YxHfw9tcUKZWOc2JCrCxReQVo1AWSQPYaitDIJ2HY1y1wpZlV5Z
	FQJut+BRa4WRzLCbTna8G3PEkNeZHOMpnWULw0JstMV0BLyxKZbnqNPUGwwbHw==
X-Gm-Gg: ASbGnctgpqQ4+2qJL6bpDCWdZ0LW861Pi/LOlJm7DEB7M+8ajeES4tyPv8/jP9YkX++
	Rz7x5X1Kw/zxkFMYCn+Pp8/Sniqp9kSZch6f88cIh90JClE6wKDSHy/dDFcW6j2pR6jB2OeDOGb
	BJCWAsl7hDKo3PZfaoSwuVxKLR06HBRYaOlw/O3dUB/L+Tqe++Pyjz1u7sCCmiPx33p8eMFOCiq
	uu6hcbL/nkKbOkU23n+ldDmRVhhD95WzoTO0Ij0h7NTDj7Yh2CLV/xJFHSdmyDkn7Kl+Fu/FhJy
	XL5MOCd+4AFuw9do3FPzfb6lANs/CgWwEVKFmFbhChE6ex9pHabNS4j1/F5+dYiUIcFFns51tyB
	Uig27gbKsGY7UxlcGHCOxwnK5SXXyRpMfdp2Y8SaYXTI4O7U24eRzyXiyHuq+4+aLHgCwxjJ3Lh
	D7NgFQEo44tgnZG85NP4gMBzRDXsvYajEtAg==
X-Google-Smtp-Source: AGHT+IFwneyjfauaOrmlScP52596534pGKUWkXfv9shG+Dawan661BKvPlHDOq5NvEEsRRYIeMKQxg==
X-Received: by 2002:a17:902:ce04:b0:295:a1a5:baf7 with SMTP id d9443c01a7336-2986a72df51mr189795815ad.37.1763434498826;
        Mon, 17 Nov 2025 18:54:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2348afsm154505765ad.3.2025.11.17.18.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 18:54:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 2/2] smarty: upgrade 5.4.5 -> 5.4.6
Date: Tue, 18 Nov 2025 15:54:48 +1300
Message-ID: <20251118025448.952479-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118025448.952479-1-ankur.tyagi85@gmail.com>
References: <20251118025448.952479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121803

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGELOG.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
changes in v2:
- CVE_PRODUCT change in a separate patch
---
 .../recipes-support/smarty/{smarty_5.4.5.bb => smarty_5.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.4.5.bb => smarty_5.4.6.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/recipes-support/smarty/smarty_5.4.6.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.4.5.bb
rename to meta-oe/recipes-support/smarty/smarty_5.4.6.bb
index 7f99b9b5d7..88afc55c15 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.4.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
+SRCREV = "1fc41e385da8a27a87bec5914392ab662a7bb8ec"
 
 
 INHIBIT_DEFAULT_DEPS = "1"

