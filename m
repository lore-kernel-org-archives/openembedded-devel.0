Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD0A10A88DA
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50119.1774538532720095957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KoBXAxa2;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so9759765e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538530; x=1775143330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXy4UcVqYHrbeDn9D+MOgLNS+qI1z6qLYg92orrflmc=;
        b=KoBXAxa2Hg0sHnZZ1xYr65eSnyezqejDv2YXrLHSJhatsWuPi/F17h3RUj/91rtyHh
         EO6gvdECRlrCpqid5mEHqIaxUIt/EjH6XZZ6VO/2nGuEYPZCIY0Ne2ugaRE3J3tAaXQk
         0O2QD8DiBAjwS0sMKZFVybAk6Y0FGBXrvemVzYNNck1+AMxPPTWHTYQSGe+JtVmKnAE6
         7CRGg4ZtjaQe3Cy9F4L+4gQqZAhayVY6XY4e6dKiRJhTGpwTyJlxaSEqrfdEfjMwDhq9
         nY2/iRGv0YpNJ/oWS9U1sJlc3VvsaLZJ/o3Tmml0GpWJicY20CjmpgWsCkyubtM5jsi+
         p2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538530; x=1775143330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXy4UcVqYHrbeDn9D+MOgLNS+qI1z6qLYg92orrflmc=;
        b=pUbFGtTt6TTcdjaUREy35k7JggwFV5LrBs6lkqslFpuoRg+sPlCKw+lmsb9c0LuxLP
         HZ7XSLl+S5a/MDFERKUnvJwGEn6rAu1Cp6LGarUxv3Uj1+Nyg/GhcyjAv3v7qQn5caGj
         fSfAC++5JSz802qUbOOLkafPEZniEz3XGcWFS0RGlajD6CGoyURXKDoc+o570jctg99f
         h80HlbaHLhrFd2IbujFvwDuK0Mu0YUSxESNnA7GRJHsGSXb9W+7UIqOKBYW1yblvxJvT
         jxiQZaqMYI5tijb+7CNwFnqCxmksEtxjoIk+JNviqhi1Uqbll0XokZxt3NG5gTNGNTmZ
         /AsA==
X-Gm-Message-State: AOJu0YwRbxYrWXpiKcjG7JuptSZtfPQOSI88FoAVannToYiQDCwSj+ig
	7VfJP1STi7Rdxi22ri+pQm+nNWXhNE7HLYZD9yhiar+FamouZo8rnUEiB9o94A==
X-Gm-Gg: ATEYQzx6yTqF3/IlmR+vHr/PAk2zwgADJLJ0NirWQWp8+PifLsPvF9L2AjMEKDppKrK
	LrXOjLtNyP4XiFu9AQm7vaWpLkyVpxP4hqmmOX2/fsvSvz8Uj5ZfmSf80HQ2tfsfcbSFzc5z+3u
	gvzpZCok/aDFhvyYAan3Otl1EFlTBiwfn5pduv8NkXdlt5WHJ80GDPntg3ZhyBpcN2BFqSuMFQk
	+hoiV+P4GUUZvguWdTnKUApOuXsRI2nAqwoS3wEcYRBfayCYVccHjTqkTeop06crbzN2geTsP0b
	r8PbBuTpYP6C/Z7/IAJY2q9xGrwGe9K2K6Moo7ZnKVTLnKulnIuNy+UXsxZFWD99WZXsRfJ4nwQ
	V0PNfSVJCMKcYHbKDhdRNyZLtNKMHckU2JYOMIekihWcqcz8afMBkM9fpjl7YnB5r3FSUXw3Tx8
	WlTU/eB0KH47/2jQ==
X-Received: by 2002:a05:600c:a011:b0:485:3f58:da2 with SMTP id 5b1f17b1804b1-48722bfbba2mr31216965e9.16.1774538530272;
        Thu, 26 Mar 2026 08:22:10 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:22:09 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 10/13] fontforge: Use PYTHON_DIR
Date: Thu, 26 Mar 2026 16:14:35 +0100
Message-ID: <20260326152143.2224099-11-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125748

Use PYTHON_DIR instead of the custom constructed library name.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index 8d65f69354..ce529e3e7b 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -34,8 +34,8 @@ PACKAGECONFIG = "readline"
 PACKAGECONFIG[readline] = "-DENABLE_READLINE=ON,-DENABLE_READLINE=OFF,readline"
 
 CFLAGS += "-fno-strict-aliasing"
-LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
-BUILD_LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
+LDFLAGS += "-l${PYTHON_DIR}"
+BUILD_LDFLAGS += "-l${PYTHON_DIR}"
 
 PACKAGES =+ "${PN}-python"
 
-- 
2.53.0


