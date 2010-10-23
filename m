Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9Rlb-0003Yu-M2
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:15:24 +0200
Received: by gyg13 with SMTP id 13so1137524gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:14:40 -0700 (PDT)
Received: by 10.150.14.16 with SMTP id 16mr7173286ybn.366.1287792880877;
	Fri, 22 Oct 2010 17:14:40 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id r29sm216413ybn.10.2010.10.22.17.14.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:14:40 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:14:06 -0200
Message-Id: <4cc228f0.1d8b970a.4cbb.0975@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL, BAYES_00, TVD_SPACE_RATIO
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] Add lightmediascanner_git recipe
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
X-List-Received-Date: Sat, 23 Oct 2010 00:15:25 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/lightmediascanner/lightmediascanner_git.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 recipes/lightmediascanner/lightmediascanner_git.bb

diff --git a/recipes/lightmediascanner/lightmediascanner_git.bb b/recipes/lightmediascanner/lightmediascanner_git.bb
new file mode 100644
index 0000000..751d384
--- /dev/null
+++ b/recipes/lightmediascanner/lightmediascanner_git.bb
@@ -0,0 +1,7 @@
+require lightmediascanner.inc
+
+SRCREV = "${AUTOREV}"
+PV = "0.4.0+git_${SRCREV}"
+
+SRC_URI = "git://git.profusion.mobi/users/etrunko/lightmediascanner.git;protocol=git;branch=master"
+S = "${WORKDIR}/git"
-- 
1.7.3.1



