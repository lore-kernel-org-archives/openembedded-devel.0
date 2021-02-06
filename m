Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web09.12708.1612648234610462176
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 13:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=DQ4GyRcY;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.68, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f68.google.com with SMTP id h7so16147953lfc.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 13:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ytWS6cYX5pg115++/Yaawm56sHYLnao2/lOgGcdKNUs=;
        b=DQ4GyRcYdSY3CXBLBLKfkfU2BkJA7cjsk1WUziKv52qgdBVGHs9SyLbt9xw3tFzCeu
         2XS/aS9CTFU9YnVN4j89wdEL8Tef2d8kS9cZ+B7X4r4xR8Ipb7KF344Z+7c+ZJr7Pvgc
         FW0pnIn5B7EuDgzHf15B+tpCrWC1X+6jMdbsKydnqIwZ4vsbdRiQu2m9RI2VZlzY1Y3P
         7V/3CtSG6YGHIjuJ+Oo0gqYY2Ki1bQPdOkVhDlSONCwqf2+qAlbJAf7koZxJy0M3W1gY
         NwgmU/9BUoZcVYLWg4G//TCx41DqBvsZ6Le4MxSkkpqZfuB41QeofRDNiITTe8fGY8Yh
         xV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ytWS6cYX5pg115++/Yaawm56sHYLnao2/lOgGcdKNUs=;
        b=chnKxbgxz++xq3rtD5T5vOnt/sMRthKcNieA+9xKMEBWCW91kBiQoF3u9jqk5crVZf
         mxsr7toNfZ2kYTgS4DwIxWNsy+wwkv1UVgI0bYwNFNY/rkSKmy2KILoPObr5ER00gb09
         2DZ3d2tv4s8vClTd+Jty9Ljhnw0VpGQ1BJ2CuMcUlWjOGT4NC/Dic8m+Ns2FLL/0yicQ
         g9njQRtCuFSl5e6BDuNsLgjLqUMf8WtaBebCwKFwFNowgJpltE/lhLU4CYLPhWd6Odag
         ROXQbAhqubrKCini5+X1W7FuMaH6bcBbD0HGX1ooKEm7bwNMTgMVvFJRAQwD+98EMre8
         A2yg==
X-Gm-Message-State: AOAM531IwXENLf1+lIRbaP3taH1fRaqFTCNCJYA9trjppyMYBz1zi7HT
	54RnCg4vrZ7cwEotZbmj2R1CXa1hCUTUI4TA
X-Google-Smtp-Source: ABdhPJz3O2vaL/RyUHP587WeGmpf+1Z1Oi3zAjv3FadMNP9yuBm/hIOfhUGjzPocUhZAJ1sKQQuugQ==
X-Received: by 2002:a19:4801:: with SMTP id v1mr6100090lfa.628.1612648232130;
        Sat, 06 Feb 2021 13:50:32 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id n10sm1453585lfq.276.2021.02.06.13.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 13:50:31 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] adcli: update to 0.9.0
Date: Sat,  6 Feb 2021 22:50:29 +0100
Message-Id: <20210206215029.3941118-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../adcli/{adcli_0.8.2.bb => adcli_0.9.0.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/adcli/{adcli_0.8.2.bb => adcli_0.9.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb
rename to meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
index 75f303068..76df27851 100644
--- a/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "A helper library and tools for Active Directory client operations
 HOMEPAGE = "http://cgit.freedesktop.org/realmd/adcli"
 SECTION = "net"
 
-SRCREV = "cc3ef52884a48863a81acbfc741735fe09cd85f7"
+SRCREV = "1b1528038e084a9f81ea108cffca9c2707623b9c"
 
 SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;branch=master \
            file://Fixed-build-error-on-musl.patch \
-- 
2.25.1

