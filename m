Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEF9C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:48:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.87150.1723218530642850631
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GK/CnNBr;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4280bca3960so16473785e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218529; x=1723823329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Eb2xJ+nr/+JYSbJwKthRAwjeUMFMH6EhVEUi/rcEqI=;
        b=GK/CnNBrubYwt4g8IJwORJ1EVxiOTl/s25AE7eDnADiPO5oPT+rqe03nkxJwjfAicw
         hqcXphX0S9pIiVVp78tvP9q/TLsenhg0iJCQ88QpfsGSMgCWUzmldjmPhXThCO8QpW6u
         O69LHr7gSAfLjNFhlQ7htEkmvZsgrh6kR5R8NIywW+bK7ndtImtmLQoDK/jlbF88lUfL
         GrXP5UMs6dISu+T6lK25gcMdpJIBVkdnS74UooyWhEB4Cuac/ozrVVUz5mdfwGkqQSF0
         QhJrlgneN83acyRQgWxKwmR/JVgQc85MbiychfZESZgSfbgx2/q1eizxjogXmJHDgh1B
         5Rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218529; x=1723823329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Eb2xJ+nr/+JYSbJwKthRAwjeUMFMH6EhVEUi/rcEqI=;
        b=BGXNa0OYLMtg1MVnXj6qkuQ3HBBfGog0LtCkyyJ6psNFbSbMhKno9jtZqiEEXL5Nmd
         IXVJ0bMv2oVsUNzsqLVlmkihgTQCEe577aZ4zX94GNhXGmGUvv9vc7qlUFNjN5zB2jJq
         gMMKVgxNTDXlXYG4u+gXT2EtYWRBHq0tDPZgguXro3i8FuDENP6urI5xHYZBdfpmAGVR
         CDBDLcMVPeFt/mPnS58H57FQ3kjAQ6NhLnaJClxB2z6kDavXzjVMux4fFI1O2u/0mI95
         DVH+KhR1l+YO2ILscndhRpqu3BbQY1IhQsguD6RH3e0hngKvK44Y/DU0+SU+tS6Zoi+h
         VgoA==
X-Gm-Message-State: AOJu0Yzhtxr5VrLMpY5rEhiqs8Uox9ptAVrjGUCW8f6Z7zzhqauNzplb
	cJ+CvuwIUrJ9ZEho/OH9LscUaqtBZOmkb/WsFTcYyi03F+vVvcr8kMiuW5An
X-Google-Smtp-Source: AGHT+IEC464iUXmVgour7eJu+aQrOK/jR/wjTn1zdiKlJDkUT03zFY2FOthV0e6ZNYzKxWLVDEVOSA==
X-Received: by 2002:a7b:c051:0:b0:427:d8f2:332 with SMTP id 5b1f17b1804b1-429c3a18107mr15183565e9.7.1723218528517;
        Fri, 09 Aug 2024 08:48:48 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:48:48 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 02/13] python3-argcomplete: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:19 +0300
Message-Id: <20240809154830.14927-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111698

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as argcomplete, it is by default.

Fix:

WARNING: python3-argcomplete-3.4.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-argcomplete_3.4.0.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
index be3ded82b..d350a6342 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SRC_URI[sha256sum] = "c2abcdfe1be8ace47ba777d4fce319eb13bf8ad9dace8d085dcad6eded88057f"
 
-PYPI_PACKAGE = "argcomplete"
+inherit pypi python_setuptools_build_meta
 
-inherit pypi setuptools3
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.25.1


