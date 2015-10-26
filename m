Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id DBD3B769A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 22:06:20 +0000 (UTC)
Received: by iody8 with SMTP id y8so46504464iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 15:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qraeuaTtnbK8NHncNP8NIhieJ5zDxnMJ4wxc7Gu0H+g=;
	b=ZgzlOrJZi/r7tL2ReaYFlJRekBrsNt5WXbhqvv9jhUeChZVEUTZlouVJJ0+b1V60i3
	MXOqmSb9WjpCqw+MwSOTb/wnJmrI4KGtfF2pjJcTliZwYnvJQxt4mEqWnTydESg1CxuT
	vtw+wfw4XeoMay0irP7LsJnkuHXi7hMyGeaRdrSKnMZzuI+neKFpYt5PNKTOiJP9N0z8
	SPLNXO02VeYSLVNoPvctS4XwX9TIWARlNXf4tvR7oVZUFZWGcaTaXBWPAuBmnYwkNlSx
	OsyoPsByAmYWjmpoBvwWBJsz0RAwigjijNLZ946lpBDpVUwvUzJrW4r9gc3DqAFg0+2s
	hnfw==
X-Received: by 10.107.47.24 with SMTP id j24mr22724957ioo.168.1445897180738;
	Mon, 26 Oct 2015 15:06:20 -0700 (PDT)
Received: from localhost.localdomain (mail.novatech-llc.com. [64.126.95.172])
	by smtp.gmail.com with ESMTPSA id
	rt5sm7204583igb.20.2015.10.26.15.06.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Oct 2015 15:06:20 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Oct 2015 17:05:41 -0500
Message-Id: <1445897141-24786-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
Subject: [meta-webserver][PATCH] apache2: fix config_vars.mk path contamination
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
X-List-Received-Date: Mon, 26 Oct 2015 22:06:21 -0000

Replace contaminated paths with staging paths so apxs can be successfully used
in other recipes to build modules when host and target arch differ.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
index af5c72a..b62fd8c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
@@ -117,6 +117,10 @@ apache_sysroot_preprocess () {
     sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
     sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
     sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
+    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
+    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
+    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
+    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
 }
 
 #
-- 
2.4.5


