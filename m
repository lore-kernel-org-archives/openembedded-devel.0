Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.5040.1614439375809737520
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Feb 2021 07:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QOXNliW2;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id s16so6912394plr.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Feb 2021 07:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xuwXUQsnORYHUOyTfpP1Go8Fuhge8kwGQkyxQd7bPVo=;
        b=QOXNliW2Ck3uaCt8tPBT5AiS6847zKw2zUA8uYER5q2edQLnNh+20K29MRpkx0Q7de
         Ydhwo3mBEtZVpbHif0shvoO/rDtUEIQP3Qu8TDNvrLEb62247Gak7PH+qkjQ+HjeWSKO
         HyxlhsC/d/eX8dvAqAsCaq8QKQNz97ERj1VaTp0wrtYYyvi+CGJWkz4l3+Utp6wJqi87
         3BL85vaz7Q4LAe6XeoTGosF9EauifXxordlOuxuxiAbL6vDa+uPGEaXZxFzTlVkORCiq
         4YEhZwZj5DrTcDJ/gcTfbc7nDWTzTvsO8/ImwMEIHmV6ca4j7+rxTBSkFcuiHiUMFy/z
         7McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xuwXUQsnORYHUOyTfpP1Go8Fuhge8kwGQkyxQd7bPVo=;
        b=bgYdUzF4Fv6i1FOKj8FEQ0iy/XDqlMgm0otLubxTrKb0ISZoIo9LvxtskLTPAO+C5e
         TdLy+5XIhXPP+yvAX0+ZdeykD4t14VD4MlYH7eZZ3N93/mtvZ2HeBb+AQWK3VQxIntZq
         gWxOVto+GBh2QoKQtoacbepw07CgrmQDkKsabqcrGGvWUsEvY3cb62MlRXzp6G68siu1
         +B6y2NvrsADBLTq/lN74yjBIG1vwJLTSzdABSXK7pqw4M1HQSwKKcK0kKOfWervA3Lex
         +dOcVX2F5EgT2t2gxaK1vB/noDA+yNmbmI98b67HmpYNLw3Q+ixX3zLIj+3IeDPg8/y4
         4i8g==
X-Gm-Message-State: AOAM532R4LsCu+NF1kjcPRzKSxax9Gi6hDWkUIQGD3myrMb47pHLn64t
	ZJcEjgJMV0KNHtxAIZELd88c9jwhCRzxzQ==
X-Google-Smtp-Source: ABdhPJwPhTAZMMIM3c3oF7vUEmWJRAGAGjb7gWJOll1V2i4Ggh4o1NWCqBLhxP3z3O/QfbZMFY+ywQ==
X-Received: by 2002:a17:90a:c698:: with SMTP id n24mr8383199pjt.81.1614439375008;
        Sat, 27 Feb 2021 07:22:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id u15sm12645393pfm.130.2021.02.27.07.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 07:22:54 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Miartus <adam.miartus@softhows.eu>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] libcereal: pick up additional licenses of cereal components
Date: Sat, 27 Feb 2021 07:22:48 -0800
Message-Id: <20210227152250.157722-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227152250.157722-1-raj.khem@gmail.com>
References: <20210227152250.157722-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Miartus <adam.miartus@softhows.eu>

Signed-off-by: Adam Miartus <adam.miartus@softhows.eu>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
index 7ff5760cbd..2f8978c9d0 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
@@ -3,8 +3,14 @@ HOMEPAGE = "https://uscilab.github.io/cereal/"
 
 SECTION = "libs"
 
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e612690af2f575dfd02e2e91443cea23"
+LICENSE = "BSD-3-Clause & MIT & BSL-1.0"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE;md5=e612690af2f575dfd02e2e91443cea23 \
+    file://include/cereal/external/rapidxml/license.txt;md5=d63ab70ba21ca0544b03284958324301 \
+    file://include/cereal/external/LICENSE;md5=b07578c9df99c0b8b45eb041efd4a645 \
+    file://include/cereal/external/rapidjson/LICENSE;md5=e7abb663111d4ac17cf00323698aff08 \
+    file://include/cereal/external/rapidjson/msinttypes/LICENSE;md5=dffce65b98c773976de2e338bd130f46 \
+"
 
 SRCREV = "64f50dbd5cecdaba785217e2b0aeea3a4f1cdfab"
 SRC_URI = "git://github.com/USCiLab/cereal.git"
-- 
2.30.1

