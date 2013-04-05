Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UNzc9-0005rO-HX
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 07:55:11 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id AF736EA048
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2013 07:46:25 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 948E7A40716; Fri,  5 Apr 2013 07:38:14 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Apr 2013 07:37:55 +0200
Message-Id: <001217b18cb77bef28e080695cac129da1800937.1365116038.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365116038.git.apelete@seketeli.net>
References: <cover.1365116038.git.apelete@seketeli.net>
In-Reply-To: <cover.1365116038.git.apelete@seketeli.net>
References: <cover.1365116038.git.apelete@seketeli.net>
Subject: [meta-handheld][PATCH 2/2] ben-nanonote: add DEFAULTTUNE to machine configuration
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
X-List-Received-Date: Fri, 05 Apr 2013 05:55:20 -0000

Add DEFAULTTUNE to machine configuration to ensure that the correct
tune features are selected by default.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 conf/machine/ben-nanonote.conf |    1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/ben-nanonote.conf b/conf/machine/ben-nanonote.conf
index 1ce5815..275dff9 100644
--- a/conf/machine/ben-nanonote.conf
+++ b/conf/machine/ben-nanonote.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the Qi-Hardware's Ben Nanonote
 
 require conf/machine/include/tune-mips32.inc
+DEFAULTTUNE = "mips32el-nf"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-ben-nanonote"
 
-- 
1.7.10.4



