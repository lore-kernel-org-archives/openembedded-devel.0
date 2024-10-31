Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6775D767D2
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.12747.1730382087804533996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MGj/3UFT;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c99be0a4bbso1338794a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382086; x=1730986886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JQAQ1LjVX4JYKXvcuXmgc+5U+tsmodMVyQtLqyzHsM=;
        b=MGj/3UFTvHPQr01lqPIFJHgJdS4tfpMDjWTPbnbrEwRKh1pnRhvxNpldkGUmY84Jyz
         zDVC7fKrdSbWd02Z58sWZef1h6D2iR7mMq9rdlV6KtVAZbMK8R8HDJq68ZG5sjhlPKY9
         GQXI9sEVazmuomPUmbqOTLbUhZQIaJWYTxNKbcTurr3yQAWDW+M2JMOD9iD3qpJoKlPg
         X9zyv/S6t7pZS4fo4PHradQCzpU6bYWfmXwjE+kvRXw0s9fDgZPwXDeuo9PZBAmuFopy
         WhWCuFNvnLTCenOm4J8XH6acr4BvmQh1OxFs5j9ONM1GvjT48s8Cu7CvMwJTm2x5grOB
         xlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382086; x=1730986886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JQAQ1LjVX4JYKXvcuXmgc+5U+tsmodMVyQtLqyzHsM=;
        b=XFPY2RUlurr0ozbeKKDxnBi3WNkNKTbHCpQJRdyFKEataOdIEBYut70ZTZ0mkUODlq
         UcT+UFoULMUNU+Wng8i7S0pKCbmbEOJER7CmWi5PaHU8GDtjdrOxDNA3xxCjFCWUuf3x
         tD19sP3CnyNZuRTxYM7LDA4uU+PtZnMlSMcGngDVJlJfOxFGlQ57I9WrHOZv+G3Kcmtj
         enilLuDqT2Kv4TVEIxPHxtor7NVoiHaZ08Ha3r465BlOHk04r4qGeNlkFp9PdwsSSyqL
         /nBFwjF1olLCwtxfVWjU/eX2XMriTFy6gmvhfHbr+hl5bFBoKiD6dmv0YqlG+viRKhBX
         dZcg==
X-Gm-Message-State: AOJu0YwOOkb2dX3Lluv3FdXYO4TdDMCUp6b66nT3aZLWUKZPohFw23rw
	E7MePLHPQplTlYRQGxIUi3rvJW5bKRn8GYiql+ByU7WD15g6YgKXj+Tfkg==
X-Google-Smtp-Source: AGHT+IG7NAYWnfCYs0PZiO9hIHhPUqweTYKXSqL1s4cbMY+hBL8Yy5cO8qOZ18006z1Kdzjj9dNbYQ==
X-Received: by 2002:a05:6402:2344:b0:5ce:b82f:c4bb with SMTP id 4fb4d7f45d1cf-5ceb82fc944mr327503a12.25.1730382085908;
        Thu, 31 Oct 2024 06:41:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceb13a2398sm331865a12.29.2024.10.31.06.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 02/11] perfetto: drop unnecessary FILESEXTRAPATHS
Date: Thu, 31 Oct 2024 14:41:05 +0100
Message-ID: <20241031134114.2791747-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113359

* we already have a common directory in default FILESPATH called 'files'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../perfetto/{common => files}/0001-fix-musl-build.patch        | 0
 meta-oe/recipes-devtools/perfetto/perfetto.inc                  | 2 --
 2 files changed, 2 deletions(-)
 rename meta-oe/recipes-devtools/perfetto/{common => files}/0001-fix-musl-build.patch (100%)

diff --git a/meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch b/meta-oe/recipes-devtools/perfetto/files/0001-fix-musl-build.patch
similarity index 100%
rename from meta-oe/recipes-devtools/perfetto/common/0001-fix-musl-build.patch
rename to meta-oe/recipes-devtools/perfetto/files/0001-fix-musl-build.patch
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.inc
index e0e4f04a23..3cd0cb91b8 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
@@ -1,8 +1,6 @@
 SUMMARY = "Perfetto - System profiling, app tracing and trace analysis."
 HOMEPAGE = "https://github.com/google/perfetto"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/common:"
-
 # Add only patches here which are used by both perfetto and libperfetto
 SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1 \
 	   file://0001-fix-musl-build.patch \
-- 
2.47.0


