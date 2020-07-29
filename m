Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.1815.1596011008801225090
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 01:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=RAvw1Fep;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.178, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f178.google.com with SMTP id g6so11462568ljn.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 01:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lpsd5N84fALiHbBCgPmOsJc8otT9XrW7FTtnAdcE+cU=;
        b=RAvw1Feplchey3GVUeILTzsrtALAZpYgCHFPQCZgTH9plWnFUjebHbreDw9zjZzh4F
         sZ3iNpAT/TB4s/t0BRi4Zk9iFN10y92jkj2DGkvXSOg8e+733iZNqg2hHa6XhlV4aMNb
         qqyg8xvk0NAQzfIciYQNBMqzRys+eRfQkOboBUM7Im6eFL4uqogr0XQwsl7EBwWkXsrT
         RxH6MJYxi/piAzwyyumWic8EP5FqjDhjnPkUi6ODIam/OYHuVTEbxE3e5lsIRK7DEqpt
         hKunnpSUYVM4Dv0EcDEQT2Zp3+eLzdqMCU6r1n2311EpVRAv1R8PSw+BCir4wGRwKBR3
         A7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lpsd5N84fALiHbBCgPmOsJc8otT9XrW7FTtnAdcE+cU=;
        b=Pig6R1OmR6iN6x8X8TLQ43gFZ8QFvKEdL6tbAMtBlUd/mOsV6Vn4nogwi0ezQMBu20
         YjFEC9154ZJ9TsbKr9e6VbbkJ3Fi/OOXmrfdG6WPwW+Y8rzuZstNJhRJOcOXl9ny/a+j
         IO5mPcZ38wix8UdNlWhiXJ/o7jnzmV4PbL7gvvx6jPDsCT4SsB49AOMGWXfeUDfadw/Q
         0kOiW84EJsrGYMjzCinH7G9EHBB8BELzloQA95QIe1mYRkfG/jwAtMm5ziPSCyHe3r35
         wIdFsdQUkvqoeh8J8S+DTJ33DrneL1Qa6WC8lwHkNcrErj14tPia+c2pq2QBl0m18XaR
         VAIQ==
X-Gm-Message-State: AOAM531SvIpHVNTsLZZegizdZg3zr3yp1OzOk9Xai6xijH+oEUm4vh2G
	p/HiP+ojJNQsBfDSkx5VZbeBXnJJepA=
X-Google-Smtp-Source: ABdhPJziltRwoG1ipy+1Mllk5/UxMmWp++KDhaYLnRQErOehKMTH64+rpCK8DrWA2HWqjLa1cDQDCw==
X-Received: by 2002:a2e:5852:: with SMTP id x18mr45165ljd.132.1596011006541;
        Wed, 29 Jul 2020 01:23:26 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id m20sm352419lfb.72.2020.07.29.01.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:23:25 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 1/2] libyui: update to 3.10.0
Date: Wed, 29 Jul 2020 10:23:23 +0200
Message-Id: <20200729082324.2710436-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libyui/{libyui_3.6.0.bb => libyui_3.10.0.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libyui/{libyui_3.6.0.bb => libyui_3.10.0.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb b/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
rename to meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
index 7c6f4c13d..d7f529e31 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/libyui/libyui.git \
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
 
-SRCREV = "8459235919f592b1bc099ecf9a947cb6344b6fa5"
+SRCREV = "de9134007d2d029fe5809ce48f57fe218e6ffe16"
 SRCREV_FORMAT = "default"
 S = "${WORKDIR}/git"
 
-- 
2.25.1

