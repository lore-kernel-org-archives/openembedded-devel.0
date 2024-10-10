Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE99CF07CC
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:48:38 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.38826.1728550112562944446
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NyTeyeSz;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a83562f9be9so81304166b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728550110; x=1729154910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHW12/DMicKcWzVEWh18XuZ3hiEM3Go+qVLdAEeTBiU=;
        b=NyTeyeSzt5dwzEIS/NbUVP2E/2n9IA/ZLYQJNnuoLQB8hTAx6IcVMTflOUgy7OoGWH
         0qYjMSigvH//f1nz+okaVpare9OjlpaL414DjMB9sBiCcOzYU/vt8yJ9JpSYzHgUAj95
         A0pKW3OdQvhqLCWowXgtOIOPLGCHLvEVu6GvXFLyNX3nMWDpnlM8a+5Qysb3d5n/ZUCd
         32LeL/e7ETDVGN0aUFi76989YeTW9utK6/pwD0Nafrk4gpGwb3tjHdInJXVTPRXxkeae
         0yvEPDJLSHbPjuXUEKXGL72fFeklvnV8rGuLqezdeWdpRR+wGVVCO49YrIj+lB/R7iuP
         Qbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550110; x=1729154910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHW12/DMicKcWzVEWh18XuZ3hiEM3Go+qVLdAEeTBiU=;
        b=k0RjXXE+21NUJeQvFa4pVX+i2ZSg20CQsBcwLiiDDRL7i5x6rzi+wwEWzovkw+gl49
         wVBbefQrgM6ksW2wK4aTl+9tigLwaF7v2IkTX1OzLY7/sYf5V10IsQMKba7+NjNal/Qx
         zlMV8kIwWi0SEO3TWEWHSORNtJCRYXxf82+pAf5YFHSSBxDjWOePYKIGo9a500299FGU
         FaEPZTFArDKdHZuzrbAq8I0RQQDur6AxqgmCwVSHneSY6gSl81yylpy2lLhVNEhZp0r9
         Rif+kCnEnWZsU+2Es6Hz7tCEybElYdI9Fyj0Bqkf2Se9P4AvqHxS+5igeJpOuUjYPitp
         Q5uQ==
X-Gm-Message-State: AOJu0Yx/ANlmyFMbHsNq/J1XUHbT+fPau5uURAc+4hcEw3lWgcSMYbPT
	23ksAVxuXPHR/wMa3IGcaa8uDH0qmpfS/d30X4EcpsSLcBDKJUCTJU4ItAN5
X-Google-Smtp-Source: AGHT+IH5jlynmZl4mY/qNvAcHQdOSzZkKofs9Z8TuJfKnM0GFYeS3zkby/whLEhhKjI5MZ5bwMvkfg==
X-Received: by 2002:a17:907:d845:b0:a99:8b87:bbc5 with SMTP id a640c23a62f3a-a998d258143mr462265766b.39.1728550109564;
        Thu, 10 Oct 2024 01:48:29 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c0238sm56844466b.115.2024.10.10.01.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:48:28 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2 2/6] python3-alembic: switch to PEP-517 build backend
Date: Thu, 10 Oct 2024 11:48:12 +0300
Message-Id: <20241010084816.40869-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010084816.40869-1-alperyasinak1@gmail.com>
References: <20241010084816.40869-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112768

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.
- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as alembic, it is by default.

WARNING: python3-alembic-1.13.3-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
index 0e6dc6265..f046c3ebc 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
@@ -2,12 +2,10 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00f8f5c8aab58c3e1cd61525a6675174"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "203503117415561e203aa14541740643a611f641517f0209fcae63e9fa09f1a2"
 
-PYPI_PACKAGE = "alembic"
-
 RDEPENDS:${PN} += "\
     python3-dateutil \
     python3-editor \
-- 
2.25.1


