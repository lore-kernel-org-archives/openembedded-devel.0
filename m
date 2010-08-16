Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Ol8RY-0001J7-CV
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 00:46:20 +0200
Received: by vws13 with SMTP id 13so3983377vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 15:45:54 -0700 (PDT)
Received: by 10.220.98.193 with SMTP id r1mr3609125vcn.229.1281998754232;
	Mon, 16 Aug 2010 15:45:54 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id m30sm3811556vbr.19.2010.08.16.15.45.52
	(version=SSLv3 cipher=RC4-MD5); Mon, 16 Aug 2010 15:45:53 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:45:51 -0500
Message-Id: <1281998751-10781-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.212.47
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
X-List-Received-Date: Mon, 16 Aug 2010 22:46:24 -0000

---
 recipes/flex/flex.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/flex/flex.inc b/recipes/flex/flex.inc
index 49b26e8..5d3f076 100644
--- a/recipes/flex/flex.inc
+++ b/recipes/flex/flex.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 
 DEPENDS = "gettext"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 S = "${WORKDIR}/flex-${PV}"
 
@@ -16,3 +16,5 @@ inherit autotools gettext
 # static-only library; that might be an error
 
 FILES_${PN} += "${libdir}/libfl.a"
+
+PSTAGING_DISABLED_virtclass-native = "1"
-- 
1.5.6.4



