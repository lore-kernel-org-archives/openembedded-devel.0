Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0577B60616
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 06:19:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8R6JjXE008315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 23:19:45 -0700 (PDT)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 26 Sep 2016 23:19:44 -0700
From: <zhe.he@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Sep 2016 14:19:41 +0800
Message-ID: <1474957181-10534-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] Remove bashisms
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
X-List-Received-Date: Tue, 27 Sep 2016 06:19:45 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 4 +++-
 meta-oe/recipes-support/postgresql/postgresql.inc   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index a62389d..62906fd 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -32,7 +32,9 @@ do_configure() {
 }
 
 do_compile () {
-    . ${CONFIG_SITE}
+    for CONFIG_SITE_ITEM in $CONFIG_SITE; do
+        . $CONFIG_SITE_ITEM
+    done
     if [ X"$ac_cv_uint" = X"yes" ]; then
         CFLAGS="${CFLAGS} -DHAVE_uint"
     fi
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index e473f58..9592c79 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -179,7 +179,7 @@ do_install_append() {
 
     # install COPYRIGHT README HISTORY
     install -d -m 0755 ${D}${docdir}/${BPN}
-    for i in ${B}/{COPYRIGHT,README,HISTORY} ${B}/doc/{KNOWN_BUGS,MISSING_FEATURES,README*,bug.template}; do
+    for i in ${B}/COPYRIGHT ${B}/README ${B}/HISTORY ${B}/doc/KNOWN_BUGS ${B}/doc/MISSING_FEATURES ${B}/doc/README* ${B}/doc/bug.template; do
         [ -f $i ] && install $i ${D}${docdir}/${BPN}
     done
 
-- 
2.8.3


