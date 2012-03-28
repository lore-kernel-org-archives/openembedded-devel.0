Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCr98-0004db-AD
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 13:34:34 +0200
Received: by wera1 with SMTP id a1so573859wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 04:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=X4Tk5oTpwMLs3jR0dzmMpNBys3rrdfThO71uBRCYJew=;
	b=nHzv+Ste0isy1tGUlTGEkMPQHH9USWSUe6WSF83n1Cf2Q3xICXY9J4AqwA6QrUk/V3
	oWhEhqwf2jkGXDXVqlZeviZsMrngMEUGdwzFCW8l11LX1Jj6yzQmLqFiGgitg+1dQihh
	4KWY2Yf6hWRd+jytcIbkGkSs2+8BnF0c1qyE5iy09rWhLsFZGRuRqNYYR1IllHFKiYqo
	d46LONC31rzhy3pnTcb6UtYpPBY4c2nUBz1fWgJ7IEGzcHbj01v6eHjOGQjK8xrEqCGJ
	e1nqDMoBrhkhQREyux3ch8pSIM/htLnIIa1XQgAR5cCNuFkDWGpU0CrJ7ayLta30DBdV
	FH0g==
Received: by 10.180.83.72 with SMTP id o8mr6235724wiy.5.1332933932448;
	Wed, 28 Mar 2012 04:25:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm12250143wib.4.2012.03.28.04.25.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 04:25:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 13:25:23 +0200
Message-Id: <5a7fc35885c7f07840731881c5e07b5c68299838.1332933826.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332933826.git.Martin.Jansa@gmail.com>
References: <cover.1332933826.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332933826.git.Martin.Jansa@gmail.com>
References: <cover.1332933826.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] linux-kexecboot-3.2: upgrade to 3.2.12
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 11:34:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-kernel/linux/linux-kexecboot_3.2.bb    |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
index 5492183..8cb19aa 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
@@ -1,13 +1,13 @@
 require linux-kexecboot.inc
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 S = "${WORKDIR}/linux-${PV}"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.9.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.12.bz2;apply=yes;name=stablepatch \
            "
 
 SRC_URI[kernel.md5sum] = "7ceb61f87c097fc17509844b71268935"
 SRC_URI[kernel.sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
-SRC_URI[stablepatch.md5sum] = "4610f3e62a5446422d1e81a90ab3cd06"
-SRC_URI[stablepatch.sha256sum] = "7836685dee161a4ffaf887b8e2f8dd3cb7712e690d0942fefb1db09bb6ad3871"
+SRC_URI[stablepatch.md5sum] = "377a6d731cd246aaa0c0f6a432b7aece"
+SRC_URI[stablepatch.sha256sum] = "c6991964901ef7797cca09ff9d1b4ed7abda27e2796ad55cad09a266eaaebb5d"
-- 
1.7.8.5



