Received: from mail-gx0-f173.google.com ([209.85.161.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R2314-00069v-JY
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 17:29:18 +0200
Received: by gxk26 with SMTP id 26so1599407gxk.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=iQ4jxyMvrhTL2y6m98f08yrNWg43M+FWvQz8wYzo0oA=;
	b=j1J8uBCH6PxYUgUSHRGpuLNTk4ajQTnmPjNmSKCTnqU8hhgmYWzIp7HokVq5Rk8o7p
	xOKiF1kUwqui+JmFjq4h3RJUADeiflASAiVYwwwnk8rC0vIu0c2YKyySb4mvZ9t0wzE3
	+NZD/3KDNrH2uZhJRGAVYTx1WyTpGKYQbDMf0=
Received: by 10.151.86.18 with SMTP id o18mr530355ybl.198.1315581853315;
	Fri, 09 Sep 2011 08:24:13 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id l18sm1538370ybg.7.2011.09.09.08.24.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 08:24:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2011 08:24:07 -0700
Message-Id: <1315581847-21074-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] openssl: Upgrade 1.0.0d -> 1.0.0e
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
X-List-Received-Date: Fri, 09 Sep 2011 15:29:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../configure-targets.patch                        |    0
 .../debian/c_rehash-compat.patch                   |    0
 .../debian/ca.patch                                |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/pic.patch                               |    0
 .../debian/pkg-config.patch                        |    0
 .../debian/version-script.patch                    |    0
 .../engines-install-in-libdir-ssl.patch            |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../parallel-make-fix.patch                        |    0
 .../shared-libs.patch                              |    0
 .../{openssl_1.0.0d.bb => openssl_1.0.0e.bb}       |    8 ++++----
 18 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/configure-targets.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/c_rehash-compat.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/ca.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/debian-targets.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/make-targets.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/man-dir.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/man-section.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/no-rpath.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/no-symbolic.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/pic.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/pkg-config.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/debian/version-script.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/engines-install-in-libdir-ssl.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/oe-ldflags.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/openssl-fix-link.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/parallel-make-fix.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d => openssl-1.0.0e}/shared-libs.patch (100%)
 rename meta-oe/recipes-connectivity/openssl/{openssl_1.0.0d.bb => openssl_1.0.0e.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/configure-targets.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/configure-targets.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/configure-targets.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/configure-targets.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/c_rehash-compat.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/c_rehash-compat.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/c_rehash-compat.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/c_rehash-compat.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/ca.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/ca.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/ca.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/ca.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/debian-targets.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/debian-targets.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/debian-targets.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/debian-targets.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/make-targets.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/make-targets.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/make-targets.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/make-targets.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/man-dir.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-dir.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/man-dir.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-dir.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/man-section.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-section.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/man-section.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-section.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/no-rpath.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-rpath.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/no-rpath.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-rpath.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/no-symbolic.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-symbolic.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/no-symbolic.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-symbolic.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/pic.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/pic.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/pic.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/pic.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/pkg-config.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/pkg-config.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/pkg-config.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/pkg-config.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/version-script.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/version-script.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/debian/version-script.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/debian/version-script.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/engines-install-in-libdir-ssl.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/engines-install-in-libdir-ssl.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/engines-install-in-libdir-ssl.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/oe-ldflags.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/oe-ldflags.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/oe-ldflags.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/oe-ldflags.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/openssl-fix-link.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/openssl-fix-link.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/parallel-make-fix.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/parallel-make-fix.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/parallel-make-fix.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/parallel-make-fix.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/shared-libs.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/shared-libs.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/openssl/openssl-1.0.0d/shared-libs.patch
rename to meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/shared-libs.patch
diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
rename to meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
index 63b5460..28039ca 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
+++ b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
@@ -6,13 +6,10 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-SRC_URI[src.md5sum] = "40b6ea380cc8a5bf9734c2f8bf7e701e"
-SRC_URI[src.sha256sum] = "92511d1f0caaa298dba250426f8e7d5d00b271847886d1adc62422778d6320db"
-
 DEFAULT_PREFERENCE = "-1"
 
 export DIRS = "crypto ssl apps engines"
@@ -36,6 +33,9 @@ SRC_URI += "file://configure-targets.patch \
             file://debian/debian-targets.patch \
            "
 
+SRC_URI[src.md5sum] = "7040b89c4c58c7a1016c0dfa6e821c86"
+SRC_URI[src.sha256sum] = "e361dc2775733fb84de7b5bf7b504778b772869e8f7bfac0b28b935cbf7380f7"
+
 PACKAGES += " \
 	${PN}-engines \
 	${PN}-engines-dbg \
-- 
1.7.5.4



