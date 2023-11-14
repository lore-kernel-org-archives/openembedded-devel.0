Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA1FC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 12:10:01 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.11210.1699963790968274927
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 04:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qhC9lqLY;
 spf=pass (domain: konsulko.com, ip: 209.85.208.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-543923af573so8519858a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 04:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699963789; x=1700568589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjv+5LaCEZdrxYQxvRYKXNCnkLqAiDxaIz3zJTqrnW0=;
        b=qhC9lqLYMwsSZ4Cd0ch5HElz5Be4j1s2UwAp5MlpWx8hJbg8hwdViN3gYGNXqrBYkC
         yKup2W3IgEhLCJcSm+uHhOuv5ZdGO4OYFiRRgr6Rp7YrYakQpXLY06L1f51hC8Htw5UP
         qC5km0LNZ+ey0p1EvM8Anjt5jAkwVDNIYUo+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699963789; x=1700568589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjv+5LaCEZdrxYQxvRYKXNCnkLqAiDxaIz3zJTqrnW0=;
        b=ABaSCq3D76u8KCVIoWdA+mdPf9ZRRZRvFan6e3VPlKUfpu2tuUW+3ALbgjpQ1ZUuLV
         e/moDnxP+1Yl1xsH6ijEa3giGo7ZtS1C0uixLsRdSMzAtRDWKxzbuszvkJrmronH6bEO
         qSBBE3rn2u6nlXRb/jVGjxOtdnxrDmmUKebjImN7hd2qJKfPn+t8gtsw8wt7fpBgaDsT
         XA/P90V73O/ilcErxUsyF0/qNv8GXEtNdo6dbcDNMV5RXpEr5ZeaUQ7q0eqrcfJqFU++
         m+30Bn5817OPFqsIQSPq1SD09TKy+GEuWb1/O98NSt1hCuvhSpBpS1V958l/EqPNONY8
         li7Q==
X-Gm-Message-State: AOJu0YxIUvckzIxBpN9IdMrtw+8DHUN2S1x4wATt2RDw/96ySU2kpE1n
	RBf8GvIxubv11p0GKaIBUszyID5U/9DR5X49R8o=
X-Google-Smtp-Source: AGHT+IG5ZaT69GyZ+yrL4+rQcUNOOcUNBMiQiFk9ZhhAhTjv87mJrC7PmI8eqTsBs2N9jjvOWdNyGg==
X-Received: by 2002:a05:6402:34f:b0:540:7a88:ac7c with SMTP id r15-20020a056402034f00b005407a88ac7cmr7032328edw.21.1699963789018;
        Tue, 14 Nov 2023 04:09:49 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id o5-20020aa7c505000000b00532eba07773sm4946958edq.25.2023.11.14.04.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 04:09:48 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-py7zr: Upgrade 0.20.7 -> 0.20.8
Date: Tue, 14 Nov 2023 14:09:42 +0200
Message-Id: <20231114120944.3741068-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114120944.3741068-1-leon.anavi@konsulko.com>
References: <20231114120944.3741068-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 12:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106711

Upgrade to release 0.20.8:

- Detect brotli import error
- refactor: hardening SevenZipFile constructor
- refactor: improve type safe functions
- chore: add git export configuration

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-py7zr_0.20.7.bb => python3-py7zr_0.20.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-py7zr_0.20.7.bb => python3-py7zr_0.20.8.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_0.20.7.bb b/meta-python/recipes-devtools/python/python3-py7zr_0.20.8.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-py7zr_0.20.7.bb
rename to meta-python/recipes-devtools/python/python3-py7zr_0.20.8.bb
index d919c4a0d..f9e6820ce 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_0.20.7.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_0.20.8.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "55aa587fb4586c920437f5d6e6595f228beddb321bfee3f5146bb15c2e8e74d5"
+SRC_URI[sha256sum] = "2a6b0db0441e63a2dd74cbd18f5d9ae7e08dc0e54685aa486361d0db6a0b4f78"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.2


