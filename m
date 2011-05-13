Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QKrl5-00036n-W2
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 14:46:20 +0200
Received: from localhost.localdomain (79.51.85.13) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C06BF0065; Fri, 13 May 2011 14:43:28 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Fri, 13 May 2011 14:42:59 +0200
Message-Id: <1305290588-7057-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305290080.2448.3.camel@gnutoo-laptop>
References: <1305290080.2448.3.camel@gnutoo-laptop>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/12] pointercal-xinput: add support for bug20
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
X-List-Received-Date: Fri, 13 May 2011 12:46:20 -0000

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 .../pointercal-xinput/bug20/pointercal.xinput      |    1 +
 recipes/xinput-calibrator/pointercal-xinput_0.0.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput

diff --git a/recipes/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput b/recipes/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput
new file mode 100644
index 0000000..50e2632
--- /dev/null
+++ b/recipes/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput
@@ -0,0 +1 @@
+xinput set-int-prop "TSC2004 Touchscreen" "Evdev Axis Calibration" 32 239 10 232 6;
diff --git a/recipes/xinput-calibrator/pointercal-xinput_0.0.bb b/recipes/xinput-calibrator/pointercal-xinput_0.0.bb
index 2d62f20..fa298b3 100644
--- a/recipes/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/recipes/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
 LICENSE = "MIT/X11"
 SECTION = "base"
 
-PR = "r2"
+PR = "r3"
 SRC_URI = "file://pointercal.xinput"
 S = "${WORKDIR}"
 
-- 
1.7.0.4



