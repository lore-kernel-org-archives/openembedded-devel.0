Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol1eA-00067K-Q8
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 17:30:50 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so3100953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 08:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Gx30CH//1JaCKevK3TqrY6HrDi8Wm6Bsqvpbs5gPKFY=;
	b=L/pSpnMPH6cSPnAPFCB+wpIXFJaiR15CeaknzO+LvNMDSGiixrwMqrjAQDrX1HpnYh
	TylaOTVbJP96VBnY0kd+HpLuSjwrtH+n4ZcUXnBa5mBS3vESWIsJ0VrrUIZ7PolGeT3/
	/rIDym3vxY3zZ5H7+URtkVRavAGYcsnG3bJyk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BEL3uPGCslSaAueGus0IMuxzaXFAkGfcY3PPekT6Mact1Nku43cs7mhHs+2F+MJWB7
	NbY+X9f6zZBYQ9Cm56yxfGYO51FPGgVKZZsc3HC5SQO5OFKtKj4/Og5cflFe3UNzkNID
	qtn8Q/Y7/7AAXO9VB/NEVX/nz+yFPin0i4Cx0=
Received: by 10.223.115.201 with SMTP id j9mr5342498faq.48.1281972632023;
	Mon, 16 Aug 2010 08:30:32 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p2sm2500355fak.22.2010.08.16.08.30.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 08:30:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:30:17 +0200
Message-Id: <1281972620-7317-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 6/9] xorg-font: move older not pinned versions to obsolete dir
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
X-List-Received-Date: Mon, 16 Aug 2010 15:30:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg/xorg-font/encodings_1.0.2.bb |    8 +++
 .../xorg/xorg-font/files/imake-staging.patch       |   38 +++++++++++++++
 .../xorg/xorg-font/font-adobe-100dpi_1.0.0.bb      |    6 +++
 .../xorg/xorg-font/font-adobe-75dpi_1.0.0.bb       |    6 +++
 .../xorg-font/font-adobe-utopia-100dpi_1.0.1.bb    |    9 ++++
 .../xorg-font/font-adobe-utopia-75dpi_1.0.1.bb     |    9 ++++
 .../xorg-font/font-adobe-utopia-type1_1.0.1.bb     |    9 ++++
 .../obsolete/xorg/xorg-font/font-alias_1.0.1.bb    |   12 +++++
 .../xorg/xorg-font/font-arabic-misc_1.0.0.bb       |   10 ++++
 .../xorg/xorg-font/font-bh-100dpi_1.0.0.bb         |    7 +++
 .../obsolete/xorg/xorg-font/font-bh-75dpi_1.0.0.bb |    7 +++
 .../font-bh-lucidatypewriter-100dpi_1.0.0.bb       |    7 +++
 .../font-bh-lucidatypewriter-75dpi_1.0.0.bb        |    7 +++
 .../obsolete/xorg/xorg-font/font-bh-ttf_1.0.0.bb   |    7 +++
 .../obsolete/xorg/xorg-font/font-bh-type1_1.0.0.bb |    7 +++
 .../xorg/xorg-font/font-bitstream-100dpi_1.0.0.bb  |    7 +++
 .../xorg/xorg-font/font-bitstream-75dpi_1.0.0.bb   |    7 +++
 .../xorg/xorg-font/font-bitstream-speedo_1.0.0.bb  |    7 +++
 .../xorg/xorg-font/font-bitstream-type1_1.0.0.bb   |    7 +++
 .../xorg/xorg-font/font-cronyx-cyrillic_1.0.0.bb   |    7 +++
 .../xorg/xorg-font/font-cursor-misc_1.0.0.bb       |    7 +++
 .../xorg/xorg-font/font-daewoo-misc_1.0.0.bb       |    7 +++
 .../obsolete/xorg/xorg-font/font-dec-misc_1.0.0.bb |    7 +++
 .../xorg/xorg-font/font-ibm-type1_1.0.0.bb         |    7 +++
 .../xorg/xorg-font/font-isas-misc_1.0.0.bb         |    7 +++
 .../obsolete/xorg/xorg-font/font-jis-misc_1.0.0.bb |    7 +++
 .../xorg/xorg-font/font-micro-misc_1.0.0.bb        |    9 ++++
 .../xorg/xorg-font/font-misc-cyrillic_1.0.0.bb     |    7 +++
 .../xorg/xorg-font/font-misc-ethiopic_1.0.0.bb     |    6 +++
 .../xorg/xorg-font/font-misc-meltho_1.0.0.bb       |    8 +++
 .../font-misc-misc/configure-mapdir.patch          |   11 +++++
 .../xorg/xorg-font/font-misc-misc_1.0.0.bb         |   10 ++++
 .../xorg/xorg-font/font-mutt-misc_1.0.0.bb         |   10 ++++
 .../xorg/xorg-font/font-schumacher-misc_1.0.0.bb   |    6 +++
 .../xorg/xorg-font/font-screen-cyrillic_1.0.0.bb   |    6 +++
 .../xorg/xorg-font/font-sony-misc_1.0.0.bb         |    6 +++
 .../obsolete/xorg/xorg-font/font-sun-misc_1.0.0.bb |    6 +++
 .../xorg/xorg-font/font-util-native_1.0.1.bb       |   12 +++++
 recipes/obsolete/xorg/xorg-font/font-util_1.0.1.bb |   14 ++++++
 .../xorg/xorg-font/font-winitzki-cyrillic_1.0.0.bb |    7 +++
 .../xorg/xorg-font/font-xfree86-type1_1.0.0.bb     |    7 +++
 .../xorg/xorg-font/font-xfree86-type1_1.0.1.bb     |    7 +++
 recipes/xorg-font/encodings_1.0.2.bb               |    8 ---
 recipes/xorg-font/files/imake-staging.patch        |   38 ---------------
 recipes/xorg-font/files/lexer.patch                |   48 --------------------
 recipes/xorg-font/font-adobe-100dpi_1.0.0.bb       |    6 ---
 recipes/xorg-font/font-adobe-75dpi_1.0.0.bb        |    6 ---
 .../xorg-font/font-adobe-utopia-100dpi_1.0.1.bb    |    9 ----
 recipes/xorg-font/font-adobe-utopia-75dpi_1.0.1.bb |    9 ----
 recipes/xorg-font/font-adobe-utopia-type1_1.0.1.bb |    9 ----
 recipes/xorg-font/font-alias_1.0.1.bb              |   12 -----
 recipes/xorg-font/font-arabic-misc_1.0.0.bb        |   10 ----
 recipes/xorg-font/font-bh-100dpi_1.0.0.bb          |    7 ---
 recipes/xorg-font/font-bh-75dpi_1.0.0.bb           |    7 ---
 .../font-bh-lucidatypewriter-100dpi_1.0.0.bb       |    7 ---
 .../font-bh-lucidatypewriter-75dpi_1.0.0.bb        |    7 ---
 recipes/xorg-font/font-bh-ttf_1.0.0.bb             |    7 ---
 recipes/xorg-font/font-bh-type1_1.0.0.bb           |    7 ---
 recipes/xorg-font/font-bitstream-100dpi_1.0.0.bb   |    7 ---
 recipes/xorg-font/font-bitstream-75dpi_1.0.0.bb    |    7 ---
 recipes/xorg-font/font-bitstream-speedo_1.0.0.bb   |    7 ---
 recipes/xorg-font/font-bitstream-type1_1.0.0.bb    |    7 ---
 recipes/xorg-font/font-cronyx-cyrillic_1.0.0.bb    |    7 ---
 recipes/xorg-font/font-cursor-misc_1.0.0.bb        |    7 ---
 recipes/xorg-font/font-daewoo-misc_1.0.0.bb        |    7 ---
 recipes/xorg-font/font-dec-misc_1.0.0.bb           |    7 ---
 recipes/xorg-font/font-ibm-type1_1.0.0.bb          |    7 ---
 recipes/xorg-font/font-isas-misc_1.0.0.bb          |    7 ---
 recipes/xorg-font/font-jis-misc_1.0.0.bb           |    7 ---
 recipes/xorg-font/font-micro-misc_1.0.0.bb         |    9 ----
 recipes/xorg-font/font-misc-cyrillic_1.0.0.bb      |    7 ---
 recipes/xorg-font/font-misc-ethiopic_1.0.0.bb      |    6 ---
 recipes/xorg-font/font-misc-meltho_1.0.0.bb        |    8 ---
 .../font-misc-misc/configure-mapdir.patch          |   11 -----
 recipes/xorg-font/font-misc-misc_1.0.0.bb          |   10 ----
 recipes/xorg-font/font-mutt-misc_1.0.0.bb          |   10 ----
 recipes/xorg-font/font-schumacher-misc_1.0.0.bb    |    6 ---
 recipes/xorg-font/font-screen-cyrillic_1.0.0.bb    |    6 ---
 recipes/xorg-font/font-sony-misc_1.0.0.bb          |    6 ---
 recipes/xorg-font/font-sun-misc_1.0.0.bb           |    6 ---
 recipes/xorg-font/font-util-native_1.0.1.bb        |   12 -----
 recipes/xorg-font/font-util_1.0.1.bb               |   14 ------
 recipes/xorg-font/font-winitzki-cyrillic_1.0.0.bb  |    7 ---
 recipes/xorg-font/font-xfree86-type1_1.0.0.bb      |    7 ---
 recipes/xorg-font/font-xfree86-type1_1.0.1.bb      |    7 ---
 recipes/xorg-font/xfonts-xorg-6.8/lexer.patch      |   48 ++++++++++++++++++++
 86 files changed, 406 insertions(+), 406 deletions(-)
 create mode 100644 recipes/obsolete/xorg/xorg-font/encodings_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/files/imake-staging.patch
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-adobe-100dpi_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-adobe-75dpi_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-adobe-utopia-100dpi_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-adobe-utopia-75dpi_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-adobe-utopia-type1_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-alias_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-arabic-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-bh-100dpi_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-bh-75dpi_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-bh-ttf_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-bh-type1_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-bitstream-100dpi_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-bitstream-75dpi_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-bitstream-speedo_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-bitstream-type1_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-cronyx-cyrillic_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-cursor-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-daewoo-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-dec-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-ibm-type1_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-isas-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-jis-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-micro-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-misc-cyrillic_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-misc-ethiopic_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-misc-meltho_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-misc-misc/configure-mapdir.patch
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-misc-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-mutt-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-schumacher-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-screen-cyrillic_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-sony-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-sun-misc_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-util-native_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-util_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-winitzki-cyrillic_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-xfree86-type1_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-font/font-xfree86-type1_1.0.1.bb
 delete mode 100644 recipes/xorg-font/encodings_1.0.2.bb
 delete mode 100644 recipes/xorg-font/files/imake-staging.patch
 delete mode 100644 recipes/xorg-font/files/lexer.patch
 delete mode 100644 recipes/xorg-font/font-adobe-100dpi_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-adobe-75dpi_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-adobe-utopia-100dpi_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-adobe-utopia-75dpi_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-adobe-utopia-type1_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-alias_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-arabic-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-bh-100dpi_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-bh-75dpi_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-bh-ttf_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-bh-type1_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-100dpi_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-75dpi_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-speedo_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-type1_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-cronyx-cyrillic_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-cursor-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-daewoo-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-dec-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-ibm-type1_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-isas-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-jis-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-micro-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-misc-cyrillic_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-misc-ethiopic_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-misc-meltho_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-misc-misc/configure-mapdir.patch
 delete mode 100644 recipes/xorg-font/font-misc-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-mutt-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-schumacher-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-screen-cyrillic_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-sony-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-sun-misc_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-util-native_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-util_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-winitzki-cyrillic_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-xfree86-type1_1.0.0.bb
 delete mode 100644 recipes/xorg-font/font-xfree86-type1_1.0.1.bb
 create mode 100644 recipes/xorg-font/xfonts-xorg-6.8/lexer.patch

diff --git a/recipes/obsolete/xorg/xorg-font/encodings_1.0.2.bb b/recipes/obsolete/xorg/xorg-font/encodings_1.0.2.bb
new file mode 100644
index 0000000..b0272a2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/encodings_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+DEPENDS = "mkfontscale-native font-util-native"
+
+SRC_URI[archive.md5sum] = "11adda157b03d63fd61d95ad7ef00466"
+SRC_URI[archive.sha256sum] = "6d19107b66bbc96c085b0c2dd286ece22dcb73ba56a17fc95b0f2cbc5d6f4eac"
diff --git a/recipes/obsolete/xorg/xorg-font/files/imake-staging.patch b/recipes/obsolete/xorg/xorg-font/files/imake-staging.patch
new file mode 100644
index 0000000..bf2e350
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/files/imake-staging.patch
@@ -0,0 +1,38 @@
+--- xc/config/cf/Imake.tmpl.orig	2004-07-28 04:24:29.000000000 +0100
++++ xc/config/cf/Imake.tmpl	2004-09-14 21:03:06.000000000 +0100
+@@ -2038,11 +2038,11 @@
+  */
+       ALLINCLUDES = $(INCLUDES) $(EXTRA_INCLUDES) $(TOP_INCLUDES) $(INSTALLED_INCLUDES) $(STD_INCLUDES)
+        ALLDEFINES = $(ALLINCLUDES) $(STD_DEFINES) $(PROTO_DEFINES) $(THREADS_DEFINES) $(MODULE_DEFINES) $(DEFINES) $(EXTRA_DEFINES)
+-           CFLAGS = $(CDEBUGFLAGS) $(CCOPTIONS) $(THREADS_CFLAGS) $(MODULE_CFLAGS) $(ALLDEFINES)
++           CFLAGS = $(CDEBUGFLAGS) $(CCOPTIONS) $(THREADS_CFLAGS) $(MODULE_CFLAGS) $(ALLDEFINES) $(CC_STAGING)
+         LINTFLAGS = $(LINTOPTS) -DLINT $(ALLDEFINES) $(DEPEND_DEFINES)
+          LDPRELIB = LdPreLib $(INSTALLED_LIBS)
+         LDPOSTLIB = LdPostLib
+-        LDOPTIONS = $(CDEBUGFLAGS) $(CCOPTIONS)  $(EXTRA_LDOPTIONS) $(THREADS_LDFLAGS) $(LOCAL_LDFLAGS) $(LDPRELIBS)
++        LDOPTIONS = $(CDEBUGFLAGS) $(CCOPTIONS)  $(EXTRA_LDOPTIONS) $(THREADS_LDFLAGS) $(LOCAL_LDFLAGS) $(LDPRELIBS) $(LD_STAGING)
+      CXXLDOPTIONS = $(CXXDEBUGFLAGS) $(CXXOPTIONS) $(EXTRA_LDOPTIONS) $(THREADS_CXXLDFLAGS) $(LOCAL_LDFLAGS) $(LDPRELIBS)
+ 
+            LDLIBS = $(LDPOSTLIBS) $(THREADS_LIBS) $(SYS_LIBRARIES) $(EXTRA_LIBRARIES)
+--- xc/config/cf/Library.tmpl~	2004-05-24 20:06:57.000000000 +0100
++++ xc/config/cf/Library.tmpl	2004-09-14 21:10:29.000000000 +0100
+@@ -114,7 +114,7 @@
+ STD_DEFINES = LibraryDefines $(PROJECT_DEFINES)
+ CDEBUGFLAGS = LibraryCDebugFlags
+ CLIBDEBUGFLAGS = LibraryDebugOpt
+-     CFLAGS = $(CDEBUGFLAGS) $(CLIBDEBUGFLAGS) $(CCOPTIONS) $(THREADS_CFLAGS) $(ALLDEFINES)
++     CFLAGS = $(CDEBUGFLAGS) $(CLIBDEBUGFLAGS) $(CCOPTIONS) $(THREADS_CFLAGS) $(ALLDEFINES) $(CC_STAGING)
+ # if defined(LargePICTable) && LargePICTable && defined(LargePositionIndependentCFlags)
+    PICFLAGS = LargePositionIndependentCFlags
+ # endif
+--- xc/config/cf/X11.tmpl~	2004-09-03 17:18:18.000000000 +0100
++++ xc/config/cf/X11.tmpl	2004-09-14 21:30:30.000000000 +0100
+@@ -3359,7 +3359,7 @@
+ FREETYPE2LIBDIR = Freetype2LibDir
+ FREETYPE2INCDIR = Freetype2IncDir
+ #if Freetype2LibDirStandard
+-FREETYPE2LIB = -lfreetype
++FREETYPE2LIB = $(LD_STAGING) -lfreetype
+ #else
+ FREETYPE2LIB = -L$(FREETYPE2LIBDIR) LinkerRuntimeLibraryPathFlag($(FREETYPE2LIBDIR)) -lfreetype
+ #endif
diff --git a/recipes/obsolete/xorg/xorg-font/font-adobe-100dpi_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-adobe-100dpi_1.0.0.bb
new file mode 100644
index 0000000..31da680
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-adobe-100dpi_1.0.0.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "443acfe70e26716282f9068730fe92c4"
+SRC_URI[archive.sha256sum] = "f16c1b3a1625c9a225aff2ac12067bd3907d157b0c60625689a5080f092e9a19"
diff --git a/recipes/obsolete/xorg/xorg-font/font-adobe-75dpi_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-adobe-75dpi_1.0.0.bb
new file mode 100644
index 0000000..f0654d2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-adobe-75dpi_1.0.0.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "813b5d3723c84388a938ab6732e1329c"
+SRC_URI[archive.sha256sum] = "d62745bee0f5e4f355f237020667d783ae9fea5f18a864d748ae1287bd176339"
diff --git a/recipes/obsolete/xorg/xorg-font/font-adobe-utopia-100dpi_1.0.1.bb b/recipes/obsolete/xorg/xorg-font/font-adobe-utopia-100dpi_1.0.1.bb
new file mode 100644
index 0000000..f5286ee
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-adobe-utopia-100dpi_1.0.1.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Adobe typeface software"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5d28a30efef966f8dbbaff9a6619f01a"
+SRC_URI[archive.sha256sum] = "1943e1aa70c169b13bc7a308c8e949267f9ce6327479803203fbf10c06a9b5fe"
diff --git a/recipes/obsolete/xorg/xorg-font/font-adobe-utopia-75dpi_1.0.1.bb b/recipes/obsolete/xorg/xorg-font/font-adobe-utopia-75dpi_1.0.1.bb
new file mode 100644
index 0000000..7cffdd8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-adobe-utopia-75dpi_1.0.1.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Adobe typeface software"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "dd912284e4750023f9682812532fa033"
+SRC_URI[archive.sha256sum] = "ebd4e2194bbc727e3bbda0f5dc1493fe3a211c7cf77e3d41f93135dd04ca7089"
diff --git a/recipes/obsolete/xorg/xorg-font/font-adobe-utopia-type1_1.0.1.bb b/recipes/obsolete/xorg/xorg-font/font-adobe-utopia-type1_1.0.1.bb
new file mode 100644
index 0000000..648fe05
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-adobe-utopia-type1_1.0.1.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Adobe typeface software"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "aa7ff4bd20b961afda9c15d103b972a5"
+SRC_URI[archive.sha256sum] = "e9c672c8ff275fd5c2d76dda9a9f11138766e246e31e45763cd7e14d8824c0dc"
diff --git a/recipes/obsolete/xorg/xorg-font/font-alias_1.0.1.bb b/recipes/obsolete/xorg/xorg-font/font-alias_1.0.1.bb
new file mode 100644
index 0000000..687e0a4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-alias_1.0.1.bb
@@ -0,0 +1,12 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "X font aliases."
+
+DEPENDS = "virtual/xserver font-util"
+RDEPENDS_${PN} = "encodings font-util"
+
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "c4776b6f0f2ecdb7670b6fe64b5d2a2d"
+SRC_URI[archive.sha256sum] = "77db60d63224b9d856129d23c0b0d0e9154a166137daf749d39abfd56a4f89b6"
diff --git a/recipes/obsolete/xorg/xorg-font/font-arabic-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-arabic-misc_1.0.0.bb
new file mode 100644
index 0000000..4ebf72e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-arabic-misc_1.0.0.bb
@@ -0,0 +1,10 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "100dpi, 24 point (approximately) font to minimally support (almost) all \
+of the Arabic characters available in Unicode."
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "81595016e2ff859716fc256ebb136ba6"
+SRC_URI[archive.sha256sum] = "90e9dfa3f33805ea2ffe06faa7258d8335cdf415826f963a1d0a76bd8df7bc94"
diff --git a/recipes/obsolete/xorg/xorg-font/font-bh-100dpi_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-bh-100dpi_1.0.0.bb
new file mode 100644
index 0000000..69cbe4e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-bh-100dpi_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e5592de74a5c04e3a2608800dd079197"
+SRC_URI[archive.sha256sum] = "ae8a11777579a2242f52ed19b5fdd6c6ef6fe2c2661a49d0599188de78cfee4a"
diff --git a/recipes/obsolete/xorg/xorg-font/font-bh-75dpi_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-bh-75dpi_1.0.0.bb
new file mode 100644
index 0000000..605f759
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-bh-75dpi_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6e51cd02f4ce32e1393e34ab17a9b211"
+SRC_URI[archive.sha256sum] = "c79467b440cc9389c75d55fba64d0126d0f2e1e6c019dfafb7d89d07802c05bf"
diff --git a/recipes/obsolete/xorg/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.0.bb
new file mode 100644
index 0000000..e075cb4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c44d3f730564da465993e9292a33c235"
+SRC_URI[archive.sha256sum] = "36d47dcba591037b6af35fc151e3d7a6c9f16f42b3182e083ea140cb584d7013"
diff --git a/recipes/obsolete/xorg/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.0.bb
new file mode 100644
index 0000000..d5d87a8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fdd9be5b9db94ef363a33e39b7977e2b"
+SRC_URI[archive.sha256sum] = "50f2f36f533a49c65842568052fe4d065354ff6f39ab36dd2129f465741da046"
diff --git a/recipes/obsolete/xorg/xorg-font/font-bh-ttf_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-bh-ttf_1.0.0.bb
new file mode 100644
index 0000000..b276908
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-bh-ttf_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ad43cf739b3d46ba1e7dc778a0608a52"
+SRC_URI[archive.sha256sum] = "7a1a5e72f7e42398b98d70aa64252837e85ed76eea77a1b9a4cd0f1203d7d644"
diff --git a/recipes/obsolete/xorg/xorg-font/font-bh-type1_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-bh-type1_1.0.0.bb
new file mode 100644
index 0000000..93ddfe8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-bh-type1_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "46588b22678e440741d6220bc3945cbf"
+SRC_URI[archive.sha256sum] = "5a8a5513f2c829d56043a0f74980efc11b4b4522f21116f16711998f72c3645b"
diff --git a/recipes/obsolete/xorg/xorg-font/font-bitstream-100dpi_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-bitstream-100dpi_1.0.0.bb
new file mode 100644
index 0000000..25af60c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-bitstream-100dpi_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "173352ddec3d26e2b91df1edcf1ae85b"
+SRC_URI[archive.sha256sum] = "0c705a74d7b52e41a1f1aa6732f0200877ba2d4303b79513a524e7cc1b30e2d2"
diff --git a/recipes/obsolete/xorg/xorg-font/font-bitstream-75dpi_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-bitstream-75dpi_1.0.0.bb
new file mode 100644
index 0000000..64c2b55
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-bitstream-75dpi_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "beb476657d50d07d17eef7c325a5ed08"
+SRC_URI[archive.sha256sum] = "2ddfeaccca97524e1b0f4fb37b2fd0f1338698e35f8b05b22b594fe29e201bfb"
diff --git a/recipes/obsolete/xorg/xorg-font/font-bitstream-speedo_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-bitstream-speedo_1.0.0.bb
new file mode 100644
index 0000000..cd4790e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-bitstream-speedo_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1399dc18aeb9571b0951d9570ea1059d"
+SRC_URI[archive.sha256sum] = "99ac01786ac400cc7407f1c427b92c5ff1ac5a31ce7d5907b7ad3c969214f6e6"
diff --git a/recipes/obsolete/xorg/xorg-font/font-bitstream-type1_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-bitstream-type1_1.0.0.bb
new file mode 100644
index 0000000..39f8f33
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-bitstream-type1_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6610475e2e231242f8f2122a709c3695"
+SRC_URI[archive.sha256sum] = "4fce492dcf168837342ea1787ac35b53e4d30361239cba207c9520c42454d903"
diff --git a/recipes/obsolete/xorg/xorg-font/font-cronyx-cyrillic_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-cronyx-cyrillic_1.0.0.bb
new file mode 100644
index 0000000..d875de8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-cronyx-cyrillic_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "22b451e7230b8c003cfc496ee2d360cc"
+SRC_URI[archive.sha256sum] = "06c94e7033f5cae77b9ba27b84af7c1d3e7f73a7239346aabf98eda6c7f484ee"
diff --git a/recipes/obsolete/xorg/xorg-font/font-cursor-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-cursor-misc_1.0.0.bb
new file mode 100644
index 0000000..c152a1f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-cursor-misc_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "305fa22cdfefb8f80babd711051a534b"
+SRC_URI[archive.sha256sum] = "955de27117581ba501d7c2abae7f38b0a65662e4ab2e2b54b9eb2dc07aa5f3c5"
diff --git a/recipes/obsolete/xorg/xorg-font/font-daewoo-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-daewoo-misc_1.0.0.bb
new file mode 100644
index 0000000..67344e5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-daewoo-misc_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "61f9eab48c619af5494d3e384d8d7d79"
+SRC_URI[archive.sha256sum] = "f198eac92e343a38b1e23288880bac91c439bdc90c61a79a7cb0718e9a468926"
diff --git a/recipes/obsolete/xorg/xorg-font/font-dec-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-dec-misc_1.0.0.bb
new file mode 100644
index 0000000..06a6b0f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-dec-misc_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "284e554db1c64fb7580a06df01444a2b"
+SRC_URI[archive.sha256sum] = "83386d1225dab1ebc58e7d197acc4c310ed4e29840abf291b1fa2ffac1b68bb9"
diff --git a/recipes/obsolete/xorg/xorg-font/font-ibm-type1_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-ibm-type1_1.0.0.bb
new file mode 100644
index 0000000..b82fcdb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-ibm-type1_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8e8733051371e2b51123376b49f5d3ea"
+SRC_URI[archive.sha256sum] = "30d091c2e3506943f8a6e152c4be973c462ba19293a864bbb48b82c6cf9c461e"
diff --git a/recipes/obsolete/xorg/xorg-font/font-isas-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-isas-misc_1.0.0.bb
new file mode 100644
index 0000000..fc41381
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-isas-misc_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ec709a96b64b497a5cb5658c93bd38dc"
+SRC_URI[archive.sha256sum] = "97e61313ce0bf229da5d489fc5a05562fdca14f9acc17c40d0b272a345ba4ea2"
diff --git a/recipes/obsolete/xorg/xorg-font/font-jis-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-jis-misc_1.0.0.bb
new file mode 100644
index 0000000..f61ce02
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-jis-misc_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "61febb49a71065723a1fba17cbf23c67"
+SRC_URI[archive.sha256sum] = "3721eefd4ffc47c6948065f7acf9d5c731c4e8e54105d096735876d3712dc7ba"
diff --git a/recipes/obsolete/xorg/xorg-font/font-micro-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-micro-misc_1.0.0.bb
new file mode 100644
index 0000000..d15b7c2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-micro-misc_1.0.0.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+EXTRA_OECONF = "--disable-iso8859-2 --disable-iso8859-3 --disable-iso8859-4 --disable-iso8859-5 --disable-iso8859-6 --disable-iso8859-7 --disable-iso8859-8 --disable-iso8859-9 --disable-iso8859-10 --disable-iso8859-11 --disable-iso8859-12 --disable-iso8859-13 --disable-iso8859-14 --disable-iso8859-15 --disable-iso8859-16 --disable-jisx0201 --disable-koi8-r"
+
+SRC_URI[archive.md5sum] = "8c8bffd7540f05caa0dbb4e6e1d6c58e"
+SRC_URI[archive.sha256sum] = "16b17b5939e12e9381c8096c1f77f064ee0073fa9cb09297dec278bade17a572"
diff --git a/recipes/obsolete/xorg/xorg-font/font-misc-cyrillic_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-misc-cyrillic_1.0.0.bb
new file mode 100644
index 0000000..ba0bec7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-misc-cyrillic_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3596907d7a2a99c81d8de99bc4552b6a"
+SRC_URI[archive.sha256sum] = "7c0bac1302129d3bf40ec7d9830e728b0251dc20dda8c8979227b478663290ff"
diff --git a/recipes/obsolete/xorg/xorg-font/font-misc-ethiopic_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-misc-ethiopic_1.0.0.bb
new file mode 100644
index 0000000..6d96c46
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-misc-ethiopic_1.0.0.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0b271fc617087d77560bdca20c0cdbb0"
+SRC_URI[archive.sha256sum] = "58d2868801ca063797fa88fb4aea59f7c550473be4e9a4f96d84fe39b967d141"
diff --git a/recipes/obsolete/xorg/xorg-font/font-misc-meltho_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-misc-meltho_1.0.0.bb
new file mode 100644
index 0000000..c51cdc3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-misc-meltho_1.0.0.bb
@@ -0,0 +1,8 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "These fonts are designed for the display of Syriac text."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ccb212a7badf7aefdc9f9a92af428d32"
+SRC_URI[archive.sha256sum] = "c7e12b9926b6053f3567eae548840f0b3d283ce34f842b06309a81c1d98d3924"
diff --git a/recipes/obsolete/xorg/xorg-font/font-misc-misc/configure-mapdir.patch b/recipes/obsolete/xorg/xorg-font/font-misc-misc/configure-mapdir.patch
new file mode 100644
index 0000000..caf09b6
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-misc-misc/configure-mapdir.patch
@@ -0,0 +1,11 @@
+--- s/configure.ac~	2005-12-15 00:24:25.000000000 +0000
++++ s/configure.ac	2008-07-27 10:05:30.000000000 +0100
+@@ -45,7 +45,7 @@
+ AC_SUBST(FONTDIR)
+ 
+ PKG_CHECK_MODULES(MAPS, [fontutil])
+-MAPFILES_PATH=$(pkg-config --variable=mapdir fontutil)
++MAPFILES_PATH=$(PKG_CONFIG_PATH="${STAGING_LIBDIR_NATIVE}/pkg-config" ${PKG_CONFIG} --variable=mapdir fontutil)
+ AC_SUBST(MAPFILES_PATH)
+ 
+ XORG_FONT_CHECK_ISO8859_1
diff --git a/recipes/obsolete/xorg/xorg-font/font-misc-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-misc-misc_1.0.0.bb
new file mode 100644
index 0000000..43bfa95
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-misc-misc_1.0.0.bb
@@ -0,0 +1,10 @@
+EXTRA_OECONF = "STAGING_LIBDIR_NATIVE=\"${STAGING_LIBDIR_NATIVE}\""
+
+require xorg-font-common.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://configure-mapdir.patch"
+
+SRC_URI[archive.md5sum] = "2a57f6188c41d4bc1b88ca3d08ad011d"
+SRC_URI[archive.sha256sum] = "26a02560ad1f1648e7c36be6daf42910762131d3974422d1b306e6cae13f17db"
diff --git a/recipes/obsolete/xorg/xorg-font/font-mutt-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-mutt-misc_1.0.0.bb
new file mode 100644
index 0000000..aae3d9d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-mutt-misc_1.0.0.bb
@@ -0,0 +1,10 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Provides a 12pt, 100dpi proportional font with many of \
+the glyphs needed for Unicode text."
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "648b409b7eb78ad1cd5f6d7fac3eef88"
+SRC_URI[archive.sha256sum] = "f219183bd0f2b8ceca42a8a345c921f2a8ee19f4d86fef11c4ce8918d41aedff"
diff --git a/recipes/obsolete/xorg/xorg-font/font-schumacher-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-schumacher-misc_1.0.0.bb
new file mode 100644
index 0000000..7a5b4f6
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-schumacher-misc_1.0.0.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f1c6063d2fadc57e696a0aab69afd6e0"
+SRC_URI[archive.sha256sum] = "454e6cf885a4475569ce24ad3d4a82cb331d74e1a25f0747694a71098b56ef7a"
diff --git a/recipes/obsolete/xorg/xorg-font/font-screen-cyrillic_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-screen-cyrillic_1.0.0.bb
new file mode 100644
index 0000000..30f3984
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-screen-cyrillic_1.0.0.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "aea02d9dff03e0e1a3de85364367c0c6"
+SRC_URI[archive.sha256sum] = "01de82644a9b765599ba8c36c6b689035a85b6590486842067f707f2cb0cf268"
diff --git a/recipes/obsolete/xorg/xorg-font/font-sony-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-sony-misc_1.0.0.bb
new file mode 100644
index 0000000..1f3897e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-sony-misc_1.0.0.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0dfddd1a946e4497f009094c0ae1bdd5"
+SRC_URI[archive.sha256sum] = "1ae93ae76020b57cb0054ba9f33b4d5aec71342c6596750c07303d5c53452e23"
diff --git a/recipes/obsolete/xorg/xorg-font/font-sun-misc_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-sun-misc_1.0.0.bb
new file mode 100644
index 0000000..62bcf2e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-sun-misc_1.0.0.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e17d43a7c6c0d862cfba0908ff132ffa"
+SRC_URI[archive.sha256sum] = "03c12d8f4d8e7f0178f501ea3ee0709ee3a1deda733afecd631807e6ba5729e5"
diff --git a/recipes/obsolete/xorg/xorg-font/font-util-native_1.0.1.bb b/recipes/obsolete/xorg/xorg-font/font-util-native_1.0.1.bb
new file mode 100644
index 0000000..84f65d7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-util-native_1.0.1.bb
@@ -0,0 +1,12 @@
+inherit native
+require xorg-font-common.inc
+
+XORG_PN = "font-util"
+
+DEPENDS = "bdftopcf-native"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b81535f78fe05732931f02841e5ca37b"
+SRC_URI[archive.sha256sum] = "048c23b17ea32ee3abb341f0b1105ad07517b2e78efe2e95a4a8218089600612"
diff --git a/recipes/obsolete/xorg/xorg-font/font-util_1.0.1.bb b/recipes/obsolete/xorg/xorg-font/font-util_1.0.1.bb
new file mode 100644
index 0000000..47fa71a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-util_1.0.1.bb
@@ -0,0 +1,14 @@
+require xorg-font-common.inc
+
+PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
+
+DESCRIPTION = "X font utils."
+
+DEPENDS = "encodings"
+RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
+
+PE = "1"
+PR = "${INC_PR}.2"
+
+SRC_URI[archive.md5sum] = "b81535f78fe05732931f02841e5ca37b"
+SRC_URI[archive.sha256sum] = "048c23b17ea32ee3abb341f0b1105ad07517b2e78efe2e95a4a8218089600612"
diff --git a/recipes/obsolete/xorg/xorg-font/font-winitzki-cyrillic_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-winitzki-cyrillic_1.0.0.bb
new file mode 100644
index 0000000..7069f0a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-winitzki-cyrillic_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b99b02aff36a88ca3379715423c60303"
+SRC_URI[archive.sha256sum] = "478a7f6881fce6a335b409e1326449af4162a147d268f1978b8dd81c834beee3"
diff --git a/recipes/obsolete/xorg/xorg-font/font-xfree86-type1_1.0.0.bb b/recipes/obsolete/xorg/xorg-font/font-xfree86-type1_1.0.0.bb
new file mode 100644
index 0000000..3e091f3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-xfree86-type1_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e66f36a6d68203cc4cf7b56ebbb192dd"
+SRC_URI[archive.sha256sum] = "ef76d3b91d1bdaa9ff73cc1e5905ad4bbdc028f06157d0d2319d38e7b7f84a4d"
diff --git a/recipes/obsolete/xorg/xorg-font/font-xfree86-type1_1.0.1.bb b/recipes/obsolete/xorg/xorg-font/font-xfree86-type1_1.0.1.bb
new file mode 100644
index 0000000..090a197
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-font/font-xfree86-type1_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d7e965776c7f0c30b0f09742176fb77a"
+SRC_URI[archive.sha256sum] = "8fd9f9b81120d8afc25ea8901a8a91d7428c45cd9cfe7a7bef2b15c8b8d5f341"
diff --git a/recipes/xorg-font/encodings_1.0.2.bb b/recipes/xorg-font/encodings_1.0.2.bb
deleted file mode 100644
index b0272a2..0000000
--- a/recipes/xorg-font/encodings_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-DEPENDS = "mkfontscale-native font-util-native"
-
-SRC_URI[archive.md5sum] = "11adda157b03d63fd61d95ad7ef00466"
-SRC_URI[archive.sha256sum] = "6d19107b66bbc96c085b0c2dd286ece22dcb73ba56a17fc95b0f2cbc5d6f4eac"
diff --git a/recipes/xorg-font/files/imake-staging.patch b/recipes/xorg-font/files/imake-staging.patch
deleted file mode 100644
index bf2e350..0000000
--- a/recipes/xorg-font/files/imake-staging.patch
+++ /dev/null
@@ -1,38 +0,0 @@
---- xc/config/cf/Imake.tmpl.orig	2004-07-28 04:24:29.000000000 +0100
-+++ xc/config/cf/Imake.tmpl	2004-09-14 21:03:06.000000000 +0100
-@@ -2038,11 +2038,11 @@
-  */
-       ALLINCLUDES = $(INCLUDES) $(EXTRA_INCLUDES) $(TOP_INCLUDES) $(INSTALLED_INCLUDES) $(STD_INCLUDES)
-        ALLDEFINES = $(ALLINCLUDES) $(STD_DEFINES) $(PROTO_DEFINES) $(THREADS_DEFINES) $(MODULE_DEFINES) $(DEFINES) $(EXTRA_DEFINES)
--           CFLAGS = $(CDEBUGFLAGS) $(CCOPTIONS) $(THREADS_CFLAGS) $(MODULE_CFLAGS) $(ALLDEFINES)
-+           CFLAGS = $(CDEBUGFLAGS) $(CCOPTIONS) $(THREADS_CFLAGS) $(MODULE_CFLAGS) $(ALLDEFINES) $(CC_STAGING)
-         LINTFLAGS = $(LINTOPTS) -DLINT $(ALLDEFINES) $(DEPEND_DEFINES)
-          LDPRELIB = LdPreLib $(INSTALLED_LIBS)
-         LDPOSTLIB = LdPostLib
--        LDOPTIONS = $(CDEBUGFLAGS) $(CCOPTIONS)  $(EXTRA_LDOPTIONS) $(THREADS_LDFLAGS) $(LOCAL_LDFLAGS) $(LDPRELIBS)
-+        LDOPTIONS = $(CDEBUGFLAGS) $(CCOPTIONS)  $(EXTRA_LDOPTIONS) $(THREADS_LDFLAGS) $(LOCAL_LDFLAGS) $(LDPRELIBS) $(LD_STAGING)
-      CXXLDOPTIONS = $(CXXDEBUGFLAGS) $(CXXOPTIONS) $(EXTRA_LDOPTIONS) $(THREADS_CXXLDFLAGS) $(LOCAL_LDFLAGS) $(LDPRELIBS)
- 
-            LDLIBS = $(LDPOSTLIBS) $(THREADS_LIBS) $(SYS_LIBRARIES) $(EXTRA_LIBRARIES)
---- xc/config/cf/Library.tmpl~	2004-05-24 20:06:57.000000000 +0100
-+++ xc/config/cf/Library.tmpl	2004-09-14 21:10:29.000000000 +0100
-@@ -114,7 +114,7 @@
- STD_DEFINES = LibraryDefines $(PROJECT_DEFINES)
- CDEBUGFLAGS = LibraryCDebugFlags
- CLIBDEBUGFLAGS = LibraryDebugOpt
--     CFLAGS = $(CDEBUGFLAGS) $(CLIBDEBUGFLAGS) $(CCOPTIONS) $(THREADS_CFLAGS) $(ALLDEFINES)
-+     CFLAGS = $(CDEBUGFLAGS) $(CLIBDEBUGFLAGS) $(CCOPTIONS) $(THREADS_CFLAGS) $(ALLDEFINES) $(CC_STAGING)
- # if defined(LargePICTable) && LargePICTable && defined(LargePositionIndependentCFlags)
-    PICFLAGS = LargePositionIndependentCFlags
- # endif
---- xc/config/cf/X11.tmpl~	2004-09-03 17:18:18.000000000 +0100
-+++ xc/config/cf/X11.tmpl	2004-09-14 21:30:30.000000000 +0100
-@@ -3359,7 +3359,7 @@
- FREETYPE2LIBDIR = Freetype2LibDir
- FREETYPE2INCDIR = Freetype2IncDir
- #if Freetype2LibDirStandard
--FREETYPE2LIB = -lfreetype
-+FREETYPE2LIB = $(LD_STAGING) -lfreetype
- #else
- FREETYPE2LIB = -L$(FREETYPE2LIBDIR) LinkerRuntimeLibraryPathFlag($(FREETYPE2LIBDIR)) -lfreetype
- #endif
diff --git a/recipes/xorg-font/files/lexer.patch b/recipes/xorg-font/files/lexer.patch
deleted file mode 100644
index c3caf57..0000000
--- a/recipes/xorg-font/files/lexer.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-diff -Naur xc.old/config/pswrap/lexer.l xc/config/pswrap/lexer.l
---- xc.old/config/pswrap/lexer.l	2004-04-23 18:42:00.000000000 +0000
-+++ xc/config/pswrap/lexer.l	2004-11-16 21:07:10.569144105 +0000
-@@ -41,6 +41,7 @@
- #include <ctype.h>
- #include <stdlib.h>
- #include <string.h>
-+int yy_prev_more_offset;
- 
- #include "pswpriv.h"
- #include "pswparser.h"
-diff -Naur xc.old/programs/twm/lex.l xc/programs/twm/lex.l
---- xc.old/programs/twm/lex.l	2004-04-23 18:42:00.000000000 +0000
-+++ xc/programs/twm/lex.l    2004-11-16 21:07:10.569144105 +0000
-@@ -65,6 +41,7 @@
- #include "gram.h"
- #include "list.h"
- #include "parse.h"
-+int yy_prev_more_offset;
-
- #ifdef FLEX_SCANNER
- int yylineno;
-diff -Naur xc.old/programs/xgc/lex.l xc/programs/xgc/lex.l
---- xc.old/programs/xgc/lex.l	2004-04-23 18:42:00.000000000 +0000
-+++ xc/programs/xgc/lex.l    2004-11-16 21:07:10.569144105 +0000
-@@ -11,6 +11,9 @@
- #include <X11/X.h>
- #include "gram.h"
- #include "constants.h"
-+ 
-+int yy_prev_more_offset;
-+ 
- #if defined(FLEX_SCANNER) && !defined(YY_FLEX_LEX_COMPAT) && !defined(__UNIXOS2__)
- int yylineno = 0;
- #endif
-diff -Naur xc.old/programs/Xserver/hw/dmx/config/scanner.l xc/programs/Xserver/hw/dmx/config/scanner.l
---- xc.old/programs/Xserver/hw/dmx/config/scanner.l 2004-07-30 20:06:00.000000000 +0000
-+++ xc.old/programs/Xserver/hw/dmx/config/scanner.l 2004-11-16 21:07:10.569144105 +0000
-@@ -37,6 +37,9 @@
- #include "parser.h"
- #include <string.h>
- #include <ctype.h>
-+
-+int yy_prev_more_offset;
-+
- static int getdimension(int token, const char *text, int leng);
- static int getstring(int token, const char *text, int leng);
- static int gettoken(int token, const char *text, int leng);
diff --git a/recipes/xorg-font/font-adobe-100dpi_1.0.0.bb b/recipes/xorg-font/font-adobe-100dpi_1.0.0.bb
deleted file mode 100644
index 31da680..0000000
--- a/recipes/xorg-font/font-adobe-100dpi_1.0.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "443acfe70e26716282f9068730fe92c4"
-SRC_URI[archive.sha256sum] = "f16c1b3a1625c9a225aff2ac12067bd3907d157b0c60625689a5080f092e9a19"
diff --git a/recipes/xorg-font/font-adobe-75dpi_1.0.0.bb b/recipes/xorg-font/font-adobe-75dpi_1.0.0.bb
deleted file mode 100644
index f0654d2..0000000
--- a/recipes/xorg-font/font-adobe-75dpi_1.0.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "813b5d3723c84388a938ab6732e1329c"
-SRC_URI[archive.sha256sum] = "d62745bee0f5e4f355f237020667d783ae9fea5f18a864d748ae1287bd176339"
diff --git a/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.1.bb b/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.1.bb
deleted file mode 100644
index f5286ee..0000000
--- a/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Adobe typeface software"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5d28a30efef966f8dbbaff9a6619f01a"
-SRC_URI[archive.sha256sum] = "1943e1aa70c169b13bc7a308c8e949267f9ce6327479803203fbf10c06a9b5fe"
diff --git a/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.1.bb b/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.1.bb
deleted file mode 100644
index 7cffdd8..0000000
--- a/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Adobe typeface software"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "dd912284e4750023f9682812532fa033"
-SRC_URI[archive.sha256sum] = "ebd4e2194bbc727e3bbda0f5dc1493fe3a211c7cf77e3d41f93135dd04ca7089"
diff --git a/recipes/xorg-font/font-adobe-utopia-type1_1.0.1.bb b/recipes/xorg-font/font-adobe-utopia-type1_1.0.1.bb
deleted file mode 100644
index 648fe05..0000000
--- a/recipes/xorg-font/font-adobe-utopia-type1_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Adobe typeface software"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "aa7ff4bd20b961afda9c15d103b972a5"
-SRC_URI[archive.sha256sum] = "e9c672c8ff275fd5c2d76dda9a9f11138766e246e31e45763cd7e14d8824c0dc"
diff --git a/recipes/xorg-font/font-alias_1.0.1.bb b/recipes/xorg-font/font-alias_1.0.1.bb
deleted file mode 100644
index 687e0a4..0000000
--- a/recipes/xorg-font/font-alias_1.0.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "X font aliases."
-
-DEPENDS = "virtual/xserver font-util"
-RDEPENDS_${PN} = "encodings font-util"
-
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "c4776b6f0f2ecdb7670b6fe64b5d2a2d"
-SRC_URI[archive.sha256sum] = "77db60d63224b9d856129d23c0b0d0e9154a166137daf749d39abfd56a4f89b6"
diff --git a/recipes/xorg-font/font-arabic-misc_1.0.0.bb b/recipes/xorg-font/font-arabic-misc_1.0.0.bb
deleted file mode 100644
index 4ebf72e..0000000
--- a/recipes/xorg-font/font-arabic-misc_1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "100dpi, 24 point (approximately) font to minimally support (almost) all \
-of the Arabic characters available in Unicode."
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "81595016e2ff859716fc256ebb136ba6"
-SRC_URI[archive.sha256sum] = "90e9dfa3f33805ea2ffe06faa7258d8335cdf415826f963a1d0a76bd8df7bc94"
diff --git a/recipes/xorg-font/font-bh-100dpi_1.0.0.bb b/recipes/xorg-font/font-bh-100dpi_1.0.0.bb
deleted file mode 100644
index 69cbe4e..0000000
--- a/recipes/xorg-font/font-bh-100dpi_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e5592de74a5c04e3a2608800dd079197"
-SRC_URI[archive.sha256sum] = "ae8a11777579a2242f52ed19b5fdd6c6ef6fe2c2661a49d0599188de78cfee4a"
diff --git a/recipes/xorg-font/font-bh-75dpi_1.0.0.bb b/recipes/xorg-font/font-bh-75dpi_1.0.0.bb
deleted file mode 100644
index 605f759..0000000
--- a/recipes/xorg-font/font-bh-75dpi_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6e51cd02f4ce32e1393e34ab17a9b211"
-SRC_URI[archive.sha256sum] = "c79467b440cc9389c75d55fba64d0126d0f2e1e6c019dfafb7d89d07802c05bf"
diff --git a/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.0.bb b/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.0.bb
deleted file mode 100644
index e075cb4..0000000
--- a/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c44d3f730564da465993e9292a33c235"
-SRC_URI[archive.sha256sum] = "36d47dcba591037b6af35fc151e3d7a6c9f16f42b3182e083ea140cb584d7013"
diff --git a/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.0.bb b/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.0.bb
deleted file mode 100644
index d5d87a8..0000000
--- a/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fdd9be5b9db94ef363a33e39b7977e2b"
-SRC_URI[archive.sha256sum] = "50f2f36f533a49c65842568052fe4d065354ff6f39ab36dd2129f465741da046"
diff --git a/recipes/xorg-font/font-bh-ttf_1.0.0.bb b/recipes/xorg-font/font-bh-ttf_1.0.0.bb
deleted file mode 100644
index b276908..0000000
--- a/recipes/xorg-font/font-bh-ttf_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ad43cf739b3d46ba1e7dc778a0608a52"
-SRC_URI[archive.sha256sum] = "7a1a5e72f7e42398b98d70aa64252837e85ed76eea77a1b9a4cd0f1203d7d644"
diff --git a/recipes/xorg-font/font-bh-type1_1.0.0.bb b/recipes/xorg-font/font-bh-type1_1.0.0.bb
deleted file mode 100644
index 93ddfe8..0000000
--- a/recipes/xorg-font/font-bh-type1_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "46588b22678e440741d6220bc3945cbf"
-SRC_URI[archive.sha256sum] = "5a8a5513f2c829d56043a0f74980efc11b4b4522f21116f16711998f72c3645b"
diff --git a/recipes/xorg-font/font-bitstream-100dpi_1.0.0.bb b/recipes/xorg-font/font-bitstream-100dpi_1.0.0.bb
deleted file mode 100644
index 25af60c..0000000
--- a/recipes/xorg-font/font-bitstream-100dpi_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "173352ddec3d26e2b91df1edcf1ae85b"
-SRC_URI[archive.sha256sum] = "0c705a74d7b52e41a1f1aa6732f0200877ba2d4303b79513a524e7cc1b30e2d2"
diff --git a/recipes/xorg-font/font-bitstream-75dpi_1.0.0.bb b/recipes/xorg-font/font-bitstream-75dpi_1.0.0.bb
deleted file mode 100644
index 64c2b55..0000000
--- a/recipes/xorg-font/font-bitstream-75dpi_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "beb476657d50d07d17eef7c325a5ed08"
-SRC_URI[archive.sha256sum] = "2ddfeaccca97524e1b0f4fb37b2fd0f1338698e35f8b05b22b594fe29e201bfb"
diff --git a/recipes/xorg-font/font-bitstream-speedo_1.0.0.bb b/recipes/xorg-font/font-bitstream-speedo_1.0.0.bb
deleted file mode 100644
index cd4790e..0000000
--- a/recipes/xorg-font/font-bitstream-speedo_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1399dc18aeb9571b0951d9570ea1059d"
-SRC_URI[archive.sha256sum] = "99ac01786ac400cc7407f1c427b92c5ff1ac5a31ce7d5907b7ad3c969214f6e6"
diff --git a/recipes/xorg-font/font-bitstream-type1_1.0.0.bb b/recipes/xorg-font/font-bitstream-type1_1.0.0.bb
deleted file mode 100644
index 39f8f33..0000000
--- a/recipes/xorg-font/font-bitstream-type1_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6610475e2e231242f8f2122a709c3695"
-SRC_URI[archive.sha256sum] = "4fce492dcf168837342ea1787ac35b53e4d30361239cba207c9520c42454d903"
diff --git a/recipes/xorg-font/font-cronyx-cyrillic_1.0.0.bb b/recipes/xorg-font/font-cronyx-cyrillic_1.0.0.bb
deleted file mode 100644
index d875de8..0000000
--- a/recipes/xorg-font/font-cronyx-cyrillic_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "22b451e7230b8c003cfc496ee2d360cc"
-SRC_URI[archive.sha256sum] = "06c94e7033f5cae77b9ba27b84af7c1d3e7f73a7239346aabf98eda6c7f484ee"
diff --git a/recipes/xorg-font/font-cursor-misc_1.0.0.bb b/recipes/xorg-font/font-cursor-misc_1.0.0.bb
deleted file mode 100644
index c152a1f..0000000
--- a/recipes/xorg-font/font-cursor-misc_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "305fa22cdfefb8f80babd711051a534b"
-SRC_URI[archive.sha256sum] = "955de27117581ba501d7c2abae7f38b0a65662e4ab2e2b54b9eb2dc07aa5f3c5"
diff --git a/recipes/xorg-font/font-daewoo-misc_1.0.0.bb b/recipes/xorg-font/font-daewoo-misc_1.0.0.bb
deleted file mode 100644
index 67344e5..0000000
--- a/recipes/xorg-font/font-daewoo-misc_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "61f9eab48c619af5494d3e384d8d7d79"
-SRC_URI[archive.sha256sum] = "f198eac92e343a38b1e23288880bac91c439bdc90c61a79a7cb0718e9a468926"
diff --git a/recipes/xorg-font/font-dec-misc_1.0.0.bb b/recipes/xorg-font/font-dec-misc_1.0.0.bb
deleted file mode 100644
index 06a6b0f..0000000
--- a/recipes/xorg-font/font-dec-misc_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "284e554db1c64fb7580a06df01444a2b"
-SRC_URI[archive.sha256sum] = "83386d1225dab1ebc58e7d197acc4c310ed4e29840abf291b1fa2ffac1b68bb9"
diff --git a/recipes/xorg-font/font-ibm-type1_1.0.0.bb b/recipes/xorg-font/font-ibm-type1_1.0.0.bb
deleted file mode 100644
index b82fcdb..0000000
--- a/recipes/xorg-font/font-ibm-type1_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8e8733051371e2b51123376b49f5d3ea"
-SRC_URI[archive.sha256sum] = "30d091c2e3506943f8a6e152c4be973c462ba19293a864bbb48b82c6cf9c461e"
diff --git a/recipes/xorg-font/font-isas-misc_1.0.0.bb b/recipes/xorg-font/font-isas-misc_1.0.0.bb
deleted file mode 100644
index fc41381..0000000
--- a/recipes/xorg-font/font-isas-misc_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ec709a96b64b497a5cb5658c93bd38dc"
-SRC_URI[archive.sha256sum] = "97e61313ce0bf229da5d489fc5a05562fdca14f9acc17c40d0b272a345ba4ea2"
diff --git a/recipes/xorg-font/font-jis-misc_1.0.0.bb b/recipes/xorg-font/font-jis-misc_1.0.0.bb
deleted file mode 100644
index f61ce02..0000000
--- a/recipes/xorg-font/font-jis-misc_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "61febb49a71065723a1fba17cbf23c67"
-SRC_URI[archive.sha256sum] = "3721eefd4ffc47c6948065f7acf9d5c731c4e8e54105d096735876d3712dc7ba"
diff --git a/recipes/xorg-font/font-micro-misc_1.0.0.bb b/recipes/xorg-font/font-micro-misc_1.0.0.bb
deleted file mode 100644
index d15b7c2..0000000
--- a/recipes/xorg-font/font-micro-misc_1.0.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-EXTRA_OECONF = "--disable-iso8859-2 --disable-iso8859-3 --disable-iso8859-4 --disable-iso8859-5 --disable-iso8859-6 --disable-iso8859-7 --disable-iso8859-8 --disable-iso8859-9 --disable-iso8859-10 --disable-iso8859-11 --disable-iso8859-12 --disable-iso8859-13 --disable-iso8859-14 --disable-iso8859-15 --disable-iso8859-16 --disable-jisx0201 --disable-koi8-r"
-
-SRC_URI[archive.md5sum] = "8c8bffd7540f05caa0dbb4e6e1d6c58e"
-SRC_URI[archive.sha256sum] = "16b17b5939e12e9381c8096c1f77f064ee0073fa9cb09297dec278bade17a572"
diff --git a/recipes/xorg-font/font-misc-cyrillic_1.0.0.bb b/recipes/xorg-font/font-misc-cyrillic_1.0.0.bb
deleted file mode 100644
index ba0bec7..0000000
--- a/recipes/xorg-font/font-misc-cyrillic_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3596907d7a2a99c81d8de99bc4552b6a"
-SRC_URI[archive.sha256sum] = "7c0bac1302129d3bf40ec7d9830e728b0251dc20dda8c8979227b478663290ff"
diff --git a/recipes/xorg-font/font-misc-ethiopic_1.0.0.bb b/recipes/xorg-font/font-misc-ethiopic_1.0.0.bb
deleted file mode 100644
index 6d96c46..0000000
--- a/recipes/xorg-font/font-misc-ethiopic_1.0.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0b271fc617087d77560bdca20c0cdbb0"
-SRC_URI[archive.sha256sum] = "58d2868801ca063797fa88fb4aea59f7c550473be4e9a4f96d84fe39b967d141"
diff --git a/recipes/xorg-font/font-misc-meltho_1.0.0.bb b/recipes/xorg-font/font-misc-meltho_1.0.0.bb
deleted file mode 100644
index c51cdc3..0000000
--- a/recipes/xorg-font/font-misc-meltho_1.0.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "These fonts are designed for the display of Syriac text."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ccb212a7badf7aefdc9f9a92af428d32"
-SRC_URI[archive.sha256sum] = "c7e12b9926b6053f3567eae548840f0b3d283ce34f842b06309a81c1d98d3924"
diff --git a/recipes/xorg-font/font-misc-misc/configure-mapdir.patch b/recipes/xorg-font/font-misc-misc/configure-mapdir.patch
deleted file mode 100644
index caf09b6..0000000
--- a/recipes/xorg-font/font-misc-misc/configure-mapdir.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- s/configure.ac~	2005-12-15 00:24:25.000000000 +0000
-+++ s/configure.ac	2008-07-27 10:05:30.000000000 +0100
-@@ -45,7 +45,7 @@
- AC_SUBST(FONTDIR)
- 
- PKG_CHECK_MODULES(MAPS, [fontutil])
--MAPFILES_PATH=$(pkg-config --variable=mapdir fontutil)
-+MAPFILES_PATH=$(PKG_CONFIG_PATH="${STAGING_LIBDIR_NATIVE}/pkg-config" ${PKG_CONFIG} --variable=mapdir fontutil)
- AC_SUBST(MAPFILES_PATH)
- 
- XORG_FONT_CHECK_ISO8859_1
diff --git a/recipes/xorg-font/font-misc-misc_1.0.0.bb b/recipes/xorg-font/font-misc-misc_1.0.0.bb
deleted file mode 100644
index 43bfa95..0000000
--- a/recipes/xorg-font/font-misc-misc_1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-EXTRA_OECONF = "STAGING_LIBDIR_NATIVE=\"${STAGING_LIBDIR_NATIVE}\""
-
-require xorg-font-common.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += " file://configure-mapdir.patch"
-
-SRC_URI[archive.md5sum] = "2a57f6188c41d4bc1b88ca3d08ad011d"
-SRC_URI[archive.sha256sum] = "26a02560ad1f1648e7c36be6daf42910762131d3974422d1b306e6cae13f17db"
diff --git a/recipes/xorg-font/font-mutt-misc_1.0.0.bb b/recipes/xorg-font/font-mutt-misc_1.0.0.bb
deleted file mode 100644
index aae3d9d..0000000
--- a/recipes/xorg-font/font-mutt-misc_1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Provides a 12pt, 100dpi proportional font with many of \
-the glyphs needed for Unicode text."
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "648b409b7eb78ad1cd5f6d7fac3eef88"
-SRC_URI[archive.sha256sum] = "f219183bd0f2b8ceca42a8a345c921f2a8ee19f4d86fef11c4ce8918d41aedff"
diff --git a/recipes/xorg-font/font-schumacher-misc_1.0.0.bb b/recipes/xorg-font/font-schumacher-misc_1.0.0.bb
deleted file mode 100644
index 7a5b4f6..0000000
--- a/recipes/xorg-font/font-schumacher-misc_1.0.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f1c6063d2fadc57e696a0aab69afd6e0"
-SRC_URI[archive.sha256sum] = "454e6cf885a4475569ce24ad3d4a82cb331d74e1a25f0747694a71098b56ef7a"
diff --git a/recipes/xorg-font/font-screen-cyrillic_1.0.0.bb b/recipes/xorg-font/font-screen-cyrillic_1.0.0.bb
deleted file mode 100644
index 30f3984..0000000
--- a/recipes/xorg-font/font-screen-cyrillic_1.0.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "aea02d9dff03e0e1a3de85364367c0c6"
-SRC_URI[archive.sha256sum] = "01de82644a9b765599ba8c36c6b689035a85b6590486842067f707f2cb0cf268"
diff --git a/recipes/xorg-font/font-sony-misc_1.0.0.bb b/recipes/xorg-font/font-sony-misc_1.0.0.bb
deleted file mode 100644
index 1f3897e..0000000
--- a/recipes/xorg-font/font-sony-misc_1.0.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0dfddd1a946e4497f009094c0ae1bdd5"
-SRC_URI[archive.sha256sum] = "1ae93ae76020b57cb0054ba9f33b4d5aec71342c6596750c07303d5c53452e23"
diff --git a/recipes/xorg-font/font-sun-misc_1.0.0.bb b/recipes/xorg-font/font-sun-misc_1.0.0.bb
deleted file mode 100644
index 62bcf2e..0000000
--- a/recipes/xorg-font/font-sun-misc_1.0.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e17d43a7c6c0d862cfba0908ff132ffa"
-SRC_URI[archive.sha256sum] = "03c12d8f4d8e7f0178f501ea3ee0709ee3a1deda733afecd631807e6ba5729e5"
diff --git a/recipes/xorg-font/font-util-native_1.0.1.bb b/recipes/xorg-font/font-util-native_1.0.1.bb
deleted file mode 100644
index 84f65d7..0000000
--- a/recipes/xorg-font/font-util-native_1.0.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-inherit native
-require xorg-font-common.inc
-
-XORG_PN = "font-util"
-
-DEPENDS = "bdftopcf-native"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b81535f78fe05732931f02841e5ca37b"
-SRC_URI[archive.sha256sum] = "048c23b17ea32ee3abb341f0b1105ad07517b2e78efe2e95a4a8218089600612"
diff --git a/recipes/xorg-font/font-util_1.0.1.bb b/recipes/xorg-font/font-util_1.0.1.bb
deleted file mode 100644
index 47fa71a..0000000
--- a/recipes/xorg-font/font-util_1.0.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-font-common.inc
-
-PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
-
-DESCRIPTION = "X font utils."
-
-DEPENDS = "encodings"
-RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
-
-PE = "1"
-PR = "${INC_PR}.2"
-
-SRC_URI[archive.md5sum] = "b81535f78fe05732931f02841e5ca37b"
-SRC_URI[archive.sha256sum] = "048c23b17ea32ee3abb341f0b1105ad07517b2e78efe2e95a4a8218089600612"
diff --git a/recipes/xorg-font/font-winitzki-cyrillic_1.0.0.bb b/recipes/xorg-font/font-winitzki-cyrillic_1.0.0.bb
deleted file mode 100644
index 7069f0a..0000000
--- a/recipes/xorg-font/font-winitzki-cyrillic_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b99b02aff36a88ca3379715423c60303"
-SRC_URI[archive.sha256sum] = "478a7f6881fce6a335b409e1326449af4162a147d268f1978b8dd81c834beee3"
diff --git a/recipes/xorg-font/font-xfree86-type1_1.0.0.bb b/recipes/xorg-font/font-xfree86-type1_1.0.0.bb
deleted file mode 100644
index 3e091f3..0000000
--- a/recipes/xorg-font/font-xfree86-type1_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e66f36a6d68203cc4cf7b56ebbb192dd"
-SRC_URI[archive.sha256sum] = "ef76d3b91d1bdaa9ff73cc1e5905ad4bbdc028f06157d0d2319d38e7b7f84a4d"
diff --git a/recipes/xorg-font/font-xfree86-type1_1.0.1.bb b/recipes/xorg-font/font-xfree86-type1_1.0.1.bb
deleted file mode 100644
index 090a197..0000000
--- a/recipes/xorg-font/font-xfree86-type1_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d7e965776c7f0c30b0f09742176fb77a"
-SRC_URI[archive.sha256sum] = "8fd9f9b81120d8afc25ea8901a8a91d7428c45cd9cfe7a7bef2b15c8b8d5f341"
diff --git a/recipes/xorg-font/xfonts-xorg-6.8/lexer.patch b/recipes/xorg-font/xfonts-xorg-6.8/lexer.patch
new file mode 100644
index 0000000..c3caf57
--- /dev/null
+++ b/recipes/xorg-font/xfonts-xorg-6.8/lexer.patch
@@ -0,0 +1,48 @@
+diff -Naur xc.old/config/pswrap/lexer.l xc/config/pswrap/lexer.l
+--- xc.old/config/pswrap/lexer.l	2004-04-23 18:42:00.000000000 +0000
++++ xc/config/pswrap/lexer.l	2004-11-16 21:07:10.569144105 +0000
+@@ -41,6 +41,7 @@
+ #include <ctype.h>
+ #include <stdlib.h>
+ #include <string.h>
++int yy_prev_more_offset;
+ 
+ #include "pswpriv.h"
+ #include "pswparser.h"
+diff -Naur xc.old/programs/twm/lex.l xc/programs/twm/lex.l
+--- xc.old/programs/twm/lex.l	2004-04-23 18:42:00.000000000 +0000
++++ xc/programs/twm/lex.l    2004-11-16 21:07:10.569144105 +0000
+@@ -65,6 +41,7 @@
+ #include "gram.h"
+ #include "list.h"
+ #include "parse.h"
++int yy_prev_more_offset;
+
+ #ifdef FLEX_SCANNER
+ int yylineno;
+diff -Naur xc.old/programs/xgc/lex.l xc/programs/xgc/lex.l
+--- xc.old/programs/xgc/lex.l	2004-04-23 18:42:00.000000000 +0000
++++ xc/programs/xgc/lex.l    2004-11-16 21:07:10.569144105 +0000
+@@ -11,6 +11,9 @@
+ #include <X11/X.h>
+ #include "gram.h"
+ #include "constants.h"
++ 
++int yy_prev_more_offset;
++ 
+ #if defined(FLEX_SCANNER) && !defined(YY_FLEX_LEX_COMPAT) && !defined(__UNIXOS2__)
+ int yylineno = 0;
+ #endif
+diff -Naur xc.old/programs/Xserver/hw/dmx/config/scanner.l xc/programs/Xserver/hw/dmx/config/scanner.l
+--- xc.old/programs/Xserver/hw/dmx/config/scanner.l 2004-07-30 20:06:00.000000000 +0000
++++ xc.old/programs/Xserver/hw/dmx/config/scanner.l 2004-11-16 21:07:10.569144105 +0000
+@@ -37,6 +37,9 @@
+ #include "parser.h"
+ #include <string.h>
+ #include <ctype.h>
++
++int yy_prev_more_offset;
++
+ static int getdimension(int token, const char *text, int leng);
+ static int getstring(int token, const char *text, int leng);
+ static int gettoken(int token, const char *text, int leng);
-- 
1.7.2



