Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RIQC2-0001tY-J0
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 21:28:19 +0200
Received: (qmail invoked by alias); 24 Oct 2011 19:22:20 -0000
Received: from p4FDF19E4.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.25.228]
	by mail.gmx.net (mp044) with SMTP; 24 Oct 2011 21:22:20 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+yfMYgu6CyPFwHlPdPDHDDZeq2taNJcmUwZGfKLt
	CexREThpkN91SO
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 21:26:56 +0200
Message-Id: <1319484417-20399-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1319484417-20399-1-git-send-email-schnitzeltony@gmx.de>
References: <1319484417-20399-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 2/3] xfce-panel-plugin.bbclass: pack modules also from ${libdir}/xfce4/panel-plugins
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
X-List-Received-Date: Mon, 24 Oct 2011 19:28:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* some panel-plugins (e.g xfce4-datetime-plugin) install their modules to
  ${libdir}/xfce4/panel-plugins
* build tested with fresh build dir
* run tested on overo: applications / all available plugins

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/classes/xfce-panel-plugin.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
index 51e40c9..5b89cdc 100644
--- a/meta-xfce/classes/xfce-panel-plugin.bbclass
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -5,4 +5,5 @@ DEPENDS += "libxfce4ui libxfce4util xfce4-panel"
 SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 
 FILES_${PN} += "${datadir}/xfce4/panel-plugins/"
+FILES_${PN} += "${libdir}/xfce4/panel-plugins/*.so"
 FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug"
-- 
1.7.4.4



