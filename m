Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetUR-0005P1-KQ
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:59:23 +0100
Received: (qmail 28625 invoked by uid 813007); 4 Mar 2009 15:54:23 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:23 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQF-0001Fj-Jh; Wed, 04 Mar 2009 16:54:15 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:17 +0100
Message-Id: <1236182004-4523-63-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 62/70] base.bbclass: Add read_subpkgdata_dict function (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:00:29 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5389 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/base.bbclass |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 18afc1a..db57d26 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1061,6 +1061,19 @@ python read_subpackage_metadata () {
 			bb.data.setVar(key, sdata[key], d)
 }
 
+
+#
+# Collapse FOO_pkg variables into FOO
+#
+def read_subpkgdata_dict(pkg, d):
+	import bb
+	ret = {}
+	subd = read_pkgdatafile(get_subpkgedata_fn(pkg, d))
+	for var in subd:
+		newvar = var.replace("_" + pkg, "")
+		ret[newvar] = subd[var]
+	return ret
+
 # Make sure MACHINE isn't exported
 # (breaks binutils at least)
 MACHINE[unexport] = "1"
-- 
1.6.1.3





