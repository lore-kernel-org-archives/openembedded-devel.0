Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RpEzx-0004mH-LW
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 09:11:29 +0100
Received: (qmail invoked by alias); 23 Jan 2012 07:43:38 -0000
Received: from p5B0A202F.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.32.47]
	by mail.gmx.net (mp029) with SMTP; 23 Jan 2012 08:43:38 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18THB8aERMTlLxKfOwPwjchpK/rV5oqc1vdO16/+r
	6qWaHrqXO9HTcP
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 08:45:29 +0100
Message-Id: <1327304731-4251-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe 1/3] babl: initial add 0.1.6
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
X-List-Received-Date: Mon, 23 Jan 2012 08:11:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

inspired by classic-oe [1]

[1] http://cgit.openembedded.org/openembedded/tree/recipes/gimp/babl_git.bb

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-oe/recipes-graphics/babl/babl_0.1.6.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/babl/babl_0.1.6.bb

diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.6.bb b/meta-oe/recipes-graphics/babl/babl_0.1.6.bb
new file mode 100644
index 0000000..005b85e
--- /dev/null
+++ b/meta-oe/recipes-graphics/babl/babl_0.1.6.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Babl is a dynamic, any to any, pixel format conversion library."
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
+
+inherit gnome
+
+SRC_URI = "ftp://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "dc960981a5ec5330fc1c177be9f59068"
+SRC_URI[sha256sum] = "319b9004a5366101fd522da02cc983a5d0f50a17af0fa5cbce3535e31bce19a4"
+
+FILES_${PN} += "${libdir}/babl-*/*.so"
+FILES_${PN}-dev += "${libdir}/babl-*/*.la"
+FILES_${PN}-dbg += "${libdir}/babl-*/.debug/"
-- 
1.7.4.4



