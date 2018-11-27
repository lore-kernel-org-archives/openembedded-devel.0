Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 899176C68F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:09:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR89ew2019917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 00:09:41 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 27 Nov 2018 00:09:40 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 03:09:37 -0500
Message-ID: <20181127080937.3751-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Subject: [meta-networking][PATCH] net-snmp: inherit ptest
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
X-List-Received-Date: Tue, 27 Nov 2018 08:09:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Inherit ptest for net-snmp to create ${PN}-ptest. Update run-ptest as
well to avoid only could be run in the same directory.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest | 3 ++-
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb    | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest b/meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest
index 2334217bc..76514c202 100755
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest
@@ -1,4 +1,5 @@
 #!/bin/sh
 
-cd testing
+workdir=$(dirname `realpath $0`)
+cd ${workdir}/testing
 ./RUNTESTS
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 7794f3880..0250743e7 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -33,7 +33,7 @@ SRC_URI[sha256sum] = "c6291385b8ed84f05890fe4197005daf7e7ee7b082c2e390fa114a9477
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
 
-inherit autotools-brokensep update-rc.d siteinfo systemd pkgconfig perlnative
+inherit autotools-brokensep update-rc.d siteinfo systemd pkgconfig perlnative ptest
 
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D} OTHERLDFLAGS='${LDFLAGS}' HOST_CPPFLAGS='${BUILD_CPPFLAGS}'"
 
-- 
2.19.0.rc2


