Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F299BC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 16:14:53 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.12685.1752596088409973666
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 09:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IYZe3QBC;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso3261003f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752596086; x=1753200886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/ejpxNvMrtn1tL9ueG6gQAVUqBjx2w7gf66PbrqzuU=;
        b=IYZe3QBCzkaK33x9+kxRm1wRrwu+fbjSaFhffYpaI4djkBpcfrx7PuihenNngBCuPy
         YLefJFKS6v9a+M4EvdWZM6MwlgIjKeCdh7dFOuNVCZ7oncmmZnHNLNCogOtR/Gk5mqpy
         R2TkHPM6anyzHYlOZDiNN7BTDnBkAO0jjQ3983Mi3218zwO3LcltRQQn6SZChOH1j2OO
         +0TWpc30FbeefGQFAfBTb+qRnuMVriZW8CzGcEz/BwIpXQgdmCjpC+s/HW76iWX8v84F
         AE6Xks/FoNagO1BNV3ewUZuL11XdpNsJbuRKJc8y0jqVpNkHn3307lYD/7HuxhAVi0/N
         Fnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752596086; x=1753200886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/ejpxNvMrtn1tL9ueG6gQAVUqBjx2w7gf66PbrqzuU=;
        b=ojNl8VE02Xcx+yl1LO2EDd+7bhPe7iZ/jtX2lSxp+iSmLNXBToyFqn3KnOArWa6zZI
         Ge/DT00gEE+MAAxyJDOrBS6P+TNcfTVGUUr8C4fDCE1uAQvEWwUZGA6w5V/LEGahBmlG
         uRWQzQX7Xf9RkB5q0YVeOqja4wtK91eIo03x69Ge3g4pkH+HX/lGy5j9gxwOCM23Mg9y
         qSPSoKxI8oIrvYWI5OUBluF0wTu9pcmFQboBWF4bx4n8wj9QoUJO8o9wqde+5C38t7Ak
         PJi+Er17ovhMxpxGGnpegZmXxr6zHjYT5e1rcl8grwaHVyNI1uo53pIbkDX3loufSbUa
         4zpA==
X-Gm-Message-State: AOJu0YyAHSGFZLhRpTOWautMT4a8nSwWTrlKN9gN0XOwsAmO2cdmro2N
	W4rdDhNTVIJmcZl0d5JXhP37MiwUdk7Nq+AswcilwNjPRuBt3YA/sdeVXy8qMA==
X-Gm-Gg: ASbGncvYS+spPfilnBoJlwICEYdKu793n9LtOM1MzUaekqPqanUzZAgTK8yQLDFes2k
	2lY1v5UwtXqWR/vBm3VQVAjdk1RMUOE9GVdAIEEn8117fizh3uOvGJp8+1otKO1mzjRmM+HMIXm
	tgyEWyEFSkmkFIMCjwnuXeXp0NCiD2mKcJ7lPTi3NhoEL0vTgD9hoEyIHj70fQbzn/3Gwde9CaT
	uB1nkHlI4RvuOkEDdM5NS9R86HtINQSbPwHNhnHez5ilRdGu0TLfoT3TrBC0KiZUaD70Lq6vmCq
	I+GH+NTVu8hFLqYQc6+XA4UcPcq52XIxga3fz+MrFt+hbVLuSxBWK5kFBOWNEjKCerkuJYi9ZwM
	L826N/qbUAS6jxJUUYSZk7rd/WOPHQpfsgPBppkT7rexn30fO5cj0nBLaEA==
X-Google-Smtp-Source: AGHT+IFekho1qYFJ75t4ngFMdAL/7HUD5SILYFEL5FY2nrRFFvrBVnIVjYMTacawevF4iG5N/0JzHA==
X-Received: by 2002:a5d:5e90:0:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3b5f18168e9mr14480998f8f.0.1752596086314;
        Tue, 15 Jul 2025 09:14:46 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1a2bsm15772825f8f.14.2025.07.15.09.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:14:45 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade 3.6.3.1 -> 3.6.4
Date: Tue, 15 Jul 2025 16:14:34 +0000
Message-ID: <20250715161434.8940-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 16:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118564

Fixes several security vulnerabilities:
CVE-2025-49601, CVE-2025-49600, CVE-2025-52496,
CVE-2025-47917, CVE-2025-48965, CVE-2025-52497,
and CVE-2025-49087

Changelog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.3.1.bb => mbedtls_3.6.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.1.bb => mbedtls_3.6.4.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
index 0b64d661c4..3f8938bb82 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
@@ -22,11 +22,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 
 SECTION = "libs"
 
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=main;tag=v${PV} \
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
            file://run-ptest \
            "
 
-SRCREV = "6fb5120fde4ab889bea402f5ab230c720b0a3b9a"
+SRCREV = "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


