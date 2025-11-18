Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77757CED240
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 05:50:47 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6148.1763445039924326327
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 21:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RqlpObd+;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2984dfae043so48110485ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445039; x=1764049839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zv1WdImslF+JQYBzGpWWkCxzcrMT3nRW/w/NqLtc+oI=;
        b=RqlpObd+Ibq7otSNwqVEL5fPApaIaz4UvmV7778YOZOePbFqZ/KuNg8X59gAsS2POO
         mRBQyN+mlhU9+Jli0RflQJG6SmMyg7tedsdLrGH6ko35rU11uh0yVuQtlab81DgcVhAn
         eUR3PLz5DNv2SOkrIlFdysz++p9dMffNcR7yQIyDXqxmskUic4rNVfmcS1DedArWQAIY
         SzInBdUiGKWxbcvjM/EFbcO1rw0MbxjZr4d6vfsMQmvOiMyTwRi0L1suVYN2XH8ZTG4g
         ++1dDCKKhuLcf6zOH85vqL3XdGJu5rAhWLMNBmy8hU+AdHCehrm7HciaLxonEAvP/0BM
         at+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445039; x=1764049839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zv1WdImslF+JQYBzGpWWkCxzcrMT3nRW/w/NqLtc+oI=;
        b=AycMZ+L6E5bY42HpVtBfru+jB44hPfxVEy4yWnYCLMIK/zG4YDNtLORhMLjpnApXqI
         km1cRhQPDPwR8Id+7HpOCqCGpgL+KtFGr6+4iMLzbIjYtbyMgSLAcHPeOZBEIyq/3hhL
         E+F4nMw+v+b13ky1Qm8hYFeWDB+Mg1IgK6YROTpBylq9W7ITqje/g6AGmUmZubPxVQjU
         dJbt0AU+YN4gTnxAk4AJ5gxnwYaTDY/0ve6R6TQWD7Ecc2OJPpe544YGMKn5eiTpXvkk
         a0ao1BteIaYANbFS+p8kffbUp2h4p0TgKbKkGkOsYUzNtwBlX6rjM78nQg7PiYlfV/Gh
         MVQQ==
X-Gm-Message-State: AOJu0YwWPw1zkvZCjgvLNk9wHg2cm8zSBNkTQpJ8hjZjKntcIHlIXVMi
	KDY+yTUfLoOFfGZ7DjoodDtRhu302dKMoqthu9zPpOIdNrVd6ev9e7inP+1jDA==
X-Gm-Gg: ASbGncuI4e5wMhjhNO1iwvH04fzgNwxXwpnDz1ewpGkip6phgZSv6srmuAupPg1/WRA
	3zDazWfFubo2S2uIDC/ctXcPMriO5lPhytxRMrogkPgMVW282y9u9GMkDw0Ci6dTCNtOxCLdTCC
	GlE8YJ3td5aYaV9X9pK4EoaUf63vZMNDdjhXeUA8A9OrTPEiq62w58OjVmklur6pyalcnfFeCzt
	+my+b6hMFuZeXaVSDTmJbMov4ObUubpaUQB8CdnlnPWISCu68PwvfgneHXSZ87qikFgqEZ9MlVe
	x4qZe7S9U7t2FNHrzpXlQqF7DJWbkJ4Fl13xL2pyjJBYU/4QH+Yxt44yfPAQUEh0t0kr7VaOg9T
	Ig7YHLouPBMDcQIyYoOubgND/c+EV3WJzk/eU/LKXgQfAoSG0qSc88dOSGhUdVg2ws4bxEwoGcO
	SBNviAGMlnK6pLHOemjM37lWXcdovubLg20mU=
X-Google-Smtp-Source: AGHT+IFDpxAS9P3zu5XDbghfR234YHtp27Ny+ohKXPliEPfFMIh0VeWXMY3RVASwifFQZr6kN/7pcw==
X-Received: by 2002:a17:902:f603:b0:295:7453:b580 with SMTP id d9443c01a7336-2986a76a1e2mr158570935ad.58.1763445038913;
        Mon, 17 Nov 2025 21:50:38 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm126822955ad.79.2025.11.17.21.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 21:50:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 1/6] apache2: ignore CVE-2025-3891
Date: Tue, 18 Nov 2025 18:50:22 +1300
Message-ID: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 05:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121804

From: Gyorgy Sarvari <skandigraun@gmail.com>

The vulnerability was reported against mod_auth_openidc, which module
is a 3rd party one, and not part of the apache2 source distribution.

The affected module is not part of the meta-oe universe currently,
so ignore the CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 11fc309ae95bc221d44fb85515ab5df7afd59c26)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
index dcba815831..98b2215f44 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
@@ -48,6 +48,7 @@ CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version is not affected
 CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
 CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
 CVE_STATUS[CVE-2010-0425] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
+CVE_STATUS[CVE-2025-3891] = "cpe-incorrect: The CVE is for a 3rd party module, which is not part of the Apache source distribution"
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 

