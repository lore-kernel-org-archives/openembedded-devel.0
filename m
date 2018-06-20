Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFFEE76049
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 02:14:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5K2Dr7K002424
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 19:14:08 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 19 Jun 2018 19:13:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jun 2018 19:13:42 -0700
Message-ID: <20180620021342.12415-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gd: Replace strncpy with memccpy to fix -Wstringop-truncation.
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
X-List-Received-Date: Wed, 20 Jun 2018 02:14:18 -0000
Content-Type: text/plain

Fixed:
git/src/gdft.c:1699:2: error: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...gdft.c-Replace-strncpy-with-memccpy-to-fi.patch | 46 ++++++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.2.5.bb             |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch

diff --git a/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch b/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
new file mode 100644
index 0000000..b175c44
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
@@ -0,0 +1,46 @@
+From 85c7694a5cf34597909bdd1ca6931b0f99904c2e Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 19 Jun 2018 00:40:49 -0700
+Subject: [PATCH] annotate.c/gdft.c: Replace strncpy with memccpy to fix
+ -Wstringop-truncation.
+
+Fixed:
+git/src/gdft.c:1699:2: error: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/annotate.c | 2 +-
+ src/gdft.c     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/annotate.c b/src/annotate.c
+index 00aaf49..17df813 100644
+--- a/src/annotate.c
++++ b/src/annotate.c
+@@ -104,7 +104,7 @@ int main(int argc, char *argv[])
+ 					fprintf(stderr, "Font maximum length is 1024, %d given\n", font_len);
+ 					goto badLine;
+ 				}
+-				strncpy(font, st, font_len);
++				memcpy(font, st, font_len);
+ 			}
+ 		} else if(!strcmp(st, "align")) {
+ 			char *st = strtok(0, " \t\r\n");
+diff --git a/src/gdft.c b/src/gdft.c
+index 9fa8295..81dbe41 100644
+--- a/src/gdft.c
++++ b/src/gdft.c
+@@ -1696,7 +1696,7 @@ static char * font_path(char **fontpath, char *name_list)
+ 		gdFree(path);
+ 		return "could not alloc full list of fonts";
+ 	}
+-	strncpy(fontlist, name_list, name_list_len);
++	memcpy(fontlist, name_list, name_list_len);
+ 	fontlist[name_list_len] = 0;
+ 
+ 	/*
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
index 63d9acf..62d0df0 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=07384b3aa2e0d39afca0d6c40286f545"
 DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
+           file://0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch \
           "
 
 SRCREV = "8255231b68889597d04d451a72438ab92a405aba"
-- 
2.10.2


