Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D405F77EE4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 06:07:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7T67wgN009212
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 23:07:58 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 Aug 2017 23:07:57 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Aug 2017 02:07:56 -0400
Message-ID: <1503986876-223948-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] tcpreplay: upgrade to 4.2.6
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
X-List-Received-Date: Tue, 29 Aug 2017 06:07:58 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../tcpreplay/{tcpreplay_4.1.2.bb => tcpreplay_4.2.6.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.1.2.bb => tcpreplay_4.2.6.bb} (59%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.2.6.bb
similarity index 59%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.2.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.2.6.bb
index 6ee9d73..681ef02 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.2.6.bb
@@ -6,10 +6,10 @@ SECTION = "net"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
 
-SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.tar.gz"
+SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "3105b10b07dbc0b07ce2da07a2368359"
-SRC_URI[sha256sum] = "da483347e83a9b5df0e0dbb0f822a2d37236e79dda35f4bc4e6684fa827f25ea"
+SRC_URI[md5sum] = "3e65d5b872e441c6a0038191a3dc7ce9"
+SRC_URI[sha256sum] = "043756c532dab93e2be33a517ef46b1341f7239278a1045ae670041dd8a4531d"
 
 DEPENDS = "libpcap"
 
-- 
2.8.1


