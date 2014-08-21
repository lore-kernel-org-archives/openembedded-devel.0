Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 72DC6601A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 02:21:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7L2La02019362
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 19:21:36 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 19:21:36 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Aug 2014 22:21:34 -0400
Message-ID: <1408587694-31616-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lmbench: use BPN instead of PN
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
X-List-Received-Date: Thu, 21 Aug 2014 02:21:44 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Use BPN instead of PN to fix the dirs in scripts
when build with multilib.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 67392b4..38e0d2e 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -56,8 +56,8 @@ do_install () {
             -C src install
     mv ${D}${bindir}/line ${D}${bindir}/lm_line
     install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
-    sed -i -e 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${PN},;' \
-           -e 's,^BINDIR=.*$,BINDIR=${libdir}/${PN},;' \
+    sed -i -e 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${BPN},;' \
+           -e 's,^BINDIR=.*$,BINDIR=${libdir}/${BPN},;' \
            -e 's,^CONFIG=.*$,CONFIG=`$SCRIPTSDIR/config`,;' \
            ${D}${bindir}/lmbench-run
     install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
-- 
2.0.0


