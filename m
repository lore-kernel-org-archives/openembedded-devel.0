Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SJiVc-0000t0-Ao
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 11:46:08 +0200
Received: by wera1 with SMTP id a1so3216999wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2012 02:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ifK1yxRwuiR8lhrrmPN5zQx4muJhmxJL95lpSJcXYA0=;
	b=Jy2ld1wWWx0V71fjq2gbEIQgwBhALSRLbZpfj/9WLizNskhy5J2YLDH3SxnCn04EDf
	jK7TthQKlCGKZ6VIX4m5eNu/aSzlloY/66SWm50sJdchqr+Yvsks4JTHe5j77oLbV+Mt
	l4hcbCj+x6weZdtIYaBRwTl1EF/uh+iX65eNCTL8ZdN81JIwNvD7YF2Axn6/RL8Xdc43
	gruAb11zRfv0OSv9FkhEWgMWWlfv7hS0SyxWUUtLHaltwqepND4lCWO1hrj5sZYQTiau
	t4BIDqLlZ55bKTcuu9hGT10O6YSF3g22IKYMNzNKYPSaDUEU1sSdzhIU1ABL7bsjMPsI
	fgjQ==
Received: by 10.180.95.129 with SMTP id dk1mr19515831wib.3.1334569003765;
	Mon, 16 Apr 2012 02:36:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h8sm29871435wix.4.2012.04.16.02.36.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 02:36:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Apr 2012 11:36:27 +0200
Message-Id: <31223ca1e653572e217e17cc6409583b2c2b6ab9.1334568930.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <62de43c3c2201f1dc73e7c4c9eb6aba0c131d1b4.1334568930.git.Martin.Jansa@gmail.com>
References: <62de43c3c2201f1dc73e7c4c9eb6aba0c131d1b4.1334568930.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1334568930.git.Martin.Jansa@gmail.com>
References: <cover.1334568930.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/3] pixman: remove IWMMXT setting
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
X-List-Received-Date: Mon, 16 Apr 2012 09:46:08 -0000

* khem moved it to oe-core and kept it here

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/pixman_0.25.2.bbappend                |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
index 4a26ba8..4798eec 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
@@ -3,7 +3,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 DEPENDS += "perl-native"
 BBCLASSEXTEND += "native"
 
-PRINC = "7"
+PRINC := "${@int(PRINC) + 8}"
 
 SRC_URI += " file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
 
@@ -11,6 +11,4 @@ NEON = " --disable-arm-neon "
 NEON_armv7a = " "
 NEON_armv7a-vfp-neon = " "
 
-IWMMXT = " --disable-arm-iwmmxt "
-
-EXTRA_OECONF += "${NEON} ${IWMMXT}"
+EXTRA_OECONF += "${NEON}"
-- 
1.7.8.5



