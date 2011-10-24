Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RIQC1-0001tW-P2
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 21:28:18 +0200
Received: (qmail invoked by alias); 24 Oct 2011 19:22:19 -0000
Received: from p4FDF19E4.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.25.228]
	by mail.gmx.net (mp044) with SMTP; 24 Oct 2011 21:22:19 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1809GsEBuQ0vD/6KyFAk/uAj6dMfOfLrJK0puLPWt
	+C+Qlj9VEKeDCN
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 21:26:55 +0200
Message-Id: <1319484417-20399-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 1/3] xfce.bbclass: Move static libraries to ${PN}-staticdev
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
X-List-Received-Date: Mon, 24 Oct 2011 19:28:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested with fresh build dir
* run tested on overo: applications / all available plugins

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/classes/xfce.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index 5b12cba..1a13fdc 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -7,5 +7,6 @@ FILES_${PN} += "${datadir}/icons/* ${datadir}/applications/* ${libdir}/xfce4/mod
 FILES_${PN}-doc += "${datadir}/xfce4/doc"
 
 FILES_${PN}-dev += "${libdir}/xfce4/*/*.la"
+FILES_${PN}-staticdev += "${libdir}/xfce4/*/*.a"
 FILES_${PN}-dbg += "${libdir}/xfce4/*/.debug"
 
-- 
1.7.4.4



