Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLZHL-0002iG-5P
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 12:46:48 +0100
Received: (qmail invoked by alias); 02 Nov 2011 11:40:39 -0000
Received: from p5B0A24CF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.36.207]
	by mail.gmx.net (mp020) with SMTP; 02 Nov 2011 12:40:39 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+buS9nws6bfb5FXtV5h1oEuumXoFLZzINKeuWFr0
	mGhXo/9MlQox2R
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Nov 2011 12:45:14 +0100
Message-Id: <1320234315-14835-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1320234315-14835-1-git-send-email-schnitzeltony@gmx.de>
References: <1320234315-14835-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 2/3] xfce-panel-plugin.bbclass: Add further directories to FILES_${PN}
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
X-List-Received-Date: Wed, 02 Nov 2011 11:46:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Some panel-plugins (e.g xfce4-clipman-plugin) use panel/plugins instead of
  xfce4/panel-plugins.
* build tested on maiden tmp-dir
* run tested all applications and plugins on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/classes/xfce-panel-plugin.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
index 5b89cdc..b2f0678 100644
--- a/meta-xfce/classes/xfce-panel-plugin.bbclass
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -5,5 +5,7 @@ DEPENDS += "libxfce4ui libxfce4util xfce4-panel"
 SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 
 FILES_${PN} += "${datadir}/xfce4/panel-plugins/"
+FILES_${PN} += "${datadir}/xfce4/panel/plugins/"
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/*.so"
+FILES_${PN} += "${libdir}/xfce4/panel/plugins/*.so"
 FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug"
-- 
1.7.4.4



