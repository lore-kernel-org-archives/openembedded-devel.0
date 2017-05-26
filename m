Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4257822F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 07:37:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4Q7baj7004377
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 May 2017 00:37:36 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 26 May 2017 00:37:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 May 2017 03:37:29 -0400
Message-ID: <e05067141edbcdba4d0e7559d6de3a4eae8f620f.1495783956.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1495783956.git.hongxu.jia@windriver.com>
References: <cover.1495783956.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 1/4] gnome-themes: remove PNBLACKLIST
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
X-List-Received-Date: Fri, 26 May 2017 07:37:38 -0000
Content-Type: text/plain

- Since gtk-engines was removed from PNBLACKLIST,
  so we could build gnome-themes

- Add glib-2.0-native to DEPENDS.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index e8f8314..1a89f48 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2b543dc97eb7594d026af39d9b54204b"
 PR = "r3"
 
 SECTION = "x11/gnome"
-DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
+DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native \
+           glib-2.0 intltool-native libxml-simple-perl-native \
+           glib-2.0-native \
+"
 RDEPENDS_${PN} = "adwaita-icon-theme"
 
 EXTRA_OECONF += "--enable-all-themes \
@@ -32,4 +35,3 @@ SRC_URI[archive.md5sum] = "41db9e3cb25d35af2675c599e67944d1"
 SRC_URI[archive.sha256sum] = "8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a"
 GNOME_COMPRESS_TYPE="bz2"
 
-PNBLACKLIST[gnome-themes] ?= "Depends on blacklisted gtk-engines - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.8.1


