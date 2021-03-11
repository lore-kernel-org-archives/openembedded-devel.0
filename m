Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.480.1615503584759087824
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 14:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q60VTByC;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id p21so14615978pgl.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 14:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g7SVw65gp/vmdax0dEw16E1vWHXusut4nd2LexB9dsc=;
        b=q60VTByC4Lktt0gOpr0QgadMFzaq+QWNFyD9YukGRB4RF96wqk13RgAYWUCiIilNJI
         Z+ixQlf843VUTL1Zv3zRf1HeuHZFB3FKGuFSpqDk5dQ3ux/oZrjZ1yYlbYrBikTJPThW
         lXPzGzkBZ7/ZdtTfo/NXjZqiws1ZC2zFzD6MEUmD4L9iIzs5OCY7WiIC6qGA3ZrSho63
         C53ksqsH0wvPo0L98rnJ10cn+rC5koeL784xY8tHGj/67ajEDnGNJ2OZ83phjQ4kVQTj
         3R1Ox2/hjxizEwPLP+z2zeWPdIr7kUadeX3s2c7WEH2uyCNssMGu6KfH954HBLIhlYb7
         fPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g7SVw65gp/vmdax0dEw16E1vWHXusut4nd2LexB9dsc=;
        b=MffzhBl5TYupeTfma88G+nOwlhDxrf4cOZ8tGVkuVh1DVHOZk8xKMKntuwAYBBEQHG
         1tn5+Dz7nA8zwRkUynniseT0BSXw+OG4YsEFBqGyygvTt45fu5Yg4PH/ZF5l0p8CKZMS
         Bh59xKuW5TjjeCY6GYfS0no5UFb3k4iB+J2bT8aF+v/ekZLkybhbxUk6h2Mckst5zYMS
         u6gLBI7NbaCYFSVyky8ymGSsZwmUaMxlNATg6avXWTOAhv5Dea9pTmPL9cHMLpnqyejV
         +yv09zzKQ8AxpNO0qPDGpo5tLPOwspG9cEhJ6/Uy8RbG9pFMpOx+VKk0FjWLcWFuqVa4
         r34A==
X-Gm-Message-State: AOAM533GWj4qaeqSdZLe7i0ghQQPj8w2LxRPdxVS0wGnSuqqJcW7tXG6
	LXzbGCM2BXe78fOagX+3Hw0iKGJt2mqwGg==
X-Google-Smtp-Source: ABdhPJx6rXN+CU2wEB7SK06pOOPC7lfTOsQapX+Sknyux3plD7Nna5qGN6WlFT1hM6VB5TTNh3mzAw==
X-Received: by 2002:aa7:942d:0:b029:1f2:cbc6:8491 with SMTP id y13-20020aa7942d0000b02901f2cbc68491mr9656029pfo.53.1615503583891;
        Thu, 11 Mar 2021 14:59:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id d11sm3516396pfd.43.2021.03.11.14.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 14:59:43 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Matteo Croce <mcroce@microsoft.com>
Subject: [meta-oe][PATCH] libbpf: Depend on virtual/kernel:do_shared_workdir
Date: Thu, 11 Mar 2021 14:59:41 -0800
Message-Id: <20210311225941.2419765-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

its checking for .config values which means we need to stage kernel
sources before executing do_compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Matteo Croce <mcroce@microsoft.com>
---
 meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb b/meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb
index 8b548d0b58..57e8376b5e 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LPGL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
+do_compile[depends] += "virtual/kernel:do_shared_workdir"
+
 SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https"
 SRCREV = "051a4009f94d5633a8f734ca4235f0a78ee90469"
 
-- 
2.30.2

