Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C0FEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 12:10:19 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.5908.1689682213559094538
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 05:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lQR/eau+;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-986d8332f50so733451366b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 05:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689682212; x=1692274212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ESg5SOJgC73TkMKhb9XAgQDWWCG2yzwU83duUgBOMtk=;
        b=lQR/eau+i3YcC1dvl7pUdgdvstntwuxtoWoOqD9PL+2UaW+IVEAsLlY07SbyOAfqka
         nC7RIuB1h5Ovqoi22woQpxr/f/MfattNqwdJGQJadk4E0FjqXMXn+Jk5dxkRKl2Hf68N
         WhzN4IDB7dZsiQCjQT4Dyk/s+AmB9GgkdYWZIW6IcCJkexLiGsRUhuQOa5kOJ70v73xO
         LqSQBFmdr5D72+AGC8Krep8U20pxJ+d4NC7i1VOQqivxdooqh9/h3fuPKmiFQ9fX8P3J
         STwPQSWV5HJPRTfkuLiFv00jZREr1dsOIlDvF3azvhQRd4Jc+kFPs3CP+mzCQ0CLsXFi
         uc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689682212; x=1692274212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESg5SOJgC73TkMKhb9XAgQDWWCG2yzwU83duUgBOMtk=;
        b=YGEg4MJ6ks0xCAepV852bZI+5jclI4h6xc0UxNFAxrUb3uLk5aWw8DJAItseOKpyBV
         oV5fPUUsp5416cw8YguU59414K72D7iGyoL5zsIi+NkVBVZD30jwRLX+QTylRgaQq1/A
         H7Dkiebfdabmn0hTUSoQ+yZodicz8/XBwOI7qrFpI/hpGToTDgTwcnRuY7ClLXRdkmCk
         UtErUTL5Grp0IaMI4lFnEqBXpSy/NuIeLFiTGsjkHN2Q3Mcv9vE3yMzaKxyRx3ShA02H
         aSDamko6MiDPsh6VWk8LgpKGVX0rOGJq1Y35tOv2EX64ZpYMISU2Fe+BWZ1x+9RP1x22
         EAhg==
X-Gm-Message-State: ABy/qLYcslHzPxUh4iwD+iM3D7MEFirIx9pypg5j/FUUjjmGYVjGE1mt
	l+JvKVQ5/jsEB5LhWL/8N52j24rvXwA=
X-Google-Smtp-Source: APBJJlFBizYM1wdNIJrD83LlThjQVs660QoDsiACVvAq/a6CGI8KgFPZzY7PLBUmB7nqIS6+WuvQxA==
X-Received: by 2002:a17:906:2d6:b0:970:c9f:2db6 with SMTP id 22-20020a17090602d600b009700c9f2db6mr13536512ejk.63.1689682211698;
        Tue, 18 Jul 2023 05:10:11 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y23-20020a170906559700b0098e48ad11f2sm970338ejp.93.2023.07.18.05.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 05:10:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/3] libtommath: add recipe for LibTomMath used by dropbear
Date: Tue, 18 Jul 2023 14:09:36 +0200
Message-ID: <20230718120938.2048623-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 12:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103940

* When system-libtom PACKAGECONFIG is used, both libtomcrypt and libtommath
  are used from system and we need a recipes for both.

* libtomcrypt was already added to meta-oe in langdale and PACKAGECONFIG
  was added in dropbear in:
  https://git.openembedded.org/openembedded-core/commit/?id=b7c2edd2d6ded287d8b34dd047ae84d3fd69d4c6

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libtommath/libtommath_1.2.0.bb            | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb

diff --git a/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb b/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
new file mode 100644
index 0000000000..05fe6d079b
--- /dev/null
+++ b/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "LibTomMath is a number theoretic multiple-precision integer library"
+HOMEPAGE = "https://www.libtom.net/LibTomMath"
+SECTION = "libs"
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=23e7e0a32e53a2b1d35f5fd9ef053402"
+
+SRC_URI = "git://github.com/libtom/libtommath.git;protocol=https;branch=master"
+
+SRCREV = "6ca6898bf37f583c4cc9943441cd60dd69f4b8f2"
+
+S = "${WORKDIR}/git"
+
+# For libtomcrypt to use libtommath.a and avoid:
+# http://errors.yoctoproject.org/Errors/Details/720465/
+# ld: TOPDIR/tmp-glibc/work/core2-64-oe-linux/libtomcrypt/1.18.2-r0/recipe-sysroot/usr/lib/libtommath.a(bn_mp_cnt_lsb.o): relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC
+CFLAGS += "-fPIC"
+
+EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' 'CFLAGS=${CFLAGS}'"
+
+do_compile() {
+    oe_runmake -f makefile.shared
+}
+
+do_install() {
+    oe_runmake -f makefile.shared install
+}
-- 
2.41.0


