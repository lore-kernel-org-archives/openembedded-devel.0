Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web08.360.1613771668063429118
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 13:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=ZBg/XlCT;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id o16so24527301ljj.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 13:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=orQGMr48alQYqW6/yAQjHks/+WzRTCCzf0Jw3I9/k7w=;
        b=ZBg/XlCTW/RC0WFjjR+9bMgG5xMajSbheoF2C+3CO3/PmaN7GUyWj0bMuFDJUCzeZN
         HM8/uUQ7wdZog9aFlx9vf1k46jY6v77IOptSoLjDJxXhAL23xZvsFgdiBqSnd3K4xhsF
         P2P5UXrte3lctWSdMz3me6szGdzjlxQlMqqcU7VSjPp4r0MABYTYgam1w6+BbAsRozL3
         JBwcahrSDZ6oBiQFWr2vmtazGEI1xRIdVU86+JPjeDoCoOynzkFsSLoSiB3msCVO4UuV
         PweVWGxzbXaoWAdmzNd5rxRdGTmEtTsLguCMJTz/kvr3qCugt9yQsrJF6XV6uSi54yBq
         BHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=orQGMr48alQYqW6/yAQjHks/+WzRTCCzf0Jw3I9/k7w=;
        b=MtrWnyGDhgJIkK/CySoCf9d0sThwSP3vSJXrbZIm/jn1skR3GC3yGi3q4ar3ZwUr+X
         isaCrnHpL7SrsLL3YoNMNTX26ZTkX9OsLh+FqyfIYSXJ6kZ6JrROJulYnBz9CVSNe8xg
         Ju3Nhq0mW5d91qykPaB/cuTx6wPqVpLy0TgxhyKj1js7mjwCRT0cjf4rAOH2YYuZu0gb
         ZgGmpN0vxcMBGPHqukcKEEzz55PBtXUOvTgz4SSrWHsIc3y+Mo0eaqviJAjiU8zjc+zH
         zXrrb5yGuOLNzwwsOwG5Tvxbb+dFgsgSgNfh5QE62fGxn/w3jiiQi3j0luO5RHfKur/2
         pD7A==
X-Gm-Message-State: AOAM532Atux1m/46myj/w2xchBNNWoReQYJZuPfJC4MZkJPy0cDTxFvO
	3h9I76iowJSXP2KInNUpj1yyfVNuI/QL04YS
X-Google-Smtp-Source: ABdhPJx8sku13VtjIKMsQ6kTk/bGpMmhJxGEBAmkgclu9EiN0vd1+LoCJVMHdYs948nrONdaG94TIQ==
X-Received: by 2002:a05:6512:228b:: with SMTP id f11mr6934291lfu.78.1613771666102;
        Fri, 19 Feb 2021 13:54:26 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b1sm1037778lfq.187.2021.02.19.13.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 13:54:24 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-supervisor: update to 4.2.1
Date: Fri, 19 Feb 2021 22:54:21 +0100
Message-Id: <20210219215421.2367919-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...python3-supervisor_4.1.0.bb => python3-supervisor_4.2.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-supervisor_4.1.0.bb => python3-supervisor_4.2.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
index 56ab27e0f..0ff4b35d9 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
@@ -7,8 +7,7 @@ HOMEPAGE = "https://github.com/Supervisor/supervisor"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
 
-SRC_URI[md5sum] = "ecea94eedc70ba5127fdeb0665bcca0d"
-SRC_URI[sha256sum] = "2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383"
+SRC_URI[sha256sum] = "c479c875853e9c013d1fa73e529fd2165ff1ecaecc7e82810ba57e7362ae984d"
 
 PYPI_PACKAGE = "supervisor"
 inherit pypi systemd setuptools3
-- 
2.25.1

