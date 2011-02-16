Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpfQl-0002cd-DF
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 12:20:25 +0100
Received: by ywi6 with SMTP id 6so534885ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 03:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=JIfl3GiQE6TSMVeJHSNVg1tBx6nx7jk0d8CeDhQm6jI=;
	b=hWcJ0cj2TSu/rAn6iHUCh3Pnn3SAE+46OfU4qYmYWdDk0NcKBZHQVvgrZvLo1eANqY
	tEUZ+gpbL7+69F+9b7WS8ZZrVpMCYenr4mXpO/OXy7a4G/QiFQ4frPFoufrpvrRs9IAk
	mjl8lTLwfXMJh8HbSE6rFsTkaKCmxJn7j2tF4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=vdf+cVcTZAJqsVhDdPQ0pWual3QiRzVffaZKjD5Z0yD2kh55tWf6/iW7sBtpGK5Mg/
	Cqqbv/I8qVUUhiOQFSSYIAfe9TBwxynTMhHBhxLL9Q3+N+xhNHST6ReNxLeCBYBaKaZ3
	S2uK86DI6g+rquaMF0JHbVSCwGAyxQAvXFvCA=
Received: by 10.236.95.144 with SMTP id p16mr869516yhf.45.1297855150950;
	Wed, 16 Feb 2011 03:19:10 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 68sm3057927yhl.19.2011.02.16.03.19.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 03:19:10 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:18:43 +0000
Message-Id: <1297855134-19216-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 02/13] python-dbus: update to 0.83.2 and fix rpath to use absolute path
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
X-List-Received-Date: Wed, 16 Feb 2011 11:20:25 -0000

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
index 0000000..c2495dc
--- /dev/null
+++ b/recipes/python/python-dbus_0.83.2.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Python bindings for DBus, a socket-based message bus system for interprocess communication"
+SECTION = "devel/python"
+HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
+LICENSE = "MIT"
+DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native python-epydoc-native"
+PR = "r1"
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



