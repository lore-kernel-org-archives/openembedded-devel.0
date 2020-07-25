Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.7747.1595674926132875667
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 04:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=geTzr/d0;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id i80so6511621lfi.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 04:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRwxmhZ+/s6TSbsulwIglnipiq5hag/plItQRDTvaX8=;
        b=geTzr/d03amOGIrznqHlossvoVNdrceTmZMGoDQ9FS1qT2M6lWT3L29sNIPbLRXfx6
         k1f3tqUrlpOUzfxJyHQ4kwcthdxSmBISDN/1x9+Dl8Ad0HkpnVPj3Ot26jNMlQE6Lata
         oftQ0UCM1TbOQnDlQR/ttdaehvPzxILz+saj2UJunF+JgJ7hxFewVQKZ5/IDAdy4d/8q
         4J6+0/6cLwd5sicqLGmjh5Ue8I+B114Lv09oc2+/dkTs9j858O/YPBLlS85ReNabof8e
         M1czvBB+pXdpQFi7ESiwO36o0H3rEST1h9Asjh8qKk7dCISrdgdGCEHbhJJ84fdzruYE
         7M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRwxmhZ+/s6TSbsulwIglnipiq5hag/plItQRDTvaX8=;
        b=BjITO/hocmwsxjTDK+VlM/fjNVbP7BmQgHpAjDwHJMo+7xUkWu5uBe566u9dlAvYup
         sQ7p1Mln/Nc9NpvdjdcrdVmpdoHyMWFokzJfds/XjiC4hxjh8S8yLdWUmeM/IT+JRsof
         AAQEGJJkPT46Onp4+lX8JhNGK79wlXpIAhLlakd48nfvYBXwDj4RKjPyswdt+ToNHeRZ
         cQhJxMMqQGjH49xfg+eHmK2VkD6NMsnXmerbUCxJhlyNoQds0y8ljIeGbVJotf0ZgUjM
         BmrMpkgxJyWV4+CYdy5097UtaMDw8swXEFQ5t9oJB0zYzwj4kZf7leZdDTGknonN0QNX
         2Xbw==
X-Gm-Message-State: AOAM531eGE+jwDnpOclQUsULBUzaBEtAriwiIQWDD/oFGAUAzcK/kvin
	YfFCH1eKClRU7bwTsPFjFCxSLAPvyzA=
X-Google-Smtp-Source: ABdhPJxXf7w5YokCNgjFsQiAdbinCSvJIwUXsqYWlqqAC4SaOBflJ2zZO+6h0Cjxh4tA2GqBP4elKw==
X-Received: by 2002:a19:803:: with SMTP id 3mr7156094lfi.15.1595674923870;
        Sat, 25 Jul 2020 04:02:03 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id l18sm1065477lje.45.2020.07.25.04.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 04:02:03 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libwebsockets: update to 4.0.20
Date: Sat, 25 Jul 2020 13:02:01 +0200
Message-Id: <20200725110201.2157416-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libwebsockets_4.0.1.bb => libwebsockets_4.0.20.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.0.1.bb => libwebsockets_4.0.20.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
index 0d1f57ab86..5427daac47 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c47b078124308a4e1354e8d59f606b7"
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "6eb39388f43f6e2a27f0efcbf8cb2391e38824e9"
+SRCREV = "ec9e8ab892f2dc569ae09336c80c2796fd14a6ff"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.0-stable"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
-- 
2.25.1

