Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RFxt3-0000Pg-2a
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 02:50:33 +0200
Received: (qmail invoked by alias); 18 Oct 2011 00:44:43 -0000
Received: from p5B0A17D4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.212]
	by mail.gmx.net (mp020) with SMTP; 18 Oct 2011 02:44:43 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX187275gVrQ7e7N8NyqnQhanEl1bInbg6K4WMHE1wn
	RQVeD/oTNtMr+E
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 02:49:19 +0200
Message-Id: <1318898961-19779-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 1/3] xfce-panel-plugin: bbclass for panel plugins
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
X-List-Received-Date: Tue, 18 Oct 2011 00:50:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* based on Koen's patch [1]
* use libxfce4ui instead of libxfcegui4

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035589.html

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/classes/xfce-panel-plugin.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/classes/xfce-panel-plugin.bbclass

diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
new file mode 100644
index 0000000..51e40c9
--- /dev/null
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -0,0 +1,8 @@
+inherit xfce
+
+DEPENDS += "libxfce4ui libxfce4util xfce4-panel"
+
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+
+FILES_${PN} += "${datadir}/xfce4/panel-plugins/"
+FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug"
-- 
1.7.4.4



