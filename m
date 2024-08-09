Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E291C52D73
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 08:52:54 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.79760.1723193564749031472
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 01:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=css6/wiW;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a8553db90so229504066b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 01:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723193563; x=1723798363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgfFx1lzCV2+pLGDVxjfVxd3jTri5zTWSLG5xGFyC/M=;
        b=css6/wiWMGzRZX1v2wSqfzKS8QOVPT1abw2F3Fbt3O6GvOqdb4Crc8N5KeXcGF/J13
         Et5/a4uq90qDi0MnK+2sm5Qc6vcqOB4FQOuzWE4jlwHsVqOvGN8my2CjFt5aCUWOw5L/
         LwMFORx6fcoQkuFFFukfGwem7ooFrukVAdJA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193563; x=1723798363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgfFx1lzCV2+pLGDVxjfVxd3jTri5zTWSLG5xGFyC/M=;
        b=Jrvxb/k3knnYIRh6XLE1GaXFvtSW2mqSfDf+kUXV54DeWsQWHgi7qYxhpFYENQw8sZ
         95imrGf59LF6zO+agNTxlAHB8fUzGrLIey9KaSHRcATMlOvfBODKUKu1Fr/cTQQZ+JO6
         e6etq22aBjh3HMYaBx2mvQPNIrb2JMhSKYD2rs7TQFZHNE7q3hCIdhiGN8GqZOdeq1er
         HUxHriTTV46BslNvNMuntWlHx1WyZmxs0be8ha8YXGC0RObC9pqO8ClFYQOu7aMaRBYZ
         VItfhr1UZvCY+2EiyNpknVKXjboHF1EOqv+Xs2i98Vl1aDYRCzNnY74w6CXng/oyY2xC
         Uecg==
X-Gm-Message-State: AOJu0Yx613Ni0Tg/96HsRbHMp4WTb8Ayeav7GF2KXYIa15iqcFnvJbjw
	ar3zxpIDja3mZ9C5Oo7NGXy/Q4JoUyorJeil8UOTAG6RZQ85uYMCVg3ifdSvREhXIrrK+Gvw3QH
	z
X-Google-Smtp-Source: AGHT+IFWrkBn5m4tpOrTQ8Me3UoiFmbyNqG1jaV6K2krA96CejQ32YYOzZnyryFgXhRMsmiBALRFOQ==
X-Received: by 2002:a17:907:f764:b0:a77:c583:4f78 with SMTP id a640c23a62f3a-a80aa5eb15dmr70795066b.39.1723193562827;
        Fri, 09 Aug 2024 01:52:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3c4fsm823286366b.33.2024.08.09.01.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:52:42 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-argcomplete: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 11:52:35 +0300
Message-Id: <20240809085236.1828180-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240809085236.1828180-1-leon.anavi@konsulko.com>
References: <20240809085236.1828180-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111688

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: python3-argcomplete-3.4.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-argcomplete_3.4.0.bb    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
index be3ded82b..90def16a6 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
@@ -7,7 +7,11 @@ SRC_URI[sha256sum] = "c2abcdfe1be8ace47ba777d4fce319eb13bf8ad9dace8d085dcad6eded
 
 PYPI_PACKAGE = "argcomplete"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+    python3-setuptools-scm-native \
+"
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.39.2


