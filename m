Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D1B2174737
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 22:59:16 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id s12so14320669wrc.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 15:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xB4rrLddh7DBp/EqxetbIhJkWN/CJmMaiarNgGPWd74=;
	b=RKDyVAYe1aSZQ0liVg1nYHWgmqjpwBiIAtgeMLJ1Iw11MGsLvmYWLeYxxGDx+OWaMG
	j5ICu0gZfZxcAYHrY4LVHhYlG9N7O6Kkfdkm8CV98kVeOM4zLQM4+E2Fzwa7uqu4pVQc
	pFk2FAZZJ49IupKtXEgfPCyovpX9nPFOl86LpAoG5SGT5fX40tqxYLPv2fhzaRTzow8c
	4BkVHdidoYkFJ5W7Od6EXmgcwiI/W1G7oMc8r5v3E4O+6+K0/0M0LmSlzIaxO2Idxo50
	xlA88NkompXwX1mQnu3Z6em0LqBbxBX2XZfoQSLH5JJnjP0t+ZRDazsyuKOX2h3/ncqr
	xRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xB4rrLddh7DBp/EqxetbIhJkWN/CJmMaiarNgGPWd74=;
	b=CzEKU5fbMZvKXyEeZWEtG2WVmIqhZMl3DECOmPG8qVxPSnmvvDd0VD14uR8ufXgydX
	aW+q45se+g6VbVqQQ1/HaUhH9hjvXDSHMf/2TNkZKVmylemL4EcMSxEL5igOr+4r5tB4
	aIYCkVNvDf5N5v74X1WCV5893gUBg/fQC+7M6LfATDTBVR8UJ+oif+4LTOW2Qd6hw8je
	zty6DRya8hNyN09LVZzTa0LENGidMlB27ER+MRxWZGXrTTbfpa6O7pLW0SAVXVz0z6Wx
	wds8lxtwXZ7/MNEMYDLFDtCIrm3vpYwl/VI5rsBC6PHep0gMOGaJXwIL8Uv2JOsNwMF/
	CMfg==
X-Gm-Message-State: ALQs6tBUVc7UF/I5+jXzjEjrGdbkc8/MIq+MKL88N0qrwnfCagavEfrV
	/fsExIzmceURqY/0jkXwuOstGQ==
X-Google-Smtp-Source: AIpwx4/adsuYmb3SWkJjAv5AMFbAiZgZ21kkR5nNySPeGQoAKcETnEfm6/29vhZRZFyp8bIj3Wfpbw==
X-Received: by 10.223.139.4 with SMTP id n4mr1350153wra.112.1523401157074;
	Tue, 10 Apr 2018 15:59:17 -0700 (PDT)
Received: from localhost.localdomain
	(host167-216-dynamic.251-95-r.retail.telecomitalia.it.
	[95.251.216.167]) by smtp.gmail.com with ESMTPSA id
	y191sm146932wme.14.2018.04.10.15.59.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Apr 2018 15:59:16 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2018 00:59:12 +0200
Message-Id: <1523401152-29650-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld][PATCH] zaurusd: relax Autoconf macro to allow tslib >= 1.0
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
X-List-Received-Date: Tue, 10 Apr 2018 22:59:17 -0000

Fix build after 72ef78e tslib: Upgrade to 1.15 release

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../zaurusd/zaurusd/allow-newer-tslib.patch        | 31 ++++++++++++++++++++++
 recipes-bsp/zaurusd/zaurusd_git.bb                 |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/zaurusd/zaurusd/allow-newer-tslib.patch

diff --git a/recipes-bsp/zaurusd/zaurusd/allow-newer-tslib.patch b/recipes-bsp/zaurusd/zaurusd/allow-newer-tslib.patch
new file mode 100644
index 0000000..8269148
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/allow-newer-tslib.patch
@@ -0,0 +1,31 @@
+From 368e025220842db13e8b5d95bfe12877d752a7c8 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Wed, 11 Apr 2018 00:14:49 +0200
+Subject: [PATCH] zaurusd: relax Autoconf macro to allow tslib >= 1.0
+
+Fix build after 72ef78e tslib: Upgrade to 1.15 release
+
+| checking for "tslib-1.0"... no
+| configure: error: TSKeys requires tslib.
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 36f858c..b207dcf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -45,7 +45,7 @@ if test "x$HAVE_TSKEYS" != "x"; then
+ 	#
+         # Checks for tslib
+ 	#
+-	PKG_CHECK_MODULES(TSLIB, "tslib-1.0", :, AC_MSG_ERROR([TSKeys requires tslib.]))
++	PKG_CHECK_MODULES(TSLIB, [tslib >= 1.0], :, AC_MSG_ERROR([TSKeys requires tslib.]))
+ 	AC_SUBST(TSLIB_CFLAGS)
+ 	AC_SUBST(TSLIB_LIBS)
+ fi
+-- 
+2.7.4
+
diff --git a/recipes-bsp/zaurusd/zaurusd_git.bb b/recipes-bsp/zaurusd/zaurusd_git.bb
index 8a49fdc..d69805b 100644
--- a/recipes-bsp/zaurusd/zaurusd_git.bb
+++ b/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -23,7 +23,8 @@ SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://01-check-toggle-landscape \
            file://01-check-toggle-portait \
            file://use-ts-symlink-instead-of-hardcoding.diff \
-           file://0001-zaurusd-add-support-for-collie.patch"
+           file://0001-zaurusd-add-support-for-collie.patch \
+           file://allow-newer-tslib.patch"
 
 
 S = "${WORKDIR}/git"
-- 
2.7.4


