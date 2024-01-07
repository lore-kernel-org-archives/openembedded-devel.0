Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE60C47077
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 05:09:39 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.10337.1704604178470892283
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jan 2024 21:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m/NLy1Ff;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7bc32b04dc9so35591539f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jan 2024 21:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704604177; x=1705208977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K64ameQxCvuDBi9OIhhrldyTPteqJQhcKZfSbhcdbRw=;
        b=m/NLy1FfMrbFDyd9gQaxJEiTDZUA+j49CeM2wnWUaJeDYcc6Jgq+QYf5qCqLm6hy5q
         eW0rNIKh2Yx7BpCrP6STBGwWaH8pT8/uRSLW9q9BknlWJCecF99u8IQLpMvWjP+zpkqw
         f1P14zoKpciKpAenhYUNRUEvgSKPraYnacCvhHqUYWTuhOFxR3Ch1It6QwHJ+bJKh9ZO
         7k4vvPcyf7bDA5aQV4zpbnaVS51Qxi7QsIuCFbq/29+kW5noBuG05fVpAZ9TN75H4ZXJ
         vvOcnpI0Y+7ty3fGGN7bYmuX/Shu9yWZD/x6d0GYFQk9iLh81xF9h4SODNoIvOzmhWiS
         SsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704604177; x=1705208977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K64ameQxCvuDBi9OIhhrldyTPteqJQhcKZfSbhcdbRw=;
        b=ATgW6SRHbseNjXImSOnpyhZqxHBNymDyUA5GUTICpw0UlC959ycOMjmLWYbNtLTQAh
         +80gLppYg+dorweTkc4IHu5dAq/z0JFQey9rr60Kv6rInW1xzB4BM6iACLOhOF9DhqEW
         XHsls8BUYnN82kXKK3xZLtWzUsU3En9aKDTVDUVRyTH2eM17+OsefOQHUI2tnoEMxZ8j
         ocofKXe0ivYzDnB7BUkTwF5P7pbjbpfDMdyzTosPebdN44K7qzuYHeoH/yONdv18HDSS
         L2k9AyfzXijLmESscsqA0RoafK8x2jIMpnQ26x6rQYnAyRO9SGihc+LAMVTUU6k3kU4a
         3jeg==
X-Gm-Message-State: AOJu0YyXhHR8auVobghvNNBWGvdd95MW8Oj1IsIkCHMv68NdmQYdg/Bi
	HvU/nx0iKnxAjRRDYmlY88EUKCC7Png=
X-Google-Smtp-Source: AGHT+IEv9FE0tU1VLXkSMFU7DSORMXlK8oZY95RlWcR/oaOaGK2uKpvRFpypzTRWgsTOywuPSdXgcw==
X-Received: by 2002:a6b:7404:0:b0:7bb:af7d:6264 with SMTP id s4-20020a6b7404000000b007bbaf7d6264mr2254053iog.28.1704604177335;
        Sat, 06 Jan 2024 21:09:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id y127-20020a636485000000b005b529d633b7sm3729184pgb.14.2024.01.06.21.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 21:09:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pydantic-core: Rename the cpython module on musl
Date: Sat,  6 Jan 2024 21:09:34 -0800
Message-ID: <20240107050934.2399534-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 05:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108067

wheel contains site-package .so named linux-musl which is not loadable
on musl systems, rename it to linux-gnu even on musl like other python
dynamic modules.

This fixed ptest runs for both pydantic-core and pydantic recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pydantic-core_2.14.6.bb            | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb
index 601ba25b60..e58ee7fd66 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb
@@ -34,6 +34,17 @@ RDEPENDS:${PN}-ptest += "\
     python3-unittest-automake-output \
 "
 
+do_install:append() {
+    for f in ${D}/${libdir}/${PYTHON_DIR}/site-packages/pydantic_core/_pydantic_core.*.so
+    do
+        fname=`basename $f`
+        lname=`echo $fname | sed 's/musl/gnu/'`
+        if [ "$fname" != "$lname" ]; then
+            mv $f ${D}/${libdir}/${PYTHON_DIR}/site-packages/pydantic_core/$lname
+        fi
+    done
+}
+
 do_install_ptest() {
     cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
     rm -rf ${D}${PTEST_PATH}/tests/benchmarks
-- 
2.43.0


