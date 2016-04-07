Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDEE36FF60
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 01:44:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u371iNVL025539
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Apr 2016 18:44:23 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Apr 2016 18:44:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Apr 2016 21:44:21 -0400
Message-ID: <1459993461-208289-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] gnome-themes: fix icon-name-mapping not found
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2016 01:44:27 -0000
Content-Type: text/plain

Since libexecdir changed, we need also tweak for gnome-themes.
...
commit f35b2e29d9bfa817e64b83df11ebbbfe0f4e8e5c
Author: Ross Burton <ross.burton@intel.com>
Date:   Tue Apr 30 20:35:54 2013 +0100

    bitbake: set default libexecdir to $prefix/libexec
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index fec29e6..3aa743e 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native glib-2.0 intlt
 RDEPENDS_${PN} = "adwaita-icon-theme"
 
 EXTRA_OECONF += "--enable-all-themes \
-    --with-iconmap=${STAGING_LIBDIR_NATIVE}/icon-naming-utils/icon-name-mapping \
+    --with-iconmap=${STAGING_LIBEXECDIR_NATIVE}/icon-name-mapping \
 "
 
 inherit gnomebase perlnative
@@ -31,6 +31,3 @@ SRC_URI += "file://iconpath-option.patch \
 SRC_URI[archive.md5sum] = "41db9e3cb25d35af2675c599e67944d1"
 SRC_URI[archive.sha256sum] = "8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a"
 GNOME_COMPRESS_TYPE="bz2"
-
-# http://errors.yoctoproject.org/Errors/Details/35130/
-PNBLACKLIST[gnome-themes] ?= "BROKEN: x86_64-linux/usr/lib/icon-naming-utils/icon-name-mapping: No such file or directory"
-- 
1.9.1


