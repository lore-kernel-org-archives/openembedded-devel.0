Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OlRhQ-0006yA-Jw
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 21:20:48 +0200
Received: by qwi2 with SMTP id 2so1338188qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 12:19:13 -0700 (PDT)
Received: by 10.229.233.195 with SMTP id jz3mr5212499qcb.207.1282072752823;
	Tue, 17 Aug 2010 12:19:12 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id r38sm9125361qcs.14.2010.08.17.12.19.10
	(version=SSLv3 cipher=RC4-MD5); Tue, 17 Aug 2010 12:19:11 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 14:19:09 -0500
Message-Id: <1282072749-11465-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1281998751-10781-1-git-send-email-jkridner@beagleboard.org>
References: <1281998751-10781-1-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] flex: disabled packaged staging of native builds
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
X-List-Received-Date: Tue, 17 Aug 2010 19:21:08 -0000

flex-2.5.35 introduced a hardcoded path somewhere that prevents packaged
staging from working.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/flex/flex.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/flex/flex.inc b/recipes/flex/flex.inc
index 49b26e8..39f4ec2 100644
--- a/recipes/flex/flex.inc
+++ b/recipes/flex/flex.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 
 DEPENDS = "gettext"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 S = "${WORKDIR}/flex-${PV}"
 
@@ -16,3 +16,6 @@ inherit autotools gettext
 # static-only library; that might be an error
 
 FILES_${PN} += "${libdir}/libfl.a"
+
+# flex-2.5.35 adds a hard-coded path that causes failures when using packaged staging
+PSTAGING_DISABLED_virtclass-native = "1"
-- 
1.5.6.4



