Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SXDzS-00008G-1M
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 May 2012 18:00:46 +0200
Received: by bkcjm2 with SMTP id jm2so6531188bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 08:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xq3dsIFU57I2ghVBSnKA/GclOhr4XfM9BinyEJQloa4=;
	b=Bts6ff00vdtTYNtq1pctPNWfFT9jKBejAwtXTAhWg1u6PoAVJWHbwKGO/dZTe1heyR
	oYTRB+t+w65VHhl+O9FD5uWG+wbTF6TD5doF53vnxs9ZEOCLUX+Sud3hVjhDKjgoLwZC
	HQttDVEHMIkRT8dtH7JR2VjJW5NVPk2KZ7cWw577CJ0vwrg2PE4S1f+E+GwssUQhjtlv
	v3TM+4jm95vV00GTO4TL4jwOrOq8tKlo2AheZvsOekWcVXy4wbZj7QY8V4xOARiBzptC
	I0vD9Rut6QPiMHJRv8pNyg4WAKEx0w550ZpTYjpRloV9vvP8CmPdyQrMkar+k1Sch7Yr
	viVw==
Received: by 10.205.33.136 with SMTP id so8mr11396328bkb.1.1337788235979;
	Wed, 23 May 2012 08:50:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm38036576bku.9.2012.05.23.08.50.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 08:50:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2012 17:50:30 +0200
Message-Id: <1337788230-8841-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-initramfs][PATCH] meta-initramfs: append to BBPATH instead of prepend so order of bblayers.conf is respected
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
X-List-Received-Date: Wed, 23 May 2012 16:00:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-initramfs/conf/layer.conf |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 469cde5..cc78c1a 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -1,11 +1,16 @@
 # Layer configuration for meta-initramfs layer
 
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "meta-initramfs"
 BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
+
+# Define the priority for recipes (.bb files) from this layer,
+# choosing carefully how this layer interacts with all of the
+# other layers.
+
 BBFILE_PRIORITY_meta-initramfs = "8"
-- 
1.7.8.6



