Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAFEC021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 05:43:57 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.13503.1739857428085557874
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 21:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l7UADNV7;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fc291f7ddbso5760665a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 21:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739857427; x=1740462227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxxRqa3o2OAx2IyWmEw5F+azckWBtMbXEdzxryLEcHk=;
        b=l7UADNV7d+S7sK0nCshl7hyZAYTVCFpFOZuUxJJ5P2AckzJDP3kmxfxyGCemEHpsKC
         JWeAw6DDIMkO7rZDtXTIiOehWzbe8a4zvgpvYR8J/lhcmCtnpavuSQoWnfsiKbNIrtzV
         by7T//J1Osgs1/rWyrc4Huj6opjMTkQamAd2oksynKOJqrVcdOJuRvWRjnGBiSoYC741
         QSGM7Wx+tSoxeMT2xyH0rDBJKjXF9UCLAY9ZNtTHTbECUGd1cfFzpZ0aYdHu8117Stkn
         lZHFwNmQQRoe2Q8Woq7ch36FMKXdW4n0jVHkM1ov4v93tzkWaCC4asfmwjzqGy04yyzD
         QBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739857427; x=1740462227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxxRqa3o2OAx2IyWmEw5F+azckWBtMbXEdzxryLEcHk=;
        b=kC5hqxl4f5SKC4Ta+TZAwCKctCi76ni3fTC00zHcD0WoHIPoUE7KV1r6Z9wZ9YtiZY
         VRBcNNyWktEoh6eC7C4c6Ff82d+0iRTHnjPxBqSl7IAjNsBYg68NTvNA8Ema+XNrQrmu
         CyH58dQNz+UtT0/S40iPd2gw8YhEttVjr/pGb2BtDDYLl0smjJS49MsfBtmLMaXC3cjI
         X+r5aFDfZL+vjtgffJJY/YhjuLEIBck8il5jr3kCzk/hY86DmOU3OucWVTwhP8ZzrLUu
         mR9w+jRJnig4DrdxfOh6Fsri+sF0PVuBGbcrJ9vyDVTI7EXhzc0bxESyLHkMU83u5vI5
         AKUQ==
X-Gm-Message-State: AOJu0YxCDP/kgHLzvAfGInZCRjD6g6LIc2FkQeZobZoyKrYrrzTDzBej
	YOXPVDkrr/dvLlmq99uSBnEniaPhuxjInUtfzXFdxmNNg1ra79rIOUzX4wEV
X-Gm-Gg: ASbGncsIqvsSYzPe7Kq0s1GpriAtDKhxY1+qEAXuAr03uLyEZ769YbpV4SIdDEMkNfP
	nN9forowhILnmv64ziFOGbwOLxoSja3jV5T6OjIVIhPkzTBtYBBD4yweyxlBzcRE1q9S/z/eilW
	G64WnXYhH3/aVpS/nNtboUrceMWrZgPmQATOREkSKjZDnmbcGoXOseU4JTMc3y/SfKE2xs7Bhh2
	Ahl0RQXpp3j+yD7fwv0ry4ydaou3ilx5F31/SkcaNt8cp/X4ADSXY7DDfwyMourMQytBPTAYLHa
	aOveGqk=
X-Google-Smtp-Source: AGHT+IHV5zbFqV1CYm3Ex8mNRsxfpcww1f92gha6Y5vkK/2nSfg/RjO4/oMMjaC7rHR3mIO6jY2wUA==
X-Received: by 2002:a05:6a00:3cc1:b0:72d:8af9:bc64 with SMTP id d2e1a72fcca58-732617b77abmr17945688b3a.9.1739857427156;
        Mon, 17 Feb 2025 21:43:47 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::dd76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73285a7bfbfsm2276217b3a.154.2025.02.17.21.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 21:43:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] multipath-tools: Fix build with latest musl
Date: Mon, 17 Feb 2025 21:43:42 -0800
Message-ID: <20250218054344.2476688-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218054344.2476688-1-raj.khem@gmail.com>
References: <20250218054344.2476688-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Feb 2025 05:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115517

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...uxsock.c-Include-string.h-for-memcpy.patch | 28 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.11.0.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch b/meta-oe/recipes-support/multipath-tools/files/0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch
new file mode 100644
index 0000000000..128a0c4d8d
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch
@@ -0,0 +1,28 @@
+From 1d444772db14f4acb8d47b874462b0cc171ab672 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Feb 2025 12:01:59 -0800
+Subject: [PATCH] libmpathutils/uxsock.c: Include string.h for memcpy
+
+Fixes
+uxsock.c:72:2: error: call to undeclared library function 'memcpy' with type 'void *(void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+
+Upstream-Status: Submitted [https://lore.kernel.org/dm-devel/20250217200503.4166910-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Benjamin Marzinski <bmarzins@redhat.com>
+Cc: Martin Wilck <mwilck@suse.com>
+---
+ libmpathutil/uxsock.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libmpathutil/uxsock.c b/libmpathutil/uxsock.c
+index 2135476d..a474874e 100644
+--- a/libmpathutil/uxsock.c
++++ b/libmpathutil/uxsock.c
+@@ -8,6 +8,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <stdarg.h>
++#include <string.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.0.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.0.bb
index 9f95361063..67e293dac2 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.0.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.0.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=ma
            file://0010-Always-use-devmapper.patch \
            file://0011-fix-bug-of-do_compile-and-do_install.patch \
            file://0012-add-explicit-dependency-on-libraries.patch \
+           file://0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ec28527f3d544b51ceb0e1907d0bf3f"

