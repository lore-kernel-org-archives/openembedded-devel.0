Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E9CD116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 19:35:00 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2584.1764358492254061807
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 11:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WK7Fi2gH;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59583505988so2710385e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 11:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764358490; x=1764963290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6IrWcUYfoKj2qW+rSU8YzWQJWGsvWHxJ/8u0FqZ5tg=;
        b=WK7Fi2gH7OgMiTLCQSBEscTh0JW2qpq3YXmPnZNQmMKvhhQBCoTbKrX0/Gh4QdtguX
         XydMiV1g9505bhAyBWo3EsT/QvJ9P/4FylvqLNsTLCKVUnbrh5Pg4IuTaZB+wdJItzfn
         doA4XzVUJDdg/gHdP/f+UhnWv+pWl19VFGkHpwagkDu4DvQe1Y1IwOrXMq6EQYCoUwao
         8MSvEhOGFGL4jJzXB7DLsrpqZnAT9yLGXb9U+jCWpTnsnDRAsk/kklB5C9tA/dew2eqw
         ejYg0C4+ZUiMxg4PBB7Yj0RY/azncxCFU+ccmKH4LgSwMv6eN6QvfgJJZogTEAGulOuI
         2Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764358490; x=1764963290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6IrWcUYfoKj2qW+rSU8YzWQJWGsvWHxJ/8u0FqZ5tg=;
        b=sZk/VoLxUMp3Y8NbyPGn69kOvFPq1bM7i0ic/fCOob8tgttz3s4IUjYiE9UFDmfyrv
         UB31i8KUwesOIfOImDD7n4vr60TMmaLarRAlhskcNaDu17WCJCkrCTWLK+SKScwuDopd
         ZzFXFpoRrws4sZbsgEFQPRb0nwmvABd9H9JELN90VOaqAbyCxn80opUxLd0SzzP4UuTu
         N8im/r08Vv8H31EQ3o4TNZ4cjQcjDYM/ATLt/fzHqgzdLGeY0fAlDqq98nUd6nRMWkT4
         AL8sRBYCYRm8n9EY3Oun6Yglu/nzKc3hOWFAb+aHm44lE8b/o0eEj50fmtqN9g+ZmJ7Q
         ebvQ==
X-Gm-Message-State: AOJu0YykJhdH/BFsbQP+mXAQ5NAJSTyTJEET+CwRUOLdyYHvE2Vvpe8b
	3wKXEBY1uy6+ZyEuypGyRqMeEB4Ie0VCh37JGLNHPn+TvCNv/4nk/7gnVNyMxg==
X-Gm-Gg: ASbGncsHIvWR65tJh5t7NEy/Oh+oHBM8jEAAd4xeqJu/fWRP/ZrMGgUjpCC+B7chyZe
	G3moz3X7lJSmw92T64X34mgHmcAqtNLWld/dLU2ev5J/b9y90KXzSznVEU/w3rHqeZbIfCMFLuv
	j2zhgvmlThMjmoWSMACs+eaAiUWmB9kWB+BfkqbBoKwXrfo3jDpdH9YN2Ffba9p2fIhIZzJjITP
	eBobDv1vCTo+cWeQFY5a3e+20p3o+Sqz5to7wyMqdPP52q+BLUQc+40Pp0obFkqeIAa9pENp81Q
	LZ2fdwE9430M1SBed2xoPfCUoA4yDe4OPUrcYoMr5alKd5S2qyDWO8K2K3yUMaJMZfhrRdOgDxC
	re11N8ybMbYdXLwjeg2y571o4RzXrWYI5ENrq2jiWuM5dGFEyObMmj0IE6eU9p9WlZKSF4IN7xC
	NdBXKCyrRCrrXE5o1mUP3P7zMxy0Q=
X-Google-Smtp-Source: AGHT+IEyaksujmwXlvULOQKb2GihU1QDY0g9sS88x4nJVnQWnwCxJJLa9T+o0qrRTCXrYZgKRKPDXg==
X-Received: by 2002:a05:6512:3b0d:b0:595:7fa1:3a4 with SMTP id 2adb3069b0e04-5969ea357f4mr9849503e87.23.1764358489714;
        Fri, 28 Nov 2025 11:34:49 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8a7bd7sm1407294e87.7.2025.11.28.11.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 11:34:49 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] proj: Fix do_package QA issue for unshipped bash-completion files
Date: Fri, 28 Nov 2025 22:34:25 +0300
Message-ID: <20251128193425.1104585-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 19:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122124

Add bash-completion directory to FILES to resolve the installed-vs-shipped QA error.

Fix:

ERROR: proj-9.7.0-r0 do_package: QA Issue: proj: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/projinfo
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
proj: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: proj-9.7.0-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-navigation/proj/proj_9.7.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
index 2a41f1ec52..eb9fe46f30 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
@@ -12,7 +12,9 @@ inherit bash-completion cmake lib_package pkgconfig
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
 
-FILES:${PN} += "${datadir}/proj"
+FILES:${PN} += " \
+	${datadir}/proj \
+	${datadir}/bash-completion"
 
 BBCLASSEXTEND = "native"
 
-- 
2.43.0


