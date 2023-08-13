Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7C2C001B0
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 15:26:57 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.86998.1691940416199093725
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Aug 2023 08:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=h6qQw4mB;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99d937b83efso136766266b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Aug 2023 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691940414; x=1692545214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZH08Y7ayf9hs4dXOIjNaCPcPKjDFIsginUe1pUuzHA=;
        b=h6qQw4mBsYqukng26+TqruB4ahr4uRaVLR8EbbUy6EwwxNzjy7LEoupBeBEzNoAZos
         Q/MomMboMUY6zlxuH1NqlnasVX7lcqt5nIvEAW4Md42E78YzD7ntliya4KvYhk/VROUE
         Vd0GqwU3xQC2H6VCgj4rwRj4dAWbpgOFgziUHIEw0HCXpoGuDzby/WUXkB4YWhEdvyQW
         /Wfjr2QAI2pJDMG0WqslO6KZf5C+gCpIeEhNVVJj8rSq2TPcvYKXOj35nNYK3ATjMR0A
         89tOzvVOREaGPqhutEXQragQ4A1xBrmkq89uskvranoeYmw3H6jz8zXnVcKMTu7XRfDU
         pKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691940414; x=1692545214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZH08Y7ayf9hs4dXOIjNaCPcPKjDFIsginUe1pUuzHA=;
        b=Z2VHo7fuBXjWqMjW0QVzWV0c5FT99keWCKydjCC46px8WoVcviQPgftK/JYuACOwFU
         c7r1L0Y49bK2FmpENQrCqLpGsfdLAKIKjpasLv8ms2emHFA52FWAHcTbmnBz+E80gz2j
         g/w3ttJB5ojdtNKPIlgODvXfRqnx1LyQByE1pu8erFWqb48agAMdBBOcHVW3C3ckAGCv
         fFsdiARmbCNPalPJOsxJpllSTRhG0Wp4QqkJvuH7Pks06+9BhVc9LJAAHJLmY3CNtMVz
         AgYsgXO/qZii0D/p+YniNkC8A2OmtJ6d+npVRLojQNRqzNKXDzRRg6xZpmrVEAJcvfQA
         i35A==
X-Gm-Message-State: AOJu0YxTO1Ky+NGJrT0f3pwToXhF+QvLk6Mky01gqJhR+wIOzIYN/zc0
	tGlttKWUgZjMZA827/qiEhJwtJDOxdU=
X-Google-Smtp-Source: AGHT+IEhroRnp0Rt/TyutiL4b+7U6U+PjjSlrB89F8gYa9mirXleKbNyezvyaRNzIL8jyO3sAl/DWQ==
X-Received: by 2002:a17:907:75d7:b0:99c:bcbc:bd86 with SMTP id jl23-20020a17090775d700b0099cbcbcbd86mr5897622ejc.16.1691940414437;
        Sun, 13 Aug 2023 08:26:54 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n5-20020a1709061d0500b0099cf9bf4c98sm4671009ejh.8.2023.08.13.08.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 08:26:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] openh264: fix installed-vs-shared QA issue with multilib
Date: Sun, 13 Aug 2023 17:26:45 +0200
Message-ID: <20230813152645.8947-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Aug 2023 15:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104346

* in some cases libdir is /usr/lib64 and then libraries installed in /usr/lib aren't packaged:
ERROR: QA Issue: openh264: Files/directories were installed but not shipped in any package:
  /usr/lib/libopenh264.a
  /usr/lib/libopenh264.so.2.1.1
  /usr/lib/libopenh264.so
  /usr/lib/libopenh264.so.6
  /usr/lib/pkgconfig
  /usr/lib/pkgconfig/openh264.pc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
openh264: 6 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
index 3fa87d05f5..89b1ea58c5 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
@@ -45,7 +45,7 @@ do_compile() {
 }
 
 do_install() {
-    oe_runmake install DESTDIR=${D} PREFIX=${prefix}
+    oe_runmake install DESTDIR=${D} PREFIX=${prefix} LIBDIR_NAME=${baselib} SHAREDLIB_DIR=${libdir}
 }
 
 CLEANBROKEN = "1"
-- 
2.41.0


