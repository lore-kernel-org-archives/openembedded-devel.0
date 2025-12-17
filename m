Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4F5D65C7E
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 17:31:08 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18440.1765988339312353111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 08:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lk24Cw+a;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: rbarrau33@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b735e278fa1so1086239066b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 08:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988337; x=1766593137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0mQsJgEqQ/0uo5t2ZTmsVGm/g3KOwqjBSrVpJGU/0O8=;
        b=lk24Cw+agvGH+ZauSl3dpG/HTDWpkKR166ue9kWe7Kei8UDwqykLKAkk3l+DT9pX/F
         +UHy0wilvQJlwhFFh4cfSYDUi3Ob0cG1h55HNH98x8C9oFV9h/gnummydUsTUep/0OP9
         nbnAWuvq0sRoLcAannzt33u7DkvW8UyW5sOol9l4JtD64KUom4NPae29Bq3zkma26Lhd
         RwG8jhrzsg4RDGvca8L0vGAG2oDeRS9Ob4u1q0t2lItlCpb/Tn2OmRsiQeDktz1lJDGC
         bZiu+SbrXvby6v5D+b0kIjBwn97xgVVRatHdcUTJCzzfsfLZ1C2mXsvkTHgUkZ0ZhblA
         7vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988337; x=1766593137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mQsJgEqQ/0uo5t2ZTmsVGm/g3KOwqjBSrVpJGU/0O8=;
        b=oY4nOOaoVkRt9NPSMaxkasq1yC0HZwlwi0Mlrl0wwQZaYbo3zYxbNWdruRqEcyOZ7Q
         i6vXGr1DsY0hR5IJb0sng6KmAVZUQ5czomnvNGWghRBwEw3ZOlAS8Ltbnwff+hkscM/0
         k0wS1qjWRwOGbzdAD5p2DP9gKEfHYUAMBeWcZX/9Ax60M7TTQL99CDQQ4ZY0bKlEdgm0
         NU7KTWcclOftAxpS3x+6/F2GnGv/FZxU6FB54EZWIZHB6HC1bv9hBWYZ+Z9/Rv9+6hQe
         d6QCcOcuuOa83055aJsYzJ1hMmpsS9seP6fwVjJniWUuUpdEKJd+8uzDTy+j+E2fD+Xi
         5V7A==
X-Gm-Message-State: AOJu0YzPNGMI/D5sDvD1UiX5+RxjWRt4Wo2tKh8ZYLJi2lhy8TC2mJVK
	qOlxfh/zQw+Zx1ZHfUgBOnFrzxyqYBS1ipg0Mlnpct6KIFcBspp5XQ+9hv/IGw==
X-Gm-Gg: AY/fxX7dgFTs4O6nKTVbUX0G6DwuypzwrrATUchWt2BVKpYrxKl1Bykgr13Bbe++lpX
	bzbgl+erHJYo2nD6zvzVwPWUH5/7Hv1lRdiZ2KPjqklQ5I0X3DytANTFD2+T5xF/0b0CAdMZb91
	wRhAWgwGLk0jWF5FqZc1a5tTjQv0mitMIOYponWR4P4F9pL+MCVlLT8QAOlY+NNZm/noNU3rHh7
	FtATb4pZw+yE4oMWcHlL/GVqyBye9ESlRqoRFagjx2zOzy+Fn5XOvWelNk2YdCvkLF8b4MRsPPJ
	TX7gGI9PTAa1eGvTmhAa5ZO8fUF8ooO/LRbF8PkPu2nUFkYbsjp0wFSK087dIMZ6XCNP7KDozgi
	xhvC6mCiEOXIRBIZ1Foh0V5vRePQ0sYAGfLS4dGjFBuWA6+4BdIMFhxfs1pFcjkY2ytO07edzyb
	VSu036LwLT9ivmGYbN/ZzWic5ESLV2e+1kLWCQV0HJ2ApUe4SHyI4H0Kieol7HFEKw3gyKTBhqJ
	QjZrX1OQsrtWFAH5kvOUH08bGD07OgOEa/Zonce/ttYX7L/mC1o+EiAh8z8BOhjqb3t
X-Google-Smtp-Source: AGHT+IEqp8wtqfOp9zE8KOy922wDqJpEux1OvC3sNuq3tsr8kpGKF24k2Io9dHA8kgGEHQj2IXE+QQ==
X-Received: by 2002:a05:600c:4f86:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-47a8f9071c6mr196194195e9.21.1765987883820;
        Wed, 17 Dec 2025 08:11:23 -0800 (PST)
Received: from LSTA-2404.. (2a01cb01403af46ce64bc8ed90517e24.ipv6.abo.wanadoo.fr. [2a01:cb01:403a:f46c:e64b:c8ed:9051:7e24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ada8426sm5482869f8f.5.2025.12.17.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:11:23 -0800 (PST)
From: Renaud Barrau <rbarrau33@gmail.com>
X-Google-Original-From: Renaud Barrau <renaud.barrau@madic.com>
To: openembedded-devel@lists.openembedded.org
Cc: Renaud Barrau <rbarrau33@gmail.com>
Subject: [meta-oe][PATCH 1/2] libtoml: add new recipe
Date: Wed, 17 Dec 2025 17:11:13 +0100
Message-ID: <20251217161114.403899-1-renaud.barrau@madic.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 17:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122725

From: Renaud Barrau <rbarrau33@gmail.com>

Create a recipe for the tomlc99 project https://github.com/cktan/tomlc99

Signed-off-by: Renaud Barrau <rbarrau33@gmail.com>
---
 .../recipes-support/libtoml/libtoml_git.bb    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtoml/libtoml_git.bb

diff --git a/meta-oe/recipes-support/libtoml/libtoml_git.bb b/meta-oe/recipes-support/libtoml/libtoml_git.bb
new file mode 100644
index 0000000000..befd413d3c
--- /dev/null
+++ b/meta-oe/recipes-support/libtoml/libtoml_git.bb
@@ -0,0 +1,41 @@
+SUMMARY = "TOML parser in C"
+HOMEPAGE = "https://github.com/cktan/tomlc99"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95bbe2f9180443b5dcef3fb959804a65"
+
+SRC_URI = "git://github.com/cktan/tomlc99;protocol=https;branch=master"
+
+SRCREV = "26b9c1ea770dab2378e5041b695d24ccebe58a7a"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+do_compile() {
+    oe_runmake CC="${CC}"
+}
+
+do_install() {
+    install -d ${D}${includedir}
+    install -m 0644 toml.h ${D}${includedir}/
+
+    install -d ${D}${libdir}
+    install -m 0644 libtoml.a ${D}${libdir}/
+}
+
+do_install:append() {
+    install -d ${D}${libdir}/pkgconfig
+
+    cat << EOF > ${D}${libdir}/pkgconfig/libtoml.pc
+prefix=${prefix}
+exec_prefix=${exec_prefix}
+includedir=${includedir}
+libdir=${libdir}
+
+Name: libtoml
+Description: TOML parser in C (tomlc99)
+Version: 1.0
+Libs: -L\${libdir} -ltoml
+Cflags: -I\${includedir}
+EOF
+}
-- 
2.43.0


