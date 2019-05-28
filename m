Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5CE07E1E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 02:52:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4S2qBOT022709
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 19:52:21 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 27 May 2019 19:52:00 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 May 2019 10:51:58 +0800
Message-ID: <1559011919-113581-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] phoronix-test-suite: add rconflict
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
X-List-Received-Date: Tue, 28 May 2019 02:52:31 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

phoronix-test-suite rdepend on lsb, lsb rdepend on lsbinitscripts,
lsbinitscripts rconflict with initscripts-functions. so also add
rconflict for this one.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb
index 4c7b057..bdd6855 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.6.0.bb
@@ -30,6 +30,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
 SYSTEMD_SERVICE_${PN} = "phoromatic-client.service phoromatic-server.service"
 
 RDEPENDS_${PN} += "bash python php-cli util-linux-lscpu os-release lsb"
+RCONFLICTS_${PN} = "initscripts-functions"
 
 FILES_${PN} += " \
     ${datadir}/phoronix-test-suite \
-- 
2.7.4


