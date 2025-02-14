Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713A9C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 06:21:47 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.15456.1739514101028124591
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 22:21:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j315rijw;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220c92c857aso26775555ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 22:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739514100; x=1740118900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLVMh1+ApnbirTqUf+m/5nB8iwHo+U58yXOUtZu7jEk=;
        b=j315rijwICaG6CCf7MczxytOT3XbS5PGbPLFl88b8SnasN+qFoeB2Eb0KoSkmYk7Hm
         8M/eOc4IaHoThOP3ohRFWHzNKfr585cJOE2R//ASYwKa2cs2YGSMQM84+0jK9z7ExelH
         U4vEQbgjXu7Efaxll5tNVvcqj2luY/PkdFKwkgvHfIP2JKkJpf7rPys3k9FT7EmP+JO6
         c02r573ycparSGY97p86uBF1dAv4i/ZQ7i7AIeJlWXivz/4bpfx8Axikp9ge54Ft71Ik
         OYkh23cPBNQtOLgI7UTJ/q/M2X4TYo/bftfV0Ra80bFU0uV+Z3yXIeUOYJopfQm4h5C5
         Kscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739514100; x=1740118900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLVMh1+ApnbirTqUf+m/5nB8iwHo+U58yXOUtZu7jEk=;
        b=XNyQJvRMVy6fbLvLpGnG/oOTqx+hvdVli2MwUV9ySHAKlPcwoRQP1q0NHOb6vGBYIP
         aoSAGcpdMCYiN+HsWhuX/wOKSgxnPoTKQpSJsjE54Jy5JQNefkofGHYZGaOpzpTs9RKX
         /m8dI/muSfTPdfhEYWpWDlYG+TCBWnTdLacbYWOE7IHEtoLJL31Hck7vMtY3f2fehCHx
         e1+ZhjAI56gxApqphq+dytZEndMAUKwhWlmkFYO1n13+6oIVVP7L8yRKCcZ7EprnB8um
         eH4IaoQUQ3jjEEM7dRi+95Bx7XzgNCiozUm56wQSEfN7SFgHIr+8KRu74XY4J4GojJTf
         e4Rg==
X-Gm-Message-State: AOJu0YzTOABgPwIBvdeSAdp+vZFIppKcApcQEcXruxojfmhTcgKWdFjq
	HxsPGc4qFnZTfj85+m8ai1bl8JKz8YjwXuIalVUfVXiUqn71BH+j4fPbWfI3
X-Gm-Gg: ASbGncvF9N1Pi+gGmCnqzWizQvdfmdBBUMnv42GUi+t3E05QSWdfvIEluqxqykPAVk4
	GU7ZzmRKqd2vlBZP1WmbheDPjbrM190h98E1JaUNCz0nnIDRYR0SYutAV7vUzS2OAdHhM66k5We
	kmnblOmfgibC+UIl2luQX1NnC8WS3qHRRAKY7gHh6hjAtke76eWc/PH89ola4s0Yn265bAcaTPA
	wQDo8kAFylCaxsoUFW0SOgoO2f4CrqpHIKWiXpnO5OVUhMJ3tpegBKFcQFaW+wes9nAXxcCMPvr
	3PudJlc=
X-Google-Smtp-Source: AGHT+IHNyNkUH08ryxTO4/hQEX9rYt/qXLfla8wGNob67jqC4OAtsnA974fwfAhAtwm/oURFl2kdEA==
X-Received: by 2002:a17:903:94b:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-220d36d40b3mr82522635ad.7.1739514099377;
        Thu, 13 Feb 2025 22:21:39 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::b976])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5367e97sm22205705ad.61.2025.02.13.22.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 22:21:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH] can-utils: Fix build regression on musl
Date: Thu, 13 Feb 2025 22:21:37 -0800
Message-ID: <20250214062137.1598925-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 06:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115475

This got introduced with 2025.01 upgrade on musl systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Cc: Mark Jonas <mark.jonas@de.bosch.com>
---
 ...ime.h-for-timespec-struct-definition.patch | 28 +++++++++++++++++++
 .../socketcan/can-utils_2025.01.bb            |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch
new file mode 100644
index 0000000000..91b9dd3c4e
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch
@@ -0,0 +1,28 @@
+From 4363ef59cc9f2169455f56453759d4a4d9b89a5f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Feb 2025 22:14:47 -0800
+Subject: [PATCH] Include time.h for timespec struct definition
+
+Fixes
+git/isobusfs/../libj1939.h:33:18: error: field has incomplete type 'struct timespec'
+   33 |         struct timespec next_send_time;
+      |                         ^
+
+Upstream-Status: Submitted [https://github.com/linux-can/can-utils/pull/579]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libj1939.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libj1939.h b/libj1939.h
+index 44393a2..7c19f43 100644
+--- a/libj1939.h
++++ b/libj1939.h
+@@ -17,6 +17,7 @@
+ #include <linux/can/j1939.h>
+ #include <stdbool.h>
+ #include <stdint.h>
++#include <time.h>
+ #include <sys/socket.h>
+ 
+ #ifndef J1939_LIB_H
diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index 932aa1de20..d4ee34167d 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61
 
 DEPENDS = "libsocketcan"
 
-SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master \
+           file://0001-Include-time.h-for-timespec-struct-definition.patch"
 
 SRCREV = "01083a64ebf28cc716efe2d2fd51c141042ae34b"
 

