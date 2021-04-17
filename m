Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.3509.1618693575733911809
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MD5UUUuc;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id z22so10611088plo.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=C11SFL7wSOU1VCFF+TQ3O+3ksYB9wQrura7JlFCJLjk=;
        b=MD5UUUuc8SyCi8Qe21euL4rLZhRQmCD2wVAgSOvLPrOn03uA7RRmObX8ja2zCp4sL3
         lJFou/JgyJWlFmBC0yQlAYaGYoz3Kbo2Naw3lae7sqxZvazhz8+uiq4I9lvopGCABqVO
         iv3lb4SX4b31AtsJ+qJB3iJ4p264BzbWVXKLKVfgHSagaYtV2/cNXw7QqgxANj+c0tjr
         SjVXjZ64UKVjZB6N+LdqXtrhHwUTKxfEXO7eZ1kPqAfRUk5nj4xQgnbM8HhulAdoQju8
         Ce/KACkfsf1pjuVUqykG5OHvNeX8Xe6zrkM9qPKxAPYFl8gmgorsoWCR1gnvsl6EkZ0S
         Vq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=C11SFL7wSOU1VCFF+TQ3O+3ksYB9wQrura7JlFCJLjk=;
        b=O3TzAPEYKlHSXHsQjphJA0tJuM+WHzUjYIc0qx2y7e4nFQXOejieUW9eI7kMIVSbwq
         pNmXyXNX9GB55VQpy5RDoisYQNNeVZUCb5sw2YkU14i3hPOL1SumIHWHveoTkON+Fb8h
         HbMjcTsW80dX3hd92cJ8Ry/EP89XUJfsk8qEc5WCzG1FGdo6KSdPfweVaHjVV9Wrt/2W
         tkRFp5NHG9JkSU8RT/PkGY8teB1cxqb7jTiZqensTLEqRSlUeEn6QWxj6E6lKimSnj8j
         uo7e9Wbf/pkX1kiSwXQmIzeGx0Apvj9qcXEg3jBDHuzlp6OIimRXsqCzI8Xi4emQEZ2M
         45qQ==
X-Gm-Message-State: AOAM532sbqSuATPpX4QrCrQsje6aqLtaEbemeILZF9HI4/ddjW6Kejxg
	TKNAsthwf4CXgcSaA9bo/JF4YAoD3/YFcQ==
X-Google-Smtp-Source: ABdhPJx/Jmz3oWniXcl6X0aKI9KMvpgiQEFInROw37k2tgYuIzYC4i+CATaKd2ukOER9nKQSycfgJQ==
X-Received: by 2002:a17:902:6b81:b029:ea:dcc5:b841 with SMTP id p1-20020a1709026b81b02900eadcc5b841mr15579781plk.29.1618693575167;
        Sat, 17 Apr 2021 14:06:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:14 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 07/50] python3-grpcio-tools: Upgrade 1.36.1 -> 1.37.0
Date: Sat, 17 Apr 2021 14:05:16 -0700
Message-Id: <90877785777ad4d6b7ae9bc77bd23e32d388148f.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.37.0:

- use boringssl asm optimizations in aarch64 wheel source build.
- Clarify Guarantees about grpc.Future Interface.
- Use crosscompilation to build python armv7 wheels.
- [Aio] Add time_remaining method to ServicerContext.
- Standardize all environment variable boolean configuration in
  python's setup.py.
- Crosscompile python aarch64 wheels with dockcross.
- Fix Signal Safety Issue.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 004644b2da066e234129cc4e1009d7768837e6fa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...n3-grpcio-tools_1.36.1.bb => python3-grpcio-tools_1.37.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.36.1.bb => python3-grpcio-tools_1.37.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.37.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.36.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.37.0.bb
index da571d3a2ba..d1b934bd0a7 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.37.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 
-SRC_URI[sha256sum] = "80ef584f7b917f575e4b8f2ec59cd4a4d98c2046e801a735f3136b05742a36a6"
+SRC_URI[sha256sum] = "3ec510c1b6bfc32effc639acf9a055e72dab7a7b6757bf72f2132790d6a7cf1c"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.17.1

