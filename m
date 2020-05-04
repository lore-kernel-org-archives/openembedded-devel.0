Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.288.1588631081303200246
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 15:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=USgCTq18;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: bartlomiej.burdukiewicz@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id u4so934450lfm.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2020 15:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Z6ojcPSRML05HUYRTU8Jz6WQaD30+7s0trtMomSHYY=;
        b=USgCTq1882jNeCfhBXYYYoHITdQz+UtsnpAx47Yt3Q6t5czmO4pEH3hcu7gogBTeXv
         LFveUTcnDm7t2AKKuigf034fvh+tMoWGJvpaCYpKjrc8wGefM1GV3UtnIYQ+wBX+x+hU
         EvC2BKX9PhwkoKccktIc2ucr86As3iG82MG5u+uz1dF6aceJbk2UpEhBNl3ucSWe6QFp
         /UEg5qWvMysnCri+jTOwfkFSLDiGBYqASzAW4KIbhracllqB/INILS3e59iS1LL2XjgE
         J39RabS4hJYZB7K5tkJgRaS2Jdu4iDOkJ9sREFjsA0jwB8+/k7SiC9HpH8PH1OPrkCM6
         v2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Z6ojcPSRML05HUYRTU8Jz6WQaD30+7s0trtMomSHYY=;
        b=WmzdGRKjjjk2If+UW0kDozRTT0JBpabOYfbjGN3QWXUodHTIunQvC+2E7cuGafHjNg
         84cWbxL+luRhIkVsfNPs2UBxBJTqPpXrnI3Eoc2GksxuHvnhj8jbWzvL6s+vIWWGP38K
         jdAJIhJeHPHvLfre38hAPMVyAWntbT2qOg/bWorjGvudTDrQIxNZ3me1G9DUUlU4zqD3
         hF1U8KH/yPGH1IUi9Ud74crcyPduV/7rVgKVHd74Kav69gMz43KrBFP7/iVzbCZXaBZ6
         vj2ZTkv3OU9gmph6LWzb7U/NQMEUkbQvSIRByZHW/NnIqzwaOlz3Aj3+1frOXvt1Wnkg
         1+ew==
X-Gm-Message-State: AGi0PuYYju92+nMHoXpAUhTe+8PI2vNMKEdhrZLDhr+yiwhSXSgY9HAd
	pm7vQxwCjIV1Kh9WVLIZK07i9j340ns=
X-Google-Smtp-Source: APiQypK2Q8wzgdUudS9n2VGKaPYt+MfjPAd4zvdSq06z+lkb/+YgXjIZ4lUcEljRj///i4e+iBesYw==
X-Received: by 2002:ac2:5338:: with SMTP id f24mr12397196lfh.197.1588631079068;
        Mon, 04 May 2020 15:24:39 -0700 (PDT)
Return-Path: <bartlomiej.burdukiewicz@gmail.com>
Received: from localhost.localdomain (dynamic-78-8-50-212.ssp.dialog.net.pl. [78.8.50.212])
        by smtp.gmail.com with ESMTPSA id g6sm147205ljj.78.2020.05.04.15.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 15:24:38 -0700 (PDT)
From: =?UTF-8?B?QmFydMWCb21pZWogQnVyZHVraWV3aWN6?= <bartlomiej.burdukiewicz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Bart=C5=82omiej=20Burdukiewicz?= <bartlomiej.burdukiewicz@gmail.com>
Subject: [meta-oe][PATCH 1/2] pugixml: generate pkgconfig files.
Date: Tue,  5 May 2020 00:24:29 +0200
Message-Id: <20200504222430.388879-1-bartlomiej.burdukiewicz@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes build of kodi that is expecting proper
pkgconfig files for pugixml.

Signed-off-by: Bartłomiej Burdukiewicz <bartlomiej.burdukiewicz@gmail.com>
---
 meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb b/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
index 69e66289c..73ddf77d8 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_URI = "https://github.com/zeux/${BPN}/releases"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON \
+EXTRA_OECMAKE += "-DBUILD_PKGCONFIG=ON \
+                  -DBUILD_SHARED_LIBS=ON \
                   -DCMAKE_BUILD_TYPE=Release \
                   "
-- 
2.26.2

