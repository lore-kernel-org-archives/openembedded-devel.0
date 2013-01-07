Received: from mail-la0-f51.google.com ([209.85.215.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsB1c-0006Ag-Ob
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 12:38:04 +0100
Received: by mail-la0-f51.google.com with SMTP id fj20so14956840lab.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 03:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=pXCxQxUGfLFiA8C/EAN/MfVBKArPHeCbpQjzTY2gKkA=;
	b=KgadwMIU+CzKUHUnUggQJMSp5aj5WC24LRv8B4LxiQCcYGasaXVPHbfXwA/3TEvvzg
	/Jm8gr2BruPmaD/utetWIiO7iqjIRcJCUs/HZbImYBOJO01/0awQlBgPKBd5vZ/y5Ldj
	Ebo3Z903nUox7sSLPUDdj24BqAWpIAIyZurYVHvf4yJQoVt8sGygnsgmbjY/P4mjNCJs
	xrNzycpezw3VVADE8mVCqf6JBXD7Q2BNg+yCJuabndXG1+2FNbAJW9RxKRZkfrNfQ5iV
	MwyJ3CuoejC1VL5vYOh2/xukDpcZhGgIhNmBS4dasJcEqocJz2tH+9lwoo+RSsCBamLA
	E8TQ==
X-Received: by 10.112.44.161 with SMTP id f1mr24145457lbm.29.1357557763599;
	Mon, 07 Jan 2013 03:22:43 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ml1sm22805743lab.15.2013.01.07.03.22.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 03:22:42 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsAmu-0006XH-Al; Mon, 07 Jan 2013 13:22:40 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jan 2013 13:22:39 +0200
Message-Id: <1357557759-25093-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] xmlto: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 11:38:04 -0000

Add obsolete_automake_macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../xmlto/xmlto-0.0.25/obsolete_automake_macros.patch      |   12 ++++++++++++
 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb              |    6 +++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch

diff --git a/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch b/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
new file mode 100644
index 0000000..faa8acc
--- /dev/null
+++ b/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
@@ -0,0 +1,12 @@
+diff -Nurd xmlto-0.0.25/configure.in xmlto-0.0.25/configure.in
+--- xmlto-0.0.25/configure.in	2011-12-01 17:49:00.000000000 +0200
++++ xmlto-0.0.25/configure.in	2013-01-07 05:24:16.169953519 +0200
+@@ -1,7 +1,7 @@
+ AC_INIT(xmlto, 0.0.25)
+ AC_CONFIG_SRCDIR(xmlto.spec.in)
+ AM_INIT_AUTOMAKE([dist-bzip2 subdir-objects 1.6])
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AC_PROG_CC
+ AM_PROG_CC_C_O
diff --git a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
index 806ea2e..447c791 100644
--- a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
+++ b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
@@ -5,7 +5,11 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz" 
+PR = "r1"
+
+SRC_URI = "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
+           file://obsolete_automake_macros.patch \
+"
 SRC_URI[md5sum] = "a88cd3f08789b4825d1ac89fa065170d"
 SRC_URI[sha256sum] = "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc352e843147e3e31a"
 
-- 
1.7.10.4



