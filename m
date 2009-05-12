Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M3wmC-000887-4R
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 20:32:28 +0200
Received: (qmail 24583 invoked by uid 813007); 12 May 2009 18:25:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 May 2009 18:25:48 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 May 2009 20:25:13 +0200
Message-Id: <1242152713-31425-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1242152713-31425-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1242152713-31425-1-git-send-email-marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 2/2] patch.bbclass: use hashlib with Python 2.5+ - removes DeprecationWarning
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
X-List-Received-Date: Tue, 12 May 2009 18:32:28 -0000

Patch.bbclass change removes DeprecationWarnings too but has to keep
compatibility with Python 2.4 so I had to use try/except block because
hashlib is 2.5+

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/patch.bbclass |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/classes/patch.bbclass b/classes/patch.bbclass
index 075e826..8d2bde0 100644
--- a/classes/patch.bbclass
+++ b/classes/patch.bbclass
@@ -13,14 +13,22 @@ def patch_init(d):
 			return "Error: %s not found." % self.path
 
 	def md5sum(fname):
-		import md5, sys
+		import sys
+
+		# when we move to Python 2.5 as minimal supported
+		# we can kill that try/except as hashlib is 2.5+
+		try:
+			import hashlib
+			m = hashlib.md5()
+		except ImportError:
+			import md5
+			m = md5.new()
 
 		try:
 			f = file(fname, 'rb')
 		except IOError:
 			raise NotFoundError(fname)
 
-		m = md5.new()
 		while True:
 			d = f.read(8096)
 			if not d:
-- 
1.6.3





