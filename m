Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QEQbV-00032A-83
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 20:33:49 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QEQZ5-0004z6-Sd from Tom_Rini@mentor.com ;
	Mon, 25 Apr 2011 11:31:19 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 25 Apr 2011 11:31:19 -0700
Received: from localhost.localdomain ([172.30.80.238]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 25 Apr 2011 12:31:18 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 11:31:11 -0700
Message-Id: <1303756273-22385-2-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 25 Apr 2011 18:31:18.0965 (UTC)
	FILETIME=[F80EDE50:01CC0376]
Cc: koen@dominion.thruhere.net
Subject: [PATCH 1/3] patch.bbclass: Add minver/maxver params
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
X-List-Received-Date: Mon, 25 Apr 2011 18:33:49 -0000

Similar to minrev/maxrev and mindate/maxdate allow us to list patches
in an inc file and only apply them in certain versions.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 classes/patch.bbclass |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/classes/patch.bbclass b/classes/patch.bbclass
index edfb5e9..3045719 100644
--- a/classes/patch.bbclass
+++ b/classes/patch.bbclass
@@ -102,6 +102,18 @@ python patch_do_patch() {
 				bb.note("Patch '%s' applies to earlier revisions" % pname)
 				continue
 
+		if "minver" in parm:
+			srcver = bb.data.getVar('PV', d, 1)
+			if srcver and srcver < parm["minver"]:
+				bb.note("Patch '%s' applies to later versions" % pname)
+				continue
+
+		if "maxver" in parm:
+			srcver = bb.data.getVar('PV', d, 1)
+			if srcver and srcver > parm["maxver"]:
+				bb.note("Patch '%s' applies to earlier versions" % pname)
+				continue
+
 		if "patchdir" in parm:
 			patchdir = parm["patchdir"]
 			if not os.path.isabs(patchdir):
-- 
1.7.0.4



