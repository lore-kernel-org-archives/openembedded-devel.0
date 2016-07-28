Return-Path: <denis@denix.org>
X-Greylist: delayed 3601 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Jul 2016 18:01:04 UTC
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB606072C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2016 18:01:04 +0000 (UTC)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OB1005P7B8XMF00@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	28 Jul 2016 12:00:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=M7bID_UMRky1ekRSCaUA:9
Received: by 100.15.86.14 with SMTP id 214a56b2; Thu, 28 Jul 2016 17:00:47 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 0FA6A1620BD;	Thu, 28 Jul 2016 13:00:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jul 2016 13:00:26 -0400
Message-id: <1469725226-14727-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][krogoth][PATCH] cmake_qt5.bbclass: when using _prepend don't forget to add space at the end
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
X-List-Received-Date: Thu, 28 Jul 2016 18:01:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Previous commit aacd63f10dd58acf7bf6138e2f4734e37dcf0420 introduced a bug by
using _prepend w/o a space at the end, resulting in corrupted EXTRA_OEMAKE
variable in packages that inherit cmake_qt5.bbclass.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 classes/cmake_qt5.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/classes/cmake_qt5.bbclass b/classes/cmake_qt5.bbclass
index 4dc897b..3180fd6 100644
--- a/classes/cmake_qt5.bbclass
+++ b/classes/cmake_qt5.bbclass
@@ -32,4 +32,5 @@ EXTRA_OECMAKE_prepend = " \
     -DOE_QMAKE_PATH_QT_DOCS=${OE_QMAKE_PATH_QT_DOCS} \
     -DOE_QMAKE_PATH_QT_SETTINGS=${OE_QMAKE_PATH_QT_SETTINGS} \
     -DOE_QMAKE_PATH_QT_EXAMPLES=${OE_QMAKE_PATH_QT_EXAMPLES} \
-    -DOE_QMAKE_PATH_QT_TESTS=${OE_QMAKE_PATH_QT_TESTS}"
+    -DOE_QMAKE_PATH_QT_TESTS=${OE_QMAKE_PATH_QT_TESTS} \
+"
-- 
2.7.4


