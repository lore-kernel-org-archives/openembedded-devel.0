Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44F1C282D0
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 09:33:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7484.1741339990457275012
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 01:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mXHpLab9;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: awais.belal@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39133f709f5so244338f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 01:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741339988; x=1741944788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8vfpxFkezYUUFvA5ZhcXasknv8pe6axopT46gywiiE=;
        b=mXHpLab94FVwkllX2DmQ5naW9jMZ9I8G1ytAkRy6raPKWWGYEoEDYVfC+BEncRpGl0
         b5j77rjdk7y05ND/AuiosurB097+GJSEDSRoKmzELDPPtbgwpSYizWXcXHiaDvSCqp96
         lHVaNoUYv83vUutmTN4UFwUYXOpUYCUUdAjAYZR5KxVchPCcunbv8demNkWposyhc7PV
         skVwYQDTAB4bVGysOGAdLLGXEmHP1krgSSngb1ioNbsk8Mohk+PsfKgnNIdpSVy6s3vX
         Vr2M0kfo751sHsz2e56lyMyVCmEAwMW6gkFI22RcP5XlTZyYXdaI7dupnJAwmvU3WaYE
         0cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339988; x=1741944788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8vfpxFkezYUUFvA5ZhcXasknv8pe6axopT46gywiiE=;
        b=XP9GyYS0aBtjTI5gE3URb4hz20mmsnhiWlAuUlN7SLPs6qO5oF3eoccrpgbukjsMrm
         YQMG5btlIgqrQuqp+w9Uhzir9vAFaEqz8rdeWMSmwNE5Xz/ZqI3GBUjHLMdbniVrmMRN
         RDeOt7v4NVG0OA/N7ovDkN5pT3lXvcwLCVWDE3W0MGznKNb9R0P1BH93w60ZTBxbVdy8
         swcjK4sNCtLsEDkmQ4MKo74lpurHsffh5i/8ev3KxzVfDJ9zLyHL3DaWrQpNYKRGS+gx
         5xFDIyoZ9tEumRZIsy+83OeKcNiiLLELBcxEbnPaSz0GFbc8aheOHiH8faz6RIHy78a2
         rVWQ==
X-Gm-Message-State: AOJu0YxUKch7u9XJ9eqt/6t62wDbDU+7TAkuQRh/SbB5Qh14RmdobxUN
	g8sQAUM3O9bVeDhUqgWl9vOfjJVsckuKNUOf6hE7R8vAONr3QttKFz3R9Q==
X-Gm-Gg: ASbGncv/E+77HG78Uq6NG+SnJLzm68KK01FUCRrYTeElS3N1SFlGvW+5MPiz4we4Ypu
	1cmV+hfDZ2gW2JGgcmxP7ZaDdMHumGV8bNnt2FfKKp0taFmHFLr0P5KkllMFkwwan0OUePAodWN
	fTpWOnqhs8md+mg1Gold0XLZxr05rn9xCmchcMsdrBO3doMhCog0nIfdVt0K25rYNdg8cmWQXYU
	HRDlQZZJ2XWh6n5RUX/RWJ3v670imFqpPnMHBlXguWzeTjwTQScII1GTRV5Kt9QcDBuaiBVGwUP
	kWmv86B/9SjoFko0A30sPtzMQAUyS5pXG8UH9LZTugq1tvo=
X-Google-Smtp-Source: AGHT+IFps5FfhMz5ojv1pHeTPyWa0fZ+lA7L/i7tAn82rSf+5Ke2DmAuekUiq4QpvitOEo7ps2rQqA==
X-Received: by 2002:a05:6000:1a86:b0:391:952:c747 with SMTP id ffacd0b85a97d-39132d16fe7mr1387740f8f.7.1741339988382;
        Fri, 07 Mar 2025 01:33:08 -0800 (PST)
Received: from elitebook.. ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01952dsm4668359f8f.45.2025.03.07.01.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:33:07 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Awais Belal <awais.belal@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
Date: Fri,  7 Mar 2025 14:32:55 +0500
Message-Id: <20250307093255.1110778-2-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307093255.1110778-1-awais.belal@gmail.com>
References: <20250307093255.1110778-1-awais.belal@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 09:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115781

Move on to 4.4.29 and drop a patch that is not applicable anymore.

Signed-off-by: Awais Belal <awais.belal@gmail.com>
---
 ...001-free_mon-Include-missing-cstdint.patch | 28 -------------------
 .../recipes-dbs/mongodb/mongodb_git.bb        |  7 ++---
 2 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
deleted file mode 100644
index 8cee14889f..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5d8218b8a1b5bc71e2a0cf543a000e194daba599 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 29 Jan 2023 17:15:30 -0800
-Subject: [PATCH] free_mon: Include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no
-longer transitively included [1]. Explicitly include it
-for uintXX_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- src/mongo/db/free_mon/free_mon_options.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/src/mongo/db/free_mon/free_mon_options.h
-+++ b/src/mongo/db/free_mon/free_mon_options.h
-@@ -29,6 +29,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index f7fd881713..5d904dd4f9 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.24"
-#v4.4.24
-SRCREV = "0b86b9b7b42ad9970c5f818c527dd86c0634243a"
+PV = "4.4.29"
+#v4.4.29
+SRCREV = "89d6ffe6fc67b36fd47aff6425087003966588e3"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
@@ -32,7 +32,6 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch \
            file://0001-server-Adjust-the-cache-alignment-assumptions.patch \
            file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
-           file://0001-free_mon-Include-missing-cstdint.patch \
            file://0001-apply-msvc-workaround-for-clang-16.patch \
            file://0001-Fix-type-mismatch-on-32bit-arches.patch \
            file://0001-Fix-build-on-32bit.patch \
-- 
2.34.1


