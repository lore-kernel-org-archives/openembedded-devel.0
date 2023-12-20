Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBA2C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 21:08:53 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.32337.1703106526843754865
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 13:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35da160de2bso350515ab.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 13:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703106525; x=1703711325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7vhDGICgltmzmVnICtSc8fvikvzE/wgzv8Uu898jOw=;
        b=S1Wt0YYMLc+3utAEArqERvoexIi5OWOmo9bfWBBtocQeSSRmJin58kkZFIoSA66xHy
         ZT5WEvKGR6rOjktZuCA1kdC+DXhwgCI74d+RGvBi65x1nCdVrCRESQq+EKft0k9BLgre
         xJjAoJq4N+tY9/APpP87rvQ1sSeWlbHfeULRbwZBFKV5rb7apjGYPgoj42BwU/SIafHd
         4uQ+rWxJWuzZERqM2Fx1Z2oQETij08VD7YUi0zhcxT9GnTebZxgmjIFHotVVCYZwaT8h
         LY/ttYrrqQRI9MUkGf9r3Zees7iSkN9hDHPwIo+aFta0BdCPQjuihicSlJ0c3oRrRZXc
         NETQ==
X-Gm-Message-State: AOJu0Ywfp0FQkLmujwr3ElyqgKadCfGeyjnVdtk/WnTrpdWE6BaYwN+y
	bBIOGrCcJiX3SjIOOWNWys/fepBPcEDlSQ==
X-Google-Smtp-Source: AGHT+IHkgSpvCZt8oxLc1Ho4h9KrWkiMFZ8yRe47r/sUwW9qPOTNdZIwrqDWolxCiZT0GD55OF/AUg==
X-Received: by 2002:a05:6e02:194d:b0:35f:c98f:b191 with SMTP id x13-20020a056e02194d00b0035fc98fb191mr2151737ilu.42.1703106525118;
        Wed, 20 Dec 2023 13:08:45 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id f4-20020a056e020c6400b0035d70101e82sm95974ilj.42.2023.12.20.13.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 13:08:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-astroid: update to version 3.0.2
Date: Wed, 20 Dec 2023 21:08:25 +0000
Message-Id: <20231220210825.3605157-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 21:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107673

Changelog
* Avoid duplicate inference results for some uses of typing.X constructs like Tuple[Optional[int], ...].
  This was causing pylint to occasionally omit messages like deprecated-typing-alias.

Closes pylint-dev/pylint#9220

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-astroid_3.0.1.bb => python3-astroid_3.0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.0.1.bb => python3-astroid_3.0.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb b/meta-python/recipes-devtools/python/python3-astroid_3.0.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.0.2.bb
index 348dc2ebb..23501ce00 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.0.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "86b0bb7d7da0be1a7c4aedb7974e391b32d4ed89e33de6ed6902b4b15c97577e"
+SRC_URI[sha256sum] = "4a61cf0a59097c7bb52689b0fd63717cd2a8a14dc9f1eee97b82d814881c8c91"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


