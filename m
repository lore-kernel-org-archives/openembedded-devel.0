Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A13E77187
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 18:36:24 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.40712.1734287778798384536
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Dec 2024 10:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tt42C+8H;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso2263989276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 10:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734287778; x=1734892578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbSXaOQWyDKwxO39ZFrMWf1Z/0MjXGz8/veSJvHytyE=;
        b=Tt42C+8HJUNLvDzGj+IaAOp2wdvNQ7agwpmucV7Fskbv19Wwam6sb6Y9y1G4UP0UkJ
         F3FTUZxDJtpg3Ki1460ZDfiny3ZDl8MLfq5CFcsM+k9QqCBzDeIVRrpprKKBr78Dk07O
         YgkkjxPIg+4VTMuV0vxjKUQroUdeaPB0mbUA1SdrQoXOxPmm6H3+i9I/Zjdesd15pzxP
         GZtVLm3jkvvTgR/P6Brhp+mdsPzoEumEExOhH7qge4Y5WYrwRq5cMiRZgWC80gFL3bZB
         1BXCKOtPIEitU9l0zUB4J/jdXjJVzVTa1TITpOyLvkyvZuATzYkZEEWoW55MZ1q9fiif
         z9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734287778; x=1734892578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbSXaOQWyDKwxO39ZFrMWf1Z/0MjXGz8/veSJvHytyE=;
        b=F3fqKsIedvfeQZbDqkA7E2Chb1WYfA6Lnayoi7LaHHFEZvUj8MNbNvY1Dk4JECDpTW
         h+f5oQujY0Ho0ZjjoLzxotD4nyattj3a7uLdPFEnScdrc4Oa5eqSHJLrtddJMm7Y9/7o
         peuB5k1t4nnkQceldFRSOyacjEuELt/GRvoz3A+sr+IZmD2npxXTP/Q/HcdcXqZtDl7s
         2xTxxR2/OJKxU4toM0t0YYtS1gcc7UOpCxf5i4Har0K4hjWVKEOwxI7gv+F/1PEbQcK+
         Cc2LgUpYCWDRu/52MuSuL0mddic3XdPNYq0q4qiAhmZvaLmUoGT+AN2Wog89eRMLYnOd
         akaQ==
X-Gm-Message-State: AOJu0YxuJ4S17/Un0rfl+ZiF9+ztaL1zX1bFN6sDG+/3oG0kAXmqYszq
	NzxhxWxZpUzSAYaUmKHktD1I86lE2KEl4GgGQCusi2khlokA7t4241XDMuTa
X-Gm-Gg: ASbGncsKszvgpmPwevA7yl87tdrBz+78YbPeCFDDh7rPU9VUpfSgTKj5H/+oWP9Bvn4
	ZttylRIlDWyfni4kt90Y+KDZj4miPIL9ggmjCXOqO49Fe2tf9PPTU+L01dQVKn7xWUWgJuUK292
	7oo36sgTn92CdBS6+rSFmsypvQXOkv7b8Pl4JtfVuP4L3J1cap3tW99C61X6OAElq7a5BtehdvN
	j5Dr75DQMRagP4NJnfXgyzHwVRgGEItuSVBFjh7b6uo/kvH7EVJ/nWND4D4qlI7jlsO5w==
X-Google-Smtp-Source: AGHT+IEyZxcjDv5089+SZRSe36ahJ666y8hG/Rw6xFKTpXr+IHEFQt40RYn6av+kO+VaX5kC4VaixA==
X-Received: by 2002:a05:6902:2213:b0:e4a:8132:26c6 with SMTP id 3f1490d57ef6-e4a81322f97mr2701561276.42.1734287777778;
        Sun, 15 Dec 2024 10:36:17 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:a906:ba5:bc1d:da36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e47035366easm985356276.18.2024.12.15.10.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 10:36:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 2/5] mariadb: Ensure compatibility with ARMv9 by updating .arch directive
Date: Sun, 15 Dec 2024 13:36:13 -0500
Message-ID: <20241215183616.7218-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241215183616.7218-1-akuster808@gmail.com>
References: <20241215183616.7218-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 18:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114318

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

The pmem_cvap() function currently uses the '.arch armv8.2-a' directive
for the 'dc cvap' instruction. This will cause build errors below when
compiling for ARMv9 systems. Update the '.arch' directive to 'armv9.4-a'
to ensure compatibility with ARMv9 architectures.

{standard input}: Assembler messages:
{standard input}:169: Error: selected processor does not support `retaa'
{standard input}:286: Error: selected processor does not support `retaa'
make[2]: *** [storage/innobase/CMakeFiles/innobase_embedded.dir/build.make:
1644: storage/innobase/CMakeFiles/innobase_embedded.dir/sync/cache.cc.o]
Error 1

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aa667cbe219d207412fb5d89182887759fd63bc7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...lity-with-ARMv9-by-updating-.arch-di.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 39c9f4c9d5..f3b8b5eed4 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -24,6 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch \
+           file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
new file mode 100644
index 0000000000..11d1724768
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
@@ -0,0 +1,44 @@
+From 1b0c05b53ede7decb3f4dfe6187f9573cab5e0ab Mon Sep 17 00:00:00 2001
+From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+Date: Mon, 2 Dec 2024 02:18:46 +0000
+Subject: [PATCH] Ensure compatibility with ARMv9 by updating .arch directive
+
+The pmem_cvap() function currently uses the '.arch armv8.2-a' directive
+for the 'dc cvap' instruction. This will cause build errors below when
+compiling for ARMv9 systems. Update the '.arch' directive to 'armv9.4-a'
+to ensure compatibility with ARMv9 architectures.
+
+{standard input}: Assembler messages:
+{standard input}:169: Error: selected processor does not support `retaa'
+{standard input}:286: Error: selected processor does not support `retaa'
+make[2]: *** [storage/innobase/CMakeFiles/innobase_embedded.dir/build.make:
+1644: storage/innobase/CMakeFiles/innobase_embedded.dir/sync/cache.cc.o]
+Error 1
+
+Upstream-Status: Submitted
+
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ storage/innobase/sync/cache.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cache.cc
+index 43d642d05b5..af2d1f3d221 100644
+--- a/storage/innobase/sync/cache.cc
++++ b/storage/innobase/sync/cache.cc
+@@ -82,7 +82,12 @@ static void pmem_cvap(const void* buf, size_t size)
+   for (uintptr_t u= uintptr_t(buf) & ~(CPU_LEVEL1_DCACHE_LINESIZE),
+          end= uintptr_t(buf) + size;
+        u < end; u+= CPU_LEVEL1_DCACHE_LINESIZE)
++#if defined __ARM_ARCH && __ARM_ARCH == 9
++    __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) : "memory");
++#else
+     __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) : "memory");
++#endif
++
+   __asm__ __volatile__("dmb ishst" ::: "memory");
+ }
+
+-- 
+2.43.0
+
-- 
2.43.0


