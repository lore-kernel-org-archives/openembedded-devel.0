Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1P9CjW-0004p1-M8
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 10:12:15 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 22 Oct 2010 10:11:36 +0200
X-TM-IMSS-Message-ID: <1abf279500008b80@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 1abf279500008b80 for
	<jaap.dejong@nedap.com>; Fri, 22 Oct 2010 10:11:39 +0100
Message-ID: <4CC14738.9070309@nedap.com>
Date: Fri, 22 Oct 2010 10:11:36 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.11) Gecko/20101006 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 22 Oct 2010 08:11:36.0962 (UTC)
	FILETIME=[BF6FB620:01CB71C0]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] cacaoh: patches to get do_install do its work
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
X-List-Received-Date: Fri, 22 Oct 2010 08:12:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

 From 60a5f60af4ad65112452f98d99350fce45332e8e Mon Sep 17 00:00:00 2001
From: Jaap de Jong <jaap.dejong@nedap.com>
Date: Fri, 22 Oct 2010 09:28:25 +0200
Subject: [PATCH] cacaoh: patches to get do_install do its work

Signed-off-by: Jaap de Jong <jaap.dejong@nedap.com>
---
  recipes/cacao/cacaoh-cldc-native_0.98.bb |    2 +-
  recipes/cacao/cacaoh-native.inc          |    2 +-
  recipes/cacao/cacaoh-openjdk-native.inc  |    2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/cacao/cacaoh-cldc-native_0.98.bb 
b/recipes/cacao/cacaoh-cldc-native_0.98.bb
index 9a34b36..44b81fe 100644
--- a/recipes/cacao/cacaoh-cldc-native_0.98.bb
+++ b/recipes/cacao/cacaoh-cldc-native_0.98.bb
@@ -5,7 +5,7 @@ SRC_URI = "\
    "

  do_stage() {
-    install -m 0755 src/cacaoh/.libs/cacaoh 
${STAGING_BINDIR}/cacaoh-cldc-${PV}
+    install -m 0755 src/cacaoh/cacaoh ${STAGING_BINDIR}/cacaoh-cldc-${PV}
  }

  SRC_URI[md5sum] = "8b8907c8b925761c9410bcadb9705346"
diff --git a/recipes/cacao/cacaoh-native.inc 
b/recipes/cacao/cacaoh-native.inc
index 2b3709f..d745107 100644
--- a/recipes/cacao/cacaoh-native.inc
+++ b/recipes/cacao/cacaoh-native.inc
@@ -24,7 +24,7 @@ do_compile() {

  do_install() {
    install -d ${D}${bindir}/cacaoh-${PV}
-  install -m 0755 src/cacaoh/.libs/cacaoh ${D}${bindir}/cacaoh-${PV}
+  install -m 0755 src/cacaoh/cacaoh ${D}${bindir}/cacaoh-${PV}
  }

  NATIVE_INSTALL_WORKS = "1"
diff --git a/recipes/cacao/cacaoh-openjdk-native.inc 
b/recipes/cacao/cacaoh-openjdk-native.inc
index 5070e7e..4afb955 100644
--- a/recipes/cacao/cacaoh-openjdk-native.inc
+++ b/recipes/cacao/cacaoh-openjdk-native.inc
@@ -27,5 +27,5 @@ do_compile() {
  }

  do_install() {
-    install -m 0755 src/cacaoh/.libs/cacaoh 
${STAGING_BINDIR}/cacaoh-openjdk-${PV}
+    install -m 0755 src/cacaoh/cacaoh 
${STAGING_BINDIR}/cacaoh-openjdk-${PV}
  }
-- 
1.7.1



