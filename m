Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF96CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 04:42:34 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.1585.1759380145754189820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 21:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JghjC22D;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-72ce9790ab3so7765607b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 21:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759380145; x=1759984945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqRQV+B8vvGO5hSKjBFAoKSYQZPu9ww1k9P4hdMia7I=;
        b=JghjC22DdCzYjnfaet43V1cx5JbZ7Ge/dcTbN6vizVHhPa158l5FgWtG6xknPgr2cU
         CShAqcfaUyNRdugaII3bP1THLfI4OgxL+7OBewGBSPg44YAyK5VFVocwRvmrVxQMhMsF
         XHshVgEDKJVFTpWMN/k/OpAFmYKPJh/eUEUmXkFtDyi24+BMCj4crUFeJgNpN574H2hC
         fi/BgGilEkp4PgWQg2xolWNayALb0dmTvFA6DyB89wXsP5gVgIqv0+5BP5w18BoJmFrP
         wVD0jBSYCJP3IFI7zex599eTbqcsJTcWeJ542Kt5SOF8Z/Ut3oOJwRuVwIIeSQq5ZKm3
         1/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759380145; x=1759984945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqRQV+B8vvGO5hSKjBFAoKSYQZPu9ww1k9P4hdMia7I=;
        b=DW6Dhj4jIW5Fwq+GAm4eOGWnqZBIf/uto9wkMA+7uk+f5zefQk1NElaaWPDfRV5d5o
         HVevXK4qK9r9zWrRjgunVD99AW2q2DEEt4iwyM6fILF+PQa+UB6Ivjm09w9B0vfuoTyq
         XYas3JE0IJgWUBBEbCYgZVoKt0TomY5psdpaVdXRv2J5oUi110QA2RqyImE1yT3RUbg4
         veVaswCXfE2ddW/ke8peVu7ci8a5rw9BaYU0hdUKLoAdZFLe4JgU4Twc34kO06dPfFY+
         iKYunFyzsFGprYGEKBc2nfYcHC0DZTlg5naDoL12q2m9JO0cn/am36QYOXmmuZ8bhjmU
         kB0g==
X-Gm-Message-State: AOJu0YxfCtWEuzMZLlu9W5j0vOS2CHlMhsh7r7kPdqqqP1ffh+FfP8Js
	Q9gAxLmqhBRIL3p/eI1/0uQ36nSl4GNS/5mraPA4ucx87TURUA7/lxcaBtHHlcf4
X-Gm-Gg: ASbGnctX3/52yWBqmafyTb1L5/7nXe5CnF7oXSL7VPMdr8iELKuae0S083L+/cw1wsP
	hEjs64pQfZgeBcoPi0sNkDWihxhxe9N2Tnzwj1kjZDDZJwA2HbolA/G6+ha8BTtU1owVZOonVNj
	4OhA5CiGNPgOiyzm1XTMzjkuRYargXubV17Bb4ivj+ksKoFmMJhSyhdbDjX6/H8RcMO90CEPe++
	AwCBBYDhazbOK/DmOHOpqIHdihjZcEtw1H8JuIwxtDfJldiKz5cQouW/AQRp0XbS0yOX9hJ2lje
	8GIQABeXQSoGFwLbh5YmGp6ffLTeO2HbfX8GrXkH3a5FUnWHF9z316MSHI1K55JRRm+3SQvALcn
	WJDCupPbCK9irxzi/qa4CJI/XcKWVyWGalmcfrXzLdaAHgQFqnSPh
X-Google-Smtp-Source: AGHT+IHbeOBIqppR2y+W/uHryGf+vvOrU1yO5lsgqtbHdWmqxeZz5tNxd/7Tw+ZnChtazosOuyIsnA==
X-Received: by 2002:a05:690c:a0a7:10b0:744:21d9:f5c3 with SMTP id 00721157ae682-77f6f346fb3mr67231607b3.28.1759380144369;
        Wed, 01 Oct 2025 21:42:24 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c35c4csm5245207b3.25.2025.10.01.21.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 21:42:24 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nspr: upgrade 4.36 -> 4.37
Date: Thu,  2 Oct 2025 00:42:17 -0400
Message-ID: <20251002044217.13563-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 04:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120156

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/nspr/{nspr_4.36.bb => nspr_4.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nspr/{nspr_4.36.bb => nspr_4.37.bb} (98%)

diff --git a/meta-oe/recipes-support/nspr/nspr_4.36.bb b/meta-oe/recipes-support/nspr/nspr_4.37.bb
similarity index 98%
rename from meta-oe/recipes-support/nspr/nspr_4.36.bb
rename to meta-oe/recipes-support/nspr/nspr_4.37.bb
index c129362539..1f7c11a145 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.36.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.37.bb
@@ -23,7 +23,7 @@ CACHED_CONFIGUREVARS:append:libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[sha256sum] = "55dec317f1401cd2e5dba844d340b930ab7547f818179a4002bce62e6f1c6895"
+SRC_URI[sha256sum] = "5f9344ed0e31855bd38f88b33c9d9ab94f70ce547ef3213e488d1520f61840fa"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.43.0


