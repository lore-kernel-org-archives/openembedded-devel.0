Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BE0CCF2DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:28:19 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32745.1768818490032432034
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JCSgOq+O;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0f3f74587so26341525ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 02:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768818489; x=1769423289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7WhecDJh2teRz7Bm7SScB8IpXxQ7bXd66LHBcMmlpE=;
        b=JCSgOq+OB3TFRV3qs0EAWpG9f0a1TuUSWnnEzL2Fz+L/5Flw6aZ00Ploo4XXbDyYHG
         YaMgTTPRvt87NjTV8IavtruPOnkdx49KL85+ftaDBWcuyqCO5IfJqSs0PdZXCgYUzYgX
         2oiB+uXXw9SMZrsdVhuaTGCjZY1rAsYPNxTEP767Pek1CEH0LJZGzI0Ezjv3+FxpzuDY
         VbqWSlbmH4cXQ/eDqNqYCx1CChBZ6tVrSsk5TvsF8loBqa+oHPSoLmlSJzyQ2wTWIpG4
         8s9YH3pxupo37OSOrvlk72rAtrzc7+Pq5evOBukgOixk/E9oRhKY5SVS2bsdxOfXLToB
         d6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818489; x=1769423289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K7WhecDJh2teRz7Bm7SScB8IpXxQ7bXd66LHBcMmlpE=;
        b=RuVmnDzqunbjKMcV0hO7F3Bf07bmlMU5T8FBueKev3m3+eNGxTaoFESkW8/ZnQINJZ
         xE0t+TIMllFrsYGYO0888Dgv2aM2EWu64MZ2rah7qWVpvGLQpQa6GVzrO1cRC6vy7I8a
         9yIcszvS8y3+fFZhJHLsWlqBqh3A3jcizaDZmESkqqRfV4sAF4OfvZG0gIw2HcUM8Cfk
         /zCJWl7gqDb3a0sbcscJOPjbCKKfuVe5owYx4AyK+stNgOhuEEEWL0/c8OxTDmvwf5u+
         9a6YgqYc/15ESLXBrBQ8Pgduu1CBJx1bW5YwvE2FmNFWNo99fGyj5dXiYUpF88fQ2JqY
         y9Sg==
X-Gm-Message-State: AOJu0Yzy/55a/80aRQWxVSin6LD/S9OdDYmkhM7voMAjUCItzuazpG3z
	qin5rqg87dJufyL8mOMnxjBgx9Fs2iWQj0yHDB/B/IfTKPXDYIZecWSYmBxz4A==
X-Gm-Gg: AZuq6aL71FRNcedWdOQHkKhdstc2r4PjH1Xloi/veIErmP0XM9e0ALSX8DisTADM/AH
	MsioRp96Jwpl1iKTA/d1tL+GsZPBFN82gQtXowXtgqlOc8wkCEPkbrUJ56XpfU1Mn2vBS/11x3i
	Edfdmxk+LcKmwV1ZMCQB0lhTwgkm2LS7xlBJ11E4MHOfO+aTA3a3mWM2IsxhpmJVGu6EH4Nw+BZ
	2QESfvfN1ZtXJtaA7adNUMDSSoWs5XkKekS0X8dDq0iusvYkVvlNNg9uJ5EyupfEwigYfUTB5SL
	08+ogrmrZkYD07lPrvyues0qxHvVQ3PIKPgQAdXOWeRdtwyc8QEaNH1xFlpIv81n6qQOXk01GWT
	MPsJBzeUJDSczeYnECH7tzd8tNSz3HNSFml88R71SoMk1PiaJNHSPLqPQ4efd5HSKi7pJd4qExD
	EvCxKQaufL8EWsjyZeeemXvdg=
X-Received: by 2002:a17:902:d503:b0:267:a5df:9b07 with SMTP id d9443c01a7336-2a7175189a1mr90175155ad.12.1768818489156;
        Mon, 19 Jan 2026 02:28:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941e3b6sm93628465ad.97.2026.01.19.02.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:28:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 3/3] nginx: ignore CVE-2025-53859 for 1.28.1
Date: Mon, 19 Jan 2026 23:27:47 +1300
Message-ID: <20260119102747.125302-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119102747.125302-1-ankur.tyagi85@gmail.com>
References: <20260119102747.125302-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123632

From: Peter Marko <peter.marko@siemens.com>

Fix is included via commit [1].

[1] https://github.com/nginx/nginx/commit/fbbbf189dadf3bd59c2462af68c16f2c2874d4ee

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5d3936d5dd0489a984e37cc00b59e6a05d9541ac)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
index b34b81b9b2..eaaf2b75e9 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
@@ -3,3 +3,5 @@ require nginx.inc
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 
 SRC_URI[sha256sum] = "40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e"
+
+CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"

