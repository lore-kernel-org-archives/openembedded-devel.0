Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TRgYU-00039p-TP for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 11:50:18 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 48ADAE0117;
	Fri, 26 Oct 2012 09:36:49 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 3A9FF706EF5; Fri, 26 Oct 2012 11:36:49 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2012 11:36:47 +0200
Message-Id: <ff679935b073a89c4e407d259bcc2eea9148fb91.1351244110.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1351244110.git.sledz@dresearch-fe.de>
References: <cover.1351244110.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 1/1] opkg-utils: bump SRCREV to latest
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
X-List-Received-Date: Fri, 26 Oct 2012 09:50:19 -0000

This update contains
* opkg.py/opkg-build: fix creation of tar archives
* opkg-make-index: fix mis-indented else:

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/opkg-utils/opkg-utils_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/opkg-utils/opkg-utils_git.bb b/recipes/opkg-utils/opkg-utils_git.bb
index a9c9803..f1db35e 100644
--- a/recipes/opkg-utils/opkg-utils_git.bb
+++ b/recipes/opkg-utils/opkg-utils_git.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                      file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "49cc783d8e0415059d126ae22c892988717ffda7"
+SRCREV = "f1a9d6701993a6f6b1930b4c2bdb71525aa25320"
 PV = "0.1.8+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
            "
-- 
1.7.10.4



