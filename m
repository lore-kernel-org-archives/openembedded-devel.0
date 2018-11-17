Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5B4E60102
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2018 09:57:39 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id y56so9024865edd.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2018 01:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sRBtjbFlbwnL+LC6WEE5U+y1m4DWB5gT6YS3pKdYAZA=;
	b=q4NcZZV4/IGUA6fvtBgf2SSrF9J2k08wSC0je0kKhsjEApVkcOrtfxvBZPm5LHAw8s
	0v82MSJrx7OmMVuHXzODSMH8GTh1hCiaLNwn0sNQO6mOSveTnjAMqmedq6FvmqME4b7v
	und0tT3oV6d2iEfS+imdCJf+gMFojsdmoaBoajrZB4pbu0GFrJ/rF5XjOyPKvzkwpm8t
	Xlx1UDYeHfpnfFmeu/es+SW7DD6XRUlWm3Ett+vG4xH0k2g7enBu6guX7dzoPcPCXeq+
	/1/BnoTSpo97t1yTXbr4fjNQgzhChF19PgbjWjqiOHD9MPAMvhEHM65S5/1gQPMrxsEB
	LstA==
X-Gm-Message-State: AGRZ1gJXjoYgLdt/wv9pusVjCTOr+E+WWPPXxd/XoPri/dG4W7ZVMIPr
	zACOX1PlfgZkK/WBXFMQGfgM/8xq
X-Google-Smtp-Source: AJdET5cVy4XdKpe3DXp6iTErpjDJxFxHXKjWh41oP6UtWzLV0pYxSryaYllx/syzJIprSTxUUnS+Vg==
X-Received: by 2002:a17:906:2cd3:: with SMTP id
	r19-v6mr11036284ejr.38.1542448659985; 
	Sat, 17 Nov 2018 01:57:39 -0800 (PST)
Received: from tfsielt31850.jci.com (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	b42-v6sm10477296edd.81.2018.11.17.01.57.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 01:57:39 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Nov 2018 09:57:38 +0000
Message-Id: <20181117095738.2217-1-git@andred.net>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] java-library: make packages overriding PACKAGE_ARCH work again
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Nov 2018 09:57:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Recent changes is OE have caused the traditional approach of inheriting
allarch and setting PACKAGE_ARCH not work anymore. Once allarch is
inherited, PACKAGE_ARCH can not be overridden afterwards.
See commit a23c482cab4f ("allarch: only enable allarch when multilib
is not used") d9ba0219b2f6 in poky.
    http://git.openembedded.org/openembedded-core/commit/?id=a23c482cab4f874f4a6a6889716123569eb5ece9

The error manifests itself with configure trying to
   --host=allarch-poky-linux --target=allarch-poky-linux
which fails.

To work around this we can make java-library's allarch inherit
conditional, as is done e.g. in OE-core for packagegroup.bbclass
    http://git.openembedded.org/openembedded-core/commit/?id=9c826962ec8fa45c2b035427442b90a41517144e
    http://git.openembedded.org/openembedded-core/commit/?id=2c9b1d304daade7b0907320aeb9c522e7ab9dcab

So this commit does exactly that, and fixes the two users of this to
follow the new approach.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 classes/java-library.bbclass           | 8 ++++++--
 recipes-core/libmatthew/libmatthew.inc | 2 +-
 recipes-extended/rxtx/rxtx_2.2.0.bb    | 2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index ce1cd28..e0159ba 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -10,9 +10,13 @@
 #
 # package archs are set to all, if the recipe builds also packages which
 # can not be used for all archs, then set the PACKAGE_ARCH of that package
-# manually, see rxtx_xx.bb for an example.
+# manually *before* inheriting the class, see rxtx_xx.bb for an example.
 
-inherit java allarch
+inherit java
+PACKAGE_ARCH ?= "all"
+# Fully expanded - so it applies the overrides as well
+PACKAGE_ARCH_EXPANDED := "${PACKAGE_ARCH}"
+inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED') == 'all', 'allarch', '')}
 
 # use java_stage for native packages
 JAVA_NATIVE_STAGE_INSTALL = "1"
diff --git a/recipes-core/libmatthew/libmatthew.inc b/recipes-core/libmatthew/libmatthew.inc
index 7db979b..2119c0b 100644
--- a/recipes-core/libmatthew/libmatthew.inc
+++ b/recipes-core/libmatthew/libmatthew.inc
@@ -7,8 +7,8 @@ DEPENDS = "virtual/java-native classpath-native classpath"
 
 S = "${WORKDIR}/libmatthew-java-${PV}"
 
-inherit java-library
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
+inherit java-library
 
 # Some internal version numbers which change from time to time.
 # Allowing to override them makes this include file more
diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index e54dad7..d4fbb9d 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -28,8 +28,8 @@ S = "${WORKDIR}/rxtx-2.2pre2"
 
 INSANE_SKIP_${JPN} += "dev-so"
 
-inherit autotools-brokensep java-library remove-libtool
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
+inherit autotools-brokensep java-library remove-libtool
 
 JARFILENAME = "RXTXcomm.jar"
 EXTRA_OEMAKE += "RXTX_PATH=${D}${libdir_jni} \
-- 
2.19.1


