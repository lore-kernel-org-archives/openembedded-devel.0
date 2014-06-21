Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5D76FA3B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:20 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so4686018wgg.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0etgy9o6EoizWd9J+r+JwJo3Kslcke0X4m9LjzGX5K8=;
	b=qb6uCSVTIMXO2iqqqYmP2rflAP35DVdwjGfwNyIXhlfdTP2zoad2WRwi33QgAO4rUK
	bbU44k98HDgcnCBYWqVwkMYKtSeKtm1MPkQwLNAzpky5Kz3iuGcbn9xO8qHhQ0uaI69h
	+o3Ryj0CoR9ZR9cxIpbhY0+QzqOl//qIFu+vYpI1JUAH7iXdavKCO513WICIIwdlBTGy
	grZ+h98lH++4koLCJsBOP2LRnFD+aeTOP0H76RAJIJTOTLuH5z1r2+rbVKoO7i2NfPDb
	Mk2fOEBSyaain9vjn0pAiY4N7MnFPiH4NDsVZuykz0QxE1j8ULH+D0siJGUBiIWtf8uA
	6HbQ==
X-Received: by 10.194.77.103 with SMTP id r7mr9782830wjw.67.1403342361173;
	Sat, 21 Jun 2014 02:19:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fn1sm12427464wib.18.2014.06.21.02.19.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:19:08 +0200
Message-Id: <1403342349-11180-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 11/12] libetpan: fix build with B!=S
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libetpan/libetpan-0.57/sepbuild.patch                | 16 ++++++++++++++++
 meta-oe/recipes-support/libetpan/libetpan_0.57.bb        |  3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libetpan/libetpan-0.57/sepbuild.patch

diff --git a/meta-oe/recipes-support/libetpan/libetpan-0.57/sepbuild.patch b/meta-oe/recipes-support/libetpan/libetpan-0.57/sepbuild.patch
new file mode 100644
index 0000000..4f01617
--- /dev/null
+++ b/meta-oe/recipes-support/libetpan/libetpan-0.57/sepbuild.patch
@@ -0,0 +1,16 @@
+Index: libetpan-0.57/rules.mk
+===================================================================
+--- libetpan-0.57.orig/rules.mk
++++ libetpan-0.57/rules.mk
+@@ -134,9 +134,9 @@ prepare-am: prepare-local
+ 	         if test -e ../../$(subdir)/$${hdr}; then \
+ 	           echo "$(LN_S) -f ../../$(subdir)/$${hdr} ."; \
+ 	           $(LN_S) -f ../../$(subdir)/$${hdr} .; \
+              else \
+-	           echo "$(LN_S) -f ../../$(subdir)/$(srcdir)/$${hdr} ."; \
+-	           $(LN_S) -f ../../$(subdir)/$(srcdir)/$${hdr} .; \
++	           echo "$(LN_S) -f $(srcdir)/$${hdr} ."; \
++	           $(LN_S) -f $(srcdir)/$${hdr} .; \
+              fi; \
+            fi; \
+ 	     done; \
diff --git a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
index 0dbd782..6be0694 100644
--- a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
+++ b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
@@ -10,7 +10,8 @@ PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libetpan/libetpan-${PV}.tar.gz \
            file://libetpan-autoreconf.patch \
-           file://libetpan-ldflags.patch"
+           file://libetpan-ldflags.patch \
+           file://sepbuild.patch"
 
 inherit autotools pkgconfig gettext binconfig
 
-- 
2.0.0


