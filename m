Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0681DC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:15:38 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.1343.1706303729237455196
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7baa8097064so34916539f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 13:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706303727; x=1706908527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbqIqlebTxJr8cdBp4238Krm61D5O9ZW/5zptHsqBws=;
        b=w6xpQ5nbnPmw+onS2OgizrkBtCpcYAS++xMBk5rUqxFufxAVCyoaeHkeq3L5REmVyx
         kZ1LJKcEB5KWlgO6yl8L/F5MN4v9vnT+z3UofhLYx5qrwmxYK66HE5bWQpWeG0tOQ5Lx
         pjRQdcXjEoRQ01zoB+ysBGZZoVa7rBU4r9Tx6mhg0JBhpG5CIXZJEDBq24wA+lcmROr5
         sGPshuWEjBvDY4ZKrLkibFa+D6WAM7Vm78uuECmeWg8GjesZV6SPR73bcJDTDn2QqNx9
         F1f0R+X+7EJb7ojykovThfl0YUBjR3fJQj4tf4OhelvH6OFJafOfqn28aExt11BWnfMx
         lxtA==
X-Gm-Message-State: AOJu0YzIgwTY7YnRLMf0vdw8E9p/xBm7yjavtHMh2EzOjyeI7oUfHlkg
	tLa75C15LviHkX7YTNaUd6QESY1TEPsteQtQzQ+MfYDc+BjruoKl80Yq9YhS5dC0Pny+
X-Google-Smtp-Source: AGHT+IFtdL+zva5fjKQUrgyURIysE9HckMbzAUwRhuO3l2tgAcqJyHMHo5aQW1oMaixzOtV6c9Fngg==
X-Received: by 2002:a92:c6c6:0:b0:35f:f683:f76f with SMTP id v6-20020a92c6c6000000b0035ff683f76fmr385972ilm.32.1706303727704;
        Fri, 26 Jan 2024 13:15:27 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bt15-20020a056e02248f00b00361a166564csm539935ilb.4.2024.01.26.13.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 13:15:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-cytoolz: update to version 0.12.3
Date: Fri, 26 Jan 2024 21:15:16 +0000
Message-Id: <20240126211516.1576078-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 21:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108469

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-cytoolz_0.12.2.bb => python3-cytoolz_0.12.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cytoolz_0.12.2.bb => python3-cytoolz_0.12.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_0.12.2.bb b/meta-python/recipes-devtools/python/python3-cytoolz_0.12.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cytoolz_0.12.2.bb
rename to meta-python/recipes-devtools/python/python3-cytoolz_0.12.3.bb
index fa8549c54..6c35ad580 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_0.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_0.12.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d422ebce3e9c6447563bd410e9b22f2e"
 
-SRC_URI[sha256sum] = "31d4b0455d72d914645f803d917daf4f314d115c70de0578d3820deb8b101f66"
+SRC_URI[sha256sum] = "4503dc59f4ced53a54643272c61dc305d1dbbfbd7d6bdf296948de9f34c3a282"
 
 inherit pypi setuptools3
 
-- 
2.34.1


