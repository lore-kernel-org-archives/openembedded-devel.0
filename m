Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpgD-0001GZ-Ve
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:55:10 +0200
Received: by wgbdr1 with SMTP id dr1so1218754wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=eKMNQl4i7xxAVtEvbR2vetHG7ANrFCjosfluAB9z0Yg=;
	b=ylLF8KsJx+K6dBrBzNSg3kuw+W06pQ53Nqj1t/W6/GrrMIp1WKOlp2phDlC90wOBds
	dkAsz6Am9ereJubKm8VT469WbwvgHby4whsvGd6Do6bKmb/trDGaM8o8SSeQLJocpRUv
	PqN9YCJ83FySo8zCDQebCPeh9ZEp1L96og56fkyoNaTiJEQkgaapJ/mBTVusBa2Ew2D3
	LJ/6RqfeHUDxl1aN5Amnf1UhZOI1RpzUJo2x1P3GxSL55+d5/NPjT4h9Bn6bbyLsVKXs
	86f2WWuaiC6mEuHdVuUtAFjrY9vby5E8zS+hfIEiBqWsmx3vrNXP5FCN+JRG6I1USwHS
	kmtA==
Received: by 10.216.232.32 with SMTP id m32mr1693019weq.186.1344606200032;
	Fri, 10 Aug 2012 06:43:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm7835251wib.2.2012.08.10.06.43.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:43:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:42:57 +0200
Message-Id: <2857e93c1fee38bcc30a3f7bcc6aaf261d946946.1344599409.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344599409.git.Martin.Jansa@gmail.com>
References: <cover.1344599409.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344599409.git.Martin.Jansa@gmail.com>
References: <cover.1344599409.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] php: drop LD_LIBRARY_PATH settings
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
X-List-Received-Date: Fri, 10 Aug 2012 13:55:10 -0000

* it breaks do_fetch in some settings

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/php/php.inc |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 320696c..87eb4b1 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -7,7 +7,7 @@ DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native mysql5 \
            libc-client openssl"
 DEPENDS_virtclass-native = "zlib-native libxml2-native"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
 
@@ -43,9 +43,6 @@ LIBS_pn-php =" -lpthread "
 export LIBS
 THREADS_pn-php = "pthread"
 export THREADS
-LD_LIBRARY_PATH_virtclass-native = "${STAGING_LIBDIR_NATIVE}"
-LD_LIBRARY_PATH_pn-php = "${STAGING_LIBDIR}"
-export LD_LIBRARY_PATH
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
 CFLAGS += " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -D_GNU_SOURCE"
-- 
1.7.8.6



