Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17l-00006O-VO
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:58 +0200
Received: by mail-ea0-f169.google.com with SMTP id m14so3423520eaj.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=7Wje8EzZq6EnNXpxQxFS8OvhxmLUWrEU09Ci4kyNtyM=;
	b=EP+izEhWE1Fiou4C/JMtcBb9VsYAYVqyYvNMJByg9yrzk5PepAqItFc5ztnvtfv5lo
	TWSQ4pS3mSbpk/Gixsu2/5LvihKDZKPo2jwlgM4zOjkM/KrO1ZlAIk0xSXObet+W1+2u
	WnVcxP8jEWN7FskZr9+UnrzoECVWrG6RLLNF/CKFnHCloRjKSiahvPaKzP/GSMt5HnzA
	Iz7TDDqAibWN8D5iU3VeYMWwILvtRAXaxzThSUw97hp/6qGpn3PRXVjjTo0ndo0GNxKp
	O0HKZiR6FR3WRsDIwkCF2rYCFaJ+VCy6ZxXCj0w6t9jxMg6WI9bWxqkGitTp4rO8W8b4
	SuQA==
X-Received: by 10.15.111.75 with SMTP id ci51mr18425485eeb.7.1368959259284;
	Sun, 19 May 2013 03:27:39 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:13 +0200
Message-Id: <1368959233-28288-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 11/11] gnome-system-monitor: fix build after gtkmm update
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
X-List-Received-Date: Sun, 19 May 2013 10:45:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...0002-src-procman.cpp-include-main-gtkmm.h.patch |   49 ++++++++++++++++++++
 .../gnome-system-monitor_2.28.2.bb                 |    7 ++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/files/0002-src-procman.cpp-include-main-gtkmm.h.patch

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0002-src-procman.cpp-include-main-gtkmm.h.patch b/meta-gnome/recipes-gnome/gnome-system-monitor/files/0002-src-procman.cpp-include-main-gtkmm.h.patch
new file mode 100644
index 0000000..7b67281
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/files/0002-src-procman.cpp-include-main-gtkmm.h.patch
@@ -0,0 +1,49 @@
+From acff719983aa1294148dc4a367c48957f5510eff Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 17 May 2013 18:25:56 +0200
+Subject: [PATCH] src/procman.cpp: include main gtkmm.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+after update of gtkmm build failed with:
+
+In file included from /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gtkmm-2.4/gtkmm/main.h:33:0,
+                 from procman.cpp:26:
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:92:7: error: 'Value' is not a template
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:92:54: error: expected template-name before '<' token
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:92:54: error: expected '{' before '<' token
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:92:54: error: expected unqualified-id before '<' token
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:174:7: error: 'Value' is not a template
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:174:30: error: 'Glib::Value' is not a template type
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:174:58: error: expected template-name before '<' token
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:207:7: error: 'Value' is not a template
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:207:24: error: 'Glib::Value' is not a template type
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:207:51: error: expected template-name before '<' token
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:274:7: error: 'Value' is not a template
+/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gdkmm-2.4/gdkmm/types.h:274:32: error: 'Glib::Value' is not a template type
+<...>
+
+Upstream-Status: Backport
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/procman.cpp |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/procman.cpp b/src/procman.cpp
+index b5c0d0a..d9b4b3f 100644
+--- a/src/procman.cpp
++++ b/src/procman.cpp
+@@ -23,7 +23,7 @@
+ 
+ #include <locale.h>
+ 
+-#include <gtkmm/main.h>
++#include <gtkmm.h>
+ #include <giomm/volumemonitor.h>
+ #include <giomm/init.h>
+ #include <glib.h>
+-- 
+1.7.4.4
+
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index 7764b71..4e0d0da 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
@@ -2,14 +2,17 @@ DESCRIPTION = "Gnome system monitor"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11/gnome"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils gnome-icon-theme libwnck gtk+ dbus-glib librsvg"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "3f0bca9b0ebc7a365466851cd580d167"
 SRC_URI[archive.sha256sum] = "b628edfd39e3a6b374ce133f367d3568475eb4e981a367f4f9d62a9784e5ae59"
-SRC_URI += "file://0001-Fix-glib-includes.patch"
+SRC_URI += " \
+    file://0001-Fix-glib-includes.patch \
+    file://0002-src-procman.cpp-include-main-gtkmm.h.patch \
+"
 
 do_configure_prepend() {
     sed -i -e s:help::g ${S}/Makefile.am
-- 
1.7.4.4



