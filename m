Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39413C43217
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:40 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.17030.1652622573920736918
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hH56X3i1;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id v11so11772325pff.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7IiE8bybWQ7RL/qGsc8WVoTM0pO75szXvRS62yeOLEE=;
        b=hH56X3i1a3XlhEaxZXRFMYoBcYMFZLdnIgS/2zncYxfeUNE6WpQWwIBkvouhkCZWll
         iKWZ4SxeMJTQ0W+l80dRW4m9dQnumP77NVFvWxlc0GvnsduuWI8VsOezYtodBXeJFmnA
         U09oK0WeJe5gDjCBDc5IOkbwi3TtZAZSdi6HNoSi++eY1Jm1u1AYcSU+bS+88Hhq+SHP
         ghwgJI1iLDi6T6iAUD3urdRHqaKt4Rl1A76Al0DTCQ5u/HvlxQGxbInTBD/BsM+VdcQk
         xcRe7NP5nxQtf5abp734ycqcN0HnFAto985WHQGjPFczv5ZDFnxY5I5OFiR+l91XwRr4
         08dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7IiE8bybWQ7RL/qGsc8WVoTM0pO75szXvRS62yeOLEE=;
        b=HYcrFRS3EdDzBOCgCqibt2cJ7MwnROzVFzgnotKC5yLz1hvYwYFAuG4F+NfHcizqqv
         vzX6Gxl9Sv4/1uF70bwMQ1yNAPFP1WhEfEUIIxhoXCsI/klgov+DgEpPD4+Oqrgz2u/U
         7hfF7VamnRT+9bB6F/hyh8xhIMYEsfmX4YuS4IY6sBELzOXsHHWB7YO4FtBUORoCAupi
         jEYS/8wAjiSrFNnwFzeS/fRw+A/RqmIMJExQ50XrdP7cgZs3VqZm5rytKrOAkkScfx3G
         CpBFsezsEoLVMO6FH6Q3CEBhfDa+NLk+awgPWYc3QfNvIHakR3EewLpJ+6vL/6SXE3nM
         aU8A==
X-Gm-Message-State: AOAM533UO0seCE7iYbMO60ikXgca/eUEOkcNiBLY/UfFFkyK7cfVj6f8
	ozfvWsEunIgie9REzafoSD6G1L45lTEpQw==
X-Google-Smtp-Source: 
 ABdhPJxxePI9AnsNsXuC3j56MeOCZBrw7+Bq4fEzw8NPMrcIfNzvm8HNw5C7Trx7U8p4ZzbmbmXAaA==
X-Received: by 2002:aa7:9109:0:b0:50a:78c8:8603 with SMTP id
 9-20020aa79109000000b0050a78c88603mr13435625pfh.77.1652622573117;
        Sun, 15 May 2022 06:49:33 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 05/22] libcereal: Enable for glibc/ppc
Date: Sun, 15 May 2022 06:49:05 -0700
Message-Id: 
 <8db53b8f014c8128d28981e03b739078bb202e58.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97102

From: Khem Raj <raj.khem@gmail.com>

The error is not observed with glibc latest clang 14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f3d8e41b9d9b6fa6df92178f379d18f7e7a6478a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index fc4fad708a..80c962ead4 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -45,6 +45,6 @@ RDEPENDS:${PN}-dev = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-#it needs to work with CXXFLAGS += " -mlong-double-64" but ppc64 only supports 128bit long double
-COMPATIBLE_HOST:powerpc64le = "null"
-COMPATIBLE_HOST:powerpc = "null"
+#it needs to work with CXXFLAGS += " -mlong-double-64" but ppc only supports 128bit long double
+COMPATIBLE_HOST:powerpc:libc-musl = "null"
+COMPATIBLE_HOST:powerpc64le:libc-musl = "null"
-- 
2.25.1


