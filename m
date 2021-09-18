Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.837.1631984261292174405
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FZ2hhw+G;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id l6so3506891plh.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=a4WhZsdhSylYYTRkmsV1zMyRL2IuC1N5hyGQmkZ0pvA=;
        b=FZ2hhw+Gm8HYFchIwh4KvwjWW5f5coZJGJJxJdnAa7gtlEOKRNOro+i5XixOBU7F4k
         AMS+zXb8Ugno7QYtpjbItArgYPiAABWHPlZb/kQQTuO2z89lfMFoalHwPXYd1BkUqU4g
         OUOlgbKDf6QZ57zGkE5ryXLUDZ5oWl6++oJq1pH+PALlnXvY4ZEK97AXOVdeEcivrPxr
         IGU5BcvLI4W/moz/Uq9WmwYSdbdecDjl8twamISvIMi1njNT/O1sxSObXd8obP8v7wX2
         oSAKyFIq6iLBdqAFrlxxyKswsh1n2VXyohi7pwcJx9Vssg4TBbcK7Uj7Jzp8negnBi43
         HOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a4WhZsdhSylYYTRkmsV1zMyRL2IuC1N5hyGQmkZ0pvA=;
        b=umlTin+pqwQI/kB7IFt0mIhNmTXpJKrKknvYcw39yFec2ERCdi1qsOJ4oh16S+eZ4S
         fJqdYF67gsfTzaha39KhwJy6qK47fHYrVSK5hybVISTrJC5o9exox3KQNVgLBL+IWhO7
         mIfUzlksCVId7GvbSk9zvu5Q39qTZLKjqY0AQWOx1/YDKw3jgj/X7BmN+6AwXU4RZW1y
         iM17LcdyfR3BHmiaeTehMOTNju5j7p5JtzR/aMcxVO88R5HfCol1lyKaXubHmZx9CLoi
         0VIN8x1LfhDHm2gal0MbzoJ+XMAuTYmAMy09ML0BanQQNf67DBXkDehHxx9H6ko0rLnq
         nt2A==
X-Gm-Message-State: AOAM532Z1H0r4MzEkp0sYHWGNI8K2/FjvhDW7bsKFEpfr5SkKnXGJYDT
	vz5xh7J2R4K0o5VChAwCFXcMJXf8tbk=
X-Google-Smtp-Source: ABdhPJyk7+66SOgUynctTVVuvklHaeUsyt0N8tMReVYY1UgYoBa6rVWXuvQRk+/lHmjuENbKrQJM+w==
X-Received: by 2002:a17:90b:1b0b:: with SMTP id nu11mr28298352pjb.74.1631984260699;
        Sat, 18 Sep 2021 09:57:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:40 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/18] python3-dill: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:22 -0700
Message-Id: <20210918165738.2581429-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-dill_0.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.4.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.4.bb
index f77d11e255..ff0104cc8a 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Serialize all of python"
 HOMEPAGE = "https://pypi.org/project/dill/"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41adceb584fdde8323ddf9ad23c07fe5"
 
 SRC_URI[sha256sum] = "9f9734205146b2b353ab3fec9af0070237b6ddae78452af83d2fca84d739e675"
-- 
2.25.1

