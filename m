Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokkh-0001He-N9
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:07 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id D0069189478; Tue, 31 Mar 2009 22:40:15 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:15 +0200
Message-Id: <1238532015-3141-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] initscripts: set alignment to 0 for armv7a
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:08 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/initscripts/files/arm/alignment.sh |    8 ++++++--
 recipes/initscripts/initscripts_1.0.bb     |    2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes/initscripts/files/arm/alignment.sh b/recipes/initscripts/files/arm/alignment.sh
index 32a9eaa..1082908 100644
--- a/recipes/initscripts/files/arm/alignment.sh
+++ b/recipes/initscripts/files/arm/alignment.sh
@@ -1,6 +1,10 @@
 #!/bin/sh
 
-if [ -e /proc/cpu/alignment ] && ! [ $(uname -m) = "armv7l" ]; then
-   echo "3" > /proc/cpu/alignment
+if [ -e /proc/cpu/alignment ] ; then
+   if [ $(uname -m) = "armv7l" ]; then
+       echo "0" > /proc/cpu/alignment
+   else
+       echo "3" > /proc/cpu/alignment
+   fi
 fi
 
diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts/initscripts_1.0.bb
index b497576..556fbe4 100644
--- a/recipes/initscripts/initscripts_1.0.bb
+++ b/recipes/initscripts/initscripts_1.0.bb
@@ -4,7 +4,7 @@ PRIORITY = "required"
 DEPENDS = "makedevs"
 RDEPENDS = "makedevs"
 LICENSE = "GPL"
-PR = "r112"
+PR = "r113"
 
 SRC_URI = "file://functions \
            file://halt \
-- 
1.5.6.5



