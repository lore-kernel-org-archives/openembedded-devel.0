Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18DCD745D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 May 2018 23:15:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w41NFDSK004046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 May 2018 16:15:29 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 1 May 2018 16:15:03 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 May 2018 16:15:03 -0700
Message-ID: <20180501231503.119778-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] phoronix-test-suite: disable systemd services by default
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
X-List-Received-Date: Tue, 01 May 2018 23:15:39 -0000
Content-Type: text/plain

Unfortunately, the default behavior for at least the client service is to
reboot the machine if it encounters problems.  Since it is pretty
much guaranteed to need target specific configuration info, we
should not enable the service(s) by default.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../phoronix-test-suite/phoronix-test-suite_7.8.0.bb                 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
index b205821..1f90a71 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
@@ -23,7 +23,12 @@ do_install() {
     fi
 }
 
+# It is not advisable to enable these services by default since they can cause
+# continual target reboots if they encounter network problems.
+#
+SYSTEMD_AUTO_ENABLE = "disable"
 SYSTEMD_SERVICE_${PN} = "phoromatic-client.service phoromatic-server.service"
+
 RDEPENDS_${PN} += "bash python php-cli"
 
 FILES_${PN} += " \
-- 
2.7.4


