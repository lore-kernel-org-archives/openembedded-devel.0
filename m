Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 267457EEA1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:41:44 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id w10so16429443pgj.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IkfmGx2B2SNa08I8cym4pb13XsXafpmbiNrMv7uQTJs=;
	b=MNcCD2uMivquTIBzGNSLIluMrSOxVN/RHgtOa4Lw5e40lF5lZnvWiQ9JcLPweLEEKk
	3wm6OjfYYe6Y0EKr36BxA8EzNbgHoWsBMlXSy47gyCgqT4QBLZsGXmP04dERgK8+MBq/
	TkNNsEekDrR5FD8GlaIVzgEwL3wyYSte0I2BICSXEYNEsx1/Tzk7RyOmFp1uNODawQEO
	hFdvGJNhYwTlQ+Ph6IvlZU7YWQMfZG44oBHV8C4yCKPygahLsDhBF8vm+jIMFCP7Ayif
	kP0R6QRoW8dTrnxgJiTrrYwyfyaE4T1TjE01v1vv7roz59xXk7Qf2iVF/H2sarsb98ic
	+AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IkfmGx2B2SNa08I8cym4pb13XsXafpmbiNrMv7uQTJs=;
	b=omOnC8SRpEUZskCaOfNI79bluZV/XQbmWGtG/G8oo2DUZDLqhFPCmTKkPDvMm0YFyp
	PaeCFxH9JArE1RF1hb8gWfqonk+Ylrw7SvNLV03kAOY/qKxZHmBn+0EOWXgFPK8Giz0Y
	7QKGq4tM9C8ucyznt5AH0rd0qzRW7/C1LyPe6IzBuqRdiZyU4lkNhRKMMYR74egnYhGn
	oRQR7NnBWydpj9i2tXg6OH1KyJXjhmYOJi7jkcTkBgdAouegJJ2SgpulDIELr4VTo+E4
	BYcQTx1tAKNwGxZovRVI5oKeK09oXGyNEFnoLXr6w8RSJdi04Z2X/OdUsQFFyo9Y+B4r
	JC3g==
X-Gm-Message-State: APjAAAVRByl+uqqIh9UzeLMKk3WXXENhYwit10ohjdB5xtIYw8CMi6hR
	5usv77ZuFqhXDOte5PpHglNDpIye
X-Google-Smtp-Source: APXvYqyzBGCvaAJz0dVX4aMgsdOACtAe/gO1Znb+GAMdtAkUmiZVGVzkISf0wQxbbi0I2sTws4gCKg==
X-Received: by 2002:a17:90a:db44:: with SMTP id
	u4mr71635951pjx.52.1563720106032; 
	Sun, 21 Jul 2019 07:41:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	t9sm37392604pji.18.2019.07.21.07.41.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:41:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:41:33 -0700
Message-Id: <c45a72ba3536c6b10473fdfcafb8a724041fbd43.1563719997.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719996.git.akuster808@gmail.com>
References: <cover.1563719996.git.akuster808@gmail.com>
Subject: [warrior] 5/8] ndctl: Remove the unnecessary dependency on virtual/kernel
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
X-List-Received-Date: Sun, 21 Jul 2019 14:41:45 -0000

From: Adrian Bunk <bunk@stusta.de>

This also makes it no longer specific to MACHINE_ARCH.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/conf/layer.conf                 | 6 ------
 meta-oe/recipes-core/ndctl/ndctl_v63.bb | 5 +----
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index c7dbbc1..bc90390 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -51,12 +51,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phoronix-test-suite->php \
 "
 
-# Depends on ndctl (through nvdimm PACKAGECONFIG) which depends on MACHINE_ARCH kernel
-# and making libblockdev MACHINE_ARCH is not an option as python3-blivet, udisks2, gvfs
-# would be MACHINE_ARCH as well
-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-  libblockdev->ndctl \
-"
 # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   terminus-font->fontconfig \
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
index 61e5302..2f299b1 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
@@ -13,15 +13,12 @@ inherit autotools-brokensep pkgconfig bash-completion systemd
 SRCREV = "cb2d678dd6d286dd96d31548c32449a8b883ae32"
 SRC_URI = "git://github.com/pmem/ndctl.git"
 
-DEPENDS = "virtual/kernel kmod udev json-c"
+DEPENDS = "kmod udev json-c"
 
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
 
-# Depends on MACHINE_ARCH kernel
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = "--with-systemd, --without-systemd, systemd"
 
-- 
2.7.4


