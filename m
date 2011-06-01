Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116]
	helo=fsc-480-012-88.intern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1QRfI9-0005Gm-CX
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 08:52:33 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 1002)
	id 625397207D; Wed,  1 Jun 2011 08:39:12 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 08:39:00 +0200
Message-Id: <1306910340-25453-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] iotop: add missing runtime dependency
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
X-List-Received-Date: Wed, 01 Jun 2011 06:52:33 -0000

Fixes runtime error:

  "No module named locale
   To run an uninstalled copy of iotop,
   launch iotop.py in the top directory"

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/iotop/iotop_0.2.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/iotop/iotop_0.2.1.bb b/recipes/iotop/iotop_0.2.1.bb
index 12ccc77..0d3e387 100644
--- a/recipes/iotop/iotop_0.2.1.bb
+++ b/recipes/iotop/iotop_0.2.1.bb
@@ -1,8 +1,8 @@
 HOMEPAGE = "http://guichaz.free.fr/iotop/"
 LICENSE = "GPL"
-PR = "r3"
+PR = "r4"
 
-RDEPENDS_${PN} = "python-distutils python-curses python-setuptools python-textutils"
+RDEPENDS_${PN} = "python-distutils python-curses python-setuptools python-textutils python-codecs"
 
 SRC_URI = "http://guichaz.free.fr/iotop/files/${PN}-${PV}.tar.bz2"
 
-- 
1.7.1



