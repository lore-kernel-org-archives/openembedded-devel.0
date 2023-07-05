Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4221C001DF
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:25:54 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.1022.1688577953786669972
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 10:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ME1ziHd5;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5577004e21bso2561676a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688577953; x=1691169953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GKY1WY1W+DrrHzuhvPv7xThOfzMd8T2SYq9I8aB1BU8=;
        b=ME1ziHd5mOKaJ8+GUWSHCDdrasU5ja2vrsUEuT9NlJw2fBaH0F2NyweEJv0t6lirK6
         CD5asAYOHzacnXuKANEppoOQkcWE+gExQYFw3U2IkWBToZWQCYX8w6jAOfJDiu95T5Pw
         ha4wvCAKeMXLncfJMF5JNe07603kfy/bB7+UMj6RkwwN9MtiR4RBrKOWmxYR0sE/NC5N
         NCuZXqJ7girmjPJad7gYNy1L8c3mpmcKh2P6Z5E8vGwUYgmF5TWeGKOVqt8Z1YehUtPc
         J4satY5e7Vf1bHW+/MWBQOC6DuVTr10HewmI5chZspYd1BMF0QLd+9dM+PyF3jjbRq1F
         hHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688577953; x=1691169953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKY1WY1W+DrrHzuhvPv7xThOfzMd8T2SYq9I8aB1BU8=;
        b=em+okImAu0LND/oQX/qDw4LYDcYc6Ot8FiHyvlWjMbs2M14Nyybiaug/klmcUEIhdM
         Za1riUKO4EqYUvOL2hO8suvlu2NdrR8jjKyVxjNVvGehqnREakZydbmj5ApAh+Dc87ZJ
         EIpNWPjeq6jPPJgrDLY9kLCVhXb7l8am4j4IfJZcSNJJ1AGdEXlpykve6WYE+ayUcf5Z
         QlB+5K2K2k1Qy5HJm7KcoQL3SN0YHgDSVh5EI1Ld19QxB0Wqs58DUxBsDOu2Xeq48H2Y
         4QwxpYxPx/3kcJth8tsU3DNXjGD1VGkEPpNPfIJeEEbd0qh/SQTmAgB4tRlHyhzHK875
         cEWw==
X-Gm-Message-State: AC+VfDwWuY/KnGnkJDPErS9HKfhgvhatOKv51pYF6KhgGdqhUDxhVbvY
	jOcqDH8rPsuAEAYnY5dCmnzvQzyTWfk=
X-Google-Smtp-Source: ACHHUZ6E7ojWxTG7gDbYk74gS0HsyqEweq2GUkyGoWr/A0NK+fUfzBg6s6eQr0AM6Tehi91pJA+GDQ==
X-Received: by 2002:a05:6a20:1446:b0:125:f3d8:e65b with SMTP id a6-20020a056a20144600b00125f3d8e65bmr16665102pzi.18.1688577952820;
        Wed, 05 Jul 2023 10:25:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::81d4])
        by smtp.gmail.com with ESMTPSA id w6-20020aa78586000000b0067b384d5955sm13869174pfn.26.2023.07.05.10.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 10:25:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-grpcio-tools: Upgrade to 1.56.0
Date: Wed,  5 Jul 2023 10:25:47 -0700
Message-ID: <20230705172550.3371930-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 17:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103668

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...f-Disable-musttail-attribute-on-mips.patch |  8 ++++----
 .../python/python3-grpcio-tools_1.56.0.bb     | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
index 8b13d7ae21..8c70b2b6a6 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
@@ -14,11 +14,11 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 
 --- a/third_party/protobuf/src/google/protobuf/port_def.inc
 +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
-@@ -255,6 +255,7 @@
+@@ -338,6 +338,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125
  #error PROTOBUF_TAILCALL was previously defined
  #endif
- #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
+ #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) &&      \
 +    !defined(__mips__) &&                                        \
-     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
-     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
+     !defined(_ARCH_PPC) && !defined(__wasm__) &&                      \
+     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__) && \
      !(defined(__NDK_MAJOR__) && __NDK_MAJOR <= 24)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
new file mode 100644
index 0000000000..eb1994d7ce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Google gRPC tools"
+HOMEPAGE = "http://www.grpc.io/"
+SECTION = "devel/python"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
+
+inherit pypi setuptools3
+
+DEPENDS += "${PYTHON_PN}-grpcio"
+
+SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
+            file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
+            "
+SRC_URI[sha256sum] = "39f5877cea514b3da9f2683dfb3ffb45ef47b05f4ff39c287d7d61c5057f48b8"
+
+RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


