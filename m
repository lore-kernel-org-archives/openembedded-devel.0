Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBeZo-00010d-Qu
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Oct 2011 05:24:52 +0200
Received: by yxj17 with SMTP id 17so2260020yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Oct 2011 20:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Z9fwxWuj4CMQYREWdphUQLxNPU22bcTDwW33190txw8=;
	b=Waz50sHtvNBs5n8LMHP3JcGzr3WVP7KCjYVLcRgpctLSfm6XsqciwfXFA4sM79hqS8
	XLGzuMHdAvcciQ647xCGIe8MEOHaF3ZXWMxeVwSlRivmAe1DYZRkIH7TDeP1GAYtHVTP
	hloTB5BvGrmUy9aTuvfX1JygpuirYmMS3yMJA=
Received: by 10.42.189.6 with SMTP id dc6mr642582icb.16.1317871153757;
	Wed, 05 Oct 2011 20:19:13 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id r14sm7995060ibe.7.2011.10.05.20.19.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Oct 2011 20:19:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Oct 2011 20:19:05 -0700
Message-Id: <1317871145-10848-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] openssl: Fix build with gold linker
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
X-List-Received-Date: Thu, 06 Oct 2011 03:24:53 -0000

There was a missing version script for one of
the apps that was being flagged by gold. So we
add appropriate openssl.ld for engines/ccgost

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openssl-1.0.0e/debian/version-script.patch     |   34 +++++++++++++++-----
 .../recipes-connectivity/openssl/openssl_1.0.0e.bb |    2 +-
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/version-script.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/version-script.patch
index 9d73f31..6d73a4c 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/version-script.patch
+++ b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/version-script.patch
@@ -1,7 +1,7 @@
-Index: openssl-1.0.0c/Configure
+Index: openssl-1.0.0e/Configure
 ===================================================================
---- openssl-1.0.0c.orig/Configure	2011-08-12 23:02:54.436331036 -0700
-+++ openssl-1.0.0c/Configure	2011-08-12 23:03:39.626397324 -0700
+--- openssl-1.0.0e.orig/Configure	2011-10-04 22:49:47.599379260 -0700
++++ openssl-1.0.0e/Configure	2011-10-04 22:49:53.263407376 -0700
 @@ -1486,6 +1486,8 @@
  		}
  	}
@@ -11,10 +11,10 @@ Index: openssl-1.0.0c/Configure
  open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
  unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n" if -e "$Makefile.new";
  open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n";
-Index: openssl-1.0.0c/openssl.ld
+Index: openssl-1.0.0e/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-1.0.0c/openssl.ld	2011-08-12 23:03:39.626397324 -0700
++++ openssl-1.0.0e/openssl.ld	2011-10-04 22:49:53.295407572 -0700
 @@ -0,0 +1,4461 @@
 +OPENSSL_1.0.0 {
 +	global:
@@ -4477,14 +4477,32 @@ Index: openssl-1.0.0c/openssl.ld
 +		*;
 +};
 +
-Index: openssl-1.0.0c/engines/openssl.ld
+Index: openssl-1.0.0e/engines/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-1.0.0c/engines/openssl.ld	2011-08-12 23:03:39.626397324 -0700
-@@ -0,0 +1,7 @@
++++ openssl-1.0.0e/engines/openssl.ld	2011-10-04 22:49:53.295407572 -0700
+@@ -0,0 +1,10 @@
 +OPENSSL_1.0.0 {
 +	global:
 +		bind_engine;
++		v_check;
++		OPENSSL_init;
++		OPENSSL_finish;
++	local:
++		*;
++};
++
+Index: openssl-1.0.0e/engines/ccgost/openssl.ld
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ openssl-1.0.0e/engines/ccgost/openssl.ld	2011-10-04 22:49:53.339407745 -0700
+@@ -0,0 +1,10 @@
++OPENSSL_1.0.0 {
++	global:
++		bind_engine;
++		v_check;
++		OPENSSL_init;
++		OPENSSL_finish;
 +	local:
 +		*;
 +};
diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
index bc812d3..8fcf0ff 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
+++ b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-- 
1.7.5.4



