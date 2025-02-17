Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C985FC021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 09:22:28 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.47358.1739784140023199978
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 01:22:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YmwwvY+1;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2616870f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739784138; x=1740388938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5Toy/pNNFZmbv/kzVVlvzwvA2HUr93lmrYQFwne1yk=;
        b=YmwwvY+1/raCZL6ielZAXXWg8EErwBVYl1ocF8Bx1ihBOn88QNNUcThFoIlpqonXek
         pgmslXeYGoyl0Uirezfz8Ee2Q9EmbeLereQJUROwGPPUG7mD3QQ9xSan05YGb80ZZ+lS
         qEuaGw6gNstMdJTE4xT/77JcSWnE98kBG9h2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784138; x=1740388938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5Toy/pNNFZmbv/kzVVlvzwvA2HUr93lmrYQFwne1yk=;
        b=GZWncL1DbPt7yQFIFy8F3iPFlpJ0NAR8Wx/h2t/R+9upPjesKSGiul3ozXRPdEo35r
         6LGWkJXrGqIONQLw+sKXL+qzu5+IXc0ysc/rUWwU0awpI8IGcbRO2fwFw+dHIa/8vlZb
         HIXU8OGwznsGLvyJkaoVETl4TgxqA7L+RMvt2I8yCdK4FaoMF0jnZHv+vt0npJ4el8id
         RMsxfRdcciiES6A55tN9MQepKzjjoXlMVaURqrYU0zoZVw3rMM+L25F4RhpDv+xbtVov
         fVpbSWGclFRSeamiZVdBWV7Zk9KxuOcEAJ5E9fxKC6E7XtIWQXnqhs8Z2t+jz3mhjM3a
         Y9Aw==
X-Gm-Message-State: AOJu0YzZoCgUoXk1n60X29y8U/7qeq8/8wkrRchqy4i2biNtd/5j+U8Q
	abouQF9D2aVWSsO5Dvp+bJTvBqQei9lmhM7ZV8Fz0W3Q5MEKSNQnUggfA2hS/CbIll6rHnLTj7a
	U
X-Gm-Gg: ASbGncto+27yWHbeuckS0rxCa1vHkzgyz2qkm/gdrwuQvBSIfGtNKf1xHHLhfUBM+c+
	7uTx3g1CRQZKncKFlbvLEBkYac92mzH4KPqaqAq1L6voNNZnHMUcrEDQaU3UcoXVRDRQl4hNuad
	uXE50OecP2Ej8BGB4zm88YwvDQBrlYEmjI4Rfzg+Bf7JvZrkzD4666ffBliX6EycrHLUHBGHzQB
	6szHlimGg7OSSUhVN2GdSrv4t36YwclEoRZKp69NHwxdtj5Kp1y0/SxZO5wRZI0dR2DTOrrMIKz
	g2VrbO+m3kB1sblCJ4MPwQ/NGyEZJQ==
X-Google-Smtp-Source: AGHT+IE1l1sDLUa9HJ1x1jOTMG6wxfeCl25bjyz+rIDtdudBUWpzcjIiKaH6D5D/zJDewRclmraW9w==
X-Received: by 2002:a05:6000:18a9:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-38f33e87e68mr11007930f8f.0.1739784137942;
        Mon, 17 Feb 2025 01:22:17 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4118sm12022347f8f.18.2025.02.17.01.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:22:17 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-typeguard: Upgrade 4.4.1 -> 4.4.2
Date: Mon, 17 Feb 2025 11:22:12 +0200
Message-Id: <20250217092212.3970278-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217092212.3970278-1-leon.anavi@konsulko.com>
References: <20250217092212.3970278-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 09:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115513

Upgrade to release 4.4.2:

- Fixed TypeCheckError in unpacking assignment involving properties
  of a parameter of the function
- Fixed display of module name for forward references
- Fixed TypeError when using an assignment expression
- Fixed ValueError: no signature found for builtin when checking
  against a protocol and a matching attribute in the subject is a
  built-in function

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-typeguard_4.4.1.bb => python3-typeguard_4.4.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.4.1.bb => python3-typeguard_4.4.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.4.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.4.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.4.2.bb
index 45b32f5120..4d208cb8c5 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "0d22a89d00b453b47c49875f42b6601b961757541a2e1e0ef517b6e24213c21b"
+SRC_URI[sha256sum] = "a6f1065813e32ef365bc3b3f503af8a96f9dd4e0033a02c28c4a4983de8c6c49"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.39.5


