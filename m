Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B92CC4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:09:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7817.1699355334047465978
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GSE+szFI;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so9414937a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 03:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699355332; x=1699960132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9TqmIzRO2RkSh+cfBfCAP9ptE50sVSPO3N4emjI/dY=;
        b=GSE+szFI5GBEpyXa1SBqY6uP0im1jxel/ui5wFzHzzYEDm7LfPOsFFm2owAw+kM+bh
         jET0uLokxgBwjszh76RhuIJQrZUQRMuufIMlJQzYHWCRW+Uj8BHlJ/Ms5ukEAKG3zLEi
         zv9Aa2Ey1N1jdW+OvEpl4tX5/tb88z+XyjvII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699355332; x=1699960132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9TqmIzRO2RkSh+cfBfCAP9ptE50sVSPO3N4emjI/dY=;
        b=PoRTveETM7FoqlCef6eLXz6SfAjX3R0lmtJgGc3z0egPWW9acNhAj+C3ZgJjB5cFSL
         tNUsaUk73xgNVZaisYuLt5aldpBbpn9LU2Eb9L59Yl2H+Gu4P/uXtEq1AFR9Sj4HYUm6
         cT9R/2BZc8Lk1u31cxbl7Z2OqB7+XqBn8Mu/zqSNXu8CyLirSG/TEk9PG/zTvgfVbdOO
         FXrfY35jkIxy1mCySsObdv55YjKJmmMrCOUk26Ds+0EvlNUzrj7cgQ241+2RwMYAnTiv
         mF+T0/GcP/fInXsJlXWRAppEJ33C2HOsiUeSeSKrNmRQ8FOg57r7DDSNIsvIYz0pdWwC
         00+w==
X-Gm-Message-State: AOJu0Yy7WquQE22Q8djSFL9nhyR+6orjDASMVoPfXwOOH8m529XSuVzo
	7yoX2rqWB2ULjHgiPwCCEd6/nbeFL/6GtREXkhk=
X-Google-Smtp-Source: AGHT+IF1N3OH0bBZaR9F45P2zr+vukIICL0bvjmQ0gy/Vjsj622eAI2pvI+POAXeSYTDpPSdzWbXAQ==
X-Received: by 2002:aa7:d50b:0:b0:53e:7d60:58bb with SMTP id y11-20020aa7d50b000000b0053e7d6058bbmr26421651edq.27.1699355332052;
        Tue, 07 Nov 2023 03:08:52 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 29-20020a508e5d000000b0052ffc2e82f1sm5515763edx.4.2023.11.07.03.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 03:08:51 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-pdm-backend: add recipe
Date: Tue,  7 Nov 2023 13:08:46 +0200
Message-Id: <20231107110848.1610779-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107110848.1610779-1-leon.anavi@konsulko.com>
References: <20231107110848.1610779-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 11:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106447

Add pdm-backend, the build backend used by PDM that supports latest
packaging standards. Version 2.1.7 provides:

- Rename tag-pattern to tag_regex in the docs
- Copytree handle existing dirs
- Normalize the dist info name in the wheel

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pdm-backend_2.1.7.bb             | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pdm-backend_2.1.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.1.7.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.1.7.bb
new file mode 100644
index 000000000..679ecb0d4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.1.7.bb
@@ -0,0 +1,13 @@
+SUMMARY = "The build backend used by PDM that supports latest packaging standards"
+HOMEPAGE = "https://github.com/pdm-project/pdm-backend"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
+
+SRC_URI[sha256sum] = "d3b50ab6374557c1edc348135e0da5decef228ddf8c973a58e40f437cf3595ba"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE= "pdm_backend"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


