Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C805D6C397
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 08:05:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6H85CMZ014155
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 01:05:28 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 17 Jul 2019 01:05:05 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jul 2019 16:05:04 +0800
Message-ID: <1563350704-152367-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] libtevent: fix do_package_qa issue
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
X-List-Received-Date: Wed, 17 Jul 2019 08:05:38 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
ERROR: lib32-libtevent-0.10.0-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package contains symlink .so: lib32-python3-tevent path '/work/core2-32-wrsmllib32-linux/lib32-libtevent/0.10.0-r0/packages-split/lib32-python3-tevent/usr/lib/python3.7/site-packages/_tevent.so' [dev-so]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb b/meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb
index 25ad7c1..a581d3a 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.10.0.bb
@@ -55,4 +55,4 @@ RPROVIDES_${PN}-dbg += "python3-tevent-dbg"
 
 FILES_python3-tevent = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
 
-INSANE_SKIP_python3-tevent = "dev-so"
+INSANE_SKIP_${MLPREFIX}python3-tevent = "dev-so"
-- 
2.7.4


