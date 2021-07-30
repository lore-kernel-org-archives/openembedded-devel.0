Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.25294.1627657974364423499
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 08:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SKkZEG3n;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id o5so17425591ejy.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5A8yQfdjKfB25mBIcQnVwVvRYda0kqDJN14N9Hrq5gY=;
        b=SKkZEG3nPUatxMm+DYZd7ZqHVPAmbyUt3t02tmXA3WafQs0CD0aSRAYY+hFewmjYNs
         yWWX8QRnh/Qz6yqFlHShd4KypM23AiQzwJQbpDP72Iuu7/dtIfTXl5VSROFosagVOF/3
         07uoBam32U/yTzdR1EQRYToDSXDkpXYfkDnt9/IjZ1uoCHLxDS8eVPt/jx4cnD5LN16E
         qA0Oq4bIsxkj3yqO3lzVn+49EnJiCciaDQjyEsVw/cxnPSdHtPcxVRgTF9AtzIPVpmeN
         FkctHmsFNdE2NqOpeEbtsHirdbEMYmNA+A8FfyOyILXQVSLSYPJROt4MIaYF+JBKK8SE
         4GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5A8yQfdjKfB25mBIcQnVwVvRYda0kqDJN14N9Hrq5gY=;
        b=PEFSsvy3efnqgnaIJmnycIxroNwzqL3oXVRAxrg7LLTkx+UIwCCTvrWNycvbb3krNl
         TmgeER0/WCrrkzRMCvDv6rAq+/0FdQxPZ81Lil6KO/KEZpONA7P+9zXzz5G3awTR+lKG
         6V2RaKCDjTxjDxjZHyWb0EJqNYtH9Yy/zpw6TbMB7ijyfO5QVT6Y81E8XtXovj8V8Bp/
         24VeV847o6HW23mI2ZqNE/PHV8l9m+X01Znow/r5Y3lWNVk0NnO72DXkDu4kY7fCd5ch
         zpsuXoCfOCnEa1B+H0tFhpV9TbQZejq9XGQxc5E1GuVvwM3JNiESy61XRqmfaqUvt0AJ
         bJJw==
X-Gm-Message-State: AOAM533T6/D2Ia6hu+nLIDAaZiKLRdu03zZ1F9VAPaoE3i4zfra5eFus
	X2umjrafZrdiR2t8eiw9ZKjBskY12haGOQ==
X-Google-Smtp-Source: ABdhPJxsgqdR9SDMGed2nRmzyXFalF03tMqr7eG7XVrq4OZVMcpjCiDejuX8+VXbL2Lrjy5aejfGow==
X-Received: by 2002:a17:906:3707:: with SMTP id d7mr3048040ejc.127.1627657972866;
        Fri, 30 Jul 2021 08:12:52 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u9sm654678eje.31.2021.07.30.08.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:12:52 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/2] packagegroup-meta-oe: manually finish override syntax conversion
Date: Fri, 30 Jul 2021 17:12:49 +0200
Message-Id: <20210730151249.54702-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730151249.54702-1-Martin.Jansa@gmail.com>
References: <20210730151249.54702-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb          | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0f6b94d576..29268bb854 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -206,7 +206,7 @@ RDEPENDS:packagegroup-meta-oe-crypto ="\
     libsodium \
     pkcs11-helper \
 "
-RDEPENDS_packagegroup-meta-oe-crypto_remove_riscv32 = "botan"
+RDEPENDS_packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
 
 RDEPENDS:packagegroup-meta-oe-dbs ="\
     influxdb \
@@ -949,12 +949,12 @@ RDEPENDS:packagegroup-meta-oe-test ="\
     pm-qa \
     testfloat \
 "
-RDEPENDS_packagegroup-meta-oe-test_remove_libc-musl = "pm-qa"
-RDEPENDS_packagegroup-meta-oe-test_remove_arm = "fwts"
-RDEPENDS_packagegroup-meta-oe-test_remove_mipsarch = "fwts"
-RDEPENDS_packagegroup-meta-oe-test_remove_powerpc = "fwts"
-RDEPENDS_packagegroup-meta-oe-test_remove_riscv64 = "fwts"
-RDEPENDS_packagegroup-meta-oe-test_remove_riscv32 = "fwts"
+RDEPENDS_packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
+RDEPENDS_packagegroup-meta-oe-test:remove:arm = "fwts"
+RDEPENDS_packagegroup-meta-oe-test:remove:mipsarch = "fwts"
+RDEPENDS_packagegroup-meta-oe-test:remove:powerpc = "fwts"
+RDEPENDS_packagegroup-meta-oe-test:remove:riscv64 = "fwts"
+RDEPENDS_packagegroup-meta-oe-test:remove:riscv32 = "fwts"
 
 RDEPENDS:packagegroup-meta-oe-ptest-packages = "\
     zeromq-ptest \
-- 
2.30.2

