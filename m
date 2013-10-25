Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 664EF6D2A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 05:23:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9P5NO5w027750
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 22:23:24 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 24 Oct 2013 22:23:23 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Oct 2013 13:23:24 +0800
Message-ID: <1382678604-2326-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] macchanger: fix PN -> BPN in FILES_${PN} for multilibs
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
X-List-Received-Date: Fri, 25 Oct 2013 05:23:23 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
index 2ecfab2..8491dc0 100644
--- a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
+++ b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
@@ -12,9 +12,9 @@ SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
 SRC_URI[sha256sum] = "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
 
 FILES_${PN} = " \
-    ${bindir}/${PN} \
-    ${datadir}/${PN}/wireless.list \
-    ${datadir}/${PN}/OUI.list \
+    ${bindir}/${BPN} \
+    ${datadir}/${BPN}/wireless.list \
+    ${datadir}/${BPN}/OUI.list \
 "
 
 FILES_${PN}-doc = " \
-- 
1.7.10.4


