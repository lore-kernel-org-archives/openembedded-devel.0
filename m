Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E722C79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:26 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7004.1788942742993911573
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LyEmUrp8;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso6713836a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942742; x=1789547542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EH62pqO34Cl+szUaf0tM8cDFGRW/UrNQqlLNpmb5z+k=;
        b=LyEmUrp8xWZb0pm5Siqf5mcVk436cQDhX/qFtwaTrMIow9cHw9qGALA+9bcW+xanTr
         DDEYxySHp4nD63gTH4w95Rzbyi86rAGNhWvCRkOCXAZjNjM33BElOKcibHjFyCZ0M3e3
         Yyxr5WioILPG2EVoaSMGZ0P2biNLNXNZbL/WOHCz10dCkNVRphCII/y4yEHnvCURaOMG
         Yr1ZyrCgnjcov0kG7KPu1txyGS6wmxyYKFi3tdWSRb0X2qdAl36h0a94OJRhZ5w1BZ1V
         oAgeVV9aB7uHI8/eT9j5Oj1kNizwKCuKVRHOniMcTigcuMVM+kWRMXgVPjW7yOS/Y5ph
         LiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942742; x=1789547542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EH62pqO34Cl+szUaf0tM8cDFGRW/UrNQqlLNpmb5z+k=;
        b=SF7tqfTpJ62aqw5S/xxRyqSKu3/gTUWI5/mvDh8V1UuP5HnxiHORaz11wbsvi5oVxB
         LPWTS5i6YyOeUN8W+AT5gaYCxoeZOWcG07Gwk7vPot8QhjoJ91bat8BnpQuP4ztlRlkK
         94TRKGkBsPkc/SFwTm0SfVmBsoD2ydl+u8TulNfByGyNe+QTzu28DcTqi8WCpbvBhHSf
         MPm+E2wqddzlAxCvxG60LJ+lytNBn+YftGZiBeA6OZ5Jon5XsnWa+4cgivGeHqpJToCT
         6OxHztTVPZZPtMU0XlGLlrTNIgLmQdWZ0lS7t7nO70TSP/DJOCuR9UK3VG1G9Lpe6ewy
         BWAQ==
X-Gm-Message-State: AFuF++lB1ZiuSQwXHyk8WAyHtowp8KlgNMOsank2ARNe9B56KL/axj3y
	5Vjao78FCSMtZ1BcsZ3eoQCDvU0hVtPaLpnhZ4zVGw8sIaLhpJwoPl6pAvDpbhi0
X-Gm-Gg: AYBFou3811WgAeWp4VIL6fiDd/YwrCxLiUCBYJPnQ2EjSc7LChzxB/sHm9Ly1kC+clS
	rysOSPUgMOQA1sy4Y9hThFZHxZjICoS4fLHKyuRycdFsDQQuUYDZDy/+g9obJ0D+qYZQf55bwLZ
	cErKnQaPSCJh0646u3rKO4Ppn6wUi4aSCshr3dhCWZqoZws4PvoYyAzrFRQKW0IMJZOl+h9eoX/
	eo2evTrgKS8kQTDocUnYPPbnKCK4NNlpqw4nbktwJAo2Cu4Lw5ls1cpvX17QFkuW6VUy/jcKYcO
	PGJKysTUI7F6BXy6DBoRusgxPqvIgEm0gxjEiS9tMTrhqydWaCPgljwPb/w8XjeY9KZCEQeYRlm
	LJwNfY1kxB30IqlqZLVnGIMt2l9df5GYFL7eLlVrUQ206fj4ryOMitT1v4RF6RVUwDaW2gKEUpj
	F/TAv92TdUUdeX3vI3OcyU2lB+fOvVlRGohweobcOqEZUi4YMJJwwRffiY18eFFq0vDpgUlkHGc
	mN5Xz8bi+GYKL/ee5MS9VeLKJdBuj6UTg==
X-Received: by 2002:a17:90a:d64e:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39b2612eb54mr50584465a91.9.1788942742268;
        Wed, 09 Sep 2026 01:32:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 11/15] freerdp3: patch CVE-2026-64621
Date: Wed,  9 Sep 2026 20:31:36 +1200
Message-ID: <20260909083140.2494932-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129882

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit matching GitHub advisory[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-64621

[1]https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-f27x-frr8-j9hc

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-64621.patch     | 27 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64621.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64621.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64621.patch
new file mode 100644
index 0000000000..4fbc7abf4c
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64621.patch
@@ -0,0 +1,27 @@
+From b33dbe41020a6227ad3e89285c27e25e3f8617e9 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Wed, 1 Jul 2026 23:03:29 +0200
+Subject: [PATCH] [client,common] fix double free
+
+(cherry picked from commit 7696267929ae8ba045c1bbe275b3915653828313)
+
+CVE: CVE-2026-64621
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/7696267929ae8ba045c1bbe275b3915653828313]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ client/common/file.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/client/common/file.c b/client/common/file.c
+index 9fe207731..1ddf9f0ae 100644
+--- a/client/common/file.c
++++ b/client/common/file.c
+@@ -2533,7 +2533,6 @@ BOOL freerdp_client_populate_settings_from_rdp_file_unchecked(const rdpFile* fil
+ 			if ((val >= UINT32_MAX) && (errno != 0))
+ 			{
+ 				CommandLineParserFree(ptr);
+-				free(list);
+ 				return FALSE;
+ 			}
+ 			list[x] = (UINT32)val;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index a577916bef..493fa94c4c 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-63633.patch \
            file://CVE-2026-63652.patch \
            file://CVE-2026-64620.patch \
+           file://CVE-2026-64621.patch \
 "
 
 

