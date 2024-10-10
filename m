Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255ADCF07CC
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:48:48 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.38931.1728550117823415413
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mbLWAHzr;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a995f56ea2dso108329766b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728550116; x=1729154916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGwtGFSzb2rkK5x/T3tzZHED+E8Nfc7hzbIfWpHk0v0=;
        b=mbLWAHzr130hzdPldMD7bvrgqHQ+NTnjcvtTyizxKDgBaH9dn+VGr983sIr6S79bKk
         oUaXCIM0LQODyNhem+gTOQA1hqCLtMMC90ytJRIn4wHSfYwGe4vG4KfbkB+1iVDMvPch
         XwDPx+NZp9D6T+vbqK0MeS7ivmEgIay9h1HVV1YU+E5W5sFB+nDp01bGTOFlLvqD5Ulu
         z8CGD4igHDLcN1HoDydFl+7ulwiVQsD1hZGwFxbzmKgOvWG7ygRYD36lD//UF4GVmCe2
         5qYFDZGXAk7HMRl1uNld2DunBqywf51e90S84RDJm9Yv5mKoXtfvWLprdzi0bYL3FQ7W
         T5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550116; x=1729154916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGwtGFSzb2rkK5x/T3tzZHED+E8Nfc7hzbIfWpHk0v0=;
        b=WmEpOKl3Wa7SmXSpgdJEgTYVp0jztOavJ9KZ/3hTh+qu4TuXXRZVGte3NLef6EsoJE
         fs3jiDzf9Ap3ilFzBiNuJ1d9PKqxvf/djA/DOmCUOKTS6CxVirHHz66zmnlYUVL9GpXW
         Z8m8vk5cB3DMgGHzf2y7/BmD64sjK+qR8VNnUjRaf9puXO0zzdhZ399SNKf+t1fNraZh
         hgJV24zRbTm+5anMIQugvcF/319eaN2CZi/qfplSCJ7PT3R+DwesUF8kmECFYa8pvq4q
         z5eNPA7r++Cwy6CTx2ukNCgcGCHg6DjcfS2AtrXPVpoWQURcvWews8kWt7zpGwEadGJ9
         Q2YA==
X-Gm-Message-State: AOJu0YyNNyitCiQqK/MRO+7QJabwVhPjGt5XXKtYirZ9Xuwni1SoCgh8
	f1OzK1Ame8CtU6e8Z1s7jImQBCyBHBPrm/kGNzpZauWeg3kmLuTOtI9QGGTt
X-Google-Smtp-Source: AGHT+IH6fBPTvNwQgfrMCDC6wfwdRkvgmvijXFUJ0SLjktIyAkpTEicME/KBLzG8Qg6h+Yww0Uzs/A==
X-Received: by 2002:a17:906:c110:b0:a87:31c:c6c4 with SMTP id a640c23a62f3a-a998d19ea24mr488482266b.24.1728550115769;
        Thu, 10 Oct 2024 01:48:35 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c0238sm56844466b.115.2024.10.10.01.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:48:35 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2 6/6] python3-reedsolo: switch to PEP-517 build backend
Date: Thu, 10 Oct 2024 11:48:16 +0300
Message-Id: <20241010084816.40869-6-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010084816.40869-1-alperyasinak1@gmail.com>
References: <20241010084816.40869-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112772

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-reedsolo-2.1.0b1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python3-reedsolo/python3-reedsolo_2.1.0b1.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
index bd2b59d36..6884e908a 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
 SRC_URI[sha256sum] = "e11528d63e75461d45b86c23f9db8260303d6ab6cae075fa9eddb44527ad8ece"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-cython-native"
 RDEPENDS:${PN} += "python3-core"
-- 
2.25.1


