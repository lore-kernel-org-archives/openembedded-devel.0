Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web08.254.1617899803507090972
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OMCCPbSK;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id m13so2758590oiw.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=TBOFdB/RzQFxVzhfF43tbJlcDdU/yJ+/u4mEEAaWu1s=;
        b=OMCCPbSKnuoiIwhQse7SztzECrnjLzqfagRSw9rQ+2DjdUY6fBTEELC0+VgZuDgar0
         pLoo6xZEofjayWgpjtTmagzFS/eeCyx2aGrDBG5G9n9Kdh4Ig6U4MxyrLrT5Y45WSIft
         wtIdLDD1jU8fS/G3+9sSATYVrL/lhH93tyDR8iCGanOshvrwa70yzZAp7DYhYXjCiZEA
         GE80BsP1dD/Tze89ETDQrEWA6gH68kIJAKTdHXLXDibKQ1fpfBAy+Bsh5zk1fNV4QscQ
         dfHA7vPj6W24RpRYysM0X1aZ5eE1RDa7KDxWOttoL03e4cnaICclwlif8a3ztP8Sc5gB
         VSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=TBOFdB/RzQFxVzhfF43tbJlcDdU/yJ+/u4mEEAaWu1s=;
        b=o5rQ/7mdhQtm0lt/r/xxtzB3/t00Kar0NtAjDTwJolESByEPdb7NI02vicSe0zxlyC
         0HJ2zEVr+LsbBpVECfb/RcMnkvm/vrv3+XgAHn5IQXU5tlTIwMmAROgY7rzW6Qtqxowy
         Bt0gcM5HEOxzR/Sgz/nTeIqUmnrTlwatjlnt5/czH4kFpSURFptZnNv8qhW85s67ozTs
         WKRaywRRPq6QXYQptibgArukdDwPUNhqFf561gH3gNpaidDtPLMGASqG5p/VIFgyGOp0
         TYKWx+ZerAbyGUNiGC2z1b7txCNT8FygXPnwuaq2DeCkrwRvvQ8I464sSiQwEtRzJ5Ls
         8QXQ==
X-Gm-Message-State: AOAM530FhYae4lK6TcvQ7r3iA8O+EyO4HfIksqv7efBVikzSzzArQktK
	fe1SXR1qqTONQRAthcp8mdUVET5DvoY=
X-Google-Smtp-Source: ABdhPJzO3/pmMEKVSbnS9MbWkq7wLvbRxenFMMxiimjFV++VLbKIoJf14tgbJklLauJE/lGWDpSNnw==
X-Received: by 2002:aca:f452:: with SMTP id s79mr6910873oih.126.1617899802752;
        Thu, 08 Apr 2021 09:36:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:42 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 32/64] ostree: upgrade 2020.8 -> 2021.1
Date: Thu,  8 Apr 2021 09:35:39 -0700
Message-Id: <4fd44de9a8d26396ba17780e63a7d09f97d1e69a.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7d2604942cebea24e090f11186d0aa43a61be037)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ostree/{ostree_2020.8.bb => ostree_2021.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2020.8.bb => ostree_2021.1.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.8.bb b/meta-oe/recipes-extended/ostree/ostree_2021.1.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2020.8.bb
rename to meta-oe/recipes-extended/ostree/ostree_2021.1.bb
index 4f0f719fb38..c382ad87f27 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.8.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.1.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree \
     file://run-ptest \
 "
-SRCREV = "3e289b19345e30d2da193cd208e109f7d7aaa2a1"
+SRCREV = "e9e4b9112083228b8c385ad26924b6c4623f4179"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.17.1

