Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PELAc-0003BS-NR
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 13:13:27 +0100
Received: by ewy2 with SMTP id 2so1577051ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 05:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=A9lGWAh/e3TvRVYeAffKCa+2QffcW8HUvnXHGDzk5vY=;
	b=BxWJfHLjtYy5GEO+bem8crIxOVUzgHQ9OzleEYwBovI6jKqWFcsFvAybXjOrwdhT00
	lyMhmZPuefgaIoQjTuYKyrlf4rqPeXKZxL4Qq8xeUJBqZ0v3hlcLuQillVKwIoaK/Srg
	LJN6KlnDQ+jNmdvUXLcdlr/MJcseFlTsxgyao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=p5gRRIICunSPArEQVgWKUtucfqV5xxWq4BsuRsEJl6BPbRYg0CuLDcsPqNp6we6tCc
	k6795ZxP34afGp0Y4cGeEoQhj+9W5XpabRMqOdEYkFyZYOT5CCPXGsPAkxTRGYWRdLn/
	y2kEAAl1XSq3/BLDPBKTufZY6C6XGL5EC9h+I=
Received: by 10.213.27.197 with SMTP id j5mr1611957ebc.47.1288959154265;
	Fri, 05 Nov 2010 05:12:34 -0700 (PDT)
Received: from localhost.localdomain (D4B26BC1.static.ziggozakelijk.nl
	[212.178.107.193])
	by mx.google.com with ESMTPS id v56sm965521eeh.2.2010.11.05.05.12.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 05:12:33 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Nov 2010 13:08:54 +0100
Message-Id: <1288958934-18209-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libX11: patch configure.ac so a nios2 system is not seen as an os2 system.
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
X-List-Received-Date: Fri, 05 Nov 2010 12:13:27 -0000

configure.ac matches target_system against *os2* to detect if we're
configuring for an os2 system. Unfortunately this also matches if the
target_system is nios-linux (which is not an os2 system :-) )
This patch adds an additional case. The patch is added to the individual
recipes and also made upstream.

Patch is tested by fully building 1.3.2 and by running
bitbake -c patch for the other recipes.

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 .../xorg-lib/libx11-1.1.5/configure.ac-nios2.patch |   12 ++++++++++++
 .../xorg-lib/libx11-1.3.2/configure.ac-nios2.patch |   12 ++++++++++++
 .../xorg-lib/libx11-1.3.6/configure.ac-nios2.patch |   12 ++++++++++++
 .../libx11-1.3.99.903/configure.ac-nios2.patch     |   12 ++++++++++++
 recipes/xorg-lib/libx11_1.1.5.bb                   |    3 ++-
 recipes/xorg-lib/libx11_1.3.2.bb                   |    3 ++-
 recipes/xorg-lib/libx11_1.3.6.bb                   |    3 ++-
 recipes/xorg-lib/libx11_1.3.99.903.bb              |    3 ++-
 8 files changed, 56 insertions(+), 4 deletions(-)
 create mode 100644 recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
 create mode 100644 recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
 create mode 100644 recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
 create mode 100644 recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch

diff --git a/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch b/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
new file mode 100644
index 0000000..5605a59
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
@@ -0,0 +1,12 @@
+Index: libX11-1.3.2/configure.ac
+===================================================================
+--- libX11-1.3.2.orig/configure.ac	2010-11-05 10:30:33.825536983 +0100
++++ libX11-1.3.2/configure.ac	2010-11-05 10:31:25.913899269 +0100
+@@ -202,6 +202,7 @@
+ # arch specific things
+ WCHAR32="1"
+ case $target_alias in
++  nios2*) os2="false" ;;
+   *os2*) os2="true" ; WCHAR32="0" ;;
+   *) ;;
+ esac
diff --git a/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch b/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
new file mode 100644
index 0000000..5605a59
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
@@ -0,0 +1,12 @@
+Index: libX11-1.3.2/configure.ac
+===================================================================
+--- libX11-1.3.2.orig/configure.ac	2010-11-05 10:30:33.825536983 +0100
++++ libX11-1.3.2/configure.ac	2010-11-05 10:31:25.913899269 +0100
+@@ -202,6 +202,7 @@
+ # arch specific things
+ WCHAR32="1"
+ case $target_alias in
++  nios2*) os2="false" ;;
+   *os2*) os2="true" ; WCHAR32="0" ;;
+   *) ;;
+ esac
diff --git a/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch b/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
new file mode 100644
index 0000000..5605a59
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
@@ -0,0 +1,12 @@
+Index: libX11-1.3.2/configure.ac
+===================================================================
+--- libX11-1.3.2.orig/configure.ac	2010-11-05 10:30:33.825536983 +0100
++++ libX11-1.3.2/configure.ac	2010-11-05 10:31:25.913899269 +0100
+@@ -202,6 +202,7 @@
+ # arch specific things
+ WCHAR32="1"
+ case $target_alias in
++  nios2*) os2="false" ;;
+   *os2*) os2="true" ; WCHAR32="0" ;;
+   *) ;;
+ esac
diff --git a/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch b/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch
new file mode 100644
index 0000000..5605a59
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch
@@ -0,0 +1,12 @@
+Index: libX11-1.3.2/configure.ac
+===================================================================
+--- libX11-1.3.2.orig/configure.ac	2010-11-05 10:30:33.825536983 +0100
++++ libX11-1.3.2/configure.ac	2010-11-05 10:31:25.913899269 +0100
+@@ -202,6 +202,7 @@
+ # arch specific things
+ WCHAR32="1"
+ case $target_alias in
++  nios2*) os2="false" ;;
+   *os2*) os2="true" ; WCHAR32="0" ;;
+   *) ;;
+ esac
diff --git a/recipes/xorg-lib/libx11_1.1.5.bb b/recipes/xorg-lib/libx11_1.1.5.bb
index e775585..b44dcc8 100644
--- a/recipes/xorg-lib/libx11_1.1.5.bb
+++ b/recipes/xorg-lib/libx11_1.1.5.bb
@@ -1,7 +1,8 @@
 require libx11.inc
 DEPENDS = "${COMMON_DEPENDS}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
+SRC_URI += " file://configure.ac-nios2.patch"
 SRC_URI[archive.md5sum] = "d1512d65dadd4f48c779d4749e7753a8"
 SRC_URI[archive.sha256sum] = "da9272900e41615e9c5dc25d84730b8966da6f5c8f4c40418dca2ad040fc8b82"
 
diff --git a/recipes/xorg-lib/libx11_1.3.2.bb b/recipes/xorg-lib/libx11_1.3.2.bb
index b3d48ab..189d1ff 100644
--- a/recipes/xorg-lib/libx11_1.3.2.bb
+++ b/recipes/xorg-lib/libx11_1.3.2.bb
@@ -1,10 +1,11 @@
 require libx11.inc
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 # gcc 4.5 ends up ICEing with thumb and -O1 with -fno-omit-framepointer
 # therefore if we are in thumb mode then we use -Os instead of -O1 for
 # DEBUG_OPTIMIZATION
 
 DEBUG_OPTIMIZATION_thumb_append = " -Os"
 SRC_URI += " file://dolt-fix.patch"
+SRC_URI += " file://configure.ac-nios2.patch"
 SRC_URI[archive.md5sum] = "001d780829f936e34851ef7cd37b4dfd"
 SRC_URI[archive.sha256sum] = "4def4d5c9fce85d690f1f29d675154594acdea3d3fe792d0cb513732c7b4bcb2"
diff --git a/recipes/xorg-lib/libx11_1.3.6.bb b/recipes/xorg-lib/libx11_1.3.6.bb
index 625f906..8d9f343 100644
--- a/recipes/xorg-lib/libx11_1.3.6.bb
+++ b/recipes/xorg-lib/libx11_1.3.6.bb
@@ -1,6 +1,7 @@
 require libx11.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += " file://dolt-fix.patch"
+SRC_URI += " file://configure.ac-nios2.patch"
 SRC_URI[archive.md5sum] = "8e0a8a466aa78f66e09fe06cb395319f"
 SRC_URI[archive.sha256sum] = "599826765c59a98b1e58b4f6c4ad50dca69eeb0e7bd78aea736ca815f45bea40"
diff --git a/recipes/xorg-lib/libx11_1.3.99.903.bb b/recipes/xorg-lib/libx11_1.3.99.903.bb
index 65ff63c..5ea3291 100644
--- a/recipes/xorg-lib/libx11_1.3.99.903.bb
+++ b/recipes/xorg-lib/libx11_1.3.99.903.bb
@@ -2,7 +2,8 @@ require libx11.inc
 #--without-xcb is not an option anymore
 #http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8
 DEPENDS_virtclass-native = "libxcb-native ${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
+SRC_URI += " file://configure.ac-nios2.patch"
 SRC_URI[archive.md5sum] = "3e8ed7a91f70bb819b5dab9c124a7062"
 SRC_URI[archive.sha256sum] = "50205aad0646c0ab13aff8e8eaec7c5cddff416d3a012f83c5661ad98e49736f"
-- 
1.7.0.4



