Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF7B4786C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 07:59:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6D7xQY4029344
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 00:59:26 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 13 Jul 2018 00:59:25 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jul 2018 00:59:25 -0700
Message-ID: <20180713075925.59746-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] augeas: Upgrade to 1.10.1
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
X-List-Received-Date: Fri, 13 Jul 2018 07:59:26 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Add EXTRA_AUTORECONF += "-I ${S}/gnulib/m4" to
  fix below compile error:
| In file included from ../../../augeas-1.10.1/gnulib/lib/printf-args.h:41,
|                  from ../../../augeas-1.10.1/gnulib/lib/printf-args.c:29:
| ./wchar.h:571:6: error: #if with no expression
|  # if
|       ^
| In file included from ../../../augeas-1.10.1/gnulib/lib/mbrtowc.c:21:
| ./wchar.h:571:6: error: #if with no expression
|  # if
|       ^
| Makefile:1581: recipe for target 'printf-args.lo' failed
| make[4]: *** [printf-args.lo] Error 1

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/augeas/augeas.inc                     | 2 ++
 .../augeas/{augeas_1.5.0.bb => augeas_1.10.1.bb}              | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/augeas/{augeas_1.5.0.bb => augeas_1.10.1.bb} (12%)

diff --git a/meta-oe/recipes-support/augeas/augeas.inc b/meta-oe/recipes-support/augeas/augeas.inc
index 185abae18..c939d4b89 100644
--- a/meta-oe/recipes-support/augeas/augeas.inc
+++ b/meta-oe/recipes-support/augeas/augeas.inc
@@ -31,3 +31,5 @@ do_install_append() {
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libselinux] = "--with-selinux,--without-selinux,libselinux"
+
+EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
diff --git a/meta-oe/recipes-support/augeas/augeas_1.5.0.bb b/meta-oe/recipes-support/augeas/augeas_1.10.1.bb
similarity index 12%
rename from meta-oe/recipes-support/augeas/augeas_1.5.0.bb
rename to meta-oe/recipes-support/augeas/augeas_1.10.1.bb
index c4f62e747..26e191bd3 100644
--- a/meta-oe/recipes-support/augeas/augeas_1.5.0.bb
+++ b/meta-oe/recipes-support/augeas/augeas_1.10.1.bb
@@ -1,4 +1,4 @@
 require augeas.inc
 
-SRC_URI[md5sum] = "01190e455c513124a2dae29a1182c113"
-SRC_URI[sha256sum] = "223bb6e6fe3e9e92277dafd5d34e623733eb969a72a382998d204feab253f73f"
+SRC_URI[md5sum] = "6c0b2ea6eec45e8bc374b283aedf27ce"
+SRC_URI[sha256sum] = "52db256afab261d31cc147eaa1a71795a5fec59e888dfd0b65a84c7aacd6364d"
-- 
2.17.1


