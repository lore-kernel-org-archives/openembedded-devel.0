Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MH0X5-0007Cl-Rv
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:10:52 +0200
Received: from localhost.localdomain (unknown [10.50.1.118])
	by hermes.mvista.com (Postfix) with ESMTP
	id CFE2819405; Wed, 17 Jun 2009 12:00:21 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 12:00:21 -0700
Message-Id: <1245265221-19129-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
Subject: [PATCH] bitbake.conf, package_ipk.bbclass: rather than including FILE in SRC_URI, move that fallback to package_ipk.
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
X-List-Received-Date: Wed, 17 Jun 2009 19:10:52 -0000

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/package_ipk.bbclass |    3 ++-
 conf/bitbake.conf           |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index d4cb3b6..da7abb4 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -260,7 +260,8 @@ python do_package_ipk () {
 			ctrlfile.write("Replaces: %s\n" % ", ".join(rreplaces))
 		if rconflicts:
 			ctrlfile.write("Conflicts: %s\n" % ", ".join(rconflicts))
-		src_uri = bb.data.getVar("SRC_URI", localdata, 1)
+		src_uri = bb.data.getVar("SRC_URI", localdata, 1) or \
+		          bb.data.expand("file://${FILE}", localdata)
 		if src_uri:
 			src_uri = re.sub("\s+", " ", src_uri)
 			ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index adb248e..4cdc56f 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -543,7 +543,7 @@ SRCDATE = "${DATE}"
 SRCREV = "1"
 AUTOREV = "${@bb.fetch.get_srcrev(d)}"
 
-SRC_URI = "file://${FILE}"
+SRC_URI = ""
 
 ##################################################################
 # UI/Interaction Configuration
-- 
1.6.0



