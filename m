Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13CDB60030
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 06:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7J6SXYK014464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 23:28:33 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 18 Aug 2014 23:28:32 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Aug 2014 14:28:31 +0800
Message-ID: <1408429711-18797-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] numactl: fix the ptest
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
X-List-Received-Date: Tue, 19 Aug 2014 06:28:35 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. one test case is not installed
2. install a copy of numactl into ptest dir, since the test
script is using the relative path to run numactl

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/numactl/numactl_2.0.9.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/numactl/numactl_2.0.9.bb b/meta-oe/recipes-support/numactl/numactl_2.0.9.bb
index bbb3393..651277d 100644
--- a/meta-oe/recipes-support/numactl/numactl_2.0.9.bb
+++ b/meta-oe/recipes-support/numactl/numactl_2.0.9.bb
@@ -33,11 +33,12 @@ do_install_ptest() {
         local test_binaries="checkaffinity checktopology distance	\
 		ftok mbind_mig_pages migrate_pages move_pages mynode	\
 		nodemap pagesize prefered printcpu randmap realloc_test	\
-		regress regress2 runltp shmtest tbitmap tshared"
+		regress regress2 runltp shmtest tbitmap tshared bind_range"
 
 	[ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
 	for i in $test_binaries; do
 		install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
 	done
 	install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
+	install -m 0755 ${B}/numactl ${D}${PTEST_PATH}/
 }
-- 
1.7.10.4


