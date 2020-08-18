Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.60597.1597728797208291448
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 22:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZtW41uVa;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id v15so9226805pgh.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 22:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EPGf+1KtQ1ivVhxDTohyXWtFJR5eoY+uCJlLugNqh/A=;
        b=ZtW41uVaPuX3ULMccf5Xuc0f3tIWpv1Ujdl8xVPrfMe7uB76gGod720MjdPWCcVVia
         DgNV7zTmuO8G0+K8Ey//YxRPtULx1MR5e0DvIcy+nsKGRfSUku1HVJtKSFdNpE/URCZW
         yhZA6Y0SDPejFOW+r1LvDrDcVblZ7lJsgEpsARj++zAw8wefvRAV6b+uMChhWCah0Cuk
         Vf6/B4D9UZIBhkjaFW1VZ10uDKeqPL+Cbhbbbsgn3p8LsXThEsKlVCFXG/odf0Fp9SV2
         oRCXKPrmmJsLlH5xZeP2OXcpnX6X57s4oCr2fLxD5N4kHIRq1xouxeKsfumYXLtDznom
         j53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EPGf+1KtQ1ivVhxDTohyXWtFJR5eoY+uCJlLugNqh/A=;
        b=Ppgk0QceCMX3a5HlBAT6d9Fjxo2wZcFF6bG0QNQwCazEGTy7XDBjslcEQXwl64LreS
         1Dmd+7GvQHR5YGqcIpTzeMx82wTn8ygw0uVvdATaKfY/Pp7uvcjuI/pXsZAFdCUnw8L/
         DMBxnOOKlq/5OAmgd16x5y36HffPZq8Mkqnx825l08LKXP/Lhp6bTgk68hKg5Zwztg/s
         5r1EYNBX8OakyngZwNxefG8yWg47x7DsP8BBaul3w1DnzSa7+/xy0CMcbF0Hgq63FM2M
         1cEpKkOTQlJl0zX7p2iHG1qykSS85r6AQAocsk5r9YzQ2QlTb2EwHJXwihwtrLZm2MZ0
         cfKQ==
X-Gm-Message-State: AOAM5310NQz4Xd1DDyvZ/qsQrWWbfy0EE+LbYejY7O4N2r7d0RScusKA
	9jp3NL5BuECSJ3E97qI1BWIkE4Jj/pU5UA==
X-Google-Smtp-Source: ABdhPJwsmlLC9H4gvoVqxVQAYJt0F+AlG4RsyrAgjua/M+U5NTqxJ8eeJFFLL1t6mLNRRq/djl4boQ==
X-Received: by 2002:a62:1745:: with SMTP id 66mr13374803pfx.273.1597728796228;
        Mon, 17 Aug 2020 22:33:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id f27sm22078061pfk.217.2020.08.17.22.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 22:33:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opengl-es-cts: Use SECURITY_NOPIE_CFLAGS
Date: Mon, 17 Aug 2020 22:33:12 -0700
Message-Id: <20200818053312.1048641-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
ERROR: opengl-es-cts-3.2.6.1-r0 do_package_qa: QA Issue: opengl-es-cts: ELF binary /usr/lib/opengl-es-cts/deqp-gles3 has relocations in .text
opengl-es-cts: ELF binary /usr/lib/opengl-es-cts/cts-runner has relocations in .text
opengl-es-cts: ELF binary /usr/lib/opengl-es-cts/glcts has relocations in .text
opengl-es-cts: ELF binary /usr/lib/opengl-es-cts/deqp-gles2 has relocations in .text
opengl-es-cts: ELF binary /usr/lib/opengl-es-cts/de-internal-tests has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
index a9ded3d78f..0e50fd9474 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
@@ -24,3 +24,5 @@ do_install() {
 	rm -r ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
 	rm -r ${D}/${CTSDIR}/common/subgroups/*.a ${D}/${CTSDIR}/common/subgroups/cmake_install.cmake ${D}/${CTSDIR}/common/subgroups/CMakeFiles
 }
+
+SECURITY_CFLAGS_riscv64 = "${SECURITY_NOPIE_CFLAGS}"
-- 
2.28.0

