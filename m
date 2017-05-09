Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 334CF60069
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:43:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v497hve4022807
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 May 2017 00:43:58 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 9 May 2017 00:43:57 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 May 2017 03:43:56 -0400
Message-ID: <1494315836-230826-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] phoronix-test-suite: remove it from blacklist
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
X-List-Received-Date: Tue, 09 May 2017 07:43:57 -0000
Content-Type: text/plain

The phoronix-test-suite was in blacklist, because the php-cli can't work,
the php-cli can work now, so remove it from blacklist.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb  | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
index e2df4e8..fd244b4 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
@@ -34,5 +34,3 @@ FILES_${PN} += " \
     ${datadir}/mime/packages/openbenchmarking-mime.xml \
     ${systemd_unitdir}/* \
 "
-
-PNBLACKLIST[phoronix-test-suite] ?= "Runtime depends on blacklisted php-cli - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.8.1


