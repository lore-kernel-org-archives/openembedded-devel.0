Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 538257214C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 12:22:59 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so24398335wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lhw1Y9fJCksGiny7QY772OSnEBgpNn0oR80t3vKR/Ts=;
	b=XSCTvyZsbvXe2IyWn64Wh5zQHf5iOBBg9HOuGPmm95nnSbVspK3nymx5HhC+3aZPMD
	S3SMKwYQrYf7kVvy96s2axa9WIDJnK6QeS+1ss1CyN+CSRhUrfzx5z+PQHEimCWvwKeX
	PR7EUolgtkrMDq/YrPa2BtS6izSxxmlz5LJzejXjmPZfmRQcjo4wCApXT/sSXLSi25QF
	5rF2Rld0GfXUhe9ML4pQMSpA/O11P85rk2oIo8IGFHTDUkM+CnV+O+3BpNcdpNTo1OBM
	yTfeYEv84L9nFVoXQb3ymVn0u22uuOtJCt2T5NLEBz6Pp1EaOgCyaE7uNlh7i0Xt4JzI
	qhDA==
X-Received: by 10.194.193.2 with SMTP id hk2mr89703507wjc.40.1417436580161;
	Mon, 01 Dec 2014 04:23:00 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	td9sm28219525wic.15.2014.12.01.04.22.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 04:22:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Dec 2014 13:22:59 +0100
Message-Id: <1417436579-26311-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [meta-oe][daisy][PATCH] gdal: fix sqlite, expat and libtiff detection
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
X-List-Received-Date: Mon, 01 Dec 2014 12:23:02 -0000

* fixes following configure errors like:
  checking for SQLite3 library >= 3.0.0... yes
  cat: /OE/sysroots/qemux86/usr/lib/include/sqlite3.h: No such file or directory
  /OE/work/i586-starfish-linux/gdal/1.10.1-r0/gdal-1.10.1/configure:
  line 25411: test: !=: unary operator expected
  configure: WARNING: Can not find SQLITE_VERSION macro in sqlite3.h
  header to retrieve SQLite version!
* and autodetected expat support which sometimes tries to use host
  version from /usr/include

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
index 4fa6de1..e22108e 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
@@ -79,8 +79,9 @@ EXTRA_OECONF = "--without-perl \
                 --with-pcraster=internal \
                 --with-geotiff=internal \
                 \
-                --with-sqlite3=${STAGING_LIBDIR} \
-                --with-libtiff=${STAGING_LIBDIR} \
+                --with-sqlite3=${STAGING_EXECPREFIXDIR} \
+                --with-libtiff=${STAGING_EXECPREFIXDIR} \
+                --with-expat=${STAGING_EXECPREFIXDIR} \
 "
 
 EXTRA_OEMAKE += "INST_DATA="${datadir}/gdal""
-- 
2.1.3


