Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id ED9F47790E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 00:58:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id z63so4557269wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 16:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DEyZ+mnYfXrBUFuFX7G8XQWPdVvXMdDK9OZ06bVzxUk=;
	b=AEH5lYqfynHs+OenZZyR8dn/hyLsCnJs7wG7WTkMdiTQL4A8e9k+mxpdYBxHFm3QO7
	nmMkeLyHvaP2w3vc6ZARSu+DmJ4FS38DaM6c92TN3lSFoQxD9/1MB4lIFYpNUyLjxCpm
	IbuOHLEZLKaot1ddbvore23jZqjD+FTu0QIlmUTcCzGCyFU6ssOOE5bTY0+ajhQNYJ/F
	txkLqFb65QVhR6nN4xR/8e76dHOzqFFp0De7DQm3FAk8GpbyN+9gudXgyVnrt7GLHU+T
	7PiMuzX8RPZ6esb5A2diBpxakkxb2aI7SU4jQ4wtzfpHH/3aaBIrGAu04Qaq1r+Lnovy
	cG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DEyZ+mnYfXrBUFuFX7G8XQWPdVvXMdDK9OZ06bVzxUk=;
	b=HEmVphYBYbpKIkuXfSaQF0rNgHhnhQLSjmu4CJjIFnaETauo2UISb6KgNRZFSdnB+i
	cNTxXr0rcTvbhbG5HqkbPejyx208KYvSl0fDZxiQb4CXb5aYPiBMaDiEb+VKW02Z5pzM
	hf9NFsZabEsz0HO7+g8aP/Oc7d9PT1YLIyqB2Ai6paMWEHLKjRr2z7cEwJhDc18g4gt7
	CIqVX8kj/uNoEbqSnL48mqRWXY+jEFQypYgPZxOap7xL+ifb0nmPV7nnbXwuTc0ZgAV/
	ATNz8Iuelj8zK/qiNsBU7xhiGCoHzLCJyjqfyqCbajanlM4v9JE7dVjWu2AUqLhR5+k9
	mjng==
X-Gm-Message-State: AFeK/H2bXLnV7pvpWCHrMgIan7FfdzDy+eVulCa+7wGq4TPpE5r0HyxkSqNvnwkHR/t19A==
X-Received: by 10.28.74.28 with SMTP id x28mr4882827wma.131.1489280323398;
	Sat, 11 Mar 2017 16:58:43 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host33-64-dynamic.8-87-r.retail.telecomitalia.it. [87.8.64.33])
	by smtp.gmail.com with ESMTPSA id
	63sm19172311wrh.68.2017.03.11.16.58.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 11 Mar 2017 16:58:42 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Mar 2017 01:58:34 +0100
Message-Id: <1489280314-12185-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] klibc: add dependency on coreutils-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Mar 2017 00:58:43 -0000

As seen doing world builds after the host-tools changes dash needs nl.

  GEN     usr/dash/builtins.c
TOPDIR/tmp-glibc/work/core2-64-oe-linux/klibc/2.0.4-r0/git/usr/dash/
mkbuiltins: 100: TOPDIR/tmp-glibc/work/core2-64-oe-linux/klibc/2.0.4-r0/git/
usr/dash/mkbuiltins: nl: not found

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index f00e31a..bd0ab61 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -4,7 +4,7 @@ minimal entaglement, and portability, not speed."
 SECTION = "libs"
 LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
-DEPENDS = "linux-libc-headers perl-native"
+DEPENDS = "linux-libc-headers perl-native coreutils-native"
 SRCREV = "4d19974d7020488f63651244e1f9f51727c3f66c"
 
 SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
-- 
2.7.4


