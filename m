Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D2FC7EE2E
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:43 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.69124.1683477188999494246
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TS89agCF;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-55cc8aadc97so54833477b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477215; x=1686069215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/busuOYtDXG9Iz6p7NhaohDnsxj7bOaptbwnqn9wPw=;
        b=TS89agCFrni6LPwxJzJdWuqlIwO1zj27kEeRyJILj815GkC0cMyOZjTipC8erwkxY/
         6PNDX/HMGA34wvemrwqLYIQKGJ5iEGsUbb5mIi+/XzF76hqIbzhWI68puDy5KevVNHSn
         0JrXiSHosV+HTDF32cC/DRzPY2RLWW9MfZ0mmv+mp2xpCvTQXoPd5uLh3EBbYn3AysrJ
         sc+DUHk90cHDkB+3pBMuyaeKcAGGfPmLgWtkdQeTuMFMCbH26wVCjLqxZJfSsQBBxrak
         bN4DEe/ov8Z5o32h3LNizsSPYWnVnKWCBS9WQ5EKmyDF8bZKGskbAV/sTChHiIXVKm+i
         dNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477215; x=1686069215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/busuOYtDXG9Iz6p7NhaohDnsxj7bOaptbwnqn9wPw=;
        b=ZuEju6xHA+vj6Ylk9L28xWGsUQRdBAIkn/xDUhr27UYVVfHuKlNKl9SAz2cdQU7ZMk
         f9yb6oA6vh2I09EapnS0svFGyA8vc1RygfQKQfM1R6NmYewacCuDDKpSUGNE3YlGbWO3
         z9D3dAOxnA+G+a29lKQUDFWh4a8y7XFeaAg9ds6AUvpIrS6EMWNR6ht1nJD4nVJh/6LQ
         CQS9SV0skPVQnzXeN5YU7EUAbyp09nbBWMlR1KklrHjdgfO+Vr/BkxWB3qt6rfHNDLIu
         LXXxB1BrJHqbqLIrvZ8/1QwqJEc7nAXOLfcD0G1S8V0rkoSA6Du5cUYGZ5Hh/i0IfFDt
         WI2Q==
X-Gm-Message-State: AC+VfDxVroFrralXdTgJvq5Tk6l36CE9yn8dOtbexJKL4W8UcPoHiHEc
	qVXuHyV81jys+RHv5zhdCgqTtVGHby0=
X-Google-Smtp-Source: ACHHUZ4Sz8IGZf7NmK7tlmoWqbqGILB5FTv3iBta/kY+mdKbmsNvCoySMSx2cXQDSSDUQ7y8ORSC4Q==
X-Received: by 2002:a0d:c7c2:0:b0:552:a63e:18d1 with SMTP id j185-20020a0dc7c2000000b00552a63e18d1mr7570051ywd.52.1683477215002;
        Sun, 07 May 2023 09:33:35 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 26/29] debootstrap: Use DEBIAN_MIRROR for SRC_URI
Date: Sun,  7 May 2023 12:33:02 -0400
Message-Id: <20230507163305.3261044-26-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102356

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 34796ff654d7c6acd348a54664a167830e0e6ecd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
index 4d13aa66c8..592d997aad 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
 
 SRC_URI  = "\
-    http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_${PV}.tar.gz \
+    ${DEBIAN_MIRROR}/main/d/debootstrap/debootstrap_${PV}.tar.gz \
     file://0001-support-to-override-usr-sbin-and-usr-share.patch \
     file://0002-support-to-override-usr-bin-arch-test.patch \
     file://0001-do-not-hardcode-the-full-path-of-dpkg.patch \
-- 
2.25.1


