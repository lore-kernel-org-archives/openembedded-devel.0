Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AB1C7EE24
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:43 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.68999.1683477193085198587
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ERhw2aNs;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-55aa1da9d4aso66146157b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477212; x=1686069212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U4GjOOXIuHe0ADXuXgNiHHjyw+TBdbEMalD4w3rS2I=;
        b=ERhw2aNsf8R/2V2a/GkzD0V8VC8yN+ciyhP+V62TA0s7Orev7L+VK5dTC6DLBnKJ2P
         MtFQLpuGczgcP+1qFZ7bwJr1Y5Z8QxSY7DUR19jkpJfQxGciJoYpFAlraDtPht4Fbora
         u5M//nJD6z80ASVvjqMqw/wKn7wIC7JHoIcv+fBizPlzN301+XCKkRX3IfatMnwaFmZ+
         gYbhOz139D8OYe4uPT3E6InEUo5vo27wi6Ar4E5V0cnvbaQH1aLSb9AnaIHCSRf9swbB
         RKpzg6MjmTper+2LZZLPW5mtDybZ7yQTT5U0UHTi0Pyj75IcPvjOkds1p0P+52MkDUAd
         R89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477212; x=1686069212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+U4GjOOXIuHe0ADXuXgNiHHjyw+TBdbEMalD4w3rS2I=;
        b=iFSol1RzjteN894PDLN8arnWzZhmbIrRRpkI2twYSDNAfAe8GE9RTOfE8FoW8VllhY
         Lmk31smv0wDEm7Z+Ig5SgwXaIaZ+IHF+8V7DaXOpGZCRtiOdDkMbuJDvhyOyn92uY53l
         LSOq+b8RNtC0Aa8JDC3PX5w8vpHcCH9EB4HNu/e0k0o2aD98CXjn7RsdVa1SFjHKKDE4
         Hkoub/l6lBT5l/WZdsHFD7MN2Ol+AoWqHCyvgg/gqsfMzXZXYHHAaxqo4XympP22nJmK
         RodcWC1uXpYnPc+tHq8AJjmXwx5VPRo9zL6RKnNjzHHocdQFsoYdDjlJoCXTSJ3xA2rb
         jaew==
X-Gm-Message-State: AC+VfDy+bhjmS/MLGGHFV/3wdstGdJVfTVrK0FcM7lD7IiSLQaCShABz
	0Xmt+Iuwp1ROeMkxQvmfB8OZkf5uZIw=
X-Google-Smtp-Source: ACHHUZ4xsqLLVVOFhcvFUuKR69AP4Z3fcORlreNIwUmvTg6Db1tOrrI+dZndXSNF0EcQBIUqlVdlLw==
X-Received: by 2002:a81:4885:0:b0:55a:4a73:6177 with SMTP id v127-20020a814885000000b0055a4a736177mr8274148ywa.42.1683477212548;
        Sun, 07 May 2023 09:33:32 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 24/29] mosh: Point SRC_URI to https://mosh.org/
Date: Sun,  7 May 2023 12:33:00 -0400
Message-Id: <20230507163305.3261044-24-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102354

From: Khem Raj <raj.khem@gmail.com>

mosh.mit.edu does not have the tarballs anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d4be801b86229123809ea9fb6829d3f7df83f6bb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
index 4537a09412..2869e06336 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter"
 
-SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
+SRC_URI = "https://mosh.org/${BP}.tar.gz"
 SRC_URI[sha256sum] = "872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1465ddd"
 
 inherit autotools pkgconfig
-- 
2.25.1


