Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUO9-0007Dq-9g
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:05 +0100
Received: by yie16 with SMTP id 16so1651053yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=IrInTPbZjy117rCSSk7jWdN0fOx1KsoHaH+zo280XrM=;
	b=dD9T6F5uAy2MUjoPNkPqrMvyh0l7J7Tb68cFJ/zOTG0lShwjNEFOzUZZhirGr9Z4B6
	JA8M2bGVVCjutwHw2FIL74mR2PhnO6epOQuLqS6aVwCl2B6cu21cE2LKFlSN/1uNlGRn
	rX0M4hYKZDIDA4dHEen1Fx8YttYR4EKXwy6Jw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=IXMZmIjuxu4s2ZH2qDBT3AWBpOleSZenMu368ySIvYlbgNMQsBbKOhyQ1yRmMr+5xy
	mK6Hh7jLLr/icZJVshBJvkkHpsqz0iPpbet5pb6yEsMjPORkeG2fS8bEDDL+EvsYcQW7
	GnIRYiI9fJchQt+3k98x523BzYLnKaZ+x1ZIE=
Received: by 10.147.98.7 with SMTP id a7mr1545256yam.4.1298051031214;
	Fri, 18 Feb 2011 09:43:51 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.43.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:43:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:17 +0000
Message-Id: <1298051011-10445-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 02/16] python-dbus: update to 0.83.2 and fix rpath to use absolute path
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:05 -0000

In case prefix and exec_prefix are empty, rpath can end up with no
absolute paths thus failing to build due a linking issue.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/python/python-dbus_0.83.0.bb |   29 -----------------------------
 recipes/python/python-dbus_0.83.2.bb |   33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 29 deletions(-)
 delete mode 100644 recipes/python/python-dbus_0.83.0.bb
 create mode 100644 recipes/python/python-dbus_0.83.2.bb

diff --git a/recipes/python/python-dbus_0.83.0.bb b/recipes/python/python-dbus_0.83.0.bb
deleted file mode 100644
index 9766604..0000000
--- a/recipes/python/python-dbus_0.83.0.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "Python bindings for DBus, a socket-based message bus system for interprocess communication"
-SECTION = "devel/python"
-HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
-LICENSE = "MIT"
-DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native python-epydoc-native"
-PR = "ml2"
-
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
-S = "${WORKDIR}/dbus-python-${PV}"
-
-inherit distutils-base autotools pkgconfig
-
-export BUILD_SYS
-export HOST_SYS
-
-RDEPENDS_${PN} = "\
-  python-io \
-  python-lang \
-  python-logging \
-  python-threading \
-  python-xml \
-"
-
-FILES_${PN}-dev += "\
-  ${libdir}/pkgconfig \
-"
-
-SRC_URI[md5sum] = "562c78876219bf458d79a041af18293d"
-SRC_URI[sha256sum] = "89dd1d5aa5c2ba04677d1aa2616caa50274d8c08f3d6bc164e6f7b9930776191"
diff --git a/recipes/python/python-dbus_0.83.2.bb b/recipes/python/python-dbus_0.83.2.bb
new file mode 100644
index 0000000..7c6eebb
--- /dev/null
+++ b/recipes/python/python-dbus_0.83.2.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Python bindings for DBus, a socket-based message bus system for interprocess communication"
+SECTION = "devel/python"
+HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
+LICENSE = "MIT"
+DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native python-epydoc-native"
+PR = "ml0"
+
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
+S = "${WORKDIR}/dbus-python-${PV}"
+
+inherit distutils-base autotools pkgconfig
+
+export BUILD_SYS
+export HOST_SYS
+
+RDEPENDS_${PN} = "\
+  python-io \
+  python-lang \
+  python-logging \
+  python-threading \
+  python-xml \
+"
+
+FILES_${PN}-dev += "\
+  ${libdir}/pkgconfig \
+"
+
+do_configure_append() {
+	find ${S} -name Makefile | xargs -n 1 sed -i 's,prefix}lib,prefix}/lib,g'
+}
+
+SRC_URI[md5sum] = "4ebcaa905bdcb4132b915196b0a3691b"
+SRC_URI[sha256sum] = "883729c98f40790021e3be0f7028ae863ee1c4a7b922a5578c1342592adfff64"
-- 
1.7.2.3



