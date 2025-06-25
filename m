Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F38BC7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 14:12:50 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.16305.1750860762234627450
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 07:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=P11GhWUy;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ade58ef47c0so202670266b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750860760; x=1751465560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3wjaaSQj3GEjNp9CPE/0dPPAgIF1MtGntgrDoyXty4=;
        b=P11GhWUyS5x8+pPbOWs3NatqU92Pafh9MEqxfJTiUJW2oWNbgYXwK9REQ/C5SZrjX8
         Y08BAlrlOwTQrHVJQFr51GPZ7GDSgcljsMCihlGiSbJZt1ZL7wz8710FCb4IBKehjGOi
         aaC0TdkL1WKWXPDHpx3tDjy5g1oVgQ5rPCv5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860760; x=1751465560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3wjaaSQj3GEjNp9CPE/0dPPAgIF1MtGntgrDoyXty4=;
        b=uA7zvLzwsGdeiLsn8KZYFophEzE+BnTx/2hFrVrhgjF31Qb2xc5BgqM6K5VOPnOD65
         uFECBa44eD6Db+FwBG07PNFgCvpTjn/8DMDQ7S6kmKp41qhQUV1dVz34rIlX7w7N18fu
         DgzIhpxJFqjZi8qy0dbcr2OpZg6dNVmUD8QO/nXy8gjfnxauLOFcobSRpJkgPF93cxR3
         AIKoLE7va0A+yWNbaiwD/MZTcAhvoL04zQDdI1CcSRrB5Xu4L5p6Cg8kuNi4kpw3Ma3T
         4+MrPWUbEBrimuuG1etTjnFAwGRpW/nW89K+Ixs6q5Cj+XOe2Eba2K1yqMDpFx49qWa9
         kEhw==
X-Gm-Message-State: AOJu0YygoB5QPwBZXlzHBoDLET7zkr9e+l6yiCdGeOTrAV85a4l8+A5x
	OFFoD5H4i9lh+nqH88+hEKjeKsydcJqmlwOVU35BuvkiWIAGTZ/kFEpkjraoYShrvlq68F7vKT2
	J27oD
X-Gm-Gg: ASbGnctpadq37UJFjtMlVTgGpOWZpjskYDGXvbGjCL/cpmjXbuTwW5sUlKnf3IhafiB
	V4MnG2CkvxRZqLMh3aW+5tLFk+Zoa4qf5eXJV+D2K0q3l+8zyiL5gfr3GLYABd9HZt/7IeCJG0Y
	zXYlfjVb39t1pPyhZwzAJFBrywryrt5EMzW9K4MwTO1oRNj1HPFhnRBL09kgTtZMfCeSquiGjPT
	PMzbfvFzvEGe5kWxKhd/GhefHz1PZS5IAZJT3NgqQMdZawxtCR5mh5j8iQVQlO+qkFtJYvJycSH
	Ski+aJLQ0fE2SqRotqmKSzDyed9bjqAm3TaRaO/UGqlxTfHLCaL9D2dPPQIjW05dhFbPHc1wteu
	8
X-Google-Smtp-Source: AGHT+IHzYgOaoAkm2Mpqd+naPDqjkDolFatAUUpGAKWwb6lshyAK4BRiKIk1richInAkVSKj+IHyFg==
X-Received: by 2002:a17:907:6d02:b0:ade:44da:d2cf with SMTP id a640c23a62f3a-ae0c07dfc24mr321979666b.18.1750860759991;
        Wed, 25 Jun 2025 07:12:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6e41sm1046181166b.121.2025.06.25.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:12:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-elementpath: Upgrade 5.0.1 -> 5.0.2
Date: Wed, 25 Jun 2025 17:12:35 +0300
Message-Id: <20250625141236.3027897-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 14:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118108

Upgrade to release 5.0.2:

- Fix for XPath 2.0 fn:node-name
- Workaround for processing arguments with multiple occurrences for
  external functions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-elementpath_5.0.1.bb => python3-elementpath_5.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.0.1.bb => python3-elementpath_5.0.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.0.1.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.0.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.0.2.bb
index 71ccec5719..f766ed002b 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "d3e4807b7e38e190e382eefef93f35ce6f71adf63b33e3f01d0e11f22e5d5cc7"
+SRC_URI[sha256sum] = "26224a33ad9edc82bfa5b26a767a640c8407fbbf9e019b1c369f718dd21823fb"
 
 PYPI_PACKAGE = "elementpath"
 
-- 
2.39.5


