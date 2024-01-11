Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FF8C4707B
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 00:27:17 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.336.1704932833117085499
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 16:27:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JZcrDGww;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6daf9d5f111so3354107b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 16:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704932832; x=1705537632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nU2j2RPI8LlWGN+LJqYMeDaINcanx4fqFgWK0By/NMc=;
        b=JZcrDGww6NiOd1JtYZGHo+5QV55hmNICJaiuLOVsyDMW0/pf5siLlnqllj2zb1BGbp
         TUncOxo8XsuHXUBgjJzhXNTWIhHLSeCmTSMdRPXcIC8vxz/969RqDdJTXeEISgz/5vIp
         jVmIEPkCvjQuWF2J6nBLswKwqkfEHgZk5HNsz/89gOLtWX4JvyH9OoeRIKwiO6C05e0z
         Q1ZAADi2K25wnNRoaMmxG1TxQOGeAG2PQZrvsh0VoWMKoKHVIearzNxnEy1zmP4MuYQB
         yd/HXcslOGEf3ZT9T9j6hgxIIap4VbNZj2WXnAfZ+tv69Ye4KfQQVHdmcfx2dqJQHhQy
         E4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704932832; x=1705537632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nU2j2RPI8LlWGN+LJqYMeDaINcanx4fqFgWK0By/NMc=;
        b=aIJ3XByUhPARQVZdcUC/ycRBEZsjz5Lbb9JwHDlu4tU186GoZsJd8jYX03JHUcfWRF
         BIVirMuwbrVg3lsJzqHSRpozLCQ2HGAIEpOOuksEdMAEUShxxX8gAyLelglCYQu5Hd68
         gpcALvhjDGiyNW2iUKNTMb5nGTbHEt6mXfVVJEf6eFpxJ3ZW9jlmvu83faFTZA54Vbih
         0Z2j6VVUl/mNzfiiV09/GQZBacw5cbBNI0VeVhnojhoV4SOboDlGTO4C1OyS2FUb/4b9
         iWE9LOJAbqBuLIyLXZN/2QsmQkzHGb4o5MMapuf4oYHI8aFSzRBcPR5O6sULo9InW85w
         Wbtw==
X-Gm-Message-State: AOJu0YxyoDmhtPx/FBlEXd3ESKOT84zS9/9AnkeF/Wo+nBn4BKRKrDmB
	zkGSIvOsauPqokyGLyiYkySKL47LlZnr/Q==
X-Google-Smtp-Source: AGHT+IG1Ia+h2EYv/YZ0mK9wDHUnLfM3jheg9M4xpVO0+beuIgbo/qUeJsRgNacgQ5hrW1pCGAl7PQ==
X-Received: by 2002:a05:6a00:8d86:b0:6d9:b7ef:466c with SMTP id im6-20020a056a008d8600b006d9b7ef466cmr438544pfb.67.1704932832216;
        Wed, 10 Jan 2024 16:27:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3c3a])
        by smtp.gmail.com with ESMTPSA id g17-20020aa78751000000b006d9fd64fdcasm4081000pfo.37.2024.01.10.16.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 16:27:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] kernel-selftest: remove Wno-alloc-size-larger-than from scripts/Makefile.extrawarn
Date: Wed, 10 Jan 2024 16:27:09 -0800
Message-ID: <20240111002709.575122-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 00:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108220

6.6+ kernel has the warning options moved to dedicated include file
under scripts called Makefile.extrawarn, therefore search for this
file as well to remove this unrecognized option by clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 291a83aaad..6c97e28545 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -93,6 +93,7 @@ either install it and add it to HOSTTOOLS, or add clang-native from meta-clang t
     sed -i -e 's|^all: docs|all:|' ${S}/tools/testing/selftests/bpf/Makefile
     sed -i -e '/mrecord-mcount/d' ${S}/Makefile
     sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/Makefile
+    sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/scripts/Makefile.*
     for i in ${TEST_LIST}
     do
         oe_runmake -C ${S}/tools/testing/selftests/${i}
-- 
2.43.0


