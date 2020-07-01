Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.10742.1593562065195275207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RpC/WVDy;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id c1so2968505pja.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=G0czPUf/X833G8dkIiCLliApPlka6UrQ/xD7vWSbMH4=;
        b=RpC/WVDy6nzO5rKI3HQQdpMgC9MjEUQVBRO9tjt6on5ZMFDcZyJzZp0MVOd8WCGSY2
         jtFM4N1iUwnw6hmXLpoXESo2S1RxPN32t/f4uUbuxWv2/fi7xBSXj5ituD64OJJZ8ZXS
         1QHWwWvGebc/4OhbQ0MLYBh+QdTvnGBRMImcwI4elWs01X8tLeRNvVVGwRnmR5g9JcJv
         ukCKPpkaUE7wUUKtKPz9lP1EYJ3byfhCAgZXHqGKSA9kBX6opkdwCGA9XIRrUoABMxW+
         wcUjewzJv6L2B2XqVnNkv3MZPNovzgl8m28z6o0jCH6E6zGEWwpZLDSMY43ou4HpmKf/
         7Vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=G0czPUf/X833G8dkIiCLliApPlka6UrQ/xD7vWSbMH4=;
        b=iD0yJAy0MS6bva6UT1J1vRRTuyKSe4kWHuxe1l5xAayLhq/Y/Q0lx7cbr5MZ34KZP3
         ZVg6X1fiVZR2I5lKOHR/yWtaS/qNEsjZhwO5I7J2ehuV2QfhEObDmXe1gLRGlvBVib15
         wIoiUsB8cZMqMnJXc4AMAGc09t4VAT0URdV2EUhqVEXt+6s2mumgowHmXswTCPdecwS3
         7AwdtYDplnaQAormAIkIxlIFdBu1zmXK2EkaElVfQKVb4E0ZSxWgS19HsiavThXgxXpZ
         7AiIXc/SZYvTY18+PR0BiTaDycMJHlqgL81MhO6SO/YPaONQAYSQZbizgGfMRQZUjvwF
         O3jw==
X-Gm-Message-State: AOAM530TJJhHqOiR6A1HmnvxwMSrV8ombhTlu3KJuB/Ib6icamL0KIyx
	59pm/EZaxSiAjqQ+xVgLU3eWRo7u1hE=
X-Google-Smtp-Source: ABdhPJyin8uiJSPc14bMHRJ4XUmpuNsVpdjx9g2bN1/v21UqdL+y5O0sMZ1Q0fe3fmE+D4TDflPxsw==
X-Received: by 2002:a17:902:6506:: with SMTP id b6mr18858326plk.13.1593562064529;
        Tue, 30 Jun 2020 17:07:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:43 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 20/32] python3-m2crypto: add the missing rdepends
Date: Tue, 30 Jun 2020 17:07:05 -0700
Message-Id: <761cb3dbf2d03a0b4fdb9475551096b369399d51.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix the error such as below:
 # python3
 [snip]
 >>> import M2Crypto
 ModuleNotFoundError: No module named 'decimal'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fe77eaab8f0c3be9e1fbfeef69400f4f06748613)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python-m2crypto.inc    | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index 881fdf1cc2..81c81645af 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
+++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -17,10 +17,16 @@ PYPI_PACKAGE = "M2Crypto"
 inherit pypi siteinfo
 
 DEPENDS += "openssl swig-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-typing \
-                   ${PYTHON_PN}-distutils \
-                   ${PYTHON_PN}-smtpd \
-                   ${PYTHON_PN}-xmlrpc \
+RDEPENDS_${PN} += "\
+  ${PYTHON_PN}-datetime \
+  ${PYTHON_PN}-distutils \
+  ${PYTHON_PN}-logging \
+  ${PYTHON_PN}-netclient \
+  ${PYTHON_PN}-netserver \
+  ${PYTHON_PN}-numbers \
+  ${PYTHON_PN}-smtpd \
+  ${PYTHON_PN}-typing \
+  ${PYTHON_PN}-xmlrpc \
 "
 
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
-- 
2.17.1

