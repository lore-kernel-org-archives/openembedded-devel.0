Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.13325.1613277234698943088
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Feb 2021 20:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=FPvKVK2N;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.68, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f68.google.com with SMTP id m22so5395822lfg.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Feb 2021 20:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BQfPwGew+fvaqIHp0KmXhxGB5ROXvMlbev/QUrgAFXg=;
        b=FPvKVK2NazMZobEdnXRSMKD1YV85cBWkUtClw5DBMh/fHJQ48shYUZNrc0OPxYZRAV
         d/htxrtKl38R+GyFTzrxBOFYSAJDDQ6hyhPS39e0glVYlRRYAibHahSUmScaiBJSo+S8
         DdbGG3CSvPJTDL8QU4wlXJqawjIGjEyemnK4f8mOc5njO5qfktNGhgdwOe060I15pczM
         Sll510o0uidATs0rXvdCzertJV3HK4ID7TAR7aIWbFizKuf9u6iGZBBPmJah0/wCPEXt
         MizAtgU2MJ/c/JjydG/wF7IENr+cCrbdGl7RFU8tae39aMtOnp3shwyIu+TNgq0YowSi
         yo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BQfPwGew+fvaqIHp0KmXhxGB5ROXvMlbev/QUrgAFXg=;
        b=I3C6Qgqj7HGCJdKKMGPOQo879gs2p1Ud/LpWjWKs7MzVJNL4054xGRGEA7b/4VPeOz
         SouwDPFNaqqNST06T14JfZH6TpyJiWpD0d8KL4LbBdEDDcLOauhpYkEOtKtosOLshc1t
         na1vfc6VZmey7TotEHFi34vf5Amt1xR7kwjR60JAJnSzPXuvTGHffYCRXBwgCPneTfQm
         51+L70xo/yMeMlwebxClk4cD3DpbQYgx+wgGM+WUDeH5NCMYX0PMSchGjqfOuWBniHKJ
         Pn85fGW9qKeYT2B6tnFC9Als0dM6z72u8a5mRV3T3QDlE6GVxuUEsVw8oQQRDMtyiAVy
         xIxA==
X-Gm-Message-State: AOAM530lRU0NcCvBKSjEG99/dHTtZT4YLgoFDA22ItXJDuepk30aYmDm
	vc7PEnbSQ1dV+AEISAVg1jMj/12EH3isHtLo
X-Google-Smtp-Source: ABdhPJyM4o0EHNbONAjGIvbb7+VfhIZAUxVWY1HqOZeRfoDovaqzDW8dGy48nITAvQZS4hyn1EdT+w==
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr5658001lfg.559.1613277232306;
        Sat, 13 Feb 2021 20:33:52 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id v25sm3094273lji.85.2021.02.13.20.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 20:33:51 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] python3-setuptools: update to 53.0.0
Date: Sun, 14 Feb 2021 05:33:49 +0100
Message-Id: <20210214043349.497555-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-setuptools_52.0.0.bb => python3-setuptools_53.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_52.0.0.bb => python3-setuptools_53.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
index 118f416657..811c8a5900 100644
--- a/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "fb3a1ee622509550dbf1d419f241296169d7f09cb1eb5b1736f2f10965932b96"
+SRC_URI[sha256sum] = "1b18ef17d74ba97ac9c0e4b4265f123f07a8ae85d9cd093949fa056d3eeeead5"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1

