Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39E5B78267
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 06:00:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M60Z6E013299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 23:00:36 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 21 Aug 2017 23:00:35 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 14:01:19 +0800
Message-ID: <1503381679-15466-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-oe][PATCH] makedumpfile: update to 1.6.2
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
X-List-Received-Date: Tue, 22 Aug 2017 06:00:35 -0000
Content-Type: text/plain

Remove add-proper-format-string-to-print-a-str.patch since it had been
merged in upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...e-Add-proper-format-string-to-print-a-str.patch | 35 ----------------------
 ...makedumpfile_1.6.1.bb => makedumpfile_1.6.2.bb} |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.1.bb => makedumpfile_1.6.2.bb} (87%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch
deleted file mode 100644
index 056a0ba..0000000
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0fff28f31aef9ad1d5a817216a3c98ba9d605106 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 19 Jun 2017 23:52:14 -0700
-Subject: [PATCH] makedumpfile: Add proper format string to print a string
-
-Fix
-makedumpfile.c: In function 'write_eraseinfo':
-makedumpfile.c:8273:4: error: format not a string literal and no format arguments [-Werror=format-security]
-    DEBUG_MSG(obuf);
-    ^~~~~~~~~
-makedumpfile.c:8273:4: error: format not a string literal and no format arguments [-Werror=format-security]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- makedumpfile.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/makedumpfile.c b/makedumpfile.c
-index e69b6df..8b8a6b0 100644
---- a/makedumpfile.c
-+++ b/makedumpfile.c
-@@ -8270,7 +8270,7 @@ write_eraseinfo(struct cache_data *cd_page, unsigned long *size_out)
- 			}
- 			sprintf(obuf, "erase %s %s", erase_info[i].symbol_expr,
- 							size_str);
--			DEBUG_MSG(obuf);
-+			DEBUG_MSG("%s", obuf);
- 			if (!write_cache(cd_page, obuf, strlen(obuf)))
- 				goto out;
- 			size_eraseinfo += strlen(obuf);
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.1.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb
similarity index 87%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.1.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb
index 83bbf7f..d6f2d80 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.1.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb
@@ -24,10 +24,9 @@ SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/makedumpfile/${BPN}-${PV}.tar.gz \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
     file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
-    file://0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch \
 "
-SRC_URI[md5sum] = "16c0ae9902ae57be4a603a6ab1e86c53"
-SRC_URI[sha256sum] = "0b6e73106998670407887de9e1a505b3a2dbb2fb517a4b968a665eda8fb097ce"
+SRC_URI[md5sum] = "72be5bf973eed898c5127e3abc466583"
+SRC_URI[sha256sum] = "ee3d21cb4032a60bd2c802d1d8b21b9f399710e1574f8de8ead5ab50cd821a6d"
 
 SECTION = "base"
 
-- 
2.7.4


