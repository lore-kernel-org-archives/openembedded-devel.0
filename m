Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.7714.1630069601783008694
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 06:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=l8G4rDP5;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.179, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f179.google.com with SMTP id q21so11290294ljj.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GSYpyS0BJnkAwDfOXYcjLT3i5F59b/EcOiFMXA0XgGc=;
        b=l8G4rDP5WJf00y+Nrtg4218wJkVkPHEGZXw+WDqH9xrp2+ppqmQPbZdIAxpABza4/x
         1TiHyzWr108PNGSUGxIn4RyPEzPDIZpG5PLoS/WaH7snaTVQ1doFuCV9bn8HGQapNTGL
         fiTbNHn2CXNPLUGvtYYgvISO79kXqrT2M2HRU69FWymKm+nNdWj6dSQLABlzd3brmp2y
         nILIfYkAiRFYvA7QG7P2IDFFi6EdtD2PWsqAlij24UP7+Ul8HfZdoxp9wOI9i0mTENnY
         SuCNGJI1CWKPcUck5Yz3Q2zVbCrWw6TH+4+t6psGDxTDlojEvP3Og8JpdDFGBGMZlZzg
         AvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GSYpyS0BJnkAwDfOXYcjLT3i5F59b/EcOiFMXA0XgGc=;
        b=UoRA2udsRPQg4Jrw1tmh/5gJBn8/2D+o8NR9TrwdbHyxNeCxF+yT9o34nADvkzP3RA
         woC1GEuygPLdu2BqbrAcEF6VcC5VWGl9pS5z9OeD10cTGfkZ1LF738E1L674gB7vcOla
         M9/Fn4wLQN0yZ+nCcuUZ1ilwIoDdwsKCJTQUjgFXlOAVIfsssYHghgaNin/3rQY/sdUO
         kv9F/yCe61BidWLn8IXSFrXzn1tp5g61CO1rwQmW2MwJKuuStpyY84ZrR0HcC5dss6YQ
         ldE3EPLNmtqLNDIjEFKTSH759lLErLZ84NCCDqEQ3XWutkS6sioY3XucXyrJxZIwv5jY
         p69g==
X-Gm-Message-State: AOAM532iFMR/zEIonwYBG6yhCf9DoE0GDyj8BnqeFIayA8nkcr7dJ4bH
	YvlIg83d7TSzQ+cZlRQnXK84w9Sl9hsafuOT
X-Google-Smtp-Source: ABdhPJzOtcMpRxX41QuZ3FEZSzZjU7mvMIyr+Py7aCjVxb1+U9zgnlvvWDSz/tX/1/IwwmW8ZwjTzw==
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr7349084ljk.121.1630069599089;
        Fri, 27 Aug 2021 06:06:39 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id m5sm591068lfk.267.2021.08.27.06.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:06:38 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] can-tuils: update to 2021.08.0
Date: Fri, 27 Aug 2021 15:06:31 +0200
Message-Id: <20210827130631.2865172-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{can-utils_git.bb => can-utils_2021.08.0.bb}         | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/socketcan/{can-utils_git.bb => can-utils_2021.08.0.bb} (80%)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_2021.08.0.bb
similarity index 80%
rename from meta-oe/recipes-extended/socketcan/can-utils_git.bb
rename to meta-oe/recipes-extended/socketcan/can-utils_2021.08.0.bb
index ad7fc596e..c470caf62 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2021.08.0.bb
@@ -1,14 +1,9 @@
 SUMMARY = "Linux CAN network development utilities"
-LICENSE = "GPLv2 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
-
+BUGTRACKER = "https://github.com/linux-can/can-utils/issues" LICENSE = "GPLv2 & BSD-3-Clause" LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31" 
 DEPENDS = "libsocketcan"
 
 SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git"
-
-SRCREV = "e9dd86fa5c4e6ecdfc34e487634a32f19e5c4d63"
-
-PV = "2021.06.0"
+SRCREV = "3615bac17e539a06835dcb90855eae844ee18053"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

