Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8C3C36007
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 18:03:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.124.1742580193344277705
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 11:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ARZe3wQy;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22580c9ee0aso49078715ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 11:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742580192; x=1743184992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW9qsrz6qSRHLIs7cUSdv/qA8N1a4vGNv5Ls5RwrVDY=;
        b=ARZe3wQy/ErIyXD3A19KzVnp9dDmR6iSBiEDMX1b/JC3hl5aPF67sptCk7uI7yXp7a
         6h9HfmY6Jg6TEWruolwtygvhnTfaOHnaNoKFZfrdoRYbv8OMnGduPUsHa9Rd8LTHHURt
         fAR080PyzGj0huBB5KUO+uVoM5IFglvSibW7EOlluArxHxJxE6PphXtGRA5t2ClvLBfB
         s8Z1EI4TZbco6nsg6lFfaIaIYIpUBDczcTnxN+8crN6G5fbfbFY69TAiKKeGD0ug+bqE
         Zfc0GZtxI9OwBa1JC5XXxzLIwsMzJl4j96lC2AhMrJEus2Vqx86Rva8SgZylI/Ky8hDd
         rdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580192; x=1743184992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZW9qsrz6qSRHLIs7cUSdv/qA8N1a4vGNv5Ls5RwrVDY=;
        b=hD+ndPyxFQcuwwJybwmQOeE/fDDqqW5TXLRpMMygfVv6VSVORIsWHoM7y590II0BU0
         iZqAgh0p06DaMdGlKY4REsdj0OStJ/cNdIFJsTVBFWMytOtc8hBJtY4ba53DXFQaQNrZ
         pFu33Ena3uhh65VzAM/Wcpo5k+Ab+n1pjjAVvCIhXU+b1RwEXqWGOx5Yy/dbgqAsjkq+
         XuAxecyvDpdbBm4IxtfbX1AQE42EjhisQmdMeHm7zVFTeyndIl5F3s2sR53qZHbIXtv5
         757r8LsIvxoGfXKsDUnjM5pF/FJ9jMvMRY1yK76BnTlh50NxMccItB7N52UuXJEvPthH
         iJsg==
X-Gm-Message-State: AOJu0YxsFBs7Pn78IGCZ3lQ0MIT/Npti69VzcKoggeCA1A7sHy2FD0GM
	55aGXGa4+QKT7ubNlrmAvje+GAj26LReIaaCEWz/k3/hYbTzHFHtfny/pmqv
X-Gm-Gg: ASbGncu/j6EM+c117l26VNHVXJSm0N/8cU5SbhV+tiNMTecXAMo8ks4G3TumhN4P/fd
	HIEkC7uUSnrhQAZ2SOEwZixABuVpdLJpm0x6CMLO8m1r0PVH6wyWocd//XLFqSDxutdcazdlnBU
	OkEtM0X4/h+NAfSkFeYUg+zstKVRfTZ4smLcumQv3Ci+fGQOLl0KuECVj+8B4qXhybpfie3QEdL
	pVRv6AJ80iIw70Me6bAA7mT47LrZSPUbt9KTP/8yr1VWmJ3O5xHtZr0OxFxV7qjRiar3tFL5gso
	qVFe5QRfmJaPy00zH8FZLSc0otnEj/CYWaoxVjwFybuCFu8=
X-Google-Smtp-Source: AGHT+IETaAYkXdfn+3YOs62C/cYyQehP3BhhywT3Pkek/cPT+uNsNk3HuIBVKSByL47N6k3XNNneUw==
X-Received: by 2002:a05:6a21:339a:b0:1f5:51d5:9ef3 with SMTP id adf61e73a8af0-1fe42f995edmr6670505637.20.1742580192313;
        Fri, 21 Mar 2025 11:03:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4c905sm2079807a12.66.2025.03.21.11.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:03:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] webkitgtk3: Fix build with clang and riscv
Date: Fri, 21 Mar 2025 11:03:07 -0700
Message-ID: <20250321180308.1071453-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 18:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116190

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-on-RISCV-https-bugs.webkit.org-show.patch | 30 +++++++++++++++++++
 .../webkitgtk/webkitgtk3_2.48.0.bb            |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
new file mode 100644
index 0000000000..40a7133052
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
@@ -0,0 +1,30 @@
+From 984538dcce7b184269efc1e1b0fb78e1cb932b5d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Mar 2025 01:21:22 -0700
+Subject: [PATCH] Fix build errors on RISCV
+ https://bugs.webkit.org/show_bug.cgi?id=290163
+
+Reviewed by NOBODY (OOPS!).
+
+Include c++ header <system_error> for std::error_code.
+
+* Source/WebCore/contentextensions/ContentExtensionActions.h: Include system_error
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/42802]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WebCore/contentextensions/ContentExtensionActions.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/WebCore/contentextensions/ContentExtensionActions.h b/Source/WebCore/contentextensions/ContentExtensionActions.h
+index 0b75d2e1df78..61cb33c94ce8 100644
+--- a/Source/WebCore/contentextensions/ContentExtensionActions.h
++++ b/Source/WebCore/contentextensions/ContentExtensionActions.h
+@@ -28,6 +28,7 @@
+ #if ENABLE(CONTENT_EXTENSIONS)
+ 
+ #include "ContentExtensionStringSerialization.h"
++#include <system_error>
+ #include <wtf/JSONValues.h>
+ #include <wtf/Hasher.h>
+ 
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
index 9a4101c4b4..10c2576407 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
            file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
+           file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            "
 SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 

