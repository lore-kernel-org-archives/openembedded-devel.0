Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.7413.1598688222554339785
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2020 01:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oVGAODXm;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id 67so1552228pgd.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2020 01:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q5+u7l7Y2YFl8eO8IJPHA7KK2V7ckE4yEmZonwSg8xs=;
        b=oVGAODXm+pEn4IhmICC+eTbGigUMbFqgYK4D2433NQDVLNw1015UItH7QbjEOptqbm
         mFgTB7O/vdmZpTuDOy2KSela65eTbhqpyjJRxs2x+vwVdtapJ0OTezxTMRwudymzQqRx
         xXQpsuPTRgx3BpOtJfMEbW3q3+8o2/hd+9YR7Z8tKGY8LkMAtpfhvbEdQVLKsjjKeD/i
         3gPmChA/WrymCJIbFG05q+Dbfd79gEaLx70yKRE5aUH5Ffc16w7PYLUfqwM7veEGrYj/
         92w4dhcIhRtUN1CEjYgO5OBGu/iYQ/qowKJEDNkL+60Ng59QOR4WTZ5hNsPnMy3BFwot
         Bi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q5+u7l7Y2YFl8eO8IJPHA7KK2V7ckE4yEmZonwSg8xs=;
        b=jS2W2s2eDvmULX/JBX6KhhtpCCSHgzR5v2VvGu4UzaSi6PoWuXjKzasFXzgzRvODYm
         mMYQufwITBANJRuV/ZizSrV1XHWxUQirDDantBW70UbY2/+IJkdycdbPouiF6uaXPm87
         TrbIgb45L4zPOc5BlJRfuejzDUq4z2UkzBD8gm9NTwN/xjbNbiCjT/6piZxW3HPM0iOg
         ItI5tQ3vQ9e69VSxlhqtmCXQgvNDAtRvImJzdYGDPRtaqBNPa+Je4tuUpwX1qfmvA8HG
         LwgQDMu2TVezf6v/oxwKKVDFxTBZ2yXDkPYXP/lJfuU9AWAmrzWtg2EC4KXrjzHKBzbp
         HWcQ==
X-Gm-Message-State: AOAM530r6uRlaWZA0UoVe330Rc6D30eXjpNpkUfZit0Zpmm+6PV8CHry
	UA4xJwP1VBcJV7l+8cABa3Bhi4Hh6TdFXw==
X-Google-Smtp-Source: ABdhPJw4gZ0+mQBDvhuTfEgOTY8avTaiLnVyP2BDTqn3Hf6Y2YftDx2KWL0FP9q+NUgS67QcxLiHDA==
X-Received: by 2002:a05:6a00:1356:: with SMTP id k22mr2253935pfu.76.1598688221763;
        Sat, 29 Aug 2020 01:03:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id i17sm1717557pfo.150.2020.08.29.01.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2020 01:03:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] wvstreams: Update SRC_URI to a fetchable location
Date: Sat, 29 Aug 2020 01:03:36 -0700
Message-Id: <20200829080337.3273497-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 20becaf57d..57163ce65a 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "zlib openssl (>= 0.9.8) dbus readline"
 DEPENDS_append_libc-musl = " argp-standalone libexecinfo"
 
-SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
+SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${BPN}/${BP}.tar.gz \
            file://04_signed_request.diff \
            file://05_gcc.diff \
            file://06_gcc-4.7.diff \
-- 
2.28.0

