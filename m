Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhcMK-00057w-Sv
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 07:26:34 +0100
Received: by mail-pw0-f47.google.com with SMTP id 8so11200pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 22:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=X6PaRm0s2kpubqzvA/OLK5fUQSznkKZl4Yi0Dh/pTAo=;
	b=OV51tLThafAeHgHCTMdOm8MuE63CDPU+qMzSOiRLO6s6DeHDF9QQLiQNfMwbJyrPo3
	tuOVW8u0GuPe1YG1dDRROUAp5oxmaIhlu7wtVzts2eLPM/0Pccor3UP0savlTOSf4j5m
	8KFO8qnBRagOeXeNXTAq1BZ9SXzCdAryw1T9Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BXUQ9nu1Uvqii4a3AMxX7e0YJjIMCp2g/iYkFN8v0cW25P1n8p6GyIYHPigbvrZ7I1
	usNov9nf/p7XUiAC32+GTlhPySi8xLs4SViMGpENvernZyRk4W0oyfXY9i8FWZRun8rM
	n388EjB1qb80v+iGN+LYVfp5t2atmRiu/aJ4s=
Received: by 10.142.246.14 with SMTP id t14mr3160973wfh.44.1295936747834;
	Mon, 24 Jan 2011 22:25:47 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm18429417wfa.23.2011.01.24.22.25.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 22:25:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 22:25:38 -0800
Message-Id: <1295936745-718-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
References: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/9] recipes/meta recipes/tasks: Replace ipkg-utils with opkg-utils
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
X-List-Received-Date: Tue, 25 Jan 2011 06:26:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/meta/canadian-sdk.bb         |    2 +-
 recipes/meta/foonas-packages.bb      |    2 +-
 recipes/meta/meta-toolchain.bb       |    2 +-
 recipes/meta/openprotium-packages.bb |    2 +-
 recipes/meta/oplinux-packages.bb     |    2 +-
 recipes/meta/package-index.bb        |    2 +-
 recipes/meta/slugos-packages.bb      |    2 +-
 recipes/tasks/task-sdk-sbox-gpe.bb   |    2 +-
 recipes/tasks/task-shr-feed.bb       |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes/meta/canadian-sdk.bb b/recipes/meta/canadian-sdk.bb
index 701a02d..93b80b2 100644
--- a/recipes/meta/canadian-sdk.bb
+++ b/recipes/meta/canadian-sdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
-DEPENDS = "opkg-native ipkg-utils-native fakeroot-native sed-native zip-native"
+DEPENDS = "opkg-native opkg-utils-native fakeroot-native sed-native zip-native"
 PR = "r5"
 
 # NOTE: We need to save and restore PACKAGE_ARCHS, because sdk.bbclass
diff --git a/recipes/meta/foonas-packages.bb b/recipes/meta/foonas-packages.bb
index 2bd8437..570c26e 100644
--- a/recipes/meta/foonas-packages.bb
+++ b/recipes/meta/foonas-packages.bb
@@ -74,7 +74,7 @@ FOONAS_PACKAGES = "\
 	gtk-doc \
 	gzip \
 	hdparm \
-	ipkg-utils \
+	opkg-utils \
 	iptables \
 	ircp \
 	joe \
diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index cb9e438..b8ea037 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
-DEPENDS = "opkg-native ipkg-utils-native fakeroot-native sed-native"
+DEPENDS = "opkg-native opkg-utils-native fakeroot-native sed-native"
 
 inherit meta
 
diff --git a/recipes/meta/openprotium-packages.bb b/recipes/meta/openprotium-packages.bb
index 4b10ee2..a738f08 100644
--- a/recipes/meta/openprotium-packages.bb
+++ b/recipes/meta/openprotium-packages.bb
@@ -106,7 +106,7 @@ OPENPROTIUM_PACKAGES = "\
 	gzip \
 	hdparm \
 	ifupdown \
-	ipkg-utils \
+	opkg-utils \
 	iptables \
 	ircp \
 	joe \
diff --git a/recipes/meta/oplinux-packages.bb b/recipes/meta/oplinux-packages.bb
index d828eed..ab38c1d 100644
--- a/recipes/meta/oplinux-packages.bb
+++ b/recipes/meta/oplinux-packages.bb
@@ -201,7 +201,7 @@ PACKAGES_LIST = "\
         hydra \
 	ifupdown \
         iputils \
-	ipkg-utils \
+	opkg-utils \
 	iptables \
         intercom \
 	ircp \
diff --git a/recipes/meta/package-index.bb b/recipes/meta/package-index.bb
index 335970d..3ad1d10 100644
--- a/recipes/meta/package-index.bb
+++ b/recipes/meta/package-index.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Rebuild the package index"
 LICENSE = "MIT"
-DEPENDS = "ipkg-utils-native"
+DEPENDS = "opkg-utils-native"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes/meta/slugos-packages.bb b/recipes/meta/slugos-packages.bb
index fb8458a..3487c69 100644
--- a/recipes/meta/slugos-packages.bb
+++ b/recipes/meta/slugos-packages.bb
@@ -99,7 +99,7 @@ SLUGOS_PACKAGES = "\
 	ifupdown \
 	iozone3 \
 	iperf \
-	ipkg-utils \
+	opkg-utils \
 	iptables \
 	joe \
 	jpeg \
diff --git a/recipes/tasks/task-sdk-sbox-gpe.bb b/recipes/tasks/task-sdk-sbox-gpe.bb
index 315bddb..b8d1cce 100644
--- a/recipes/tasks/task-sdk-sbox-gpe.bb
+++ b/recipes/tasks/task-sdk-sbox-gpe.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} = "\
     gdk-pixbuf-loader-xpm \
     intltool \
     intltool-dev \
-    ipkg-utils \
+    opkg-utils \
     gettext-dev \
     pkgconfig-dev \
     autoconf \
diff --git a/recipes/tasks/task-shr-feed.bb b/recipes/tasks/task-shr-feed.bb
index daec242..35e5f0b 100644
--- a/recipes/tasks/task-shr-feed.bb
+++ b/recipes/tasks/task-shr-feed.bb
@@ -79,7 +79,7 @@ RDEPENDS_${PN} += "\
 		mtpaint \
 		telepathy-python \
 		intone-video \
-		ipkg-utils \
+		opkg-utils \
 		mysql \
 		fltk-chess \
 		remoko \
-- 
1.7.0.4



