Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OmNKy-000467-PQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 10:52:36 +0200
Received: by qyk4 with SMTP id 4so3073686qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 01:52:11 -0700 (PDT)
Received: by 10.224.28.129 with SMTP id m1mr731881qac.138.1282294330702;
	Fri, 20 Aug 2010 01:52:10 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id r38sm2932953qcs.14.2010.08.20.01.52.09
	(version=SSLv3 cipher=RC4-MD5); Fri, 20 Aug 2010 01:52:09 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Aug 2010 03:52:08 -0500
Message-Id: <1282294328-21555-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] esc-node-demo: add missing index.html file
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
X-List-Received-Date: Fri, 20 Aug 2010 08:52:36 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/esc/esc-node-demo_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/esc/esc-node-demo_git.bb b/recipes/esc/esc-node-demo_git.bb
index 814771b..06933e0 100644
--- a/recipes/esc/esc-node-demo_git.bb
+++ b/recipes/esc/esc-node-demo_git.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 PRIORITY = "optional"
 
 PV = "0"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "git://gist.github.com/397547.git;protocol=git \
 "
@@ -15,6 +15,7 @@ S = "${WORKDIR}/git"
 DEMO_FILES = " \
     matrix_command_shell.js \
     hello_world.js \
+    index.html \
 "
 
 do_install() {
-- 
1.5.6.4



