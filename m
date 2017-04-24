Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 768D271D8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:34 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id x188so13076814itb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rk2CIB2hxGqMQ8kHZ1DXnbXOtJjYfZoGcYtN8laX39U=;
	b=cx7mQuDlcedFSjzr+E+NznQ6VZNWz4keSR3HbtdokqwMxl4AuzgdsvNdtTu4JrNhaE
	BZ5FpBSVxH2jH8Ky2uyYg1nR275H/Hz72epe5dk/Sj4qeXYBxtGTLNXn0ryPsOElSqfY
	KNX1lz8t6mF0caVx97T4+GyLxad6NuwuYOx/3gQDQYfcnxi3LDqLYYHrgZe585miDroZ
	tqc946O/h0qadYTBS1J5uqCiKgMRQ9rLEBWDB+A3Yq938/jHsf9fMeBo43KCuHTBr9kb
	DsWeEe+PNVDE9mSFx1NOywSpOx+9z+zIOaIw2I+6wGSVvPreyiFwFGjsRon2Hj9amd54
	5jDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rk2CIB2hxGqMQ8kHZ1DXnbXOtJjYfZoGcYtN8laX39U=;
	b=dGq5JJGLOBCgQ3YGACJXFx+zk16qYGdjkuqgnrq8iq+eYVykpMnlZTOWOK+iNk7oQi
	PqrBfTNO9cVBO63ERcvDPV0BYyGEihykr1x35Db7qbCc9/iPCTcUipmubjSA2wOPlJLE
	8V5olejWcQtB/6Mquf3Zn1swl3dObBv1NEN1ay7cKN9EM951Z8x942HChHP1BfEMGS3h
	nVCtXcgA5WEVAJNUwqXXJwuIMApoP+lJptd4VOISwYnkTWeDba1+pmWVgyYl5jDLJHsw
	hWR0Y2y7fxTeRYlf1+j7QucYtcZeR37PYoDTeMWG8A6dT+pL0F+MliueimGW4JWjECSE
	FLxA==
X-Gm-Message-State: AN3rC/5cyM2/S5S5MlKuHbJCgIrG8UK5vYpLa0J96V27sehG7ytkWxiu
	2lcPravDAciZ3A==
X-Received: by 10.84.237.8 with SMTP id s8mr17593967plk.163.1493011296042;
	Sun, 23 Apr 2017 22:21:36 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:56 -0700
Message-Id: <20170424052058.4952-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 15/17] efivar: Fix multiple definition of `efi_set_variable'
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:34 -0000

This patch is needed across all efivar when using gcc7 for target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/efivar/efivar_0.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
index be04defea..602fd81b4 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
@@ -15,13 +15,13 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 SRCREV = "963cb2e5adc145fe00717f94e382f2973f80e753"
 SRC_URI = "git://github.com/rhinstaller/efivar.git \
            file://0002-disable-static-build.patch \
+           file://allow-multi-definitions-for-native.patch \
 "
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
                                 file://0003-efivar-fix-for-cross-compile.patch \
                                 ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \
                               "
 SRC_URI_append_class-native = " file://fix-compile-failure-with-host-gcc-4.6.patch \
-                                file://allow-multi-definitions-for-native.patch \
                               "
 
 S = "${WORKDIR}/git"
-- 
2.12.2


