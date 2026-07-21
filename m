Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E32C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 16:27:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27080.1784651250908481453
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 09:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xr++xebw;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc97653887so126109125ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651250; x=1785256050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Gk8rF9ez3UMk6D6592c2Q1/no+zqh+PMR+TAa4MOvc=;
        b=Xr++xebwWhK7XT7l7qrr/xa4Dk6AnBFpasnRvVqVxHQwnVxQ8UbuTwrHhDp7wJwqHW
         hDVFJ6WNQvgFlvLK84uU2JVg1F0DnkssdvO9ugkxTyeVPhL5I3g0XDH0y4A+6ZwbJmH0
         DfJWrAr4dLjFQFashC2Tne08fyvQQUwr6U8h14DrBxPOXMuTFhZzIg8Zimj7VITXKz3w
         jnql1b45o+n7AVDb2RHT0xbzGZYR9d2jWaKBTKf5OScwMIDtKWyKnNysIGkYhUBMlFrr
         5wcUU7h0G3XrLiClrkSA42wUp9kT23hRiL7M2nROpEz8YQZa/kF+zUTKmq2QJqPZqBuG
         px5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651250; x=1785256050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Gk8rF9ez3UMk6D6592c2Q1/no+zqh+PMR+TAa4MOvc=;
        b=CWXyxP/bysjEBOTKc0BBBaG45z3SWPX4IKik7fnfXMlk8HDszkVLxiewpqUFcjofUe
         mlw+8u/kDQ5pnynv2jsc0RQQ0QiubysVCChHXZCaEeXpkorZ/yGZAgsCLe/mXEvB1oJx
         2DbAlWjsBwGzP67MD756XVnMcqknCTvBi16g+rwkCPhHkXditMFQy6HCaiaLUuAUdyzo
         H8wtRNzJISuXn4cr4FeN9CeOoyA4hRESi7wwdZqruNbxC4rE3S0YsQcau4eGVKVEH88B
         4AjsFsfEN/vH7XglCYU9Tt4cd7Pr1Y9OseXOLuR5MwXEu74b6Aco6vgTkOUFKKAQ80+O
         sk+g==
X-Gm-Message-State: AOJu0YwS9S+orHigYnU37RNo7xz7dYaBlyIlmUkr2ouS95JsTXIl3ql0
	jF5NmucSS9KpM+PW+pNy7sMQS6NI70/KW08oezKgra7bNGsxVc85SPD4Ry7qNQ==
X-Gm-Gg: AR+sD13QTle9FXVxxjk92aSMg00c9YiPs1gwEmt7B3zsQqeTP3w3CP8Z1seeLKpyKw0
	VNaQzvIZCD1arnTBa6qYGs8FsF1Tgw3zXWEWZu77fvMj3z682keOM1wAWTvlImAyYK+gPEfFvr/
	HppojsSB3U7zCS4lAC3j60b6ggchMbjeFQ3TXD7fmFPeYdUMqoxGUWp02h+1ehrptMBFDsg4jvZ
	GGHdcQ8+42r8KtIe94mSa8y5jeqS2VNrwAi18qmXGVVWv9bgcfCB41Tnz1cHzywWW5hK90hXxgD
	g1c5HtTsCq4q6Z04/VeQYwXsiqIbDofvLdjC6R0kDrECcbp7KcvInc9qCxP8FnafxDK7N2qfSQA
	JeZU1UrmMB0/U+EIYZqMf83BjMw8Jlmin9ZJPKGdgR8YhKpmoxMXjcSeqqXafy9d6dcHh2z3Y4i
	SFkiIopeY0l3OISAB72A==
X-Received: by 2002:a17:903:3d0e:b0:2cf:6dba:b294 with SMTP id d9443c01a7336-2cf6dbab68emr86834815ad.22.1784651249982;
        Tue, 21 Jul 2026 09:27:29 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:e084:b7f2:160:d1f2:65e2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm479421eec.3.2026.07.21.09.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:27:29 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-openembedded][PATCH v3 1/3] e2fsprogs-ext4sparse-native: compiles ext2simg.c using android-tools-native
Date: Tue, 21 Jul 2026 21:56:42 +0530
Message-ID: <20260721162645.2056048-2-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721162645.2056048-1-emailaddress.ashish@gmail.com>
References: <20260721162645.2056048-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 16:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128354

Add a custom do_compile step to build the  ext2simg_android utility (ext2simg)
when building for the native class.
This can be used to generate ext* based sparse image

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 .../e2fsprogs-ext4sparse-native_1.47.4.bb     | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb

diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb
new file mode 100644
index 0000000000..04f9aaaf2b
--- /dev/null
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Native ext sparse conversion utility from e2fsprogs"
+DESCRIPTION = "Builds only ext2simg for host-side ext* sparse image conversion"
+HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://contrib/android/ext2simg.c;beginline=1;endline=14;md5=fc8a826484cc82548adeaad2579adfca"
+
+DEPENDS = "e2fsprogs-native android-tools-native"
+
+SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master;protocol=https"
+SRCREV = "ece89fac4603e400155b7bbf6326284f8511bca9"
+
+inherit native
+
+do_compile() {
+    bbnote "Compiling ext2simg.c with native toolchain"
+    # Source directory for ext2simg.c in the e2fsprogs tree
+    SRC_EXT2SIMG="${S}/contrib/android"
+
+    INCLUDES="-I${S}/lib -I${B}/lib -I${SRC_EXT2SIMG}/lib"
+
+    # STAGING_LIBDIR_NATIVE: where android-tools-native installed libsparse
+    LIBS="-L${B}/lib -L${RECIPE_SYSROOT_NATIVE}${libdir} -L${RECIPE_SYSROOT_NATIVE}${libdir}/android -lsparse -lext2fs -lz -lcom_err"
+
+    ${CC} ${CFLAGS} ${LDFLAGS} -o "${B}/ext2simg_android" "${SRC_EXT2SIMG}/ext2simg.c" ${INCLUDES} ${LIBS}
+    bbnote "ext2simg_android compilation finished"
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/ext2simg_android ${D}${bindir}/ext2simg_android
+}
+
-- 
2.43.0


