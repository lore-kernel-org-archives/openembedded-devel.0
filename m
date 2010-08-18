Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Oliew-0001Uj-8I
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 15:26:28 +0200
Received: by qwi2 with SMTP id 2so33271qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 06:26:06 -0700 (PDT)
Received: by 10.224.114.1 with SMTP id c1mr5301146qaq.69.1282137966165;
	Wed, 18 Aug 2010 06:26:06 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id q8sm259267qcs.24.2010.08.18.06.26.04
	(version=SSLv3 cipher=RC4-MD5); Wed, 18 Aug 2010 06:26:05 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Aug 2010 08:26:03 -0500
Message-Id: <1282137963-11882-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libidl-native: add dependency on bison-native
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
X-List-Received-Date: Wed, 18 Aug 2010 13:26:28 -0000

bison-native now depends on flex-native, so we should be good there.

The error that would show up without bison:
checking for bison... no
checking for byacc... no
checking for yacc... no
configure: error: yacc is not usable as yacc - consider using bison

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/libidl/libidl-native_0.8.13.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/libidl/libidl-native_0.8.13.bb b/recipes/libidl/libidl-native_0.8.13.bb
index 49860a0..834f4af 100644
--- a/recipes/libidl/libidl-native_0.8.13.bb
+++ b/recipes/libidl/libidl-native_0.8.13.bb
@@ -2,7 +2,9 @@ SECTION = "libs"
 require libidl_${PV}.bb
 inherit native
 
-DEPENDS = "flex-native glib-2.0-native"
+PR = "r1"
+
+DEPENDS = "bison-native glib-2.0-native"
 
 SRC_URI[md5sum] = "b43b289a859eb38a710f70622c46e571"
 SRC_URI[sha256sum] = "bccc7e10dae979518ff012f8464e47ec4b3558a5456a94c8679653aa0b262b71"
-- 
1.5.6.4



