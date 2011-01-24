Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhTKR-0002Lw-Ly
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 21:47:59 +0100
Received: by qyk8 with SMTP id 8so3241650qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=X6PaRm0s2kpubqzvA/OLK5fUQSznkKZl4Yi0Dh/pTAo=;
	b=DmS0fu2UFihXHcDJWNAYV6VdKoX3b269jQrFPYfhVfUYEUvwsKxI/s9Xl7ZPzMkjlm
	1k5syw+ERKeHxOk7FuOyuCoNSa1wwE03lK6VmvBRE0pioNMnWJM+cyaBP/Yt6JM9kac0
	sbwbAyXmz8Wq7ZzHI5RE1zzCZWx9v9fvwY1uo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rLmCTbmaCavmuMbcFGN3DBlPB9aZNakLpiFx4YYMpPJPZr6tSHBdNGPhhRShg6NNuI
	NGWFSmIg9xw81ZyiKeQU+HmZlKQIZhqzcIEp4bbzQxEaCtWHXEP6AvnKYImjG9FS/ivA
	jHzbZssqXejDZTANJKZN+HmwhS6fRJeZa5ISE=
Received: by 10.229.28.133 with SMTP id m5mr4189758qcc.36.1295901611396;
	Mon, 24 Jan 2011 12:40:11 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t7sm9616474qcs.28.2011.01.24.12.18.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 12:18:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 12:18:11 -0800
Message-Id: <1295900293-25470-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295900293-25470-1-git-send-email-raj.khem@gmail.com>
References: <1295900293-25470-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/5] recipes/meta recipes/tasks: Replace ipkg-utils with opkg-utils
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
X-List-Received-Date: Mon, 24 Jan 2011 20:48:00 -0000

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



