Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OtdbQ-0003jH-HS
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 11:39:33 +0200
Received: (qmail invoked by alias); 09 Sep 2010 09:38:49 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp022) with SMTP; 09 Sep 2010 11:38:49 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19cSNNQ3EdcNEkyAW713IOFu4Mrm3l/TtlETLasUq
	ksztc8JKdG2/vG
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 9 Sep 2010 11:23:58 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201009091123.58183.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] clutter-box2d: renamed clutter-box2d_0.10.0_git.bb -> clutter-box2d_git.bb
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
X-List-Received-Date: Thu, 09 Sep 2010 09:39:33 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/clutter/clutter-box2d_0.10.0_git.bb |   12 ------------
 recipes/clutter/clutter-box2d_git.bb        |   12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 recipes/clutter/clutter-box2d_0.10.0_git.bb
 create mode 100644 recipes/clutter/clutter-box2d_git.bb

diff --git a/recipes/clutter/clutter-box2d_0.10.0_git.bb b/recipes/clutter/clutter-box2d_0.10.0_git.bb
deleted file mode 100644
index 4696a01..0000000
--- a/recipes/clutter/clutter-box2d_0.10.0_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require clutter-box2d.inc
-
-SRCREV = "4e72b9c135a9439b82d801c62422531db611f98b"
-
-PR = "${INC_PR}.0"
-PR_append = "+git${SRCREV}"
-
-SRC_URI = "git://git.clutter-project.org/clutter-box2d.git;protocol=git \
-           file://example-data-location.patch \
-          "
-
-S = "${WORKDIR}/git"
diff --git a/recipes/clutter/clutter-box2d_git.bb b/recipes/clutter/clutter-box2d_git.bb
new file mode 100644
index 0000000..4696a01
--- /dev/null
+++ b/recipes/clutter/clutter-box2d_git.bb
@@ -0,0 +1,12 @@
+require clutter-box2d.inc
+
+SRCREV = "4e72b9c135a9439b82d801c62422531db611f98b"
+
+PR = "${INC_PR}.0"
+PR_append = "+git${SRCREV}"
+
+SRC_URI = "git://git.clutter-project.org/clutter-box2d.git;protocol=git \
+           file://example-data-location.patch \
+          "
+
+S = "${WORKDIR}/git"
-- 
1.5.3.4


