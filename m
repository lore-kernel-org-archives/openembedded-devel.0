Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8C7C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 18:18:36 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.3591.1706638710419779357
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 10:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YSmZnLUx;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55eb1f9d1f0so173208a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 10:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706638709; x=1707243509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CI2P0T1RoMB/NeB/+feuUsuHG2feh1B2bxNFSHxGLg=;
        b=YSmZnLUxW1CE3Rmv5T8ofeUkpe2x1/7xPn0dRF6mqaOUpk8zKsg9ZHxgT6ofrMswTE
         4cmeLgi8D9gyRKgoOiX9MCMOOOHtzpDA/wAwsuPFGdb03VcOKs1kxKGOnXMIs6CvWY1J
         u9Fj1KV4h/j2DKRLTBC+wBjHdPJFRI5YHEqf6NGvGIAVJKfKGzEM0NIBG2puIlT7v+aZ
         /ABZ48jyOJ4GJzrAQRoLpD8AsaomBIUA27ZvNHIYnA4wA3XeqIkHiaKMYyJpEV9JmQYV
         by5trgYL3nq70aOEE7OMAWaJpJ/2Kl9GK+UdbN42hYbM0CegIL6/loWboqmQGZLXxjgj
         WPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706638709; x=1707243509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CI2P0T1RoMB/NeB/+feuUsuHG2feh1B2bxNFSHxGLg=;
        b=DRCRP2A4JIOFUqFeKo1OEys7mCVMmxR2UovjgK0G7IAVMNWP4R8RDSu9yxkIBiH74l
         3DMVGXek4rqURH9VxGxI7bKt7nZjA+lwlFW4bniJbk4wutuTbKlRYEsp/IA1cxa0Niec
         AYTl0caK4UhPh2XUpyz9XmeumFx7Tad84eBeftnqmHkmAOmec6G0pt+QC508qQrVMEsF
         Ulxe9ZPmHmDyvwCp6a8UND0lyeUimkwXi8TqqN6/02bnRQOV7EkKQWx8knG2JDrw2vtO
         jh7zTlDjUjLc0P4EN9Y54YL52jGbk/ct0AH4jgsMbC7g66VDFv7XXPAx38Y/wwS/GANH
         XlOQ==
X-Gm-Message-State: AOJu0Yw62IqHB6KFAXOhPJLE3zdka6zUs6CqjJNgCwKZceT3PdLyP17y
	d3Lya5EF1FB0Vss1cOldwipA/Wo9mWyP6ZL1lM9gzyPzpfRsnsxy290oCRao
X-Google-Smtp-Source: AGHT+IE40yZmm0QyycT6Um70EpiBcbuXebqz7XleJyjny5DpViLyH6XueYjppiDM90nJASCd4Z40Ww==
X-Received: by 2002:a50:ee12:0:b0:55f:2ef8:7fec with SMTP id g18-20020a50ee12000000b0055f2ef87fecmr2026830eds.21.1706638708382;
        Tue, 30 Jan 2024 10:18:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUFGz0KsRTMszx1lJXh9XQ1C7YpAXGAShdNAfZpz8fkfH3iISB1D9w5sKCzto3YBH2Xxa8Wc82BeLMH3ACNeq8nXjPUXfr5
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g9-20020a056402428900b0055d333a0584sm5078414edc.72.2024.01.30.10.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 10:18:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: leon.anavi@konsulko.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCHv2] python-jsonref: add missing Upstream-Status
Date: Tue, 30 Jan 2024 19:18:21 +0100
Message-ID: <20240130181821.3553758-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 18:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108496

* introduced in:
  https://git.openembedded.org/meta-openembedded/commit/?id=e34a29f12444cd31fb6e6c11712603897e24a6d5

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python-jsonref/files/migrate-to-pdm-backend.patch            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch b/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch
index 805d9edce1..709a38c4aa 100644
--- a/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch
+++ b/meta-python/recipes-devtools/python-jsonref/files/migrate-to-pdm-backend.patch
@@ -4,6 +4,7 @@ Date: Tue, 7 Nov 2023 10:43:32 +0000
 Subject: [PATCH] Migrate to pdm-backend
 
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+Upstream-Status: Pending
 ---
  pyproject.toml | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
-- 
2.43.0


