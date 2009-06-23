Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MJ1uF-00065H-NE
	for Openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 11:03:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id EBF5B2C81F;
	Tue, 23 Jun 2009 08:51:43 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FX5-SFau4zTx; Tue, 23 Jun 2009 08:51:42 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 8AC2E2C81D;
	Tue, 23 Jun 2009 08:51:40 +0000 (UTC)
Message-ID: <4A4097CA.9040207@gmail.com>
Date: Tue, 23 Jun 2009 10:52:26 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Added PREFERRED_VERSION_classpath to support JVM in KaeilOS distro
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
X-List-Received-Date: Tue, 23 Jun 2009 09:03:07 -0000
Content-Type: text/x-diff;
	name="0001-Added-PREFERRED_VERSION_classpath-to-support-JVM-in.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="0001-Added-PREFERRED_VERSION_classpath-to-support-JVM-in.pat";
	filename*1="ch"

From 182247f1699cd20c442bcb0d1f34bf6b4a555313 Mon Sep 17 00:00:00 2001
From: koan <koan@mozart.(none)>
Date: Tue, 23 Jun 2009 10:49:25 +0200
Subject: [PATCH] Added PREFERRED_VERSION_classpath to support JVM in KaeilOS distro
  with contribution of Ronetix (www.ronetix.at)


Signed-off-by: koan <koan@mozart.(none)>
---
 conf/distro/kaeilos.conf |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index 2b3aae8..1d75976 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -3,7 +3,7 @@
 #@NAME: KaeilOS(R) - http://www.kaeilos.com
 #@DESCRIPTION: KaeilOS Linux Distribution for Kernel 2.6 based devices
 #@MAINTAINER: Marco Cavallini <m.cavallini@koansoftware.com>
-#@VERSION: 28-04-2009
+#@VERSION: 23-04-2009
 #
 # Use this at your own risk, we welcome bugreports filed at 
 #    http://bugs.openembedded.net
@@ -12,7 +12,7 @@
 #DISTRO_VERSION = "2009.1"
 DISTRO_VERSION = "2009.1-test-${DATE}"
 DISTRO_REVISION = "1"
-DISTRO_PR = ".1"
+DISTRO_PR = ".2"
 
 #build staging from packages
 INHERIT += "packaged-staging"
@@ -130,6 +130,9 @@ PREFERRED_VERSION_binutils_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
 
+#Other packages version
+PREFERRED_VERSION_classpath ?= "0.97.2"
+
 # Virtuals:
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
-- 
1.5.4.3


