Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE2BCD11BF
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 17:56:24 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.2086.1711130174777770725
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 10:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ez++zFD3;
 spf=pass (domain: konsulko.com, ip: 209.85.218.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a46d0a8399aso584670366b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 10:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711130173; x=1711734973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=brszdR0QyK9fuHxUxd1yYabSBGGRjbf1iue8vNs8Vc8=;
        b=Ez++zFD3Skv0CjgCRgW3FPo97wnwFL0H5jNEEXkqd0vY0jbmbYu6P2IswqG0KLRavL
         CK1BKOx2ZdHdHIrnZvEnoC/HtpaBCHfCa+ayzB0hu9VC8yQDV1KTidImbjIJD06vY+/p
         QnmatrqkA1QnDiFpuxLOdc9aRDve1dhJJpvz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711130173; x=1711734973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brszdR0QyK9fuHxUxd1yYabSBGGRjbf1iue8vNs8Vc8=;
        b=RIUTowU/mhK4ABR2A8p1tNkTzC01WzYfYt5fZ8QGAgZI/eH7J+Ydiyy/0HExTjVbDX
         0IgB74u6hzVnow2dQi3qDbgO/fzJzUYWitq3yGa2zpi3tmcWz5aPxqAnseQz+fP4no4X
         nuhy7wuKCpbLcAp7U/ccetBdiR2IOUPw0mLCoRf6isqI0YAi0x9k5LxaK/tqHT+UMot5
         PR5C80PKovJnJmVwsdbx57Yfr5GAv9KLQoTmMnZvxwYRB2Cerou6DWGf2f+IBROGP+IN
         9H6jP1jvf0bNr+3mWpFGR8DlOiD9H+T8+IKUHH8qucrJHEm3LKm5VjUqxl8okAT07Wjv
         2yAQ==
X-Gm-Message-State: AOJu0YzJRJBJmIqldOjANCnu3B5PbxBe8DFxWrGjKMt3KIviuy5apP7U
	zr2ulNeIoNsNDumKTM8m97iy9tkOX+ZnqY9HYfDt502q0hY6lVFPSHCo8cNCvimpC8dwMLGGg72
	W
X-Google-Smtp-Source: AGHT+IHgbNU4avSF3rqcgOMhZn5wUTsvnRxU6Dq0/GWtQ9aB29Kwq51ChvlXraVwKsdE6/nuhCS0HA==
X-Received: by 2002:a17:906:3096:b0:a44:e5ed:3d5d with SMTP id 22-20020a170906309600b00a44e5ed3d5dmr254448ejv.9.1711130172616;
        Fri, 22 Mar 2024 10:56:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d25-20020a170906371900b00a46bb8a44cdsm54742ejc.198.2024.03.22.10.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 10:56:12 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-anyio: Upgrade 4.2.0 -> 4.3.0
Date: Fri, 22 Mar 2024 19:56:07 +0200
Message-Id: <20240322175608.160631-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 17:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109524

Upgrade to version 4.3.0:

- Added support for the Python 3.12 walk_up keyword argument in
  anyio.Path.relative_to() (PR by Colin Taylor)
- Fixed passing total_tokens to anyio.CapacityLimiter() as a
  keyword argument not working on the trio backend (#515)
- Fixed Process.aclose() not performing the minimum level of
  necessary cleanup when cancelled. Previously:
- Cancellation of Process.aclose() could leak an orphan process
- Cancellation of run_process() could very briefly leak an orphan
  process.
- Cancellation of Process.aclose() or run_process() on Trio could
  leave standard streams unclosed
- Fixed Process.stdin.aclose(), Process.stdout.aclose(), and
  Process.stderr.aclose() not including a checkpoint on asyncio
- Fixed documentation on how to provide your own typed attributes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-anyio_4.2.0.bb => python3-anyio_4.3.0.bb}      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.2.0.bb => python3-anyio_4.3.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.2.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.3.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-anyio_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.3.0.bb
index 0bf907de7..2c7a9f8ca 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e1875bb4b4e2de1669f4bc7869b6d3f54231cdced71605e6e64c9be77e3be50f"
+SRC_URI[sha256sum] = "f75253795a87df48568485fd18cdd2a3fa5c4f7c5be8e5e36637733fce06fed6"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
@@ -20,4 +20,8 @@ DEPENDS += " \
 RDEPENDS:${PN} += "\
     python3-idna \
     python3-sniffio \
+    python3-core \
+    python3-numbers \
+    python3-io \
+    python3-asyncio \
 "
-- 
2.39.2


