Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7F04D7FC91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 01:25:39 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id a16so2305990pjs.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2D3JkjYCEEsdI1RvJIurp3bRrZ3d55qpzAZUFdFDF0U=;
	b=XQX5mj8CHcXAAeq30FCp+nwonmDilXII8XE2K2CB2WVGmLKZRqml5lETVhZdFlYRX2
	E9j/RUsqF0drW3Lb04AFFXtAJ1vTNz22Nf1tFCVoBUT/ceyL71VKTYzXR7zN/GzSLWPK
	NKDwKDrTYSSzsxpHicZUs+YhFK+QTBtEgYdZjTmrdwWFeysDLDKrwJLLmJRU20xFWASe
	1MMWYQ7quneiRkxuQhyADIfieOAidcxEkKImTmX0X4x4OJb/MLSbmASPBqGE20tJM/7Z
	7TICqA5FU5nO4EYwH85UhH35kDWoxtzmUUOrA/wPSCxPjoUBLBP2LkTzI3lfhJfAOdop
	IdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2D3JkjYCEEsdI1RvJIurp3bRrZ3d55qpzAZUFdFDF0U=;
	b=hIFsov+YheuK08Pu6SedZxWAAwXO/eZVqVPev+XnLPwxWJuQD08YaIq8XLUX7VuFxH
	kOHNwMPUHrElW1Ft1KVjncAzYQt8grPShfhV9oPn/L5kuCA5MuSATWLOh1ILaD3ULhLk
	I2JyqKvZdIFe2JRQAxeV+GzWhyxOP6QgY0ENcJyK4NYWf5QdqjNOzrKD61F1zgMfly58
	dROcl4iRZp4XRnEW8AdrDgEFTCcSoKQkw1E+ZRxcJaPekOleoj2bMjCHZdXV/2atSDwz
	Kldxv11OVw1icboYBXk3x7HX/EKZKHJ1IS6uDWrgnXX4E9c2UsItIZC+VfhN/TFMnMbi
	osYw==
X-Gm-Message-State: APjAAAV6Q7qbCTKQzjtCT3G9Gk5uXamb5KTVWao2v983qkmnxuO1VwYG
	T6cFWkpGFCAswzzYniJGAqaH3PpyW28=
X-Google-Smtp-Source: APXvYqw72g+gN4YlVHiOtLQ9uc/lVMdgMqMunBsyZK9qm0ELXeZYiXZDndJGg8/Jv9679lOgsCrIpQ==
X-Received: by 2002:a17:90a:3808:: with SMTP id
	w8mr15477079pjb.143.1574385940198; 
	Thu, 21 Nov 2019 17:25:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	82sm4953635pfa.115.2019.11.21.17.25.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 17:25:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Nov 2019 17:25:27 -0800
Message-Id: <20191122012527.3260265-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191122012527.3260265-1-raj.khem@gmail.com>
References: <20191122012527.3260265-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] sanlock: Replace cp -a with cp -R --no-dereference
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
X-List-Received-Date: Fri, 22 Nov 2019 01:25:40 -0000
Content-Transfer-Encoding: 8bit

helps to stop leaking builder's UID into sstate cache

Fixes
Exception: KeyError: 'getpwuid(): uid not found: 6000'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cp-a-with-cp-R-no-dereference-preser.patch | 51 +++++++++++++++++++
 .../recipes-extended/sanlock/sanlock_3.8.0.bb |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch b/meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
new file mode 100644
index 0000000000..a0b721c466
--- /dev/null
+++ b/meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
@@ -0,0 +1,51 @@
+From 78a9cffb1c760466933bbbcbae7ecb9b30a3e6a5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Nov 2019 13:47:42 -0800
+Subject: [PATCH] sanlock: Replace "cp -a" with "cp -R --no-dereference
+ --preserve=mode, links"
+
+Using "cp -a" leaks UID of user running the builds
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile  | 8 ++++----
+ wdmd/Makefile | 4 ++--
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 533dd79..2fc9ba5 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -127,9 +127,9 @@ install: all
+ 	$(INSTALL) -c -m 755 $(LIBSO_CLIENT_TARGET) $(DESTDIR)/$(LIBDIR)
+ 	$(INSTALL) -c -m 644 $(LIBPC_ENTIRE_TARGET) $(DESTDIR)/$(LIBDIR)/pkgconfig
+ 	$(INSTALL) -c -m 644 $(LIBPC_CLIENT_TARGET) $(DESTDIR)/$(LIBDIR)/pkgconfig
+-	cp -a $(LIB_ENTIRE_TARGET).so $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_CLIENT_TARGET).so $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_ENTIRE_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_CLIENT_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_ENTIRE_TARGET).so $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_CLIENT_TARGET).so $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_ENTIRE_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_CLIENT_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
+ 	$(INSTALL) -c -m 644 $(HEADER_TARGET) $(DESTDIR)/$(HEADIR)
+ 	$(INSTALL) -m 644 $(MAN_TARGET) $(DESTDIR)/$(MANDIR)/man8/
+diff --git a/wdmd/Makefile b/wdmd/Makefile
+index 5849efc..4894517 100644
+--- a/wdmd/Makefile
++++ b/wdmd/Makefile
+@@ -68,7 +68,7 @@ install: all
+ 	$(INSTALL) -d $(DESTDIR)/$(MANDIR)/man8
+ 	$(INSTALL) -c -m 755 $(CMD_TARGET) $(DESTDIR)/$(BINDIR)
+ 	$(INSTALL) -c -m 755 $(SHLIB_TARGET) $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_TARGET).so $(DESTDIR)/$(LIBDIR)
+-	cp -a $(LIB_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_TARGET).so $(DESTDIR)/$(LIBDIR)
++	cp -R --no-dereference --preserve=mode,links $(LIB_TARGET).so.$(SOMAJOR) $(DESTDIR)/$(LIBDIR)
+ 	$(INSTALL) -c -m 644 $(HEADER_TARGET) $(DESTDIR)/$(HEADIR)
+ 	$(INSTALL) -m 644 $(MAN_TARGET) $(DESTDIR)/$(MANDIR)/man8
+-- 
+2.24.0
+
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
index 8e411e4969..bf7eaf4111 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb
@@ -11,7 +11,9 @@ SECTION = "utils"
 LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
 
-SRC_URI = "git://pagure.io/sanlock.git;protocol=http"
+SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
+           file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
+          "
 SRCREV = "7afe0e66f5c7f24894896fad20ffa6f39733d80f"
 S = "${WORKDIR}/git"
 
-- 
2.24.0


