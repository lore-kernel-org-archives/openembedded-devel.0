Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Nov 2019 13:38:51 UTC
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id A1D9B7F968
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:38:51 +0000 (UTC)
IronPort-SDR: G8O6TJVHdg3lGn5XUlTEYFv+++FVDAEzTbLMIbEZWJhG40lNL+9jZTf/jpbj+bbg6dXgvrpOcW
	mTS/X8tptZYCHh1LA8SO9f/Pgnm2uxp3Ywtghy8usVCM5KIg97IOyPhV8oSZ3vIGxJrhsrqUNO
	qTMHLHHBoZTqjjxDodvBMSMfsuStToi+eCuP2XVfKL4uTDtttAp5kiO6nfZKma/BAcyJXCvNCH
	U/X9aFBu7R/HtvbwFkKxKItDEma6EuXcfZjtB4v4y/CAc7AdGptWIznaSRVu3z/MAdOL7LVqml
	1gY=
X-IronPort-AV: E=Sophos;i="5.68,320,1569276000"; 
   d="scan'208";a="2634156"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:31:39 +0100
Message-Id: <20191118133139.21612-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][master][zeus][PATCH] libldb: Do not require the "pam" distro feature to be enabled
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
X-List-Received-Date: Mon, 18 Nov 2019 13:38:53 -0000
Content-Transfer-Encoding: 8bit

It was only added because samba was a dependency, but was not removed
again when the dependency on samba was removed in commit 6207331f.

This effectively reverts commit a190c2e3.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-support/libldb/libldb_1.5.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
index 99eb6f9ce..cc24863c6 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
@@ -36,8 +36,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
 SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
 SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
 
-inherit waf-samba distro_features_check
-REQUIRED_DISTRO_FEATURES = "pam"
+inherit waf-samba
 
 S = "${WORKDIR}/ldb-${PV}"
 
-- 
2.21.0


