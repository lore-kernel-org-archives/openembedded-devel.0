Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qzv01-0004ML-5H
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Sep 2011 20:31:25 +0200
Received: by bkbzu17 with SMTP id zu17so3342562bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Sep 2011 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D931QbPwAV0+QRoozyw1Q6Qk9OLJ547XOjfsikOtqkQ=;
	b=aRVXtI9YtkGSf6ylj71B0+vcvfDxCLBYM9GBso7p//4k8nNAbn1hMCTvqHbd2FGk16
	0k8QxfmT8v6zmWZG6Q4kLZ+oIBOqVyzg0Zqb2JVuggNr4iyFGsa8CPMHsrFkVUAIdSYk
	zrFm6UPH+wA+cA9NTZjhkhSXvvDcCKnCF+prs=
Received: by 10.204.154.68 with SMTP id n4mr1205956bkw.78.1315074386513;
	Sat, 03 Sep 2011 11:26:26 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id z7sm1089936bkt.5.2011.09.03.11.26.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 11:26:25 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Sep 2011 22:26:17 +0400
Message-Id: <1315074378-3291-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-oe 1/2] openssl: fix parallel builds
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
X-List-Received-Date: Sat, 03 Sep 2011 18:31:25 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../openssl/openssl-1.0.0d/openssl-fix-link.patch  |   22 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.0d.bb |    3 +-
 2 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/openssl-fix-link.patch

diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/openssl-fix-link.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/openssl-fix-link.patch
new file mode 100644
index 0000000..b319c62
--- /dev/null
+++ b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/openssl-fix-link.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Pending
+
+fix the parallel build regarding shared libraries.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+Index: openssl-1.0.0d/Makefile.org
+===================================================================
+--- openssl-1.0.0d.orig/Makefile.org	2011-09-01 17:03:59.000000000 +0400
++++ openssl-1.0.0d/Makefile.org	2011-09-01 17:12:24.000000000 +0400
+@@ -246,9 +246,9 @@
+	@dir=crypto; target=all; $(BUILD_ONE_CMD)
+ build_ssl:
+	@dir=ssl; target=all; $(BUILD_ONE_CMD)
+-build_engines:
++build_engines: build_crypto
+	@dir=engines; target=all; $(BUILD_ONE_CMD)
+-build_apps:
++build_apps: build_crypto
+	@dir=apps; target=all; $(BUILD_ONE_CMD)
+ build_tests:
+	@dir=test; target=all; $(BUILD_ONE_CMD)
diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
index 73c8df5..89b8615 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
+++ b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
@@ -22,6 +22,7 @@ SRC_URI += "file://configure-targets.patch \
             file://shared-libs.patch \
             file://oe-ldflags.patch \
             file://engines-install-in-libdir-ssl.patch \
+            file://openssl-fix-link.patch \
             file://debian/version-script.patch \
             file://debian/pic.patch \
             file://debian/c_rehash-compat.patch \
-- 
1.7.2.5



