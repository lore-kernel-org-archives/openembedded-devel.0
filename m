Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 832F777223
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:47:12 +0000 (UTC)
Received: by wmww144 with SMTP id w144so203564527wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0VYU0QrMj4ScKb5jDe+rdnYDpotbga1TLnuJkuQfJWQ=;
	b=zimwu8XMuKXzd5BTmhXBFuRTZnpAEBJVxOxWe4/Y/B82owEj2ew9GzNIGVsttyqx6P
	+CjCZu2s397gBgbL90DwaHuehDTi5e69aRuJQulcegk5zKSDH2HUgQgEggTRnot5v724
	bV5AO7Yw50h3ftJwz7hgleBCi1VU72CbCLZ6Ix5zwMMEZKwooxEjlJMlw1SMpmX6+o1j
	PgkEY0hVxrcGTBiH37fHsvN67wOgYkNybvPF4wItM2KEq+NVvMfwuA/J3VawuHvoxgoV
	z/KnWRc1U3b+20/JkCzOyIGH6KGFBu9CeUSDJsLvIhLVAbIUUuXMxXszMzQMCGS3Ftiq
	sNhw==
X-Received: by 10.28.217.130 with SMTP id q124mr16755320wmg.92.1447339632136; 
	Thu, 12 Nov 2015 06:47:12 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r65sm31100593wmb.20.2015.11.12.06.47.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:47:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 15:47:25 +0100
Message-Id: <1447339645-16453-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-oe] netmap: set MACHINE_ARCH, because it depends on MACHINE_ARCH netmap-modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 14:47:14 -0000

* it's also using MACHINE specific variables like:
  STAGING_KERNEL_DIR. STAGING_KERNEL_BUILDDIR
* drop suspicious:
  do_fetch[depends] += "netmap-modules:do_fetch"
  fetcher should use .lock files to prevent updating the same repository
  in parallel
* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: netmap different signature for task do_configure.sigdata between qemux86copy and qemux86
basehash changed from 748eae270193023d79f7d6a69aa1b8d2 to 9267873ef5fa4474d5f60fc79044ab64
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-kernel/netmap/netmap_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
index f15a626..a028585 100644
--- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
@@ -1,6 +1,7 @@
 require netmap.inc
 
 DEPENDS = "netmap-modules"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
                 --kernel-sources=${STAGING_KERNEL_DIR} \
@@ -13,8 +14,6 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
                 "
 SRC_URI += "file://0001-testmmap-fix-compile-issue-with-gcc-5.x.patch"
 
-do_fetch[depends] += "netmap-modules:do_fetch"
-
 do_configure () {
     cd ${S}/LINUX
     ./configure ${EXTRA_OECONF}
-- 
2.6.3


