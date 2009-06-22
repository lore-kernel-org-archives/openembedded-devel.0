Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MIliq-0000d0-Un
	for Openembedded-devel@lists.openembedded.org;
	Mon, 22 Jun 2009 17:46:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 037EF2C81D
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 15:34:59 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sj8h1dpJLX+i
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 15:34:57 +0000 (UTC)
Received: from [192.168.0.2] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 0E2C32C7FF
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 15:34:56 +0000 (UTC)
Message-ID: <4A3FA4A7.6060404@gmail.com>
Date: Mon, 22 Jun 2009 17:35:03 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Added PREFERRED_PROVIDER_classpath to support JVM in KaeilOS distro
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
X-List-Received-Date: Mon, 22 Jun 2009 15:46:17 -0000
Content-Type: text/x-diff;
	name="0001-Added-PREFERRED_PROVIDER_classpath-to-support-JVM-in.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="0001-Added-PREFERRED_PROVIDER_classpath-to-support-JVM-in.pa";
	filename*1="tch"

From fb8e1708a1511be4e781d396700426fafb20d974 Mon Sep 17 00:00:00 2001
From: Marco Cavallini <m.cavallini@koansoftware.com>
Date: Mon, 22 Jun 2009 11:17:30 +0200
Subject: [PATCH] Added PREFERRED_PROVIDER_classpath to support JVM in KaeilOS distro
 with contribution of Ronetix (www.ronetix.at)


Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 conf/distro/kaeilos.conf |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index 2b3aae8..9827c0a 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -12,7 +12,7 @@
 #DISTRO_VERSION = "2009.1"
 DISTRO_VERSION = "2009.1-test-${DATE}"
 DISTRO_REVISION = "1"
-DISTRO_PR = ".1"
+DISTRO_PR = ".2"
 
 #build staging from packages
 INHERIT += "packaged-staging"
@@ -164,6 +164,8 @@ PREFERRED_PROVIDER_libxss                = "libxss"
 PREFERRED_PROVIDER_bluez-utils-dbus      = "bluez-utils"
 PREFERRED_PROVIDER_bluez-libs            = "bluez4"
 
+PREFERRED_PROVIDER_classpath             ?= "0.97.2"
+
 # we don't ship gtk-directfb by default
 PREFERRED_PROVIDER_gtk+                   ?= "gtk+"
 PREFERRED_PROVIDER_gdk-pixbuf-loader-ani  ?= "gtk+"
-- 
1.5.4.3


