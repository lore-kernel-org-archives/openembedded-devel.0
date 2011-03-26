Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radoslav@kolev.info>) id 1Q3Wir-0007pn-Qe
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 17:52:21 +0100
Received: by fxm19 with SMTP id 19so1975500fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 09:50:27 -0700 (PDT)
Received: by 10.223.15.5 with SMTP id i5mr2441289faa.114.1301158224279;
	Sat, 26 Mar 2011 09:50:24 -0700 (PDT)
Received: from localhost.localdomain ([77.85.232.104])
	by mx.google.com with ESMTPS id j11sm835356faa.20.2011.03.26.09.50.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 26 Mar 2011 09:50:23 -0700 (PDT)
From: Radoslav Kolev <radoslav@kolev.info>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2011 18:50:34 +0200
Message-Id: <1301158234-13658-1-git-send-email-radoslav@kolev.info>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] Added a recipe for libmodbus
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
X-List-Received-Date: Sat, 26 Mar 2011 16:52:21 -0000


Signed-off-by: Radoslav Kolev <radoslav@kolev.info>
---
 recipes/libmodbus/libmodbus.inc      |    8 ++++++++
 recipes/libmodbus/libmodbus_2.0.3.bb |    8 ++++++++
 recipes/libmodbus/libmodbus_git.bb   |   11 +++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libmodbus/libmodbus.inc
 create mode 100644 recipes/libmodbus/libmodbus_2.0.3.bb
 create mode 100644 recipes/libmodbus/libmodbus_git.bb

diff --git a/recipes/libmodbus/libmodbus.inc b/recipes/libmodbus/libmodbus.inc
new file mode 100644
index 0000000..c5a673a
--- /dev/null
+++ b/recipes/libmodbus/libmodbus.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "A Modbus library for Linux, Mac OS X, FreeBSD, QNX and Win32"
+HOMEPAGE = "http://www.libmodbus.org/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+INC_PR = "r1"
+
+inherit autotools pkgconfig
diff --git a/recipes/libmodbus/libmodbus_2.0.3.bb b/recipes/libmodbus/libmodbus_2.0.3.bb
new file mode 100644
index 0000000..bf6062c
--- /dev/null
+++ b/recipes/libmodbus/libmodbus_2.0.3.bb
@@ -0,0 +1,8 @@
+require libmodbus.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI = "http://github.com/downloads/stephane/libmodbus/libmodbus-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0646f3edca6d7783d0356dc2fc4f9f4c"
+SRC_URI[sha256sum] = "cf9d8d3981ace78a4ed559f2e28c5e0270d56a607b9ae79484e5742e36543feb"
diff --git a/recipes/libmodbus/libmodbus_git.bb b/recipes/libmodbus/libmodbus_git.bb
new file mode 100644
index 0000000..5b405f8
--- /dev/null
+++ b/recipes/libmodbus/libmodbus_git.bb
@@ -0,0 +1,11 @@
+require libmodbus.inc
+
+SRCREV = "6254ede9156095ee0300"
+
+PR = "${INC_PR}.1"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=git"
+S = "${WORKDIR}/git"
+
-- 
1.7.0.4



