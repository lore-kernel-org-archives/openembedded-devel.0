Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB94C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.88124.1723221136285371788
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAsXAd0+;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-368380828d6so1224609f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221134; x=1723825934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MEIHuwrlhp0H1+fs43QAlBJUczbIUi5oulKGRg7ZJc=;
        b=hAsXAd0+sjv6Zqq6Sl5clllbpAthxHcJbvDu7TnClA5OTPb5Nc4eLbDvEae6Uc9NHq
         OxxeyslwGCpYPRrZx2Q7+6lWED02CuIAkdxMZ6/xZjunBqgAcaQfWDUIUpwfeRjXt/MS
         gTqBcUbUC7kqhtTrqLL48N4lxPowJXwb9tW7xetwnse0/cDFwKmQXmxeotXAbGhw0+JF
         N5gYtZmvfBZym2Wzv2uLeRtQyQEsOKrkPhAKFr/65ezFV8H7xTiw+4G00+Z5UDwcYvwQ
         yakREq+4X41Ku3Dpg97+pEv41SfFWZYsJ8Ko5sOogMZEfpGRpX3/jNOLEvO8lWUb2soc
         JIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221134; x=1723825934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MEIHuwrlhp0H1+fs43QAlBJUczbIUi5oulKGRg7ZJc=;
        b=klfEXW5c/Gi5sNWOftJiIOsVDto4C0xwWj8r0apSy0L2XOvLVpn9oRBnvIrpsx2TXK
         x2wt32vw3JV42KDMHeOfEu+pQiv2VLGASshYhkWA00cIlzlEj00b8/6glalDtWBe9rBz
         YJ1fl0bwreAgytCaL0zNZ+ZmugDSgxiDs6aaibt0FHdcGHqr195xrNsh72j9PJCvcDVg
         wQlsn2uGTxKgRWsT8sPW6DwXk4ApU3OoCx0FRybiNqe//OxiMNNROqBFr/eNL/zrV3Qz
         LQeYpwKEA+LaOQFQUKhZXEZ1P9iNZDEwHNMEwp+6fjgocrBL7zsP+k8R9hQx72UjrXUH
         7HIg==
X-Gm-Message-State: AOJu0YzVvSDZ/62oeXc/lAeIjB5MUyAZhkH4sBIO2MbcJiqHK7GB1WNU
	bfPpaFwDDJKh5yOM8ia0v7EyX9kpqacrp6si/Dr6ZcBMZJEM1wm3QIAzhOVN
X-Google-Smtp-Source: AGHT+IHVg7l7JoeoBPWOQVKjOS2ICoArNWWf1LmGJnFuEqMCKnYpKGVWUOIm23hWFHjANFHnoJkxww==
X-Received: by 2002:a5d:6b8b:0:b0:367:96a0:c4b7 with SMTP id ffacd0b85a97d-36d60b15b7cmr1380980f8f.62.1723221134059;
        Fri, 09 Aug 2024 09:32:14 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:13 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 02/12] python3-parse-type: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:30:51 +0300
Message-Id: <20240809163101.8416-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111713

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-parse-type-0.6.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
index a7d8cd86c..7e7ff8926 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2e469278ace89c246d52505acc39c3da"
 SRC_URI[sha256sum] = "79b1f2497060d0928bc46016793f1fca1057c4aacdf15ef876aa48d75a73a355"
 
 PYPI_PACKAGE = "parse_type"
-inherit pypi ptest setuptools3
+inherit pypi ptest python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-parse"
 
-- 
2.25.1


