Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 89A9F6A441
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 22:59:19 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so1867088eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 15:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WWB2RXuP2/0oB9kaHhpbJnEpZJaorUJsKgLO1FqR7rQ=;
	b=ZGoCLDDlKDaumQk/nGSfAkCtrSxOtMjeG7WApBizlvqez8eJIzzBuTJ5OB04nq38r/
	zRMo0VWKS32LfVsl/cFoh6I6WaH4emOjQlnQsV/1XX1ICMPLWNMOh9CW6tgiej3Q4dZ8
	StCnJEN8/kh+gigY+5b+AMaaJn+E+dUL6PUbcGZGxqM+6f9r+2mXA7FAdQiX+4RhuTZI
	9RbbKgnDYSOxElLIT4mS7M9FUwCA7J48Ary6k212NU/QlCAvo2kLDUQ8603JrcZh7jjF
	yA7+WBjFNsuXFSGYuUGH51QxJaSvkwGK7QzuvGi+teEJ6cHqyVZJJFd/oXhDm1Oir4WR
	nPdA==
X-Received: by 10.15.64.1 with SMTP id n1mr23421634eex.15.1380409160623;
	Sat, 28 Sep 2013 15:59:20 -0700 (PDT)
Received: from mizar.localdomain
	(host172-229-dynamic.20-79-r.retail.telecomitalia.it.
	[79.20.229.172]) by mx.google.com with ESMTPSA id
	x47sm32620591eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 28 Sep 2013 15:59:20 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2013 00:59:06 +0200
Message-Id: <1380409146-6701-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] kexecboot(-klibc): upgrade to last upstream commit
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
X-List-Received-Date: Sat, 28 Sep 2013 22:59:20 -0000

id: 0bcc14671aa2d84ec20f260582aca36bb901ccf1
Changelog:
 minor headers fixes
 fix fb offset computations
 replace AC_CONFIG_HEADER with AC_CONFIG_HEADERS

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb | 2 +-
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
index 45741bf..4144d85 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
@@ -2,7 +2,7 @@ PV = "0.5.9"
 PR = "r10+gitr${SRCREV}"
 
 SRC_URI = "git://github.com/kexecboot/kexecboot.git"
-SRCREV = "b667914bb0cba1c30f9b771abccfe98f1419afeb"
+SRCREV = "0bcc14671aa2d84ec20f260582aca36bb901ccf1"
 S = "${WORKDIR}/git"
 
 # the binary is statically linked against klibc
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index c3c496d..dd630a9 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -2,7 +2,7 @@ PV = "0.5.9"
 PR = "r10+gitr${SRCREV}"
 
 SRC_URI = "git://github.com/kexecboot/kexecboot.git"
-SRCREV = "b667914bb0cba1c30f9b771abccfe98f1419afeb"
+SRCREV = "0bcc14671aa2d84ec20f260582aca36bb901ccf1"
 S = "${WORKDIR}/git"
 
 require kexecboot.inc
-- 
1.8.1.5


