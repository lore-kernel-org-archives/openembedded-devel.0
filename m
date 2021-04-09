Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web09.3541.1617934866859995350
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=giCEeB7M;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id m13so4252935oiw.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=D3YwaxkuJ/DLImu66nI0jeSfawIT4991As7Kk4xDVcY=;
        b=giCEeB7MnMNef6QHdoYUjsTlXt0hq/atVQJGJMQstdf/VsktlGewS9yNwP6m7FsDCz
         0aFGuul58t55UnDHx4S9AMRnTYW2Bx5CwQVHFIeib0VLOpKYFfXq/2HSAhniPypg/BjF
         jgstRz4uCs9MrOOzAsquY1HgLBUV4cqeSv6JZZr1qewMJDrnzKP9HsXEyD/Eq+gtmmD7
         4xDNattpdtQOmjhsTFy5IttsWBwM7Sp3BQK1u9IzmB7UJqo2VsSzKPxQERwxTRM/L5Rr
         b7yMjnhjtVPIZmAWOvZSaOTNHYUudytWGm0T9lGTP4S4o4lm4l+RNLE6z7JhV7a56y5o
         gqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=D3YwaxkuJ/DLImu66nI0jeSfawIT4991As7Kk4xDVcY=;
        b=H6tmkpMd0i1lwgq6Eoiky6+d4f0XUaOlv0cL6CEdnl2eNyq+PXxD77U6lreUuuk4kr
         4lXwwV0I4ZivAWxoT1icFAUjj4J9R1Ni/ocDRk2p654uToPZeEqqsSTXGof9Wms9Ghbn
         zCb49aOpqkAV0HP2hw7CK3aj3cX3BfubKB/tg5NesYNeqHRXDOPMhVDab/DXtyGvAguw
         as+/npmZ6OssPB+go8tufaGCEHRkZSvexEDj6pQGoW0vZy315mK0trGCNueIuq2d+QOx
         KHIRuJyjEF+g2VkfUP930AhebLbocGgleHE3zkvpdrVX6TaKEcGcmjgRQo5nJIdKCSrf
         StEA==
X-Gm-Message-State: AOAM532T/hLd3aYUFY5uWptTSc1BmrWZcjAv2332BRALl+4sUY+pwATc
	26IFrBnVxnqn91rP5VNjUjBMdcbXQwY=
X-Google-Smtp-Source: ABdhPJw9riWwA9MLFB7/1LbocnCjwOzn9LE612bu908li0MRUZ+oJfS/V5g8xiKwMTCqrg4V0O5+pQ==
X-Received: by 2002:a05:6808:57a:: with SMTP id j26mr8542075oig.122.1617934866091;
        Thu, 08 Apr 2021 19:21:06 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:05 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 15/36] python3-bitarray: Upgrade 1.9.0 -> 1.9.1
Date: Thu,  8 Apr 2021 19:20:28 -0700
Message-Id: <753a641609b275b770f483ed99804d91a51f0f6d.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.9.1:

- switch documentation from markdown to reStructuredText
- add tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 79d2873495faaa6406ec9d19e3f715701d2429c9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-bitarray_1.9.0.bb => python3-bitarray_1.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.9.0.bb => python3-bitarray_1.9.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb
index 12ac3d964f4..e6bfb25c492 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "db00073387af7fe30852d96b04742a0cdbc7feaf3158558520ab7898b0435ee2"
+SRC_URI[sha256sum] = "ec99acc1b18f99b7e9d0b77766b99f80b3c42d4e83306334deef9745b41a2079"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

