Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MdyYM-0003jP-FQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:43:09 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id A3FFD1B78C; Wed, 19 Aug 2009 20:25:49 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 20:24:33 -0700
Message-Id: <1250738680-20274-2-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
In-Reply-To: <1250738680-20274-1-git-send-email-clarson@mvista.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
Subject: [PATCH] patch.bbclass: catch exceptions raised in the Resolve().
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
X-List-Received-Date: Thu, 20 Aug 2009 03:43:14 -0000

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/patch.bbclass |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/classes/patch.bbclass b/classes/patch.bbclass
index 2f99e4c..2aa63c0 100644
--- a/classes/patch.bbclass
+++ b/classes/patch.bbclass
@@ -530,10 +530,9 @@ python patch_do_patch() {
 		bb.note("Applying patch '%s' (%s)" % (pname, base_path_out(unpacked, d)))
 		try:
 			patchset.Import({"file":unpacked, "remote":url, "strippath": pnum}, True)
-		except:
-			import sys
-			raise bb.build.FuncFailed(str(sys.exc_value))
-		resolver.Resolve()
+			resolver.Resolve()
+		except Exception, e:
+			raise bb.build.FuncFailed(str(e))
 }
 
 EXPORT_FUNCTIONS do_patch
-- 
1.6.0



