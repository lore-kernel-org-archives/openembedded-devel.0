Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BDFC4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 16:10:07 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.20669.1701533406752270224
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Dec 2023 08:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bjXei0sY;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6cdfcef5f8aso1395054b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Dec 2023 08:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701533406; x=1702138206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vBUDrWaesZbSqtoE4yKAt9V+5mqRoG7SRlj5js9UFU=;
        b=bjXei0sY9/Ri2t1hQ1WrqYX0nYF8T9k1kq4eIdmmhM4MbfsoetT/P94UdHaKpZsPnF
         egopLKrWsDzAWC3NiqRhbr4wQX9V6aCQtr54qHfFdf0n7a6hCYxPfKl1U2YZX8KqX95t
         WOm1p2ABmjDJeULBVS561dJEZswZycQlgwy0QWX3MRZY7NzNnof1qX2O4hgo+Zzb7MSg
         X7+v1Kb9Sr6jxQqCGVtGIboIp2cHR5jeIw9HftITQofhSdpA5mfyijP89MSwLbj8Olay
         FumugRfLe/qNftlQlIHzUorCTOubu/PwW8tN/h9xGpvCzCz/lZMhmyKrKXNsV9onRv6c
         2SxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701533406; x=1702138206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vBUDrWaesZbSqtoE4yKAt9V+5mqRoG7SRlj5js9UFU=;
        b=P5cP3r8JnmkecD6mIvY3AQ8wAXcq2h6371OiPJf6H8qd0hvIB3/ds/+UXyYMtyeXdj
         kIBEwAkUEKRQ+eSYu8YNW5ZwYYqrI7Ro0cE+3X7F5wZLpDOyDwp9icU8mxqAX/ZXO+cm
         +GohV9L4x2mIgvwe0FUdT7IpQl/4Ht4bKNytCgIGNMaXETTuAeSrC49mlMsRvOwn7Z5c
         HOQ/+IdZXVVEDJaW7RvXJjl9XLPpg7OG6ew1A77Z+9XpaMQFSouZJD5t6teVj2Kx6fGs
         kuaS/fKDTQqSS0Kj+UlE6gZkZog2lMqaPeaxeeeaYejr9lqwONM6qmO0uMH/atf5hrYS
         GH2g==
X-Gm-Message-State: AOJu0YxXzPkYELPLyzForfJNAambB6vc3McNy/aczQanpxJLLGC8D9Ff
	SkhQBoqXSjE8QTe2qweq3HaeElg3LD4=
X-Google-Smtp-Source: AGHT+IFNW5Qyuu6hwJZ9UK6df5uF98s9mrHYxAqzyUIsIE4qH7cRkgG8cWlvqrePbchE46Ch0rkaSA==
X-Received: by 2002:a17:902:bd46:b0:1cc:1efb:1bab with SMTP id b6-20020a170902bd4600b001cc1efb1babmr374065plx.38.1701533405641;
        Sat, 02 Dec 2023 08:10:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b001cfb6a814a6sm5357089pls.0.2023.12.02.08.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 08:10:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] liblognorm:Add asprintf to autoconf function check macro
Date: Sat,  2 Dec 2023 08:10:02 -0800
Message-ID: <20231202161002.1885939-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Dec 2023 16:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107197

Fix build error found with clang-17

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ntf-to-autoconf-function-check-macro.patch | 28 +++++++++++++++++++
 .../liblognorm/liblognorm_2.0.6.bb            |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/liblognorm/liblognorm/0001-Add-asprintf-to-autoconf-function-check-macro.patch

diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm/0001-Add-asprintf-to-autoconf-function-check-macro.patch b/meta-oe/recipes-extended/liblognorm/liblognorm/0001-Add-asprintf-to-autoconf-function-check-macro.patch
new file mode 100644
index 0000000000..abb09bc648
--- /dev/null
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm/0001-Add-asprintf-to-autoconf-function-check-macro.patch
@@ -0,0 +1,28 @@
+From b8c65236cd6cd68b57004479006c683455680a82 Mon Sep 17 00:00:00 2001
+From: Alfred Wingate <parona@protonmail.com>
+Date: Sun, 15 Oct 2023 12:34:52 +0100
+Subject: [PATCH] Add asprintf to autoconf function check macro
+
+Upstream-Status: Submitted [https://github.com/rsyslog/liblognorm/pull/376]
+Signed-off-by: Alfred Wingate <parona@protonmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b6f92f1..b057550 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,7 +55,7 @@ AC_TYPE_SIZE_T
+ AC_FUNC_SELECT_ARGTYPES
+ AC_TYPE_SIGNAL
+ AC_FUNC_STRERROR_R
+-AC_CHECK_FUNCS([strdup strndup strtok_r])
++AC_CHECK_FUNCS([asprintf strdup strndup strtok_r])
+ 
+ LIBLOGNORM_CFLAGS="-I\$(top_srcdir)/src"
+ LIBLOGNORM_LIBS="\$(top_builddir)/src/liblognorm.la"
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
index f9196af92d..0cc128c8c4 100644
--- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ca016db57e008528dace002188c73dad"
 
 DEPENDS = "libfastjson libestr"
 
-SRC_URI = "git://github.com/rsyslog/liblognorm;branch=master;protocol=https"
+SRC_URI = "git://github.com/rsyslog/liblognorm;branch=master;protocol=https \
+           file://0001-Add-asprintf-to-autoconf-function-check-macro.patch \
+           "
 SRCREV = "46c6ee4c8e5f827893e485a4ef1aff04ea881273"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


