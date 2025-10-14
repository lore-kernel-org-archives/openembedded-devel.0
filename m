Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C816CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:48:16 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.187.1760474889406737385
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IboxNiR0;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f1f29a551so7411934b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760474888; x=1761079688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kFUAGtw9M1nC2Nm8N68so3/2sAQUOLwHhZ10m+9iZ+I=;
        b=IboxNiR0pRE7f5q5LMGHhWftAJ1ZSxFvv6LXeUO8QIYGgUY77s0eywJ6n6j0AV45Dp
         89bFl0vhhggy8Y0bgZWYt+TVzyUiyWhivLG+XuqT1GrNEqtFl3FvFZoVKTF7pS8vO5uL
         sC9BejkAWvsCDQHfmEAbcnHIbjqejQoZaJ49l7x6dFEAsUZ0XhqwMJ/1pdYbG5LNUvAn
         sFGbKFRY9LYHPy5gwfOr4KZKbqcm9rGtvWtf2USnzHwFIWl3ZhJ0cA2QE3vrP9cr6bt8
         kyvN5mB+QbGO1EiuAPhJfv2oqZm7NCxYn6XyuzpYAmeAjfH7rNEDX+8k+keislh194df
         jDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760474888; x=1761079688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFUAGtw9M1nC2Nm8N68so3/2sAQUOLwHhZ10m+9iZ+I=;
        b=muwapXnR7PbaRpt6g7Xb9wTjVJJpjAarhwesl9pDcyYLLMH9s6teUiEPk97GnmqVL4
         0Y+OW4R5IqPWXN5vTTRP8teB02aqvJVgdkLXHg02DWi9ajosEATKL6eV4bafA6DhSBnh
         ZIWdtGcpWlhf8SoTgvnJtDKamkvumuNU5txhZalrnC7d/VpM7U2AuuV/5DJ9KoU5Md6C
         D5hw3kAgBqVIKlY55afmE74cUk8H3dGKvnylEXs7yhcopA7HuIERhzHNfrsYSpaj2CgB
         cLEzCoX8uyfZpnseTRMWYPnT5IwofgZR1gknzI/z8Pqs2d9U8sENDNf8AsGKb/GOB1Lq
         oCag==
X-Gm-Message-State: AOJu0YyM1FsSCE5N/blwoB8Vaa+902LbR1x7tUcwXjwiLBtTd7J+12NW
	r8SyuzNDOXuWltMUvCGAoTvEMuaqMN6bMpO2ztCWx4l3j2OO7AV855vSfhLPDA==
X-Gm-Gg: ASbGnctCuQx88sSkFyh/lKzSxAu97b0BJBB3iG0ISitqJwuNFEu1ugBBYryICv/8qjw
	eDYtLkumfKqzwP4O+1QBaOrBqAftVJY7txu2ezac6cHOShVc+SmqqX71bQdlDdSpiDmsFvCYy6o
	X0cGHdz9oTD0CEreF0omkRTktP0ewbMDBSeFOlgLTIGyV/+EgXMKuhKchUORa6WJjmB4Lzzo8/a
	u4qVPtJQMLb5VVBMS869qsAgyHl0U/dR199Ng5CB30XcIq8KvFVi2mqJ9j+s7fJJDwH0E6xDpT0
	56Oos3mL2e9e16R8zwEvOePYx5XM+Ea1LGH01Z+eltNPp+ziHru7B/Z9tEpM6lHextMb9+jW4zl
	++4Qs21gdnFMo8zRPmKnESeadcN9ezeq9k7fpzG5DjzbDSQKiIoDaXR41GpGX/5iGOw==
X-Google-Smtp-Source: AGHT+IH7wFIcNBVpULugDmKyTD7I2uDMM7BLAtYGTAww7OaWy6RLP8wOg50RtWrtGCBVy+YU/Ehtrg==
X-Received: by 2002:a17:903:2d0:b0:271:45c0:9ec8 with SMTP id d9443c01a7336-290273ecac2mr313693315ad.37.1760474888441;
        Tue, 14 Oct 2025 13:48:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f06c8dsm175033635ad.79.2025.10.14.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:48:08 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH] libconfuse: patch CVE-2022-40320
Date: Wed, 15 Oct 2025 09:47:57 +1300
Message-ID: <20251014204757.1484467-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120633

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] poiting to [2] pointing to [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-40320
[2] https://github.com/libconfuse/libconfuse/issues/163
[3] https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c048c0410133241b2cfbb3d2cbeb532afff99e58)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libconfuse/files/CVE-2022-40320.patch     | 42 +++++++++++++++++++
 .../libconfuse/libconfuse_3.3.bb              |  5 ++-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100755 meta-networking/recipes-support/libconfuse/files/CVE-2022-40320.patch

diff --git a/meta-networking/recipes-support/libconfuse/files/CVE-2022-40320.patch b/meta-networking/recipes-support/libconfuse/files/CVE-2022-40320.patch
new file mode 100755
index 0000000000..52296b9c0f
--- /dev/null
+++ b/meta-networking/recipes-support/libconfuse/files/CVE-2022-40320.patch
@@ -0,0 +1,42 @@
+From d73777c2c3566fb2647727bb56d9a2295b81669b Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Fri, 2 Sep 2022 16:12:46 +0200
+Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+
+CVE: CVE-2022-40320
+Upstream-Status: Backport [https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/confuse.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/confuse.c b/src/confuse.c
+index 6d1fdbd..05566b5 100644
+--- a/src/confuse.c
++++ b/src/confuse.c
+@@ -1872,17 +1872,20 @@ DLLIMPORT char *cfg_tilde_expand(const char *filename)
+ 			file = filename + 1;
+ 		} else {
+ 			/* ~user or ~user/path */
+-			char *user;
++			char *user; /* ~user or ~user/path */
++			size_t len;
+ 
+ 			file = strchr(filename, '/');
+ 			if (file == 0)
+ 				file = filename + strlen(filename);
+ 
+-			user = malloc(file - filename);
++			len = file - filename - 1;
++			user = malloc(len + 1);
+ 			if (!user)
+ 				return NULL;
+ 
+-			strncpy(user, filename + 1, file - filename - 1);
++			strncpy(user, &filename[1], len);
++			user[len] = 0;
+ 			passwd = getpwnam(user);
+ 			free(user);
+ 		}
diff --git a/meta-networking/recipes-support/libconfuse/libconfuse_3.3.bb b/meta-networking/recipes-support/libconfuse/libconfuse_3.3.bb
index b8d0536eb3..9a339326ca 100644
--- a/meta-networking/recipes-support/libconfuse/libconfuse_3.3.bb
+++ b/meta-networking/recipes-support/libconfuse/libconfuse_3.3.bb
@@ -3,7 +3,10 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=42fa47330d4051cd219f7d99d023de3a"
 
 SRCREV = "a42aebf13db33afd575da6e63f55163d371f776d"
-SRC_URI = "git://github.com/libconfuse/libconfuse.git;branch=master;protocol=https"
+SRC_URI = " \
+    git://github.com/libconfuse/libconfuse.git;branch=master;protocol=https \
+    file://CVE-2022-40320.patch \
+"
 
 inherit autotools-brokensep pkgconfig gettext
 

