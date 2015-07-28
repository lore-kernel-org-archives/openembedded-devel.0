Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id F3FC0763FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 22:14:03 +0000 (UTC)
Received: by qkdg63 with SMTP id g63so3903766qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 15:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=P7xgObFlZUDF7CSCrnQkFMNuIR6aVRmmNNT8jpcxrlU=;
	b=gk98W0qBELZt6Y1FE1ZmPhdO+PrVbAQCqevPWkKzymOrq2bFWMLVesLw0BscsKRFSN
	UIJy+FaUy0PvH4FGIxRk9YPaULvlXGTzRw54qK/DGYfD8BMJ1RMEcoKSOpz8rutFbzZs
	OqLjib8F+SH8M3kArzGqQKyzCmlg0sub5cKQwTnUHsW96OqTcTfbl0c4beyjrKfyjYch
	41X7wndS4Z8IKHDATQ9KaaP7FDUPruh1ynrQiopQGF++UCAxV/Oyfpo5sICm2XV7MUUV
	JHGiZiprFbmroCyNHkfdn29xZlIZIg2mQIdmZ7OScjACBshaqxPX+88wgsT3Qc4vi4+X
	Gx/Q==
X-Received: by 10.55.25.150 with SMTP id 22mr49141225qkz.4.1438121643525;
	Tue, 28 Jul 2015 15:14:03 -0700 (PDT)
Received: from localhost ([179.105.243.19]) by smtp.gmail.com with ESMTPSA id
	b37sm12172760qge.2.2015.07.28.15.14.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jul 2015 15:14:02 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 28 Jul 2015 19:13:56 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jul 2015 19:13:54 -0300
Message-Id: <1438121635-29044-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] hostapd: Remove add-sysroot-to-gcc.patch
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
X-List-Received-Date: Tue, 28 Jul 2015 22:14:04 -0000

The patch has not been available in the 2.4 version form and thus the
recipe was unbuildable.

Fix by removing the patch file, which is unused, and the reference for
it from the recipe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../hostapd/hostapd-2.2/add-sysroot-to-gcc.patch   | 40 ----------------------
 .../recipes-connectivity/hostapd/hostapd_2.4.bb    |  1 -
 2 files changed, 41 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd-2.2/add-sysroot-to-gcc.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/add-sysroot-to-gcc.patch b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/add-sysroot-to-gcc.patch
deleted file mode 100644
index d1134b9..0000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/add-sysroot-to-gcc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Pending
-
-We should make sure that sysroot is used by gcc instead of assuming
-hardcoded locations for include paths
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- src/drivers/drivers.mak | 2 +-
- src/drivers/drivers.mk  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/drivers/drivers.mak b/src/drivers/drivers.mak
-index 7e175f4..950701f 100644
---- a/src/drivers/drivers.mak
-+++ b/src/drivers/drivers.mak
-@@ -35,7 +35,7 @@ NEED_RFKILL=y
- ifdef CONFIG_LIBNL32
-   DRV_LIBS += -lnl-3
-   DRV_LIBS += -lnl-genl-3
--  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
-+  DRV_CFLAGS += -DCONFIG_LIBNL20 -I=/usr/include/libnl3
- else
-   ifdef CONFIG_LIBNL_TINY
-     DRV_LIBS += -lnl-tiny
-diff --git a/src/drivers/drivers.mk b/src/drivers/drivers.mk
-index db8561a..c93e88d 100644
---- a/src/drivers/drivers.mk
-+++ b/src/drivers/drivers.mk
-@@ -30,7 +30,7 @@ NEED_RFKILL=y
- ifdef CONFIG_LIBNL32
-   DRV_LIBS += -lnl-3
-   DRV_LIBS += -lnl-genl-3
--  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
-+  DRV_CFLAGS += -DCONFIG_LIBNL20 -I=/usr/include/libnl3
- else
-   ifdef CONFIG_LIBNL_TINY
-     DRV_LIBS += -lnl-tiny
--- 
-2.1.2
-
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
index 84b1128..36c0cd4 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
@@ -18,7 +18,6 @@ SRC_URI = " \
     file://defconfig \
     file://init \
     file://hostapd.service \
-    file://add-sysroot-to-gcc.patch;patchdir=.. \
 "
 
 S = "${WORKDIR}/hostapd-${PV}/hostapd"
-- 
2.4.6


