Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5PfI-0000nu-1S
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 00:16:44 +0200
Received: by fxi1 with SMTP id 1so4148693fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 15:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=donMrJEvSIjQxybf/3x0nSCY5ktMws9auyfnxrzHpY4=;
	b=C71iahjcQhXgtNFgrwM1qKgIzDLFmFXqCYdpIs674nJPdruOFSBzvHiT3aTVFEG3ag
	YXUUmwzBe4TvBJIy5dP9YOaUhLNseD/QKR7MCnbfCUcC710RIPXZOJ9PtjPgbON2rEQ7
	LYmOcotssdjFHNqheYE5e/FGmXVD4rOFxePpU=
Received: by 10.223.37.26 with SMTP id v26mr3917321fad.100.1316383888618;
	Sun, 18 Sep 2011 15:11:28 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t19sm19649075faj.23.2011.09.18.15.11.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 15:11:27 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Sep 2011 02:11:16 +0400
Message-Id: <1316383877-30796-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-oe][V2 1/2] gcc-4.5: include libgcov.a into libgcc-dev package
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
X-List-Received-Date: Sun, 18 Sep 2011 22:16:44 -0000

First, this lib is usefull for coverage analysis-enabled building.
Second, this fixes the warning about unpackaged files in libgcc recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc   |    2 +-
 meta-oe/recipes-devtools/gcc/libgcc_4.5.bb |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index aabc1cf..a7f9480 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-PR = "r40"
+PR = "r41"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
diff --git a/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb b/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb
index 8a6c96a..1579c8b 100644
--- a/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb
+++ b/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb
@@ -13,6 +13,7 @@ FILES_${PN} = "${base_libdir}/libgcc*.so.*"
 FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
 
 do_fetch[noexec] = "1"
-- 
1.7.2.5



