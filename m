Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PosiT-0006Jm-Gv
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 08:19:25 +0100
Received: (qmail invoked by alias); 14 Feb 2011 07:18:16 -0000
Received: from p5DE49D9B.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [93.228.157.155]
	by mail.gmx.net (mp042) with SMTP; 14 Feb 2011 08:18:16 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18502Bbd3I5q/L7pY2m/XpbYBT4RG9EuRw7IMFNq5
	YwVjFa9l5j/Kij
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 08:14:17 +0100
Message-Id: <1297667657-24563-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
Subject: [PATCH] clutter: get dependency to json-glib to work
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
X-List-Received-Date: Mon, 14 Feb 2011 07:19:25 -0000

* Error on fresh tmp build was
* | checking for installed JSON-GLib... configure: error: not found
* | ERROR: Function do_configure failed

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/clutter/clutter_1.4.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/clutter/clutter_1.4.2.bb b/recipes/clutter/clutter_1.4.2.bb
index 12b6eb5..08e52d5 100644
--- a/recipes/clutter/clutter_1.4.2.bb
+++ b/recipes/clutter/clutter_1.4.2.bb
@@ -1,6 +1,6 @@
 require clutter.inc
 
-DEPENDS += "json-glib"
+STDDEPENDS += "json-glib"
 
 PR = "${INC_PR}.1"
 
-- 
1.7.2.3



