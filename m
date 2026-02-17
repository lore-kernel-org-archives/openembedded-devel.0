Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A41E68169
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:31:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9266.1771324269449702054
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dvsqprtP;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso47524205e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 02:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771324267; x=1771929067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xf0TOKc5cuGWjvXF4b/P8XwTNKKuyD7ATbWaQoi+yfM=;
        b=dvsqprtPUOIcEjqFY5LBHUP0LmK75BrpbHLXAK/tgDEIpp9JCbvnBQqiepv1kd8okl
         KQk8emPwzjyhQZqk9dlLqgownAd8xL2Mab69ngLliJL5YiurQjltw49xubiRO8AgALa3
         KxB/gYcOH4tzRkiDtRvTeDiJ/bOC9JkQgN/6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324267; x=1771929067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xf0TOKc5cuGWjvXF4b/P8XwTNKKuyD7ATbWaQoi+yfM=;
        b=NVVC30GmW4L5VS/3KkoV8dL+wQcerNnGMjbPxcTHGVeYK5pvk4PJWXW0nUC7Tv1eIC
         pyKvonPucn1Wv9FD2EUgaCxQ69wognKG7v++nQoYns1V3JekMQL0awSHN89eli5RYeHX
         LlU0u/kJgImlHPgX60bvxq5LBaWXIBsb91aeusHul1hCHmVbyn6Gop6SIShI9GTDGjCu
         Ob5RKMsM+LA+DQODqtFZTNUohvgcuWe8bdwcmamP7VziWa4emauxue/cIadMiWmrOUx0
         w6TH9K4m4uW77Vx+w5EEBSYf595p4P61S0WASPvcz1rF54UIa1JdK0Fa4ZMqtdPFVLy/
         6OBg==
X-Gm-Message-State: AOJu0YyQUij1KmMTb3TttIz+zWUuxWhN/Aif4vBw0HfeRxUjkr/Rgsuv
	6rg6Ux4hRZ5bPZzIPAzHXt2sbBn9QIJdC6ELXZvAT1Wyf4nuX0PPySKBalRivEwBTzLN/OnV5sy
	2l3Cp
X-Gm-Gg: AZuq6aLlhSTPWTk5AAOQeAXu+6glHF7B2Iim07TxyFKnE39w3km/Xacek3klsbRHdS3
	j7Mat+xgCMXnOyYMDjHwrcUBYAbA6saVroiqUyMJt3TGXriFF4xXMhOB4RIwKXdELmOfnDcO6I0
	0bKKTRv87d7NEGdqFWp9Q1v7NHWofxRIyAjX3ptVS8t4BAikzx06op/GHu0iR7ItkmsPbGm9hSb
	rY+CoJU3/rRXfCcBCQzDfMtFo0hP+L0pZc3k+E17JJ7fN+q15eMSXI+vnlu0OqIbIEv7Lr7Z43W
	+YhXaW1WjqFkV60yyPGe6teoT+z0nM/zN2OLd6tpoMOWhbK7FzYm0WKkVAOBUFxNuTd5ZcywCM6
	YqHLwFxZF8QOFIwsqzF1KqU/wOaPNosy3LDWb0Z4Pcio+ujqFWbQRGD5csE4M+BRNna6aWqOxjX
	99fmaKkVbAzkjuL0Vs3v4Cxmb/TeYf2UeTb5Q+
X-Received: by 2002:a05:600c:1c25:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-48379c14606mr156582195e9.32.1771324266667;
        Tue, 17 Feb 2026 02:31:06 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm33305378f8f.31.2026.02.17.02.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:31:06 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-filelock: Upgrade 3.20.3 -> 3.24.2
Date: Tue, 17 Feb 2026 12:31:01 +0200
Message-ID: <20260217103104.2849723-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 10:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124445

Upgrade to release 3.24.2:

- docs: restructure using Diataxis framework
- fix(test): resolve flaky write non-starvation test
- fix(rw): close sqlite3 cursors and skip SoftFileLock Windows race

License-Update: Move from Unlicense to MIT

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-filelock_3.20.3.bb => python3-filelock_3.24.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.20.3.bb => python3-filelock_3.24.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb b/meta-python/recipes-devtools/python/python3-filelock_3.24.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.24.2.bb
index 4499b220bd..d1e59107eb 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.24.2.bb
@@ -2,11 +2,11 @@
 # Copyright (C) 2023 iris-GmbH infrared & intelligent sensors
 SUMMARY = "A single module, which implements a platform independent file lock in Python, which provides a simple way of inter-process communication"
 HOMEPAGE = "https://py-filelock.readthedocs.io/"
-LICENSE = "Unlicense"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "18c57ee915c7ec61cff0ecf7f0f869936c7c30191bb0cf406f1341778d0834e1"
+SRC_URI[sha256sum] = "c22803117490f156e59fafce621f0550a7a853e2bbf4f87f112b11d469b6c81b"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


