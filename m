Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC04C19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 05:53:09 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.11187.1659851579344949820
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 22:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jyv3de4M;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id pm17so6162311pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 22:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=oYqCIqfEYNoPim+YuCSkVUCsqfKK+CZnOz/um736Yds=;
        b=Jyv3de4MLi713FXGYCmgVPye/xfLferGznkAvSCWsmmhVjcLtZk9fkfu7yUSq8RFqv
         Aa98GV6o9LOEElHnvzGIl58D93I2vj2StXwOxdneSmLpyU6v8WnxZtAyKnlq+SgTA3qF
         y3OoVJ5eVq3YEBcSl+/6kt3GcXbnghWaXbR/52zonZxry1k+BLo/7pozWyLrFp/HXqzV
         Aap31vFYt7u3v3HGGUfYUfOjLJFggrrJxvECojut47XWaHbFqSn4aJvmyR2FJ2xDitKj
         Qwx6cfFuTtCyAZhsHBlbY+795z5mXZVIsCIEaS+3i2mHz+7CCA/lCg2jy+Uc23bSRv0K
         CbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=oYqCIqfEYNoPim+YuCSkVUCsqfKK+CZnOz/um736Yds=;
        b=XKCuKYfwjX2DtHthVMwiizOBt930Hgv0kBgIu0PFVFf7gyKLBrvLTzRhY+THILem71
         RpEDoM/8xcI6LW6fcQaN/yYNSvEpyyDdSx4g/YNbopC6YF4MpYW2gUJLkNJq0DgJP0vI
         1gF37XgHw6LC5GJXBXY7NDjfpooV+k/pFMEs57o38XiZ6Jmx/Ih7ZSujXzwsIx0T/jI/
         +iDvvjQ9NFn9ILdwv46qwjK3jhGitCgDtI0oK8X2Lub9ULOYwElg3cLJyq6b/z2z6O/h
         0cL6lPcql29eBDrsREgtFMF+ui1emwK+F/0hMhSOUxv6yySoKFfArOtI8MaAQKDgNjhM
         fzhQ==
X-Gm-Message-State: ACgBeo0WAC5A1wBeX1nIXlnlm5BtoKZYaiV9JQnwgPJVF9izlSg2srOO
	reEZ7Wg3aBApJfSX4U6G7y27k9JSvyc=
X-Google-Smtp-Source: 
 AA6agR56CXZOmIYtHQ+v0bblyLxVbzsw51bhvuW2qEXr05+Sc1r6F7x+fV6T0yAU/q4RfPMkbKtyIQ==
X-Received: by 2002:a17:902:ced2:b0:16e:e19b:c5c9 with SMTP id
 d18-20020a170902ced200b0016ee19bc5c9mr14252604plg.136.1659851577909;
        Sat, 06 Aug 2022 22:52:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 f20-20020a635554000000b0041a716cec9esm3872380pgm.62.2022.08.06.22.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 22:52:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/5] kronosnet: Upgrade to 1.24
Date: Sat,  6 Aug 2022 22:52:51 -0700
Message-Id: <20220807055255.2982774-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Aug 2022 05:53:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98142

Remove upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ests-Correct-include-path-for-poll.h.patch | 29 -------------------
 .../{kronosnet_1.22.bb => kronosnet_1.24.bb}  |  3 +-
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/kronosnet/kronosnet/0001-libknet-tests-Correct-include-path-for-poll.h.patch
 rename meta-networking/recipes-extended/kronosnet/{kronosnet_1.22.bb => kronosnet_1.24.bb} (92%)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet/0001-libknet-tests-Correct-include-path-for-poll.h.patch b/meta-networking/recipes-extended/kronosnet/kronosnet/0001-libknet-tests-Correct-include-path-for-poll.h.patch
deleted file mode 100644
index 0d261fd4ef..0000000000
--- a/meta-networking/recipes-extended/kronosnet/kronosnet/0001-libknet-tests-Correct-include-path-for-poll.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cae68083fda5d4ca832ff3cc8a533454df2efe23 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Oct 2021 20:35:53 -0700
-Subject: [PATCH] libknet/tests: Correct include path for poll.h
-
-Fixes
-/usr/include/sys/poll.h:1:2: error: redirec
-ting incorrect #include <sys/poll.h> to <poll.h> [-Werror,-W#warnings]
-| #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
-
-Upstream-Status: Submitted [https://github.com/kronosnet/kronosnet/pull/363]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libknet/tests/test-common.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libknet/tests/test-common.c b/libknet/tests/test-common.c
-index 86b76b0..8f8b6ca 100644
---- a/libknet/tests/test-common.c
-+++ b/libknet/tests/test-common.c
-@@ -20,7 +20,7 @@
- #include <pthread.h>
- #include <dirent.h>
- #include <sys/select.h>
--#include <sys/poll.h>
-+#include <poll.h>
- 
- #include "libknet.h"
- #include "test-common.h"
diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
similarity index 92%
rename from meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
rename to meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
index 0b0bc29452..cbd5e7a0fd 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa88
 SECTION = "libs"
 DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl lksctp-tools lz4 lzo openssl nss xz zlib zstd"
 
-SRCREV = "0123ecebce0ad6aba3cdb320027192e15fd71e23"
+SRCREV = "f8f80fd7f9b85f2626d2c6452612962ad8efca9e"
 SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1 \
-           file://0001-libknet-tests-Correct-include-path-for-poll.h.patch \
            file://0001-links.c-Fix-build-with-gcc-12.patch \
            "
 
-- 
2.37.1


