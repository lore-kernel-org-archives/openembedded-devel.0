Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MeDd1-00018l-Kv
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 21:48:55 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id E705C1B32A; Thu, 20 Aug 2009 12:31:33 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2009 12:30:18 -0700
Message-Id: <1250796618-4437-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.1.rc3.354.g332d31
Subject: [PATCH] distutils-common-base.bbclass: only raise missing python-native error if python-native isn't in DEPENDS.
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
X-List-Received-Date: Thu, 20 Aug 2009 19:48:55 -0000

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/distutils-common-base.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/distutils-common-base.bbclass b/classes/distutils-common-base.bbclass
index 9ca392b..01bf9ea 100644
--- a/classes/distutils-common-base.bbclass
+++ b/classes/distutils-common-base.bbclass
@@ -8,7 +8,9 @@ def python_dir(d):
 	staging_incdir = bb.data.getVar( "STAGING_INCDIR", d, 1 )
 	for majmin in "2.6 2.5 2.4 2.3".split():
 		if os.path.exists( "%s/python%s" % ( staging_incdir, majmin ) ): return "python%s" % majmin
-	raise "No Python in STAGING_INCDIR. Forgot to build python-native ?"
+	if not "python-native" in bb.data.getVar( "DEPENDS", d, 1 ).split():
+		raise "No Python in STAGING_INCDIR. Forgot to build python-native ?"
+	return "INVALID"
 
 PYTHON_DIR = "${@python_dir(d)}"
 
-- 
1.6.1.rc3.354.g332d31



