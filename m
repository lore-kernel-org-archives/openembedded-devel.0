Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A26C072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 08:52:02 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.7698.1700211112370434913
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 00:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LwKkgaXs;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53f9af41444so2476986a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 00:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211111; x=1700815911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Kbik1r/Hk5bNogqPj7XUc5ih6+Q4avsSYS/yLKiEwA=;
        b=LwKkgaXsLrL8r2NB6vgwIWMb7U3GG02RWLsATPN721CB3887Tf5ByZAZMIDpJ70rwl
         37fSc6GrPrDczzG5oTIfCy+glyaTuigsjhrv7GS3M8Q3t4dDsZHvBs6+WGHja2oPW1Ji
         WjSgIYtImxk+lueZYndo0qnxG3zoS0uyvLjmuiRMXGXGdZ1KW4RlhYJnn7dKLkwz98gI
         7odzpWzx8pS6XXJ1jD8SCiDlLtsv70bcyrsfSB/8Q73vxzNo6rS4NBlVKk64NcU91w4Y
         FTaNLkKOZKLahAjHvnB08wfzWnoZBTYY/nSDFV4zNSMuC07L1Y4usoKedPOyrQr6L2jU
         9ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211111; x=1700815911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Kbik1r/Hk5bNogqPj7XUc5ih6+Q4avsSYS/yLKiEwA=;
        b=VyLsdxJkGAaSM6jMeDWubJNbGMzcaNpxE6yegDEBp/sY9aoY5hM+OwguPvUW5nk3Xk
         ZxiAXF+/0y1HFrfarwSw1Oq84S4BkjK0GRrmcmW8yNL8tjHVDuvfKulloVv6Hyb7mO6L
         MkMYPloQhap4CBXig4xkAXR4WL79W77Sq/CjGlegXStOZxSk5R5XWneFpktCrEtnxdR4
         PpCK3I5n2ZyzZAk/Ekjj1w6HaQgeth67HzSoMnLlHPDe3EtBRtiindalPYqiLvRMAKXq
         Rx8NMazVyBJb1NUrQiIEFhhvLTLgjIjBxcUZSixDmPtFFZRUD8PI1gkX4KMf5PSVtF5A
         yBzQ==
X-Gm-Message-State: AOJu0YzvdZax8A5AsxHizztzlkmWJfz+C/i4DDOW3+F9CyO3zeAq5VEq
	1F32XcvYlgIN2QB6l9xWYF0nrUWO9VY=
X-Google-Smtp-Source: AGHT+IH28JfIZtdrCHeTrLFkEgwqzNqkOrfcgRR8YLVUIBCg3+Iv5EtTezB7r4eIPvLUWCrLraIbbw==
X-Received: by 2002:a05:6402:1111:b0:543:6ce3:f091 with SMTP id u17-20020a056402111100b005436ce3f091mr14473594edv.7.1700211110584;
        Fri, 17 Nov 2023 00:51:50 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x25-20020aa7cd99000000b0054386466f56sm509626edv.60.2023.11.17.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:51:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/8] android-tools: drop ${PE}, ${PR} from /usr/src/debug paths
Date: Fri, 17 Nov 2023 09:51:36 +0100
Message-ID: <20231117085143.3813216-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 08:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106850

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 9278146702..1c66ea4997 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -92,7 +92,7 @@ do_compile() {
 
     # Setting both variables below causing our makefiles to not work with
     # implicit make rules
-    CFLAGS="-ffile-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+    CFLAGS="-ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR}"
     unset CPPFLAGS
 
     export SRCDIR=${S}
-- 
2.42.1


