Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D266E783A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 03:56:36 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id t3so2052127pgt.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 20:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PR7SoTPp0UnDWKBGsRQdcjerIvcBJwcjtqLzgVcYxyI=;
	b=RwfRkbUigdZiqC0zqpL2wBTaR1uY/PbH13OWaSXsS/+ZcGAbClZ2OkTRx2GGMZb4Ld
	eHthBQhaKjwPItTPIl8i4QlCNOptzmV2MxCaHaKBTTGj6gLcpj7dRUNeCjJseEwI0QY6
	SHe+N9941Wc1rmw+kH71WQ5kw4ovMPn0WDlgycKg9cliFJ6AWQGXzv1HPG//sejuAwqv
	lliRXYnd8Ys3spFG58Z5KPZjNUtUzQKdFmtBw0znsOTUKup70ytrgEqZ/1/o9XW80tqU
	18ZLU/bFTYew4EwfSDnyCywKhh+UPDRzdOCPLHDweP8+TQp4r2OjbrC2RFMqzFynrUH9
	ieJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PR7SoTPp0UnDWKBGsRQdcjerIvcBJwcjtqLzgVcYxyI=;
	b=sjRT8O97Bvn4zFst65UFbzYDni8x7BcFB3mbkbFOt9mOx7CC+/DNirLqASIZUSCZml
	sAhrM0x1zeYS1pKK8jzQ0vIXNDMeySMzG4Ex95XLMd108iYDJtE8Z8j7eIsqOp6Bnjoc
	597PW7E26Gkq9UZxqkxChFhTT0WaSMpYx4wYltXa+eR3xAK0TrDEg8Pwcfa85UIZhimb
	VduaFKy9cZXGcETpkJfwHGnG9wgLCc6OSnR6MZzwXBfb4yZpkSnuXN9a08oJbWFrrZsH
	BZPo67e4awH4zALinkCCvId8NYFIP6li86BrH6Ct3xTXU7PtzjDXAZpTv+YpiI9xVvWv
	bO+Q==
X-Gm-Message-State: AHYfb5jrmF67PPHISGCh46KbAadvOP+Nl9fs/2kmr3V602oMlUETaeW5
	LHpOSotIcpFWuadl
X-Received: by 10.84.194.165 with SMTP id h34mr9130280pld.373.1503633398371;
	Thu, 24 Aug 2017 20:56:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	n19sm9591917pfi.35.2017.08.24.20.56.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 20:56:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 20:56:28 -0700
Message-Id: <20170825035628.7995-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170825035628.7995-1-raj.khem@gmail.com>
References: <20170825035628.7995-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] efivar: Fix build with clang
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
X-List-Received-Date: Fri, 25 Aug 2017 03:56:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Add-Wunknown-attributes-when-using-clang.patch | 32 ++++++++++++++++++++++
 meta-oe/recipes-extended/efivar/efivar_0.31.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch

diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
new file mode 100644
index 000000000..1b8815e9d
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
@@ -0,0 +1,32 @@
+From 3d43c5efdb632da5d7387dcadce4e87b83929c64 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 24 Aug 2017 15:54:47 -0700
+Subject: [PATCH] efivar-dp.h: Add -Wunknown-attributes when using clang
+
+change !dp check to a comparision against NULL to silent clang warning
+nonnull parameter 'dp' will evaluate to 'true' on first encounter
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/include/efivar/efivar-dp.h | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+Index: git/src/include/efivar/efivar-dp.h
+===================================================================
+--- git.orig/src/include/efivar/efivar-dp.h
++++ git/src/include/efivar/efivar-dp.h
+@@ -783,9 +783,14 @@ extern int efidp_append_instance(const_e
+  * though older or other compilers might just ignore that attribute if they
+  * don't support it.  Ugh.
+  */
++#pragma GCC diagnostic push
+ #if defined(__GNUC__) && __GNUC__ >= 6
+ #pragma GCC diagnostic ignored "-Wnonnull-compare"
+ #endif
++#if defined(__clang__)
++#pragma GCC diagnostic ignored "-Wunknown-attributes"
++#pragma GCC diagnostic ignored "-Wpointer-bool-conversion"
++#endif
+ 
+ static inline int16_t
+ __attribute__((__artificial__))
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.31.bb b/meta-oe/recipes-extended/efivar/efivar_0.31.bb
index 10dde896e..6ad3b361d 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.31.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.31.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git \
            file://allow-multi-definitions-for-native.patch \
            file://0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch \
            file://musl-strndupa.patch \
+           file://0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch \
            "
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
                                 file://0003-efivar-fix-for-cross-compile.patch \
-- 
2.14.1


