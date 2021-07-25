Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.20073.1627233651782659389
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jul 2021 10:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uyh0fPzd;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id b6so9528015pji.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jul 2021 10:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bWEdgwjpBQ0sb7y+BkYvqQBXpr1eXogaHg6QkuCBRD8=;
        b=uyh0fPzdP0bJ1/5qTb5frXMpGvKXC76uHVVFipRwZwI7QYGgmR9ojcW1WBA/eysuZ/
         esK9JIXn7u2UaCr+t+ELUb9riMovPmaHtvJYxe0gu361eaF9oyFvONu30ud5XQZX3Loj
         F+yMD9hLSB8OZ+GCYU6mMXS//TDxsjw0Iw0dmg87HsK+vREmIpFqm/tpWXMAJqMIqmDQ
         vN1HS+YafxnH5jWIzLV+4bW0SU+wc538fTckOdttUrjJs0SHxgimjbYoI1wS4yJoMKeB
         mYRP6J+hfY124AR5traBNrbsVc/JzdOBXhbKNXkgFAOmMSMfO5thcPMwzf6GnKUM4uSW
         J4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bWEdgwjpBQ0sb7y+BkYvqQBXpr1eXogaHg6QkuCBRD8=;
        b=H9pOlqnAVxoEkViIYLO/DoPicE5iEOi1hpL0x+fS1+ToW0XZXYSZ9Os9seq4bKubO9
         rNMfgFU9SyDQcuJo2iEYQwj4croYW3dPNp0excYUwjsNT1TEsezrBhlIogNPG/8+Bj7f
         kRLZ64yqtXAD+AlbVTAlvxaJ+g5PRbuxxj5Nle9utWqrVL/XcQ6eX4Nt5vIsNb9bxi1R
         28iOp9RG21bFA81qITUpbOxyRz2pM/vPg76OXqvyKA8Ex0hJlsYJq8vPBsQBV4BBq2no
         eU+JJdvJFNuK9KCw4GKeJq4+4sw0JS8cF5b6QMHdggkhjW5uDaMAwYMvw31j0kBioG20
         XS0g==
X-Gm-Message-State: AOAM531/pbcJsllazMy2CEh6/tPcWpX8FZbWhSKDSi3zKlc//CAoAIyn
	+0NyuM4DyGSZUeHN8Ee03UpIq+N5XbNuMQ==
X-Google-Smtp-Source: ABdhPJy143xwLi+em5e4hy3ScTqs25mpsMEij84lfVtn8HC98+cTKOgbeUfNDS1ByeTUvfsEyI4hKQ==
X-Received: by 2002:a17:902:ce8b:b029:12b:2b93:fbdc with SMTP id f11-20020a170902ce8bb029012b2b93fbdcmr11115624plg.46.1627233650963;
        Sun, 25 Jul 2021 10:20:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id i8sm43284352pfk.18.2021.07.25.10.20.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 10:20:50 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][master][hardknott][PATCH] wireshark: update to 3.4.7
Date: Sun, 25 Jul 2021 10:20:49 -0700
Message-Id: <20210725172049.2211743-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stable branch bug fix update. Includes:
CVE-2021-22235

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.4.6.bb => wireshark_3.4.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.6.bb => wireshark_3.4.7.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
index 3062633bc3..7bc5a8150c 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "12a678208f8cb009e6b9d96026e41a6ef03c7ad086b9e1029f42053b249b4628"
+SRC_URI[sha256sum] = "6c4cee51ef997cb9d9aaee84113525a5629157d3c743d7c4e320000de804a09d"
 
 PE = "1"
 
-- 
2.25.1

