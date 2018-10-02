Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id BAE4D79659
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 17:34:01 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id 63-v6so3152936wra.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 10:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CULPENdc982p74xLDTtnIanO1uWMazw/xKyDXTPMiYk=;
	b=pdOH3AyfIW+yT6D1Mz7SQbZ2UxOV5V5fcSEF4AwoXNy/tr6HW4A0KOMe0Kavxy8NLx
	fHIQojJF8LhJAUaJMgMs7yHnCk+TGnbx6KLamqnR2mx/iMLRp6YHIrLBU9DglHlfhAbJ
	IbfOjMF0oPOhfWXEWYewKjIbifHfS2unmdRENOGfl2H6VeMkNaJt3lfZygYqmTK9l7I4
	mnZlOp6lOf6bBzPdEw6z4niVB9quZ1RBPCarm956k4TVFLSGG8d9OJdrlzRZ1Y8PYbED
	ifOFIZcnqULJtb+OCuVF31yfNIAa49d6oOepYeQdZNc3bd30H+FjHE++aD/fYYfVtXOW
	pPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CULPENdc982p74xLDTtnIanO1uWMazw/xKyDXTPMiYk=;
	b=g6QVxvnogJYNLX7r5iRvfyl8Tnu14+8o1G4e4JrgeiNQSqwZrF5lWlBf17HN6VOKbF
	1MHaMPtnUSXxkkuMMf4/Rap4ZwQeyDZ1TEn2kHxEkRpN64aHiHOXECr0kgIQC+F55Nm9
	BMaJIflrg2fh1oVGJhsYvBEugWgmYTRPw3B+fUHLYn1YatXDONFH/LcDoE07Fx5bdlx6
	/5cpoe98hZ5Io+T4gyfYqJwWRQDxTDaroTIfaAt+kHq7Vm1A5lJXoiIqEZDtk84Xx8jw
	NQdbEfLI/MdFDCNjy+j/auhXXea2NzFI6OpiAqQZv1O1RJcvDPJVHIPzmLn2NVluyYJN
	B84Q==
X-Gm-Message-State: ABuFfohgTxUoBKDQxrSiQ4mfl/yVQrMGDDBCRESurR8CssERqvEcZJKX
	+n8qR6c01S770ft8bshn++Bj2crT
X-Google-Smtp-Source: ACcGV615d6dwHLGJA+eaBvNLrtYfXRvjtsLRPODbvkhx2LkOgOABj89G3JYu0bZmX0Bui1N9F2BXBw==
X-Received: by 2002:a5d:610a:: with SMTP id
	v10-v6mr11430125wrt.308.1538501642132; 
	Tue, 02 Oct 2018 10:34:02 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l4-v6sm13463625wrb.92.2018.10.02.10.34.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Oct 2018 10:34:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2018 17:33:57 +0000
Message-Id: <20181002173359.25493-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002173359.25493-1-Martin.Jansa@gmail.com>
References: <20181002173359.25493-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] android-tools: import 2 changes from meta-webos-ports
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
X-List-Received-Date: Tue, 02 Oct 2018 17:34:02 -0000

* import upstream-able changes from following commits:
  https://github.com/webOS-ports/meta-webos-ports/commit/9d032e47b5a90846485393095a4fd9b923578f22
  https://github.com/webOS-ports/meta-webos-ports/commit/fea52b88281e197482b7412824802c057ec99000
  https://github.com/webOS-ports/meta-webos-ports/commit/d8068a7a4722f6203ef16d85c235f86a5a76fa9c
  https://github.com/webOS-ports/meta-webos-ports/commit/c314b69505343ea959adc9789e0a1fca52a8af67

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-Allow-adbd-to-be-ran-as-root.patch   | 24 +++++++++++++++++++
 .../android-tools/android-tools-adbd.service  |  5 ++--
 .../android-tools/android-tools_5.1.1.r37.bb  |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0001-Allow-adbd-to-be-ran-as-root.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0001-Allow-adbd-to-be-ran-as-root.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0001-Allow-adbd-to-be-ran-as-root.patch
new file mode 100644
index 0000000000..d8f0d48692
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0001-Allow-adbd-to-be-ran-as-root.patch
@@ -0,0 +1,24 @@
+From 3237f335c5b559c68749173f4343e6475f9eb8c7 Mon Sep 17 00:00:00 2001
+From: Florent Revest <revestflo@gmail.com>
+Date: Mon, 30 Oct 2017 21:05:46 +0100
+Subject: [PATCH] Allow adbd to be ran as root
+
+---
+ adb/adb.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/adb/adb.c b/adb/adb.c
+index 10a1e0d..a88641f 100644
+--- a/adb/adb.c
++++ b/adb/adb.c
+@@ -1267,6 +1267,7 @@ static int should_drop_privileges() {
+     int secure = 0;
+     char value[PROPERTY_VALUE_MAX];
+ 
++    return 0;
+    /* run adbd in secure mode if ro.secure is set and
+     ** we are not in the emulator
+     */
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
index 88ed6871d3..ddf8d7f74e 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
@@ -1,12 +1,13 @@
 [Unit]
 Description=Android Debug Bridge
+ConditionPathExists=/var/usb-debugging-enabled
+Before=android-system.service
 
 [Service]
 Type=simple
 Restart=on-failure
-ExecStartPre=/usr/bin/android-gadget-setup adb
+ExecStartPre=-/usr/bin/android-gadget-setup adb
 ExecStart=/usr/bin/adbd
-StandardOutput=null
 
 [Install]
 WantedBy=basic.target
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index adf372d8bb..74f2bf221e 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -49,6 +49,7 @@ SRC_URI = " \
     file://fastboot.mk;subdir=${BPN} \
     file://mkbootimg.mk;subdir=${BPN} \
     file://0001-usb_linux.c-fix-build-with-glibc-2.28.patch;patchdir=system/core \
+    file://0001-Allow-adbd-to-be-ran-as-root.patch;patchdir=system/core \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


