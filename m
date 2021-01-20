Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.26550.1611141369570229682
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 03:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J22vxo37;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id l12so17481737wry.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 03:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tvy26TsgtSinaB+amsIvMzAtAzvCGtIx3ne1FaJB7Xw=;
        b=J22vxo37VSNBj/0+0uVmLkjh4ZI6zZcRp0O0BAda2e5z7a4gOUUPG/vQAxR/TB26Lp
         mMm/Koywj+S5+RnpNd83q+7oZv8GD2ziiKVZC8blNdsxBFshqdmhxbNdDNJMNWAlxAKO
         ODY2Ueh2FXtU+PLuMW/3WfiABjkQ8a8gTceaiGJc/Sm/r9vp7lY0B1DffjAMf9e+sMbk
         iFPcJITrMpLWbULOa5UxlvCGDSygQ0bk7J6PQVpQSCObU8yYlH+h+Wqh59TcCUIbFfm9
         8DOOfcvkQeDgiecFxLvsXwS51LBkCu16+LK3UrFWrCN3o+9lFSRs4fBkcq721AHJI18u
         df/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tvy26TsgtSinaB+amsIvMzAtAzvCGtIx3ne1FaJB7Xw=;
        b=ZTToP1YNO5cO8oAWpOzPA1J3KYuxG9RWA7PPaj95WB/hMGPkiT40eWuFTebY6RyOaM
         crwbfZZOItsnHs6mlxCO8XcVGh4AjbQJimHIfHGGYgpxAOr8eZ5LWfcWj2BaTIsOp1NL
         qnfqNeKA7uJRVPV6qtF6/TjdcjTkv4x2xuUjMgXnPItsp4liu7AoPgNWo/+tqvc5XX3J
         Oj3154jO+vFltgteKUaEssgaCZ4cH7pRw/9ykzJiWiAjpGG9aJB2MCNjsPEkC54pRWZP
         NTFSZOLrFJ14yEC2M5V+8n3bfkNxcIg+kEE6MXklEcRLSy85y7e+0r+q+XDckshosZb0
         T2kg==
X-Gm-Message-State: AOAM5336BYf3JZ9sM28ik9LYqfzSm+YwIW/40Eu09tn1Rqkw3cdR0j6r
	7KEU97Nap5xDZ2Jp9S33v7h5DFkxHtF5Cg==
X-Google-Smtp-Source: ABdhPJwUaYHES2qopESf1kRs3E1ewWRULJjaHhrB63wiogfgQeprNb+pte+zOn3YlQHjHaDfphCOcg==
X-Received: by 2002:adf:e704:: with SMTP id c4mr8782203wrm.355.1611141367921;
        Wed, 20 Jan 2021 03:16:07 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id l11sm3486110wrt.23.2021.01.20.03.16.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 03:16:07 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] fsverity: fix MinGW build
Date: Wed, 20 Jan 2021 11:16:00 +0000
Message-Id: <20210120111600.879308-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120111600.879308-1-luca.boccassi@gmail.com>
References: <20210120111600.879308-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Upstream supports building a binary with MinGW but not a shared library,
so remove the configure option for MinGW targets.
---
 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb
index 72b742fec..9b1ba4f2e 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb
@@ -16,7 +16,10 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "openssl"
 
-EXTRA_OEMAKE += "PREFIX=${prefix} USE_SHARED_LIB=1"
+EXTRA_OEMAKE_append = "PREFIX=${prefix} USE_SHARED_LIB=1"
+# We want to statically link the binary to libfsverity on native Windows
+EXTRA_OEMAKE_remove_mingw32_class-nativesdk = "USE_SHARED_LIB=1"
+EXTRA_OEMAKE_remove_mingw32_class-native = "USE_SHARED_LIB=1"
 
 do_install() {
         oe_runmake install DESTDIR=${D}
-- 
2.29.2

