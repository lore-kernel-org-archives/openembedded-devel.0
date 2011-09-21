Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6G44-0002hY-2N
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 08:13:48 +0200
Received: (qmail invoked by alias); 21 Sep 2011 06:08:29 -0000
Received: from p4FDF1C6D.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.109]
	by mail.gmx.net (mp011) with SMTP; 21 Sep 2011 08:08:29 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/cpHRXoIDcDK+gpUc0b6R8ZVYBibMcmsHZi1BHzy
	h3bDzEe9pWhZEI
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 08:11:50 +0200
Message-Id: <1316585520-18605-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
References: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 01/11] xfce4-dev-tools: add native support
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
X-List-Received-Date: Wed, 21 Sep 2011 06:13:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb       |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
index 3df67ee..3985a0e 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
@@ -3,10 +3,15 @@ SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 
-PR = "r0"
+PR = "r1"
+
+BBCLASSEXTEND = "native"
 
 inherit xfce
 
+# inherited SRC_URI does not work for native
+SRC_URI = "http://archive.xfce.org/src/xfce/xfce4-dev-tools/${@'${PV}'[0:3]}/xfce4-dev-tools-${PV}.tar.bz2"
+
 do_install_append() {
        install -d ${D}${datadir}/aclocal
        install -m 644 m4macros/*.m4 ${D}${datadir}/aclocal/
-- 
1.7.4.4



