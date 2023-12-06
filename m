Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8202C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:52:28 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.35235.1701877941774440978
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 07:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=C5zpMMHc;
 spf=pass (domain: konsulko.com, ip: 209.85.208.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-54c64316a22so6601219a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 07:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1701877940; x=1702482740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KjNUuERgW28xNmvu+3hocREsNk7FyJNTCA3qD+2IlhQ=;
        b=C5zpMMHcnRIOFOCDQg16wxSmAIGk5QPb5KCThtYFNM6/Dn/y1r3kSVvYQxvG8SBoDu
         lrKwoSLhQ0fgPd3lrpK1ivjfflpdkOT3tFPA1m+Ws2GGvoc7vO1JgXm+YkgI6mm2lYR5
         cEPvYr0wMM7dzc4bhunu6Qng0jgNbBzOINKfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701877940; x=1702482740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjNUuERgW28xNmvu+3hocREsNk7FyJNTCA3qD+2IlhQ=;
        b=mvMIcdFmoVHmVfxP8IZtnaj80APdV4NLFVLIWqsTEj/6Do8aYpeRvo4HcWo0vA3UOk
         YnKNsPk8YnVcBcaPvtE9YxNVXncmEnGtQG5LN+cFmRMW9Y6tjH3M9kDjOXEzcEuKOFnp
         KaLYIIJbOgvfHRQ/y8WbCM0xJQOyhPzbPoB7EGWqNrdmb9r10DHsytz9Zc21MmCjtBsN
         qJ7srUfv6B/xOOnrzFeyZ3FKq7beBSPUJ9lMMm7i8+MvO7CzaCg5AvHMN2nX3Bgu/u/c
         AKR6+9HqcyKSyYPuR+s0FI5/Q+RcMdXTYuXBqqQp9M9myVRZ3QVYbsk8nUrFJTsa8ZVl
         g0Dg==
X-Gm-Message-State: AOJu0YzfKP564Gg+/vIvnEO24jPpAgos947yJuC+sqTrKsdC7/yp4kU+
	ehhY4eOAbNm6Meu+p9iT2otXobVFSr2WHOpSghE=
X-Google-Smtp-Source: AGHT+IHiDNb4vZWrQ2O8Wb9QD7oMtbAtW3PCf+16XXntZGLsIp+7pqqnxwpQQH8FLQca8MMdfTU7oA==
X-Received: by 2002:a50:cc93:0:b0:548:e0d0:de86 with SMTP id q19-20020a50cc93000000b00548e0d0de86mr624136edi.39.1701877939892;
        Wed, 06 Dec 2023 07:52:19 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id m22-20020a50ef16000000b0054c21d1fda7sm121183eds.1.2023.12.06.07.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 07:52:19 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] sip: Upgrade 6.7.12 -> 6.8.0
Date: Wed,  6 Dec 2023 17:52:17 +0200
Message-Id: <20231206155217.4013715-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 15:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107258

Add runtime dependencies and upgrade sip to version 6.8.0:

- Added support for specifying the project metadata using the
  [project] section of pyproject.toml as defined in PEP 621. The
  use of the [tool.sip.metadata] is now deprecated.
- The latest version of ABI v13 is v13.7.0.
- The latest version of ABI v12 is v12.14.0.
- The conversion to a pure Python implementation is now complete.

The work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../sip/{sip_6.7.12.bb => sip_6.8.0.bb}                | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.7.12.bb => sip_6.8.0.bb} (66%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.7.12.bb b/meta-oe/recipes-devtools/sip/sip_6.8.0.bb
similarity index 66%
rename from meta-oe/recipes-devtools/sip/sip_6.7.12.bb
rename to meta-oe/recipes-devtools/sip/sip_6.8.0.bb
index 00823cf1a..6c7f22dd9 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.7.12.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.8.0.bb
@@ -11,6 +11,14 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "08e66f742592eb818ac8fda4173e2ed64c9f2d40b70bee11db1c499127d98450"
+SRC_URI[sha256sum] = "2ed1904820cb661b7207eb1dccfaebec1a5463dcad903ba448ad1945502d089c"
+
+RDEPENDS:${PN} = " \
+    python3-core \
+    python3-packaging \
+    python3-logging \
+    python3-tomllib \
+    python3-setuptools \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.39.2


