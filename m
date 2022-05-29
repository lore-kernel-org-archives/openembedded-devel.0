Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918F0C433EF
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 13:38:13 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.25108.1653831491656576412
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 May 2022 06:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D3p5VZfI;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id f21so8360250pfa.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 May 2022 06:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=voK1wHEbq9Iy2cMkGVP8GtANRFTnjQVuuqY6xQOgSBo=;
        b=D3p5VZfI5ud5shBN1+JbE/M35YbhUezuB3TO+BAARylmP9KqG2CshB9+HILnqrSITI
         PUuJCgtPyZ7oP9CDn0ZWTmpCb+BEIvD1MkTGEYs+r0zu1W/edvw3HYJfWqQr7zg+EFHK
         mlZc7C6JCYKGUXEMUZtB7llXi8f0ufP/jtuO4QZwCysKUMU+JcgQZkOgkkjE0X4bkMst
         GOsJ+rppazBe4zJjiGwnwoIOT7RHurc5E5mcQlfiqXrVdaN6rt97HxQJ9Lr6CQ3XpQns
         cGYVBLplOs1HO2LxOnSSlCtu83p78d2WyEUSsa9DutaZSjhSL6T0jWjxuyLIAIaxlKuy
         xskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=voK1wHEbq9Iy2cMkGVP8GtANRFTnjQVuuqY6xQOgSBo=;
        b=dk2WCGSUNuF0aneoko/fbJ67PQHbSVGS+ajIqbckWR336Yt8Xz9tDNsdlo99+1RqD9
         cRDmAXX8h/oE+OAvOlipt5ANVBApQ0nnpQ7sCHSrf0gBhEPwyNKb4hztNkO2aiIMjz6I
         K17T/egUKDr/r2riaouMFS15Dl4BrQ51nLFAITCBS89EnrJgUB3ipLT39PhJwL5RTGUd
         Ivm+YrfMvOxO4C/Famq8TwZutr9keVW9VLB23+8+lp0Heg3+YT2iRAf2w8iAFBijKFuX
         y1TGEYUmY09l8AR8ZTRUF6MxsrpUrggFe8Db0A1RSHn3hY17BYEUBglh5q+vm3DROzbR
         wnZQ==
X-Gm-Message-State: AOAM533k0k3q8eRSB4yLMKk6FkZC5d6Q8tGQIsUtGakc8/Gda53sWW7u
	WrT0eoF9a3/fttUpG4Z+zLu0J5QIX8Ebsw==
X-Google-Smtp-Source: 
 ABdhPJziKVzILXv3KGR8RRsF69Yg5kn5CSXvtlpoagrqB2BTGYCUuR4KuBlNdWtJXo70ycP2OUNo6g==
X-Received: by 2002:a63:8048:0:b0:3fb:d725:977b with SMTP id
 j69-20020a638048000000b003fbd725977bmr6011705pgd.579.1653831490852;
        Sun, 29 May 2022 06:38:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::47b1])
        by smtp.gmail.com with ESMTPSA id
 r7-20020a17090a4dc700b001e08461ceaesm4838721pjl.37.2022.05.29.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 06:38:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++-libsystemd: Fix patch fuzz
Date: Sun, 29 May 2022 06:38:08 -0700
Message-Id: <20220529133808.2977117-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 May 2022 13:38:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97319

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0005-src-basic-missing.h-check-for-missing-strndupa.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 36545c2f60..005ef022fd 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -322,8 +322,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
-@@ -12,6 +12,7 @@
- #include "set.h"
+@@ -11,6 +11,7 @@
+ #include "missing_capability.h"
  #include "string-util.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
-- 
2.36.1


