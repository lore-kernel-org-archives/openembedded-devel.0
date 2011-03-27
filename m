Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radoslav@kolev.info>) id 1Q3mA4-0006zt-Or
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 11:21:28 +0200
Received: by fxm19 with SMTP id 19so2217654fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Mar 2011 02:19:32 -0700 (PDT)
Received: by 10.223.58.141 with SMTP id g13mr2749049fah.146.1301217570251;
	Sun, 27 Mar 2011 02:19:30 -0700 (PDT)
Received: from localhost.localdomain ([77.85.232.104])
	by mx.google.com with ESMTPS id k5sm1023513faa.39.2011.03.27.02.19.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Mar 2011 02:19:29 -0700 (PDT)
From: Radoslav Kolev <radoslav@kolev.info>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Mar 2011 12:19:43 +0300
Message-Id: <1301217583-2776-1-git-send-email-radoslav@kolev.info>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <iml6ie$bb4$1@dough.gmane.org>
References: <iml6ie$bb4$1@dough.gmane.org>
Subject: [PATCH v2] Added a recipe for libmodbus
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
X-List-Received-Date: Sun, 27 Mar 2011 09:21:28 -0000


Signed-off-by: Radoslav Kolev <radoslav@kolev.info>
---
 recipes/libmodbus/libmodbus.inc      |    8 ++++++++
 recipes/libmodbus/libmodbus_2.0.3.bb |    8 ++++++++
 recipes/libmodbus/libmodbus_git.bb   |   13 +++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
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
index 0000000..dd15e58
--- /dev/null
+++ b/recipes/libmodbus/libmodbus_git.bb
@@ -0,0 +1,13 @@
+require libmodbus.inc
+
+SRCREV = "6254ede9156095ee0300"
+
+PV = "2.9.3+gitr${SRCPV}"
+
+PR = "${INC_PR}.2"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=git"
+S = "${WORKDIR}/git"
+
-- 
1.7.0.4



