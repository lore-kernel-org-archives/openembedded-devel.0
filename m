Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D979E73182
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 14:15:49 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id p65so31024011wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2016 06:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ows665yvueSeuLAeHD6v+mIGXMBJ29GcU7MxPjGJkIo=;
	b=cNfUzmgdjrGbnSifrbZ+XNYAqPz8ymxMsznoNPImEIhoNdS6xu+LPOnksbFzbXCCh7
	ndUPeRroXp7Cy/S0VftQkmfcaPVFP6C2uLGHMQS14152OkLL/NPhIxNF9+BO2GjVhXna
	XlMl+T6qEqZaVC/CvNBEu7ulSw1NKhqaN50q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ows665yvueSeuLAeHD6v+mIGXMBJ29GcU7MxPjGJkIo=;
	b=gWAYWTeyOT+hUt6W6QykZJIEi6ohrEx7dTWmbxrQzwrpvdR4KcVlj4UMChqxbHrOg5
	yPQTFkQeXddVqCZioH3XUqH9/SyqZ+cTJYX27ajxFXmZs7xd5KtdVDNo1fVR18WZtjuI
	6NssmnSg0k4vw32uDoKidQeb8bYUuCVTAMTZb1gC/ZAFHjPb3Sgcb9QdVz/slBbZdS+c
	uRFQJSYWsVP+WblEM7KRooMVZ4pVo/rRLCeXsR9i2IFnxfWPtN0Z9pQ5LRgJ0HJrpnL1
	DEzg3nUMbly/nT7zrWpxTCu7E0HhbCWTuC/MxH/7Fi1Y9FIqkNsedjmOgBinUE/S76cy
	9iRA==
X-Gm-Message-State: AD7BkJLxXDixBbhXAs2QcHMrTw58tcygaXd46TrZY6F8TwlkmYKwASW7TMEXEl0ta3/H5iwH
X-Received: by 10.194.58.12 with SMTP id m12mr10416603wjq.22.1457100950261;
	Fri, 04 Mar 2016 06:15:50 -0800 (PST)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by smtp.gmail.com with ESMTPSA id
	az8sm3565430wjc.17.2016.03.04.06.15.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Mar 2016 06:15:48 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2016 15:15:40 +0100
Message-Id: <1457100940-16775-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1457100940-16775-1-git-send-email-koen.kooi@linaro.org>
References: <1457100940-16775-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH v3 2/2] efibootmgr: update and unblacklist
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
X-List-Received-Date: Fri, 04 Mar 2016 14:15:51 -0000

Also fix style issues.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb  | 14 +++++++-------
 meta-oe/recipes-extended/efibootmgr/files/ldflags.patch | 17 -----------------
 2 files changed, 7 insertions(+), 24 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/ldflags.patch

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
index 9b611ce..d80c89f 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
@@ -10,20 +10,20 @@ DEPENDS = "pciutils zlib efivar"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "https://github.com/rhinstaller/efibootmgr/releases/download/${BP}/${BP}.tar.bz2 \
-           file://ldflags.patch \
+SRCREV = "eb6e36c9064eae256cd60df24a977e3abd87fd16"
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
           "
 
-SRC_URI[md5sum] = "6647f5cd807bc8484135ba74fcbcc39a"
-SRC_URI[sha256sum] = "a66f5850677e86255d93cb1cead04c3c48a823a2b864c579321f2a07f00256e6"
+S = "${WORKDIR}/git"
+
+
+inherit pkgconfig
 
 EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cflags efivar` \
                  -DEFIBOOTMGR_VERSION=\"$(RELEASE_MAJOR).$(RELEASE_MINOR)\" '"
 
 do_install () {
-    install -D -p -m0755 src/efibootmgr/efibootmgr ${D}/${sbindir}/efibootmgr
+    install -D -p -m0755 src/efibootmgr ${D}/${sbindir}/efibootmgr
 }
 
-inherit pkgconfig
 
-PNBLACKLIST[efibootmgr] ?= "Depends on blacklisted efivar"
diff --git a/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch b/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
deleted file mode 100644
index 0d5594a..0000000
--- a/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Import this patch from meta-linaro.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
---- efibootmgr-0.5.4.orig/Makefile
-+++ efibootmgr-0.5.4/Makefile
-@@ -11,6 +11,8 @@
-   CFLAGS = $(EXTRA_CFLAGS) -DEFIBOOTMGR_VERSION=\"$(RELEASE_MAJOR).$(RELEASE_MINOR).$(RELEASE_SUBLEVEL)$(RELEASE_EXTRALEVEL)\" \
- 	    -Wall -g -D_FILE_OFFSET_BITS=64
- 
-+  LDFLAGS += -lz
-+
-   MODULES := src
- 
-   BINDIR := /usr/sbin
-- 
2.4.3


