Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A92D3F289
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.29968.1729278812027349166
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZoOyqKs9;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: schonm@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e5fa17a79dso1361254b6e.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278811; x=1729883611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSoUwvJHkI+fXC4eIUktOc2wWST6VZ+UR1nKxpSSFpU=;
        b=ZoOyqKs97mmQxdUuNYaJ8K9+TvRsWPamgZuBm/TEzQCK9ricNKThG9m7q9OiBefXEc
         Ud2TMXJmebWffEOcQ3U0WJaHTiMIS+vwIxakt8HC/nyzNUeFdXtTOU+hzTUgiOwqmQh5
         3sTqU/8cIqTnSC/prr33baOhLpzXLgXgYnvMZHpaTvSjYou4UNZi/sUUliSkvmez7cJb
         Om4+U3ahMvlCklTEGEY9XDe0ZtlEzE3GXrRHCH+Tzo87nBjRD9RIAyjJlEcJh06PtWVy
         /OSRAiubB36hEEHLIIwfPLTI5SYzqD5lQQZNPmoNQBkkjfjS/q6EhNus3sneZRUoaulG
         Gz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278811; x=1729883611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSoUwvJHkI+fXC4eIUktOc2wWST6VZ+UR1nKxpSSFpU=;
        b=FYhucxDrifuhB88eJ8ne+jFYjBltPJCRT/StlaVnRrI1vrs7xtY5n0RizsA+sZsH4A
         A7VQEw37VdYTFkEiHEqvm7qoyIFMC5FxxapZiA+oNMX1o/RTt9v3ZSgxyfqCFXnGMPVY
         ymfixqL1NDH8H/Qb6tNx08BG22mroC446FZeYMDeE0I8QOy74o8LPFw+AMr7bQch9RDg
         8rNuxOiD5lm4SHkYILpRdJuzwqXDMdNe9S4LhRTjaOrChbkXfOmUq8Hw2S7CjGiGDhya
         Gxtz3ESqywCGYAq5ylryBfeihZWhIJMwKUIh12ABRL4XG3tlGU+96iejdlJiLamXlneL
         24eQ==
X-Gm-Message-State: AOJu0YwzeMM22gjkdhtZ4WbOPx9qnUVUncpneX2KntnPKSZ2bVCuevJ+
	GL+Cb/gw6DoNscYLtTyZchpJ+n/G4kh38eVbaGUcavrrJS7+BYmxxgOsZA==
X-Google-Smtp-Source: AGHT+IGj8eOMHHr5FXY6n9S9Tyf3/8ANCtc+zbyu5jugIRWRA8+1UccEqjMTcZF/iRbV+QY7/xQaLQ==
X-Received: by 2002:a05:6808:1992:b0:3e3:cfec:7f1 with SMTP id 5614622812f47-3e602c83780mr2858535b6e.12.1729278810880;
        Fri, 18 Oct 2024 12:13:30 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:30 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 31/68] python3-ipython-genutils: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:18 -0400
Message-ID: <20241018191101.25184-32-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113018

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-ipython-genutils_0.2.0.bb    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
index 3261d8047..2a25d1d91 100644
--- a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
@@ -8,7 +8,6 @@ PYPI_PACKAGE = "ipython_genutils"
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ipython_genutils"
 UPSTREAM_CHECK_REGEX = "/ipython_genutils/(?P<pver>(\d+[\.\-_]*)+)"
 
-SRC_URI[md5sum] = "5a4f9781f78466da0ea1a648f3e1f79f"
 SRC_URI[sha256sum] = "eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8"
 
 inherit setuptools3 pypi
-- 
2.43.0


