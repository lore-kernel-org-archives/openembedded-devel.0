Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AD3D2B939
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.19564.1730817438187498708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mIxxDAAe;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e2e2baf1087so5145190276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817437; x=1731422237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAMu/A59uRnzOeX03p6Ek1Ce9SAbGiOXZiSj//A2OmY=;
        b=mIxxDAAeMpJdplu3v2alPHtlNvcF+FNSx0+kmBa2zOgVUB9XAbLWhi8IPFEPCzJHCa
         D8srRkFejaGi7oOGUGI6ToWUGLH6SbDjulBtgTF50ZQm395nHCK/aBsCt5Q618LcVTaT
         x+JaMSJMdUSAq4+/AqrR4SnBzwt2w7MWogarXpHzkIG9fogbrtt4kLNK2UxYfk6nHXTg
         WbK3Q3ytvz+1VFBwNa6F0DV1QEm/TZcTRS8oH8DYj+8xayIAkU1QbX6etZRkFMfaeSDB
         ISey1SjNx6DUN5k5/+Wwn4KP5eO6J7ejei/zcnYm0HEuAU/f0x4LlxR4ETsNAAG00mSp
         A8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817437; x=1731422237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAMu/A59uRnzOeX03p6Ek1Ce9SAbGiOXZiSj//A2OmY=;
        b=AWnwxRV9s3JoaR4Rw5yyP7rWCD+ts0tHyCB1sHdRcDcOz5BECXmgzSkaKy2FiGD6em
         zqOh00IACRWQ9p5sZJk7pyFKDBseZyyNnRQZ6lio6lRXmc7cLZRWdCVrtMBwbAtsvmJS
         O7NTcMpUaOQsYLtoJAtOZ4jcSPeXi2Hm5IU2XP5gvRpjjodb0GAOzaB7sU0veDjaiYfQ
         MmusQ6OSvjaAmc/aP3TuJ3yWC1hFJ/GznPdT+E0NclGcLecD58G+Ae0yPrTV15k4z9HT
         JwNug+BmaYnvvQ/cDn5PncxflO+22xeRIBljzVGvn/NZzTDabUgCaN2gE1TXzefCKOoY
         lVgQ==
X-Gm-Message-State: AOJu0YwJiDJkN7o8WBi1e/aksyGVvJO/D3V1O96f0BaT8Sb4cR9yUUa4
	ScWjYWZPcLq/7t3TazE5yDX1T0wxYxBUE3ofZECAH+KfKvICV1gKh0aqgQ==
X-Google-Smtp-Source: AGHT+IHHYmB6bQGnA1TseOw3f1KtJ9F0gYwjvlqkuOf0v1eZcWGuZL+4JMvZvCyijoZC0wADhubsLw==
X-Received: by 2002:a0d:d203:0:b0:6ea:6f5b:cdd0 with SMTP id 00721157ae682-6ea6f5bd0bbmr104099907b3.19.1730817437258;
        Tue, 05 Nov 2024 06:37:17 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 81/90] rsyslog: Enable 64bit atomics check
Date: Tue,  5 Nov 2024 09:35:46 -0500
Message-ID: <20241105143638.2301245-82-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113499

From: Khem Raj <raj.khem@gmail.com>

Build checks for this during configure but the test is a runtime
test, which does not work when cross-compiling, therefore
prescribe this by caching it for architecture/compiler options
where it will work ok.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 91c7ac099beca35f7081facd82bee27d9aaf46ba)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
index 41e3963580..cf833de22c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
@@ -39,11 +39,12 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
-EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
-EXTRA_OECONF += "--enable-imfile-tests"
-EXTRA_OECONF:remove:mipsarch = "ap_cv_atomic_builtins=yes"
-EXTRA_OECONF:remove:powerpc = "ap_cv_atomic_builtins=yes"
-EXTRA_OECONF:remove:riscv32 = "ap_cv_atomic_builtins=yes"
+EXTRA_OECONF += "--enable-imfile-tests ${ATOMICS}"
+ATOMICS = "ap_cv_atomic_builtins_64=yes ap_cv_atomic_builtins=yes"
+ATOMICS:mipsarch = ""
+ATOMICS:powerpc = ""
+ATOMICS:riscv32 = ""
+ATOMICS:armv5 = ""
 
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
-- 
2.43.0


