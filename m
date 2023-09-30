Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E9FE748ED
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 22:14:36 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.50116.1696112070120884720
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Sep 2023 15:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iu9j96ea;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6934202b8bdso4086539b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 15:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696112069; x=1696716869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PzW8gZkIEnGMY4wPs2AeeeaxG2KP6ZK89aR2dYkOV8=;
        b=iu9j96ea5/nmeugxI7aHe6pRTPx2j41eKYOeZbrubPskCoH081K6Hm5oVZMrN5cAey
         Z9pqiAcNevsDtgKzz6Kyvf8c7UXuFrm+cTQ9NqXjRAEHOMRZ06xd7fjQU29XSo7HAmth
         41ydy9/o6CmcVFv7jc82gFshQHncZ2n0eOtLN8It+9/O9zRKUud1fkrGCpc+D3tguvah
         wPDw7BVcgTlbOjCyWDzLOfReXa8pzPOIFNkIgmGUW0XWzbYiZMW1rQULMmq2zNcjvqK5
         qYO2uS65IsHy/fRHY8CQAGauwJ0GpIU0sBr51G9rcM0cvQl9y+SXg1r6u0pcYt2t/6+B
         pQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696112069; x=1696716869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PzW8gZkIEnGMY4wPs2AeeeaxG2KP6ZK89aR2dYkOV8=;
        b=h+Ql2ijnQVVs1+xr3qbWxg1M1mYIgZyVl5fC64Y7NZ8QnjIfDyu1q/CRZSD2j7ahlW
         8hpau+g1j2v7+dTOUQO8KN/MIK9W91ZHhy7Zgi//0W6r7AAUdBs9rC1iOztJ4cPht0uR
         JQCVrgtW1LThwbE28zuQ3cyk381cbc3r/EYz9GERpZRhFtUGyCEcwu1mP2x6WOkN0wgn
         GEIK3wJuCVPAtKwSdNL0yWCAv7I/cAWg04cyNCK8iNKW/o3G7xzkQcNf5BH5Oc93AQnr
         d4EwhrbND8gmO4ull04ejS6y6vkfvbfQNLWP1tjuuSa1LOK83wbD84dA33o82Nx5hvXZ
         ANFg==
X-Gm-Message-State: AOJu0YxHYYfTJ6kTnFZ+qepKf+ES9iExpXwSBTIhvF8Ys/iiifTusRQP
	mL2QsgpKdPk8QJ8lQK3q0f6B4NRAvnJgiw==
X-Google-Smtp-Source: AGHT+IFrv9Kkz0KCA6v72du9JBPbZYJoDlL0booxnBGDjlCsYNyVOX8dCQ+hxhw6l/CxScFNBok+7Q==
X-Received: by 2002:a05:6a00:2350:b0:68e:265d:c2b5 with SMTP id j16-20020a056a00235000b0068e265dc2b5mr9009439pfj.29.1696112069205;
        Sat, 30 Sep 2023 15:14:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id v1-20020a62a501000000b0068be4ce33easm8469411pfm.96.2023.09.30.15.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 15:14:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libnfs: Drop -Wno-implicit-function-declaration
Date: Sat, 30 Sep 2023 15:14:25 -0700
Message-ID: <20230930221426.347516-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 22:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105285

clang builds work without this Workaround

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
index a025189b82..afec2753cb 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
@@ -15,6 +15,3 @@ inherit cmake
 do_install:append() {
 	rm -f ${D}${libdir}/cmake/libnfs/libnfs-config.cmake
 }
-
-# Workaround for clang
-CFLAGS += "-Wno-implicit-function-declaration"
-- 
2.42.0


