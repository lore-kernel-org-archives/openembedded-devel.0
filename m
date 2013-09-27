Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id EB6A6610F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2013 22:06:19 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so1494276eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2013 15:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fP+7y8FBP6vu68RbUPwZhu/WYGinfgq4DxSIC+UXdG8=;
	b=qRhxQc6Nq4PzZaS1BgmcoxwCMNYwyMqmaKA5XdxWTHb5HBfD5l4Wp2hC1IWGP8Ifpc
	Jfujt/76kJOIcoRykwISrA7vAfzHJB4b1wVbrxJvTKQ/otysVDp9uqsk28TiZDWvW9Ba
	Qzi+pUVZDPSjPrwLrJFW3yrDt8UCLgQ4cdA+C0s238SNnWqEsMorC/qC9W9RjCKUeChu
	teseutXahZsgg7ZIkJYJrzguV/ejrUvzf1QffAnv6dpwqPUKufwZrbEjpOQKb6Yix3xo
	NX/GKA4ACY4WrIpmPp1bRR12Dw8oVcPFhS5AodGD7aEFSWeBsQKTLqfnioU5ujv1eHIo
	Z97Q==
X-Received: by 10.14.184.132 with SMTP id s4mr13921717eem.13.1380319581295;
	Fri, 27 Sep 2013 15:06:21 -0700 (PDT)
Received: from mizar.localdomain ([87.13.50.106])
	by mx.google.com with ESMTPSA id
	x47sm20616818eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 27 Sep 2013 15:06:20 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Sep 2013 00:05:59 +0200
Message-Id: <1380319559-12074-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1380319559-12074-1-git-send-email-andrea.adami@gmail.com>
References: <1380319559-12074-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH] klcc-cross: disable more unused tasks
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
X-List-Received-Date: Fri, 27 Sep 2013 22:06:20 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
index 17ae0c1..07b76d7 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
@@ -11,10 +11,6 @@ FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
 
 inherit cross
 
-do_configure () {
-    :
-}
-
 do_compile() {
     oe_runmake 'INSTALLDIR=${STAGING_DIR_TARGET}${target_libdir}/klibc' klcc
 }
@@ -23,3 +19,14 @@ do_install() {
     install -d ${D}${bindir}
     install -m 0755 klcc/klcc ${D}${bindir}/${TARGET_PREFIX}klcc
 }
+
+# disable task already run in klibc recipe
+do_configure[noexec] = "1"
+
+# disable unneeded tasks
+do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
+do_package_write_deb[noexec] = "1"
+do_package_write_tar[noexec] = "1"
-- 
1.8.1.5


