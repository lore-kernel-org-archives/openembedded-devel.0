Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qy4lQ-0005Pg-7Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 18:32:44 +0200
Received: by gxk3 with SMTP id 3so328527gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2011 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Es40vw6nKbev+oJI9CvklfvzGZnJQcd2UUyY6XmmfX0=;
	b=F6SJzaIAIVH0+6dM64lIopxbuvygpUsUZcrtjniTrMkAp8i1yKHXKHQDkYuk6vUEjW
	EC2o6rpguDCwEk4GOn3q5d1rv3yL5ktCBWpVe56tNeEDUwyEan3YKA1+rfklgU1vAuFM
	uPfGAbjXV89FjIB/ocwvFebJdvmauztpqBsEg=
Received: by 10.236.181.135 with SMTP id l7mr27338543yhm.85.1314635271761;
	Mon, 29 Aug 2011 09:27:51 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id r28sm2657976yhm.66.2011.08.29.09.27.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 09:27:51 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 09:27:43 -0700
Message-Id: <1314635263-10209-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] [meta-oe] binutils: use TARGET_PREFIX for the convenience links
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
X-List-Received-Date: Mon, 29 Aug 2011 16:32:44 -0000

From: Chris Larson <chris_larson@mentor.com>

This ensures it works even if TARGET_PREFIX != ${TARGET_SYS}-

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-devtools/binutils/binutils.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/binutils/binutils.inc b/meta-oe/recipes-devtools/binutils/binutils.inc
index d9e859e..f8fc7b8 100644
--- a/meta-oe/recipes-devtools/binutils/binutils.inc
+++ b/meta-oe/recipes-devtools/binutils/binutils.inc
@@ -109,8 +109,8 @@ do_install () {
 	cd ${D}${bindir}
 
 	# Symlinks for ease of running these on the native target
-	for p in ${TARGET_SYS}-* ; do
-		ln -sf $p `echo $p | sed -e s,${TARGET_SYS}-,,`
+	for p in ${TARGET_PREFIX}* ; do
+		ln -sf $p `echo $p | sed -e s,${TARGET_PREFIX},,`
 	done
 
 	rm ${D}${bindir}/ar ${D}${bindir}/strings
-- 
1.7.3.2.430.g208247



