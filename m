Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 087FD7001D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBP7uSXu014089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:28 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:28 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:24 +0800
Message-ID: <e501e2dad6c73436ef9819a2d7f6db27d6e8ce99.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 04/15] jamvm.inc: jamvm recipe cleanup
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:28 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

jamvm.inc's SRC_URI isn't used anymore, all jamvm bb recipes have been
defining their own.

In a rare instance, a build failed because it was using the SRC_URI
defined from jamvm.inc instead (jamvm_git.bb), this cleanup should
prevent this oddity from occuring.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/jamvm/jamvm.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index 5893cbc..777b442 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -15,11 +15,6 @@ RPROVIDES_${PN}_virtclass-native = ""
 
 BBCLASSEXTEND = "native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
-            file://jamvm-jni_h-noinst.patch \
-            file://libffi.patch \
-          "
-
 
 inherit java autotools update-alternatives pkgconfig
 
-- 
1.9.1


