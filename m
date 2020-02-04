Return-Path: <Qi.Chen@windriver.com>
X-Greylist: delayed 3573 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Feb 2020 03:23:13 UTC
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1C9B611D8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 03:23:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0142NLWe027094
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Feb 2020 18:23:31 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 3 Feb 2020 18:23:10 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Feb 2020 18:23:10 -0800
Message-ID: <20200204022310.58916-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] phoronix-test-suite: change python to python3-core in RDEPENDS
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
X-List-Received-Date: Tue, 04 Feb 2020 03:23:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The source codes are actually using python3 instead of python.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../phoronix-test-suite/phoronix-test-suite_9.2.1.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
index 52b341b0e..6525b8ec0 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
@@ -29,7 +29,7 @@ do_install() {
 SYSTEMD_AUTO_ENABLE = "disable"
 SYSTEMD_SERVICE_${PN} = "phoromatic-client.service phoromatic-server.service"
 
-RDEPENDS_${PN} += "bash python php-cli util-linux-lscpu os-release lsb-release"
+RDEPENDS_${PN} += "bash python3-core php-cli util-linux-lscpu os-release lsb-release"
 
 FILES_${PN} += " \
     ${datadir}/phoronix-test-suite \
-- 
2.21.0


