Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.13904.1615068567237403454
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 14:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aIu2kpy8;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id y67so4735339pfb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 14:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s9Pu780dJ43qWOXLCjEosSn6XjORWgjythKVkk13RUQ=;
        b=aIu2kpy8d5eTr9k+/I11DffsmWEHCTiqqhKonYdLDOEzXz/1TLgxf/+nkZoWva0Cfk
         xwv4J9FbdyWVIsjH6P5COlft6w879cLs9YuAAOWBaTsGlbH/Nn2eY4g/lCzvRyyxAm3k
         74+2h/A7VTbnrrmTZ5Oytk4r7T5D4Ak4DBZZ2MXQOghysfnxQZ3p8WOOd+Fus7TBL0n5
         42jCVemaHLbFqnvPGUGw7Z4/X0HRuff0j18IhWbWmOMqGdOqVRUEYVA4hpbAHErQRkuR
         EpHSjRVPBHrFgo8tTNTb/WxuxXdgzdLgMe75lJ8TJYE9ctKQAw3UXafdXLIHwrc7T9hf
         HzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s9Pu780dJ43qWOXLCjEosSn6XjORWgjythKVkk13RUQ=;
        b=orfqu99iMeEl0Ukk07ixJHhRXrbG0cnXs+N6SC2zFAyZHDMsz9kcVhkBldrTVxXF3x
         eDDJWreUCjm7fagTQFF8QZuS09lpTPqvWLfabKlWQL3OpKhla/w1Lr/M1cIpcuxHy9kx
         faQj494xqwxU/mXoZlkiqARbUaGQ1BZ9UNGuG7zAUqXBV/DCjasXB9nvKzFQLX0akD3p
         yMyx6sxLTBJDVGuby+m5jFGcWG+ku7ikqtY6Wo8q0QE9VdYmJM3nJBhBoai3HiTiJsk+
         uhInF0BDBvkpSxmQJuEO1Wt2gd9T0tYSYU5LLb67G4tUWhrzfTamNtOt+BIZj6LSL27k
         9gfg==
X-Gm-Message-State: AOAM531z2mzKoA2FgUN2nP55hnXpyr9dnABC193dpJ93u9qHw1DqjyMf
	pOqje/PoaI+Gt/dD5NsEa0MfQRp8nGjXFQ==
X-Google-Smtp-Source: ABdhPJz6vqGWMmLD1w+J6e2ThXhnsVGsdwJko4qY+dpn+rg42osezh1iUh8SJVOHddeGGZmWVr7GDw==
X-Received: by 2002:a63:40c2:: with SMTP id n185mr14187635pga.280.1615068566218;
        Sat, 06 Mar 2021 14:09:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id z22sm6171725pfa.41.2021.03.06.14.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 14:09:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mongodb: Upgrade to 4.4.4
Date: Sat,  6 Mar 2021 14:09:23 -0800
Message-Id: <20210306220923.2481722-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index d0c4eba7ee..2edd345590 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.1"
-#v4.4.1
-SRCREV = "ad91a93a5a31e175f5cbf8c69561e788bbc55ce1"
+PV = "4.4.4"
+#v4.4.4
+SRCREV = "8db30a63db1a9d84bdcad0c83369623f708e0397"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://0001-kms-message-bump-libmongocrypto-to-v1.0.4.patch \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
-- 
2.30.1

