Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id EEEFF7182C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 06:50:49 +0000 (UTC)
Received: by iebtr6 with SMTP id tr6so7299739ieb.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 22:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IB2jQSaijcxwubfO9K4Guhhn1tWxk4SCMCHxkNXV1I8=;
	b=tz3Xeq2R4LzqIY2HubGg2Oi0swNjFCDfKkegJP19HkmJduOv2x1X+Nn/EdTB45FGMp
	8G268sSYFyInZ106X8XjBG2vVAbR/nBbMI5t3AicSNsRri+PvdlvSCDXaa8Sy1pN6/Hj
	TrKVRUnWjnUFQBsOUYz/UA6KPBjXyTceHMCvK02qIauTmGh09JrXHFtKsfFTV/lUtNrQ
	SB+xwv0m9bTWfa1GTJjOwgaO56Km9Fu+9JbARmWqnx77j+KekltmdNo5C+ocVebZFgTI
	RTMSr+NOLDIEaLkZItD37dJcAaX8CHHEs2EZ/48HMZiucPZq9pV7h4c+rWPQMmfkUDK4
	pjow==
X-Received: by 10.50.143.44 with SMTP id sb12mr7923768igb.3.1424328650384;
	Wed, 18 Feb 2015 22:50:50 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id nv8sm13440585igb.6.2015.02.18.22.50.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Feb 2015 22:50:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Feb 2015 22:50:36 -0800
Message-Id: <1424328636-15026-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] log4c: fix undeclared dependency on expat
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Feb 2015 06:50:53 -0000

The original log4c configure.in is buggy and requires fixing
before "configure --with-expat" works as expected.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../log4c/log4c/fix_configure_with-expat.patch      | 21 +++++++++++++++++++++
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb        | 13 ++++++-------
 2 files changed, 27 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch

diff --git a/meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch b/meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch
new file mode 100644
index 0000000..4872eb4
--- /dev/null
+++ b/meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch
@@ -0,0 +1,21 @@
+The original use of AC_ARG_WITH is buggy and causes expat support
+to be *disabled* if "--with-expat" is passed to configure.
+
+Upstream status: pending
+
+Index: log4c-1.2.4/configure.in
+===================================================================
+--- log4c-1.2.4.orig/configure.in
++++ log4c-1.2.4/configure.in
+@@ -217,9 +217,9 @@ AC_ARG_WITH(expat,
+                     have any effect and Log4C uses some bundled yacc/lex code
+                     for parsing it's configuration file.
+                     ]),
+-                    with_expat=no,
++                    [],
+                     with_expat=yes)
+-if test x$with_expat = xyes ; then
++if test x$with_expat != xno ; then
+  use_expat=yes
+  AM_PATH_EXPAT(1.95.1)
+ fi
diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
index 43e0746..ea75757 100644
--- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
+++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
@@ -1,16 +1,15 @@
-SUMMARY = "Logging Framework for C"
+SUMMARY = "Log4c is a C library for flexible logging to files, syslog and other destinations"
 HOMEPAGE = "http://log4c.sourceforge.net"
 LICENSE = "LGPLv2"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://cznic.dl.sourceforge.net/project/log4c/log4c/${PV}/log4c-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://fix_configure_with-expat.patch"
+
 SRC_URI[md5sum] = "0d94919136e1d16b68427562e74cb3dd"
 SRC_URI[sha256sum] = "5991020192f52cc40fa852fbf6bbf5bd5db5d5d00aa9905c67f6f0eadeed48ea"
 
-S = "${WORKDIR}/${PN}-${PV}"
-
-EXTRA_OECONF = "--prefix=/usr"
+PACKAGECONFIG ??= "expat"
+PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat"
 
 inherit autotools
-
-- 
1.9.1


