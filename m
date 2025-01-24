Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2373C0218F
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 00:48:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.1345.1737679710494706124
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 16:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mfXnZ+N1;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2162c0f6a39so51015975ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 16:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737679709; x=1738284509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9sKviGb9Mqmq3sJelez93R8uNDazAzNBjGTuuJrlLM=;
        b=mfXnZ+N1H7+kxKS2scTm6vMZcIn1nM9mSQc5QXVyDLF0qv860lU3oJmX9DDzRFsBdf
         u3Xiu3d+9pWbeIEFCQrtpgiiTfvCL8vyvG3VKgNgN6JAl1g4ziFJJX42saR0gzFmt0HE
         GhImPgi9d746MR6MOZ0W5tS5czloY9Dg16tSlTM+VHxHjpPJJsVegcm5iyNYnUqhnTxK
         xRHGVp9SPDQ8dAXlbG5y19tbgRt+tddWbTDG9P4rgW2+oiDV+e4vhqwp/sMz/4JfTV/x
         jqqEp3vG8frheLiOjsVE5qQ+34B3ZFyW14spUPszaKz9xPoGBAQFS0N4I2VWqxm3Bnwp
         EBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737679709; x=1738284509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9sKviGb9Mqmq3sJelez93R8uNDazAzNBjGTuuJrlLM=;
        b=M1bU9I1OYyz+6rYMsBtp/d8wcXl+q9oy9PGpAT1fdawF9IBMge9Ryk6uWzT/XWWc1X
         taBut9abp6vUA8Hkgom4rO+EvG6Rax5UaGW/qRJZgngX/fdH7thqnaAaYL1p++5w7UlX
         VzMP9+AjwInKlFC0JhmkpFPfXMKZSI4svz55B/k8bPzRtATGcakhy3xg82C93r39CCTL
         upDYuvAvxL4QwZUMW3fJfLmW2NEoZuDwNTPNO7ciO471zQiZi0Y6gUsWPSQpNCf7B9Yn
         Hr6pxleFqGrEc8vorAAkVRA9qzk3kn9vhGWJG8M1ZKWDXeh3xhLLNn4OUd88t/WBfXPD
         Cbcg==
X-Gm-Message-State: AOJu0Yxm5octPAQcpPobGk1mJYEZnt/4QddOpDp0bhci9WEbUGmYfz48
	wSPEt5yYbTh7XXrafgQ0L0jKEsy3lo1E8uPjPYnAE4qaa4QgxFQP5f343IVg
X-Gm-Gg: ASbGncu5Vt6u4mFOYLt3sGpHcguX4xFbGIAR1Y7CRzKR2sh89O2j6AKjnyQ09FUxnmX
	cjClDGv0/cmgPA+0U9D9OYgInYzjQXApmvCVvf80EkCNjQm6hs7ZCEiqVDbFG8ADzvxyyOtxQB7
	GIG2cpbmunSUZuCoBrlUblfw7PTXEfYx6rMTnQoeTqNoj9fG98tHV0A1B6WvFARWRzZLaIQsY8h
	0m2kUL7VKncqHYD2KbtVH0WVuWYaapKBBw4VPEy8lc80/V3ru+TVlwYM/qeLF/R3NPqxSba
X-Google-Smtp-Source: AGHT+IEXW2P1VX0YgEcWbrBwUn+w9XYfZysAVeURCYLI1oO6AHaGRnWu+gF91aMpV7ehqPMgEqygdA==
X-Received: by 2002:a05:6a21:6d9f:b0:1e1:ad90:dda6 with SMTP id adf61e73a8af0-1eb697c1bb0mr9232166637.20.1737679709519;
        Thu, 23 Jan 2025 16:48:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::d2e2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48fe53bddsm475599a12.25.2025.01.23.16.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 16:48:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] php: Drop references to ACLOCALDIR
Date: Thu, 23 Jan 2025 16:48:23 -0800
Message-ID: <20250124004825.3525640-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124004825.3525640-1-raj.khem@gmail.com>
References: <20250124004825.3525640-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 00:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115042

ACLOCALDIR is dropped from core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.2.26.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.26.bb b/meta-oe/recipes-devtools/php/php_8.2.26.bb
index 61b127373a..053242413f 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.26.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
@@ -162,11 +162,12 @@ do_install:append:class-native() {
     rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
 }
 
-ACLOCALDIR = "${STAGING_DATADIR}/aclocal"
-
 do_install:prepend() {
-    cat ${ACLOCALDIR}/libtool.m4 ${ACLOCALDIR}/lt~obsolete.m4 ${ACLOCALDIR}/ltoptions.m4 \
-        ${ACLOCALDIR}/ltsugar.m4 ${ACLOCALDIR}/ltversion.m4 > ${S}/build/libtool.m4
+    cat ${STAGING_DATADIR}/aclocal/libtool.m4 \
+    ${STAGING_DATADIR}/aclocal/lt~obsolete.m4 \
+    ${STAGING_DATADIR}/aclocal/ltoptions.m4 \
+    ${STAGING_DATADIR}/aclocal/ltsugar.m4 \
+    ${STAGING_DATADIR}/aclocal/ltversion.m4 > ${S}/build/libtool.m4
 }
 
 do_install:prepend:class-target() {

