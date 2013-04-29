Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWnYZ-0001lQ-Fo
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 14:52:08 +0200
Received: by mail-ea0-f181.google.com with SMTP id a11so2501211eae.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=bI0zNbvvc1bf0ziKLFycfilbNPRcvMxvPJamXka5+tA=;
	b=C2qfpyYAMaOzZe9h9EtPhdZmyKCFoIJeG6WzzUw8rXRZ5rcib+Rh3m8wv67odJjZNH
	6tOO4HIWJi/PU9VKx6YKVO4KB7vLBH8aouk2tmQfOg0ljSr0Pi3ur8pKAEh4NruL3TiK
	lqAXLE6BMGa7WSjBgTk9cXs4rK1HCbobnq8u6RDWEXyEZhQLwe/CbnD8t5NfrvnfrVMS
	U//C+on6gLuZFlDFSh9uoPf3KCzEQdSoZ/CjXTRNdl2Fw4N0R3ygKaN40XK33ji+ghDi
	jai3mQeH/HXzda8WK/mw3eWyr5xh3CDkO60qUUYGLP9G6n3PJIeopc7rZbSmn7q8s9kq
	TDEQ==
X-Received: by 10.14.89.69 with SMTP id b45mr77245421eef.10.1367238829567;
	Mon, 29 Apr 2013 05:33:49 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204]) by mx.google.com with ESMTPSA id
	r10sm14784232eez.10.2013.04.29.05.33.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 05:33:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 14:31:21 +0200
Message-Id: <1367238685-16855-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome 1/5] zenity: fix build
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
X-List-Received-Date: Mon, 29 Apr 2013 12:52:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was:
| warning: failed to load external entity "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
| cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
| make[2]: *** [zenity-C.omf] Error 1

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/0001-Makefile.am-don-t-build-help.patch  |   39 ++++++++++++++++++++
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   |    3 +-
 2 files changed, 41 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/zenity/files/0001-Makefile.am-don-t-build-help.patch

diff --git a/meta-gnome/recipes-gnome/zenity/files/0001-Makefile.am-don-t-build-help.patch b/meta-gnome/recipes-gnome/zenity/files/0001-Makefile.am-don-t-build-help.patch
new file mode 100644
index 0000000..50c9cb9
--- /dev/null
+++ b/meta-gnome/recipes-gnome/zenity/files/0001-Makefile.am-don-t-build-help.patch
@@ -0,0 +1,39 @@
+From 17e5606f8c4c8ff26ba18489aad4c484cf8e2949 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 29 Apr 2013 11:34:27 +0200
+Subject: [PATCH] Makefile.am: don't build help
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+it crashes with:
+
+| warning: failed to load external entity "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
+| cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
+| make[2]: *** [zenity-bg.omf] Error 1
+| make[2]: Leaving directory `/home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/zenity/2.32.1-r2/zenity-2.32.1/help'
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Makefile.am |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 03accc1..caec7f0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,8 +1,7 @@
+ SUBDIRS = \
+ 	src	\
+ 	po	\
+-	data	\
+-	help
++	data
+ 
+ EXTRA_DIST = \
+ 	autogen.sh		\
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
index 89d95de..17fe0ee 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
@@ -2,11 +2,12 @@ DESCRIPTION = "Display dialog boxes from the commandline and shell scripts"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "gtk+ glib-2.0 libnotify gnome-doc-utils"
 
 inherit gnome
+SRC_URI += "file://0001-Makefile.am-don-t-build-help.patch"
 SRC_URI[archive.md5sum] = "aa66ec35451b16e424519b4973082170"
 SRC_URI[archive.sha256sum] = "8838be041a07364b62a4281c971392e4a09bb01bb3237a836ec0457ec0ea18ac"
 
-- 
1.7.6.5



