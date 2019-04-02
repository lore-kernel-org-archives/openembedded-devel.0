Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 369B27CC02
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 19:12:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x32JCuDk029798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Apr 2019 12:12:56 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 2 Apr 2019 12:12:55 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Apr 2019 12:12:55 -0700
Message-ID: <20190402191255.92427-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] tcpreplay: update to version 4.3.2
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
X-List-Received-Date: Tue, 02 Apr 2019 19:12:56 -0000
Content-Type: text/plain

Includes fixes for CVE-20198376, -8377, and -8381.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../tcpreplay/{tcpreplay_4.2.6.bb => tcpreplay_4.3.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.2.6.bb => tcpreplay_4.3.2.bb} (75%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.2.6.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb
similarity index 75%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.2.6.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb
index 681ef02..a808c27 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.2.6.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "3e65d5b872e441c6a0038191a3dc7ce9"
-SRC_URI[sha256sum] = "043756c532dab93e2be33a517ef46b1341f7239278a1045ae670041dd8a4531d"
+SRC_URI[md5sum] = "dfa0d1b3dfd2cd316291a7a20563b649"
+SRC_URI[sha256sum] = "4f479bd9196cafde70c58ab072ca4959ecc5278555cf1aa7cf42f7f210daa951"
 
 DEPENDS = "libpcap"
 
-- 
2.7.4


