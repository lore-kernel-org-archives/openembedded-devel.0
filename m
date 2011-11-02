Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLZHK-0002iE-EV
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 12:46:48 +0100
Received: (qmail invoked by alias); 02 Nov 2011 11:40:38 -0000
Received: from p5B0A24CF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.36.207]
	by mail.gmx.net (mp020) with SMTP; 02 Nov 2011 12:40:38 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18eLcVKDRIe/cuh6wUHWL17JWh0UboebfEz/jS7ja
	OHzVxXI64rPyYd
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Nov 2011 12:45:13 +0100
Message-Id: <1320234315-14835-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 1/3] xfce.bbclass: Add further folders for ${PN}-dev/-staticdev/-dbg
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

* Some panel-plugins (e.g xfce4-clipman-plugin) store libraries in
  /usr/lib/xfce4/panel/plugins instead of
  /usr/lib/xfce4/panel-plugins.
* build tested on maiden tmp-dir
* run tested all applications and plugins on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/classes/xfce.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index 1a13fdc..debd645 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -7,6 +7,9 @@ FILES_${PN} += "${datadir}/icons/* ${datadir}/applications/* ${libdir}/xfce4/mod
 FILES_${PN}-doc += "${datadir}/xfce4/doc"
 
 FILES_${PN}-dev += "${libdir}/xfce4/*/*.la"
+FILES_${PN}-dev += "${libdir}/xfce4/*/*/*.la"
 FILES_${PN}-staticdev += "${libdir}/xfce4/*/*.a"
+FILES_${PN}-staticdev += "${libdir}/xfce4/*/*/*.a"
 FILES_${PN}-dbg += "${libdir}/xfce4/*/.debug"
+FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
 
-- 
1.7.4.4



