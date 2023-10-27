Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB31BC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 14:06:46 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.7824.1698415600594946865
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 07:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MgfmdJe7;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-507f1c29f25so2957376e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 07:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698415598; x=1699020398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSqsExSjk0nbgoK7J6FcDVD9M8aDi8HSkeiZuyL50vs=;
        b=MgfmdJe7e8ILz2sStsU88yyNYZZYxsvpcwCxRFGhYb4jpOnBfSyeYN6kCIFhkayA82
         i1ENQMJgcIWemQ6eTo7DS/FasRn6DnfPYrGgDhEb/nvRsLo3j8nF344zf5jOss+dS7ky
         CxE2VYTUJsxoXsgULgaK3cM1PifFFO7TzoyjNnU9FDEKOHikHjryAmndQQOqtgUbPAIq
         Yegx9b2kh3uQvYw9OQKkiYrv18FVMyz6/yRKYhoEz5HpLcuZzJmeUrPndKJGmkJ6QNtF
         kWk0sWUZ9wUoxsUX+R+dKEACN985dhYtu2tJgCVE1e7MLfP50KfJfbm/xDadFLRm9tA5
         cEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698415598; x=1699020398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSqsExSjk0nbgoK7J6FcDVD9M8aDi8HSkeiZuyL50vs=;
        b=v2IUzzCqEEqx9IPMgy+CVT0J+nILMfXk8gUy78087J+jG54Czf4kbtyAqZtlbjCm2J
         veqrIzHwDUvycoe8BKtQNjbrlqpq6NquZU2Qn4k9py/y4B8kdY4gxtimyCN3gnYzMzWw
         5xnt8dOB5vw7CcHhhdHcZeU5Nggf4QmgP8t6L2M4y8Mtloo9CMhJbL6Mh7WtU3/tlUGf
         sSO8H6mxi6eC33DA91SKAacWNkiyiqOJc+QnGhepIZXlhfm1Pr8vJjxSGDrxnRs1V1Am
         wO8vWQjhUc3sI5bgWdkxa0/3ZGwriZSszIj2Y720hiD0ONqerf2B6slzh3uuY8eD/Nid
         NB8Q==
X-Gm-Message-State: AOJu0YyU5YS2Bbpmx0/rnGJ302yMJEq0hq/T5fCwNO49vzyo2WTiZgfk
	6a/3aUIjVrwugW2ZYHGXIffh93Zx9LI=
X-Google-Smtp-Source: AGHT+IGxEg/uDWEx1gcWX9cukLjcnQMHjPirJZAca1Hcokg+esz7yPzZjkgYjyDiHf7bHyogG/Wc7g==
X-Received: by 2002:a19:5f5c:0:b0:500:b63f:4db3 with SMTP id a28-20020a195f5c000000b00500b63f4db3mr1802953lfj.35.1698415597645;
        Fri, 27 Oct 2023 07:06:37 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id h13-20020a5d548d000000b0031c6e1ea4c7sm1814298wrv.90.2023.10.27.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 07:06:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] proj: Upgrade to 9.3.0 release
Date: Fri, 27 Oct 2023 16:06:32 +0200
Message-ID: <20231027140632.225031-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 14:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105775

---
 .../recipes-navigation/proj/{proj_9.1.1.bb => proj_9.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/proj/{proj_9.1.1.bb => proj_9.3.0.bb} (90%)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.1.1.bb b/meta-oe/recipes-navigation/proj/proj_9.3.0.bb
similarity index 90%
rename from meta-oe/recipes-navigation/proj/proj_9.1.1.bb
rename to meta-oe/recipes-navigation/proj/proj_9.3.0.bb
index 6ce1c8877..59bded87f 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.1.1.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
 DEPENDS = "sqlite3 sqlite3-native"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "003cd4010e52bb5eb8f7de1c143753aa830c8902b6ed01209f294846e40e6d39"
+SRC_URI[sha256sum] = "91a3695a004ea28db0448a34460bed4cc3b130e5c7d74339ec999efdab0e547d"
 
 inherit cmake lib_package
 
-- 
2.42.0


