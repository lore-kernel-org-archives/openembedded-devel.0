Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68787C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:49:06 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.87200.1723218545970599085
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBGu4F3d;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428e1915e18so14873095e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218544; x=1723823344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuMhcX0bFWEcasWPWrlgGI7i4NTDxSTUYxcfT6O9rok=;
        b=OBGu4F3dvh5PE8EG3GFVg++zQt6xVrBZxq6Bk7q6cDAqBWfmEKsiO1T4VoVvWFt3ev
         UggHCRXCoGSkZ0KuRAzFBPEMUEtFutX/aLrGDsEye8OeYNeSIPiW6mTVQFs7ZUhF8Tv8
         0PlObLWXwHq4Q+TJvqUWcak72iddKpL/eaSQLk2MEITiLATbyJnrpvY70la8+44bG/OV
         H/1HHRzPmcUMK5GZVkQyRkBuHSPOWqkNdjN/zXL6XfbFSNuEFijiaQX2Cy1/e4OwDXUj
         EuawvbtfKV955dHKSC2cqwX08Ar5/TfLdWPITQ1wrhX5CPWupqtF1qNjGUx8EQGNvYEU
         z0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218544; x=1723823344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuMhcX0bFWEcasWPWrlgGI7i4NTDxSTUYxcfT6O9rok=;
        b=b/rwG/55r/TbfmlRtXMWWEPMv7JQo1HanBoCICRfcrZYlht6HqT397aOnGXSbpCNjS
         zqbjo9SZ8WwBSxZFZKksgJFLSONi0dXu+OXrgXHhK4RDEI81oscHbxcs7hlfw2b3g2/9
         7vkSzw/g5LPJHI+VHTDzvsGZNgLbuqpRD0ksbqNR192y8KUjUyN8HD0z7fHdZ2qslweg
         qzul2VrWKM4PPscobktFG65vlbMg5OGJRks8mdFpsJggJBiv/j22cmw5iFQrFKgzHaXZ
         JjNDSb8DhwMhyHhxshe5gMM5sUi0plAWhmTNsMz/b49DktUsn1aptp+eC3zvkj3QIXf/
         5l2A==
X-Gm-Message-State: AOJu0YzHDdKz4LDiG5l3DEHZ/KCNssnCKLgvdUPldRV6dbB7R+0FW8dO
	1Txd2aUGmGHCFxRqKO0gkCMrosOcZdtdJ7SVEOH05J0WYPaJkQJTghyD5CoN
X-Google-Smtp-Source: AGHT+IGKwAanIjGeLM6kuOOieOFUzBaN3c3pkz5ALHxxVsgMf+U5yFAmIouaR+OF7I9FHOn0CAeimw==
X-Received: by 2002:a05:600c:45d0:b0:426:5dca:50a with SMTP id 5b1f17b1804b1-429c3a2a396mr15086155e9.21.1723218543959;
        Fri, 09 Aug 2024 08:49:03 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:49:03 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 10/13] python3-py-cpuinfo: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:27 +0300
Message-Id: <20240809154830.14927-10-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111706

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-py-cpuinfo-9.0.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
index 857afd1db..20a401131 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2379ecb0d7a8299101b1e4c160cd1f7"
 
 SRC_URI[sha256sum] = "3cdbbf3fac90dc6f118bfd64384f309edeadd902d7c8fb17f02ffa1fc3f49690"
 
-inherit ptest pypi setuptools3
+inherit ptest pypi python_setuptools_build_meta
 
 SRC_URI += "file://run-ptest \
             file://0001-test_cli.py-disable.patch \
-- 
2.25.1


