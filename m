Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PEmWF-0000sD-CW
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 18:25:37 +0100
Received: by eya28 with SMTP id 28so2291872eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 10:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=JyQ0UAeo4utkU1zcHCcXoZxdZIQLUYs9maH0n9yLZjw=;
	b=xOCTLq8FXlhAFaTC/mb1O+OQHdXt/hL0FuTGnOP6/PlojN5rD7PMl7rNGXttyv4u9L
	pTvTViKo74iRwjbl4qj8c77GfnmHuiA6bDZaOOCc8zFRls5RinSLG3mOUW5W7F1m2q43
	WbNuMDe3UkbB8nGkxxPWdEN/DSZQeUecoX67s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=emDrzMJRW8Ltza+Gg80j0jAJF1vP6hPlc5Mj3CP0nEVeogstSI6Euhj1IdRisIA4kJ
	S8hKSiYAIjVtC3x95BfCp6lMpS6WCFY8uRo24nblKiYItnV4NK0yaP8rcgva65pwsq0r
	H8AyXgmib9Kzf0nxNm1+xe3TERHeUUCRilMr4=
Received: by 10.14.11.226 with SMTP id 74mr1886169eex.5.1289064278821;
	Sat, 06 Nov 2010 10:24:38 -0700 (PDT)
Received: from localhost.localdomain ([93.182.199.230])
	by mx.google.com with ESMTPS id q58sm2318712eeh.21.2010.11.06.10.24.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 10:24:38 -0700 (PDT)
Sender: Camille Moncelier <pixdamix@gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Nov 2010 17:24:29 +0000
Message-Id: <1289064270-20041-1-git-send-email-moncelier@devlife.org>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: [PATCH 08/11] log4cpp: Added recipe for log4cpp
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
X-List-Received-Date: Sat, 06 Nov 2010 17:25:37 -0000

  * Log4cpp is library of C++ classes for flexible logging to files,
    syslog, IDSA and other destinations. It is modeled after the Log4j
    Java library, staying as close to their API as is reasonable.

Signed-off-by: Camille Moncelier <moncelier@devlife.org>
---
 .../log4cpp/log4cpp-1.0/configure_pkgconfig.diff   |   11 +++++++++
 recipes/log4cpp/log4cpp-1.0/stl_compile.diff       |   23 ++++++++++++++++++++
 recipes/log4cpp/log4cpp_1.0.bb                     |   22 +++++++++++++++++++
 3 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 recipes/log4cpp/log4cpp-1.0/configure_pkgconfig.diff
 create mode 100644 recipes/log4cpp/log4cpp-1.0/stl_compile.diff
 create mode 100644 recipes/log4cpp/log4cpp_1.0.bb

diff --git a/recipes/log4cpp/log4cpp-1.0/configure_pkgconfig.diff b/recipes/log4cpp/log4cpp-1.0/configure_pkgconfig.diff
new file mode 100644
index 0000000..e4a9104
--- /dev/null
+++ b/recipes/log4cpp/log4cpp-1.0/configure_pkgconfig.diff
@@ -0,0 +1,11 @@
+--- log4cpp-1.0/m4/ac_config_pkgconfig_in.m4	2004-01-27 11:27:38.000000000 +0100
++++ log4cpp-1.0.patched/m4/ac_config_pkgconfig_in.m4	2009-08-24 17:12:26.000000000 +0200
+@@ -121,7 +121,7 @@
+ fi
+ echo 'Version: @VERSION@' >>$PKGCONFIG_FILE
+ echo 'Libs: -L${libdir} @MODULE_DOWN[]_libs@' >>$PKGCONFIG_FILE
+-echo 'Cflags: -I${includedir} @MODULE_DOWN[]_cflags@' >>$PKGCONFIG_FILE
++echo 'Cflags: -I${includedir}' >>$PKGCONFIG_FILE
+ m4_pushdef([PKGCONFIG_UP], [m4_translit([$1], [a-z], [A-Z])])dnl
+ PKGCONFIG_UP[]_PKGCONFIG="PKGCONFIG_DIR[]$1-config"
+ AC_SUBST(PKGCONFIG_UP[]_PKGCONFIG)
diff --git a/recipes/log4cpp/log4cpp-1.0/stl_compile.diff b/recipes/log4cpp/log4cpp-1.0/stl_compile.diff
new file mode 100644
index 0000000..dc4672d
--- /dev/null
+++ b/recipes/log4cpp/log4cpp-1.0/stl_compile.diff
@@ -0,0 +1,23 @@
+diff -r -u log4cpp-1.0/src/BasicLayout.cpp log4cpp-1.0.new/src/BasicLayout.cpp
+--- log4cpp-1.0/src/BasicLayout.cpp	2006-09-30 08:03:20.000000000 +0200
++++ log4cpp-1.0.new/src/BasicLayout.cpp	2009-08-21 16:13:32.000000000 +0200
+@@ -14,6 +14,7 @@
+ #ifdef LOG4CPP_HAVE_SSTREAM
+ #include <sstream>
+ #endif
++#include <memory>
+
+ namespace log4cpp {
+
+diff -r -u log4cpp-1.0/src/PatternLayout.cpp log4cpp-1.0.new/src/PatternLayout.cpp
+--- log4cpp-1.0/src/PatternLayout.cpp	2007-08-28 09:54:12.000000000 +0200
++++ log4cpp-1.0.new/src/PatternLayout.cpp	2009-08-21 16:14:04.000000000 +0200
+@@ -370,7 +370,7 @@
+                         literal = "";
+                     }
+                     if ((minWidth != 0) || (maxWidth != 0)) {
+-                        component = new FormatModifierComponent(component, std::abs(minWidth), maxWidth, minWidth < 0);
++                        component = new FormatModifierComponent(component, std::abs((double)minWidth), maxWidth, minWidth < 0);
+                         minWidth = maxWidth = 0;
+                     }
+                     _components.push_back(component);
diff --git a/recipes/log4cpp/log4cpp_1.0.bb b/recipes/log4cpp/log4cpp_1.0.bb
new file mode 100644
index 0000000..0243e16
--- /dev/null
+++ b/recipes/log4cpp/log4cpp_1.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A library of C++ classes for flexible logging to files, syslog, IDSA and other destinations."
+HOMEPAGE = "http://sourceforge.net/projects/log4cpp/"
+PRIORITY = "optional"
+PR = "r3"
+
+SRC_URI = " \
+     http://downloads.sourceforge.net/project/log4cpp/log4cpp-1.0.x%20%28current%29/${PN}-${PV}/${PN}-${PV}.tar.gz \
+     file://stl_compile.diff;apply=yes \
+     file://configure_pkgconfig.diff;apply=yes \
+"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "\
+    --enable-doxygen=no \
+    --enable-dot=no \
+    --enable-html-docs=no \
+    --enable-latex-docs=no \
+"
+
+SRC_URI[md5sum] = "1face50ead0790d1297dfb04bacf273c"
+SRC_URI[sha256sum] = "b4533324b0a1f46ad74a9e92bf2caa46c246e9353059e1a835e735d41826ed19"
-- 
1.7.3.1



