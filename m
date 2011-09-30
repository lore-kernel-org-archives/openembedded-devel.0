Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R9jXj-0003DG-2s
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 22:18:47 +0200
Received: (qmail invoked by alias); 30 Sep 2011 20:13:17 -0000
Received: from p5B0A3E6C.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.62.108]
	by mail.gmx.net (mp011) with SMTP; 30 Sep 2011 22:13:17 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19ez64aIBpeM0f9e1xyGCCGCKYLX2Cgajmo1s9nd8
	fkpzKIWyHFAKI+
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 22:17:11 +0200
Message-Id: <1317413831-3451-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1317413831-3451-1-git-send-email-schnitzeltony@gmx.de>
References: <1317413831-3451-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe V2 2/2] midori: added RRECOMMENDS glib-networking
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
X-List-Received-Date: Fri, 30 Sep 2011 20:18:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When trying to open https://.. midori complains with:

TLS/SSL support not available; install glib-networking

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-oe/recipes-connectivity/midori/midori.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/recipes-connectivity/midori/midori.inc
index 60fd03e..2221134 100644
--- a/meta-oe/recipes-connectivity/midori/midori.inc
+++ b/meta-oe/recipes-connectivity/midori/midori.inc
@@ -30,4 +30,6 @@ do_install() {
 	oe_runmake DESTDIR=${D} install
 }
 
+RRECOMMENDS_${PN} += "glib-networking"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.7.4.4



