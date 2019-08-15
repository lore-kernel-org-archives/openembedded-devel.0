Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D39AF7F2F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:32:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7FEWaLf013513
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 07:32:36 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 15 Aug 2019 07:32:35 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Aug 2019 10:32:30 -0400
Message-ID: <20190815143230.69482-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-oe][Patch] packagegroup-tools-bluetooth: correct RDEPENDS
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
X-List-Received-Date: Thu, 15 Aug 2019 14:32:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

RDEPENDS_${PN} is wrongly removed and then packagegroup-tools-bluetooth
requires no package now.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-tools-bluetooth.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index 2b4448a22..efa3467a7 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -11,7 +11,7 @@ These tools are used at runtime."
 
 inherit packagegroup
 
-RDEPENDS_bluez5 = " \
+RDEPENDS_${PN} = " \
     bluez5-noinst-tools \
     bluez5-obex \
     bluez5-testtools  \
-- 
2.20.0


