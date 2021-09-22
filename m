Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.928.1632338560922584671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A7YZ6QZY;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id y8so3576443pfa.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H4VkgQ4gGeEeIstqR8YbTO241CwQt5nJRWKOybDZVxg=;
        b=A7YZ6QZYhlArsOuJUe8XPmxqC4brkATUfFE7eO3x9dwHHjnTxJ2n1MxqrCc67AYYss
         D0UvrV7Ha08KArg9xL10beds08YqTU9lptlhRUnSYQyMArBzdzJb6oD1TwaBJTBM0wPI
         WFPqjeSmnwtKJH3PuO3Fboa01MSewdHVE5MdevY2UA2bIH6s2Rww3AVw9B+upJ+MqVcn
         7wGDM2l2m/t8APDosMkHMWd+ReKIvaR4uxEMX82zolCIfzuMXLt4VJDB+dx3ZAJwGVxA
         Oxq/Zv0XMiFqxd6wvu75W+MAOl/ztUocqLGaeaOGhTeGr4izU3iK6lb8LZ/LvNeKIF6Z
         IO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H4VkgQ4gGeEeIstqR8YbTO241CwQt5nJRWKOybDZVxg=;
        b=ona8mi+yIX4wybg9VKSkX18enUrFCnNXGT0a+Od5EVg7egks1neLeRyx7ztFtspZLD
         vMmnXGGVfQv1SoFHC4+HSj0+BcZisBtVXY2lLATNI5WL65JvYfmKQixjg4ABu40sNnk2
         MCwgV2SO2fUF+U6T6Z66OBnG2NB/HRhuzwisS2I4ywSBHpYsl8OTR8TBtmE90j/KyDgA
         tkOCLquwVyxNBjZ/+MiGtOZBiCqa+l9Hmk20Cyst0Zs3SpsizRntONg4aM/yTIMSQKUu
         WG9OTs6AAqMgfJ3cuKK9tNYf71i1TN0gIo31COaNEmxOOSbGRoKe1P9ApSIbaxFY0dLK
         nPwg==
X-Gm-Message-State: AOAM532Az42GDM3UZAycjiWYQCk7l4aYrO2DKjoGE5/yeVMpFARAHeAi
	S3Om2DM1U/TnUc4Y+m9MJophRvRWJaFY2g==
X-Google-Smtp-Source: ABdhPJxVyKrrONtKEzYym4jOO0pgh0yZ2paj9hFGMjiiHgWwW9RjwQU1tNDCYhhBM9on2VUE16vgWw==
X-Received: by 2002:a62:1a97:0:b0:447:df99:95a7 with SMTP id a145-20020a621a97000000b00447df9995a7mr417136pfa.10.1632338560365;
        Wed, 22 Sep 2021 12:22:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 28/39] python3-pyparted: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:02 -0700
Message-Id: <20210922192213.3062719-28-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
FileNotFoundError: [Errno 2] No such file or directory: 'pkg-config'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
index 765201ca7b..ef04024aaf 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "\
 SRC_URI[md5sum] = "69284f943982f54ded76960c92098a02"
 SRC_URI[sha256sum] = "61cde7b096bccd69ddc75c85b17f8baed45c3687d404706d91403a319453b903"
 
-inherit pypi distutils3
+inherit pkgconfig pypi distutils3
 
 DEPENDS += "parted"
 
-- 
2.33.0

