Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.3519.1618693594804089969
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oFem97KL;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id y1so84503plg.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fcc9cQMkCRCDG80u9pSjfNyIpuksfRLlH+bwGkqToLA=;
        b=oFem97KL8nKQpttd4V7snIR89SLoGCYOF+2fHMtTKYjZKCuCcIF+NJpGDeEsMDJkrj
         Ya0mX0G0Y1XXp30dimZAvCPelacctCofUtJmegz4vTXgyVLAOvQ14IA9eSBmX/QccF+I
         9fMpA8EuJibZJPlXNXDbnOgsQG+jQDJlwqiLT6ZPFwLwdPfqtiJe4utzSaNf4B6wjSPK
         0lKkP5eANgqPNC1wg7kM7xgNdkyzzqiwVZvkuMffj5A3EUvBeekCu6oUvgzg6/DF2WH8
         zUmzy80r5NP4XleNEsw0NNbTMBphNGcmFPOVNC05xhM/eZe9O1INB9yIoSLcqT26j6Yr
         TJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fcc9cQMkCRCDG80u9pSjfNyIpuksfRLlH+bwGkqToLA=;
        b=o1hgCvm/BM+cItxCmEFMYGx4Faqta6HSxSh7kKxiDR+GLsNrrGMec/F/4ZhO0cGcpW
         oBdIenKBvjroWVDHQNp5oRGi0S+ICkCUx/dkBD/wUlTqJhAs9OVXvmsOqJiL/ArpkpQJ
         rU1MAlPkDK31NFs54GaiP+r4RDfo2fhUrXVbAiYvQcCJjUpxKZY++GCNYKs/RqzlxqD2
         A4uM7+C1vAr4ytBPQ7DqCvEmiOshDtMrAQBklfwoSZfHfu9pS32gHaK8EQQ+CXB35GB2
         VS0x5mZWpPecIeSJnF0PevxWMdV3l+jrQGJFE55WyGr5a1tLrURr+HpfOBq+mCr7EsNJ
         t1xg==
X-Gm-Message-State: AOAM533apvBPFk66ziRUAATzLW2qdi+y9KQLJ+HYVqkAOHgugxe7X9Lr
	HCOpGcANGLW8YiKSsqtxdagPFef8nb3Kuw==
X-Google-Smtp-Source: ABdhPJynWcC9gmoDqD2DaCzSM2tHKTohyynM7hosksc6XnFS8CRhyJFc49eHz764J3JkG8W2cV1YpA==
X-Received: by 2002:a17:90a:eb04:: with SMTP id j4mr16351075pjz.156.1618693594314;
        Sat, 17 Apr 2021 14:06:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 34/50] python3-google-api-python-client: Upgrade 2.1.0 -> 2.2.0
Date: Sat, 17 Apr 2021 14:05:43 -0700
Message-Id: <9320bdf0951d4288788b5c2cc5b84e87badda8ce.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2.2.0:

- Adds support for errors.py to also use 'errors' for error_details

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 88892586c99eb0fe4d823240c3285c8af50a8e0f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...lient_2.1.0.bb => python3-google-api-python-client_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.1.0.bb => python3-google-api-python-client_2.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.2.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.2.0.bb
index 11b94b3fcda..da7cae6c3de 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.2.0.bb
@@ -4,6 +4,6 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[sha256sum] = "f9ac377efe69571aea1acc9e15760d4204aca23c4464eb63f963ae4defc95d97"
+SRC_URI[sha256sum] = "29447c8e95c23ae76fcf9817432f5ed015495513abeac564905640a0ef7d1898"
 
 inherit pypi setuptools3
-- 
2.17.1

