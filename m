Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Srua2-0002bp-OK
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 19:32:02 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 98EABEA04D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 19:24:34 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 7899260C20; Thu, 19 Jul 2012 19:20:41 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:20:40 +0200
Message-Id: <8a869e667867e8e7b1e82dcb53ee75dd58805e81.1342677799.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH 9/9] opkg-utils: bump SRCREV to keep python2.6 compatibility
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 17:32:02 -0000

Fix an issue where opkg-utils was using a method that requires at
least python2.7, causing compatibility issues on hosts that are still
using python2.6.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/opkg-utils/opkg-utils_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/opkg-utils/opkg-utils_git.bb b/recipes/opkg-utils/opkg-utils_git.bb
index 997b292..75a1e9a 100644
--- a/recipes/opkg-utils/opkg-utils_git.bb
+++ b/recipes/opkg-utils/opkg-utils_git.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                      file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
+SRCREV = "423ecd36b4782327c16f516885d1248249c7724a"
 PV = "0.1.8+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
            "
-- 
1.7.10.4



