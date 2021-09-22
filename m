Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.948.1632338542202819489
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dbs9OLib;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id l6so2425341plh.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ITKkze9nHA0xwAVIZ033McNi0HJeUg9ZniApYov8IlM=;
        b=Dbs9OLibm5EjqJks7P3RGcJ5cL/k1XXi0b9THsBalPeOCzBKZNr1WMeP7rG+/U4weL
         VypqzbRW/fik3Yn9RPxJc7hucE6yB/lAm6IJkXJ2vfezD8izxfRZtccFqsMHu32C7pJf
         qu88n4uOFD4W+a9RPU1jzETsj9KpfSe9rXCurRDt8tz4MCzW1C8oFeL2edJIUhSIPS3m
         QqwoYmitrsyIk3qkkofw9m2bZTFcieRQxZdUt+oey1aNZl4+jwy4ylp827iNHsw3ih3l
         OjhrtPppYvXNLjW/vMdPWuIkKkVUIQl197fNzRg0bSTegwtYU0gc0U8ZnvPwxC2E7zPW
         1FHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ITKkze9nHA0xwAVIZ033McNi0HJeUg9ZniApYov8IlM=;
        b=7ZfJQxXlgMwwkl1GA1iXrl5XY4Q5kxrmWEWBh5tlg9JB4zbgN4CF2MhtNMlxG2LeXG
         MKn439kCNrv07qmlxN+zMpA3bfYRw77dI746LyGgpAhPvX9NtM2aTSx/sMBNai3myi59
         bDu3sYqnsCvvhW1E1gcAzE3U7I8QhGqVZcziKNrXkAQBG83Ad1aSTcEpSvsVFcvsyib0
         6oyaK42MO8nhDjB9L0jDQDx+1XI3faakGwmj4DmGEvhp0yM9ua36z5DZxQIRaPtiOCJC
         MjDBLlMsg9c6yWPb/w/3FbLmDbpPRxY+crsgbDtH/Yrz6mfbxW2gQ6D75c4p7tpjS/o8
         ACqw==
X-Gm-Message-State: AOAM533V87Z0E5AkYiJ9rpal3+nsIIslHbTEYE/CKDid1U7+kZBr+nRJ
	DfIdq9MPRKKbVsP0u0LBN+tMc+CwLsykfA==
X-Google-Smtp-Source: ABdhPJyJtqklU1lAOSZd7WWNK+F2Dg+6K2ntfoLRNSE9oY++pVzGrxbjNL4xFVGBA3mGlLBbKOa7FQ==
X-Received: by 2002:a17:90a:708c:: with SMTP id g12mr13198969pjk.13.1632338541520;
        Wed, 22 Sep 2021 12:22:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 07/39] kronosnet: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:41 -0700
Message-Id: <20210922192213.3062719-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
configure.ac:32: error: possibly undefined macro: AC_MSG_ERROR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb
index edbca246de..b19482c79a 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1"
 
 UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
 
-inherit autotools
+inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
 
-- 
2.33.0

