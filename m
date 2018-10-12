Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1B8744AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:14:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9C2DnhX014857
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:14:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 19:14:12 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Oct 2018 10:14:11 +0800
Message-ID: <1539310451-50949-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V3] e2fsprogs: fix test f_detect_junk print error msg
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
X-List-Received-Date: Fri, 12 Oct 2018 02:14:29 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

This test need to check config.h, so install it
to fix below err msg:

grep: ../lib/config.h: No such file or directory
./test/f_detect_junk/script: line 3: [: : integer expression expected
f_detect_junk: detect non-fs file data: ok

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
index 823d18b..beb0a36 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
@@ -129,4 +129,7 @@ do_install_ptest() {
 	find "${D}${PTEST_PATH}" -type f \
 	    \( -name 'Makefile' -o -name 'Makefile.in' -o -name '*.o' -o -name '*.c' -o -name '*.h' \)\
 	    -exec  rm -f {} +
+
+        install -d ${D}${PTEST_PATH}/lib
+        install -m 0644 ${B}/lib/config.h  ${D}${PTEST_PATH}/lib/
 }
-- 
2.7.4


