Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCra5-0005ge-Dl
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 14:02:25 +0200
Received: by wera1 with SMTP id a1so588895wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=H8QvC1Z6Yr7oaEXU8DSP6KEsCVc+VY6ZhsGtiOPbhUQ=;
	b=NC5cwlIdMtH7Q/TGNvH4r+zQwMmEC5RuIIxivXuMYEpl8kvPYaWiewZNWFD5AGRn8c
	sPQg0jKSHSyifNEpZrNclqnbxnlCLbMuCNZPQwyzX57iSc1eUwVjAJEaxVGzzHm21J1f
	u9hSMlrbO05K5iNc5PxqHkAzQ2SJgioJTTFWtHBCOGZC0tRpAJLrlHdSXedJca5nJHvu
	vdaR40fjHoegOBsvyQ1EC9ybw9UjoGVF2hNM3hjlMQ+Cia41RRbmY20CPPRmW7MftQpl
	QZodWzc6UXUgTplPsKOPheHpx6hO1XqVJnlMK9rzSZjyrJGC97osoXH2nhQ992npSUaI
	l2bw==
Received: by 10.216.131.2 with SMTP id l2mr17050371wei.3.1332935603502;
	Wed, 28 Mar 2012 04:53:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n15sm57406543wiw.6.2012.03.28.04.53.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 04:53:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 13:53:15 +0200
Message-Id: <79dc4a79b7c57d77cce43110ba011012a9b39f6d.1332935553.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332935553.git.Martin.Jansa@gmail.com>
References: <cover.1332935553.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 1/2] linux-3.2: upgrade to 3.2.12
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
X-List-Received-Date: Wed, 28 Mar 2012 12:02:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux_3.2.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux_3.2.bb b/recipes-kernel/linux/linux_3.2.bb
index 199f36e..5379870 100644
--- a/recipes-kernel/linux/linux_3.2.bb
+++ b/recipes-kernel/linux/linux_3.2.bb
@@ -1,10 +1,10 @@
 require linux.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.9.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.12.bz2;apply=yes;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
@@ -21,5 +21,5 @@ SRC_URI_append_poodle = " \
 
 SRC_URI[kernel.md5sum] = "7ceb61f87c097fc17509844b71268935"
 SRC_URI[kernel.sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
-SRC_URI[stablepatch.md5sum] = "4610f3e62a5446422d1e81a90ab3cd06"
-SRC_URI[stablepatch.sha256sum] = "7836685dee161a4ffaf887b8e2f8dd3cb7712e690d0942fefb1db09bb6ad3871"
+SRC_URI[stablepatch.md5sum] = "377a6d731cd246aaa0c0f6a432b7aece"
+SRC_URI[stablepatch.sha256sum] = "c6991964901ef7797cca09ff9d1b4ed7abda27e2796ad55cad09a266eaaebb5d"
-- 
1.7.8.5



