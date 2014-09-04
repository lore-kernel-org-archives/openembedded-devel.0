Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 98C71713F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:28:57 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id w10so3559979pde.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 00:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a1BdcGoy1RxATsYlC+zMTrX3C0DgbikP1DVFjOxrIjg=;
	b=P3uGZ0BvvdIaaaSCPxKZiqnxcYz1P68Xiq4A8TNXZjTX1B8QzseTpYeuwmajp5p3FL
	jiEGLsJrIkwfi3O1usASpVKTV2hHCsjlwInTIG33ZW0fshf5UUUyoHQhO2N150H9aMqq
	NCsfWNZhlOtTd12IB7p4WaJKAH5/cSb3FZ/4hYZAUz+i9TBKIrTomIvcP8S7JtJk/1bY
	KDg0k+3/plu8EKV2AVUDPCp03hQcOw2DWOX2YMLzKjDWW0cE6RI5c9OYOYmpSKlFjzvq
	VLeHXCZUq/0qQ3IGB5TRKDDxBSY/wrnAQAc9lIYZ+nh6gBOZIbvUIeEqPnDHPno6GtXf
	3Gog==
X-Received: by 10.66.167.105 with SMTP id zn9mr5347520pab.103.1409815736186;
	Thu, 04 Sep 2014 00:28:56 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id pn13sm845213pdb.53.2014.09.04.00.28.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Sep 2014 00:28:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Sep 2014 00:32:35 -0700
Message-Id: <1409815958-24314-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
References: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] luajit, acpitests: Fix build on hardfloat arm
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Sep 2014 07:28:57 -0000

luajit as well as acpitests build system has mind of its own and does not
respect CC and friends in makefiles so we have to inject
the CFLAGS via EXTRA_OEMAKE, some of ABI defining params
e.g. float-abi selection is mentioned in TUNE_CCARGS and
not in TOOLCHAIN_OPTIONS. This causes build to go for softfloat
build and that is not what we want.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb       | 5 ++++-
 meta-oe/recipes-extended/acpica/acpitests_20140424.bb | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
index 684ec14..48137e3 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
@@ -20,7 +20,10 @@ do_configure_prepend() {
     sed -i -e s:/lib$:${base_libdir}:g ${S}/Makefile
 }
 
-EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} TARGET_CFLAGS="${TOOLCHAIN_OPTIONS}" TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}"'
+EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
+                TARGET_CFLAGS="${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}" \
+                TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" \
+                TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}"'
 EXTRA_OEMAKE_append_powerpc = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_x86-64 = ' HOST_CC="${BUILD_CC}"'
 EXTRA_OEMAKE_append_i586 = ' HOST_CC="${BUILD_CC} -m32"'
diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140424.bb b/meta-oe/recipes-extended/acpica/acpitests_20140424.bb
index 7e145bb..e3c706c 100644
--- a/meta-oe/recipes-extended/acpica/acpitests_20140424.bb
+++ b/meta-oe/recipes-extended/acpica/acpitests_20140424.bb
@@ -18,7 +18,7 @@ SRC_URI[acpica.sha256sum] = "72ece982bbbdfb1b17418f1feb3a9daaa01803d0d41dcf00e19
 
 S = "${WORKDIR}/acpitests-unix-${PV}"
 
-EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc 'OPT_CFLAGS=-Wall'"
+EXTRA_OEMAKE = "'CC=${TARGET_PREFIX}gcc ${HOST_CC_ARCH}' 'OPT_CFLAGS=-Wall'"
 
 # The Makefiles expect a specific layout
 do_compile() {
-- 
2.1.0


