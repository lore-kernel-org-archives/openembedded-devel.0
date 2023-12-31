Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207F4C47DA7
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:54 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.219018.1704025423954037436
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/mPNdOu;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-336990fb8fbso6124411f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025422; x=1704630222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oerWq5SmqQlOWWaqgscfKMORokw64bY7pPeIAgpfkGk=;
        b=J/mPNdOu/aCqoEfbqBIiJAHPKpvBInK/r+aIflNpdQaI5j0e+ymNg5hQK57J+meS9z
         lVKAe5TvZ5DYonZXQ7K+0oJgViDHzpxrRQvn554KTShIS7OisGChOI0tFA01xFm+M7oN
         8wAH3sqg1Tlrm353Pq4ZIjgew7gkhC556G2GBR4Jz0EDtbAK52jiN3AjIOZRuLh4LLRf
         PQsQNa8y4dl+tqqJDyvJvCl1M24uHg6W3cLwBMxFZtRzMlYwZE0Dpi8yO/FoL7dpTp+3
         rg0UcQOcF0h229dxi3aIi3q93tVT3xjcCVTGIyc5a9+R3IK3d+5NOrMZ8Xrv73IearE4
         safw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025422; x=1704630222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oerWq5SmqQlOWWaqgscfKMORokw64bY7pPeIAgpfkGk=;
        b=KUva7t2EzmanTtn3GcfKXU/XYVurFOtnculDm5KwuvJkbpmFQJqYUrRODIZnvEPutQ
         if8Xbqhm+VmkTBueUJs4wELor/OJ02yCWvJE98z4Z+9xy1mrR1mJLbUZfFlJEmENhevz
         mAHYFG0SZht6Fohqwfit9ZYCFTDejm8SOgPrmLRVHWUa5mXh9Us/5yyhXt/82lVFe1Tp
         EJi7lHiBYChpDFwTefl4KxPh4hrBzMmptj2OP1+FbJzqdoXpQJxWSrpsUQWxQ9sEXkPM
         YQkq+OXe1f/N8T7yS8c7rnb4PgpKhYOdQNbALms/bkVjqN/BghNdFPFmcD/65DF66Kfw
         EecA==
X-Gm-Message-State: AOJu0YyL9OU6wqrCnsxfZAl1tnQpPRTx1+BxR2155R8WaknxrNi/11qB
	dCsfbvDwDUlY9Q60R3+58fGxY1SsH0o=
X-Google-Smtp-Source: AGHT+IG4lqA86wH2FGvr7SuWQ7sOvUbLzrMDzzqEDhqtV06BA4qO4fRHw5d9kbVw2NED9BEvsbMJ2g==
X-Received: by 2002:a05:6000:1ac5:b0:337:400c:eb75 with SMTP id i5-20020a0560001ac500b00337400ceb75mr116136wry.94.1704025422449;
        Sun, 31 Dec 2023 04:23:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/23] python3-oslash: remove
Date: Sun, 31 Dec 2023 13:23:18 +0100
Message-Id: <20231231122329.405225-12-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107963

Not compatible with python 3.12; dead upstream (no activity since 2020).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-oslash_0.6.3.bb            | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb b/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb
deleted file mode 100644
index b926484db..000000000
--- a/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Functors, Applicatives, And Monads in Python"
-HOMEPAGE = "https://github.com/dbrattli/oslash"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.md;md5=ed79d2637878dfe97de89e357b5c02dd"
-
-DEPENDS += "\
-    ${PYTHON_PN}-pip-native \
-    ${PYTHON_PN}-pytest-runner-native\
-"
-
-SRC_URI[sha256sum] = "868aeb58a656f2ed3b73d9dd6abe387b20b74fc9413d3e8653b615b15bf728f3"
-
-PYPI_PACKAGE = "OSlash"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-json \
-    python3-typing-extensions \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


