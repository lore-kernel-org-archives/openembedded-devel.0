Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.2914.1586306535229121455
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 17:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OI9uMjhW;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id k15so1598333pfh.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2020 17:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XvejRdjjywhgYu+QpIDKh+dWQPpkyd2RTzUW1ceBXkc=;
        b=OI9uMjhWgHgweTxGH7A9iJrPgrZAELAYhe8r4K/nLGMKRjk2iQv0y8jbCui7dnPS8A
         I8DoAqoE9lLCqevFkO2jgPcO4qTpP8ZsNNHekASHTvDwgNz/3CIzcxBScEbSdiyTUO9D
         euO8IojM58frMgF7i6LfHFcR9Kmjy+o/4fK9+GPy/DHYa4Qg9D9dTr2fev4SIgT8/YWz
         iaGzd8ka63zgnOMbI8R1+vNvZ6fND6tpJvdei19NaUbFiuaUZ/sa3IOnL0MgIWRNQNV6
         4VJQgAtrO25tK2XsQ5OpfciKy1yUAwsNJvpMARiqXMkKzoiIyGPIwGXXraHkXp4NBkCy
         mfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XvejRdjjywhgYu+QpIDKh+dWQPpkyd2RTzUW1ceBXkc=;
        b=oUwYjEwoebALggbUJo/1x7OqIUlfONpYbxbQVrVvvxihsjQbU9g0moAg6n2F8CctlN
         iPjjESRbHfUagc5h8WIUkRzKZ+EUFPR6VKe+rhVdJhNU7i3ZJiMKLDzu948HMA4uJQBZ
         uZwVWFKqZxMNC9vtie1Q5bz+yXwDHFc/uAbnmu0zXvYemFfC89lQOBJB52aBHGCP8Z5z
         zlRnKIAy+VgjqVip+tIbuRKfvz4UFWIZ5165Zv8DO+y4M2ABftAbt8czRrsQeF413rIF
         Z3ghP954Wiq6ttWC+gz+BsRlDgU8VEAeRi9J+p+y8ikaAUk4AThyUJkmVR6/kG5O8bU4
         fLYA==
X-Gm-Message-State: AGi0PubB48zV/LLETLRWE/0heiZ7wDZXUZ6oxqjtf5vSir1sXxXZkYNo
	a2YOJDzw3+Gg9GJVCETGdmuiwtI6uA4=
X-Google-Smtp-Source: APiQypIF3a88mbrNETyoL6du1U7GLhe92/bTuh4vDgajj6/auyBDi1LlHY/xjGtezYYWi6wNnG9Hmg==
X-Received: by 2002:a63:3e87:: with SMTP id l129mr4467521pga.270.1586306534004;
        Tue, 07 Apr 2020 17:42:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::493b])
        by smtp.gmail.com with ESMTPSA id g25sm7451872pfh.55.2020.04.07.17.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 17:42:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] proj: Update to 7.0.0 release
Date: Tue,  7 Apr 2020 17:42:27 -0700
Message-Id: <20200408004227.1338693-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-navigation/proj/{proj_6.2.0.bb => proj_7.0.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-navigation/proj/{proj_6.2.0.bb => proj_7.0.0.bb} (72%)

diff --git a/meta-oe/recipes-navigation/proj/proj_6.2.0.bb b/meta-oe/recipes-navigation/proj/proj_7.0.0.bb
similarity index 72%
rename from meta-oe/recipes-navigation/proj/proj_6.2.0.bb
rename to meta-oe/recipes-navigation/proj/proj_7.0.0.bb
index fa269d01b3..821bab8501 100644
--- a/meta-oe/recipes-navigation/proj/proj_6.2.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_7.0.0.bb
@@ -6,8 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "5cde556545828beaffbe50b1bb038480"
-SRC_URI[sha256sum] = "b300c0f872f632ad7f8eb60725edbf14f0f8f52db740a3ab23e7b94f1cd22a50"
+SRC_URI[sha256sum] = "ee0e14c1bd2f9429b1a28999240304c0342ed739ebaea3d4ff44c585b1097be8"
 
 DEPENDS = "sqlite3 sqlite3-native"
 
-- 
2.26.0

