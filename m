Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Ri5em-0001EF-Um
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jan 2012 15:48:05 +0100
Received: (qmail invoked by alias); 03 Jan 2012 14:40:44 -0000
Received: from p5B0A12EF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.18.239]
	by mail.gmx.net (mp062) with SMTP; 03 Jan 2012 15:40:44 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18wmiBcOzMwQk/RY1T/REQcZnJZxpivoRY/02VlVw
	EAzoTQmV5PZixk
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jan 2012 15:41:48 +0100
Message-Id: <1325601709-13917-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1325601709-13917-1-git-send-email-schnitzeltony@gmx.de>
References: <1325601709-13917-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 1/2] xfce.bbclass: inherit gettext
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
X-List-Received-Date: Tue, 03 Jan 2012 14:48:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/classes/xfce.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index debd645..2350c27 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -1,7 +1,7 @@
 HOMEPAGE = "http://www.xfce.org"
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 
-inherit autotools gtk-icon-cache pkgconfig
+inherit autotools gettext gtk-icon-cache pkgconfig
 
 FILES_${PN} += "${datadir}/icons/* ${datadir}/applications/* ${libdir}/xfce4/modules/*.so*"
 FILES_${PN}-doc += "${datadir}/xfce4/doc"
-- 
1.7.4.4



