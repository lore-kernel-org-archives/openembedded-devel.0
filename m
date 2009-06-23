Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1zF-0006Dg-QY
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:08:17 +0200
Received: (qmail 1735 invoked by uid 813007); 23 Jun 2009 08:57:15 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:57:15 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:56:29 +0200
Message-Id: <1245747394-31806-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230941.30107.marcin@juszkiewicz.com.pl>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [STABLE][PATCH 023/125] seppuku: add support for working behind the proxy
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
X-List-Received-Date: Tue, 23 Jun 2009 09:08:18 -0000

From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/seppuku.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/classes/seppuku.bbclass b/classes/seppuku.bbclass
index ab8096e..546738d 100644
--- a/classes/seppuku.bbclass
+++ b/classes/seppuku.bbclass
@@ -319,6 +319,12 @@ python seppuku_eventhandler() {
         passw   = bb.data.getVar("SEPPUKU_PASS",  data, True)
         product = bb.data.getVar("SEPPUKU_PRODUCT", data, True)
         component = bb.data.getVar("SEPPUKU_COMPONENT", data, True)
+	proxy	= bb.data.getVar('HTTP_PROXY', data, True )
+	if (proxy):
+		phl = urllib2.ProxyHandler({'http' : proxy})
+		poster.add_handler(phl)
+		opener.add_handler(phl)
+
         # evil hack to figure out what is going on
         debug_file = open(os.path.join(bb.data.getVar("TMPDIR", data, True),"..","seppuku-log"),"a")
 
-- 
1.6.3.1





