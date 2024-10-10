Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2CBCF07D1
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:48:38 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.38928.1728550113786638473
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nnFe8TJW;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a994c322aefso326375866b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728550112; x=1729154912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4AHYPZghYqKWZ225VEmcREXeqte/YWdlFWKyb+Ukbg=;
        b=nnFe8TJWAKZys2nMkquzhciRm06O/UpW5QxTtVlS/7ULDFVSf1uxRmHOpVaS1/RO17
         ujgyTixnAtWiEZ8ZAYO+E0NAyRTi4Bpoq9a4uFSrGKb3ferzEuSitAB9GNGgbOwa4JBJ
         Q1juNEXEHpe1h5nbANKELyphFiC37XKLWxlgahU+IqSw6YC18CaQpq6qxRzWs8UKNrxf
         YVbqWZItySIO+Omhqnx1LRsdGKZUa5myE3LcyUsQon11kT4fiWbcWrz9ngrpk2gx8siY
         ih9mfTyhqYdHIa98pzaMaDSX4k2ERxZJazW66UsSfXnkq/5XRd2thuo/2P6S1G2d055d
         mhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550112; x=1729154912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4AHYPZghYqKWZ225VEmcREXeqte/YWdlFWKyb+Ukbg=;
        b=iV8ElfNtRy8wBVTtjgzF2mUmrWnA9wi+haCUyICMv7/j3jcbxzppik78YBthOl+lHH
         i7SXQv68msZPjAk3htXTRWnwLK/jqVO9LnPsLwuFhZdxiAK3fUFnpn0gO+Ka1qaie/Ui
         D/eHrTakNRH3Egl8tHk0//dM/rzjvwfyLRaMWj8dWZUD7a1CvKj18dTplgecm+ATg6Aa
         032Ny+yzZ8Ab5QGNbbz1+pDsaXR9ZHHauC1j2amEQvRMhBMSH5ui3LqlxIJIvulf7t1y
         oxZ+n593T4LVNM/yDn1di4DlW0mQp1fdParyhLg4v8PRHqFv6xfz6Euakcsu0rcdVC8y
         BMvA==
X-Gm-Message-State: AOJu0Yy7zAwdd5hQFzefl++CZBF2Xp/6zvbnfev4EiMO51+fJ/4/Z86a
	QVkUot/aR7hSLBYxSp52xSQjLGb/AtYuC9E37rLVJJ/tiUw0iOTDqWbVY1UR
X-Google-Smtp-Source: AGHT+IFNpmyv9EiUw/CCEMw2kYydTr8PQPGUfwQeHxg5SrXIp2ntn741Q16NPgSFbwT7xPaj/L/BNA==
X-Received: by 2002:a17:907:3fa9:b0:a99:5afa:cc62 with SMTP id a640c23a62f3a-a99a110958cmr229927266b.19.1728550111515;
        Thu, 10 Oct 2024 01:48:31 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c0238sm56844466b.115.2024.10.10.01.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:48:30 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2 3/6] python3-inflate64: switch to PEP-517 build backend
Date: Thu, 10 Oct 2024 11:48:13 +0300
Message-Id: <20241010084816.40869-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010084816.40869-1-alperyasinak1@gmail.com>
References: <20241010084816.40869-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112769

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as inflate64, it is by default.

- Added missing dependency python3-setuptools-scm-native.

Fix:

 WARNING: python3-inflate64-1.0.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-inflate64_1.0.0.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
index 9fbd5157a..7804152d9 100644
--- a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
@@ -4,12 +4,12 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-inherit setuptools3 pypi
+inherit python_setuptools_build_meta pypi
 
 SRC_URI += "file://0001-Do-not-override-const-qualifier.patch"
 SRC_URI[sha256sum] = "3278827b803cf006a1df251f3e13374c7d26db779e5a33329cc11789b804bc2d"
 
-PYPI_PACKAGE = "inflate64"
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.25.1


