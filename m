Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA78C5B570
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 06:37:09 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48552.1786430220694332398
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 23:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h2jjgJsl;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848761b5897so1446307b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 23:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786430220; x=1787035020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLoS9HxvG5pIXXNydhF8pKBoaaTFIbhVTlukY70mSYw=;
        b=h2jjgJsld3QCfxOwq0KtqmGvd5w7eMDu6HXCqtdnMNReMZODibxQnwODw4zVZSZs3n
         whoik+TDd7/hWZhGdiCtpY7bTuxMWVJEepACI9YMRbt32xVJ68jkP6tqOAg7yjrRrJ3j
         LEKk1EZEWPuu3x8bY4ErvXbaIRefcrQipX9oSjt+3QAUFBQNb/iM4XlA7G5YqFeTe2iT
         2GqMs+cQVu1JnU26nlVcWePL9qVz2E9DylMl28JpdmPpNzHHd9De273kcGN1yDODAWT1
         7inhUyyGi59MrqpSmJDFskEGYanQv18qNOehlU8vQozyFw6k90O889QX3Qg53uKe2zLL
         NfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430220; x=1787035020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLoS9HxvG5pIXXNydhF8pKBoaaTFIbhVTlukY70mSYw=;
        b=cDTFJ5zlFMOo/3cRLHRjCHixXB0ZAAk+5BwnAqGxixwwNBJ9jlyDHP+42FOdu8AYLs
         xZM2tqfsce8LaPwInvfXrN8Jw3SJnZ/4eifvtnDMXZWBe5IrpnvPjF9aSWaA5iNqCa7k
         b2nK3bd0vLOZzJAU7zegTx/DkTjDfXuVdcrHVap7GuOEe5J71JUWOky4MlYYlc7FY3F0
         CGMytn/1uUD0hIScfYSC6g20iMI/Qi4NhS/QHg8SKf+DsgqDsWY8Rz6NdpaOZR6m/MCv
         1GXsdjfzH+ai10ySofZlgRyXlSG/xGtRWd4e6lXCmHnlxS3nA1Y6gXaL2aJMVznnYlKb
         ytQg==
X-Gm-Message-State: AOJu0YxGjIhJNyIvcF29gWBgBPkPUY57vLs/19/twkTig+wlyfwSE0Rf
	gHPQsnzXO8/8Y3NkWCoA2wXQbQGebtOKwSeKyaDaye6+ZWH1HLkYuV4H5uNf3sSp
X-Gm-Gg: AR+sD13V0d/S+5cWFrikVK4/hAw4vx5iVU5sdIxL9ED+5HMp8jDVKcQL7JVEYtzhe2g
	A9IoftpPA4UYF6B0u6hMjhgkk+bNR/0eu93qn6yHoxlqJYuC5aRFOthYLeqAZuwi13PSv/vyPQW
	oqKqd6Ne2+qMkuO7QGGLM8v89VO6rLDEcnXDm0vhiey2Wk/2Be6JhgQLnVVmhHSC964aBBYhMrj
	zdFp5bK4ecNLpL0DAfkxh7ULkDjFVfDLrXFL/3f+vkOKvkku0uFiUuXzqJ3kQu88oavzsDyMW/C
	BivxwGghPMzPOY4G6WaRDZAdrOspYw7TosxDQdYm8LEYoZtCSmVUvJ6GweN1A3UF+eXP3A55LjC
	ElNkoa7F2Hgq6mImUREJlu6XIQky2QVGRawp30MgA+ZJTMpBK0qi3A8M8yNbBiH6jJByVVoJ/BV
	pHH0OiFuMjXptJ7Bx0tNC5lTtoFA9x6WO737fNhWACbvyOnsLgwXAK1qMUGYS05EQQMxCizpTRU
	w==
X-Received: by 2002:a05:6a00:9509:b0:845:ce5f:c926 with SMTP id d2e1a72fcca58-84fa8677841mr874150b3a.1.1786430219933;
        Mon, 10 Aug 2026 23:36:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa952841dsm154852b3a.30.2026.08.10.23.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:36:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 4/6] pythen3-typer: upgrade 0.27.0 -> 0.27.1
Date: Tue, 11 Aug 2026 18:36:41 +1200
Message-ID: <20260811063643.152169-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
References: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 06:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128919

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/fastapi/typer/releases/tag/0.27.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-typer_0.27.0.bb => python3-typer_0.27.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.27.0.bb => python3-typer_0.27.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.27.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-typer_0.27.0.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
index 11c8ff6fcc..12c7bc7f61 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "629bd12ea5d13a17148125d9a264f949eb171fb3f120f9b04d85873cab054fa5"
+SRC_URI[sha256sum] = "a79bef8469a79c45498e7b814ecf8d603cc7644e9acbd9e19cac0334240b18df"
 
 inherit pypi python_pdm ptest
 

