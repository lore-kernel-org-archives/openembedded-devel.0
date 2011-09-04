Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R0Ghy-0001NK-1F
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Sep 2011 19:42:14 +0200
Received: by bkbzu17 with SMTP id zu17so3716895bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2011 10:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ol07/OUVmRvA86riKyJtyV0A3W5WghG52ROn+ixBRYQ=;
	b=F2zequ8M9N8wou5hHZI02YtWSpr8llLLQiWaafRNJiTv+4JejeGvOWfhvjSCreds8x
	g19WGryw9YD64QgXr2xjMYy7ZpTw/rr4dkNbLUiA4jeGXy0CE3fkdopy2/Kxt//MClV2
	NYVpuJg11R5/n/mQ/HWKpLjGVl0CA2eBgGTU4=
Received: by 10.204.134.140 with SMTP id j12mr1753164bkt.53.1315157831574;
	Sun, 04 Sep 2011 10:37:11 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id v16sm396213bkd.6.2011.09.04.10.37.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Sep 2011 10:37:10 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Sep 2011 21:37:03 +0400
Message-Id: <1315157824-29946-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-oe 1/2] openssl: fully fix parallel builds
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
X-List-Received-Date: Sun, 04 Sep 2011 17:42:14 -0000

Add a patch from oe-core to fix parallel builds in openssl 0.9.8m.
Then drop PARALLEL_MAKE settings in both of recipes.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../openssl/openssl-0.9.8m/parallel-make-fix.patch |   20 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_0.9.8m.bb |    3 +--
 .../recipes-connectivity/openssl/openssl_1.0.0d.bb |    1 -
 3 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/parallel-make-fix.patch

diff --git a/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/parallel-make-fix.patch b/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/parallel-make-fix.patch
new file mode 100644
index 0000000..82857f5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/parallel-make-fix.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Submitted
+
+fix the parallel build regarding shared libraries.
+
+Signed-off-by: Qing He <qing.he@intel.com>
+
+diff --git a/Makefile.org b/Makefile.org
+index 2fb0309..8bec3d0 100644
+--- a/Makefile.org
++++ b/Makefile.org
+@@ -352,6 +352,9 @@ all_testapps: build_libs build_testapps
+ build_testapps:
+ 	@dir=crypto; target=testapps; $(BUILD_ONE_CMD)
+ 
++libcrypto.a: build_crypto
++libssl.a: build_ssl
++
+ build_shared:	$(SHARED_LIBS)
+ libcrypto$(SHLIB_EXT): libcrypto.a $(SHARED_FIPS)
+ 	@if [ "$(SHLIB_TARGET)" != "" ]; then \
diff --git a/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb b/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb
index a7eb332..1091bf2 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb
+++ b/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb
@@ -11,6 +11,5 @@ export OE_LDFLAGS="${LDFLAGS}"
 SRC_URI += "file://configure-targets.patch \
             file://shared-libs.patch \
             file://debian.patch \
+            file://parallel-make-fix.patch \
             file://oe-ldflags.patch"
-
-PARALLEL_MAKE = ""
diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
index 89b8615..63b5460 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
+++ b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
@@ -41,6 +41,5 @@ PACKAGES += " \
 	${PN}-engines-dbg \
 	"
 
-PARALLEL_MAKE = ""
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so"
 FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
-- 
1.7.2.5



