Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web09.384.1613771701385093075
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 13:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=AVyvTrAu;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id c8so29125682ljd.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 13:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bU94HJvf4K340DkZdb2nvnYU9RJLzU41hJicY4P0wGY=;
        b=AVyvTrAuHfmm3pKp8PjDAD/riDUfVd6MLgUm6F9hYABlNclwn0PFeerUT9y5v+CsPd
         H6n5J8yQK4Mg3ETngawUMGz8b52BN0EmFaX85ilrT04K41fI6gr8hOT0aPbpW7YIUZlz
         fTd5QKBZnqdtgGUTIATu9CcTCW91Fdtmn6PPzpTQc9ToXrL22g1hHDml4b9VWeW9v9id
         INsYrgRsA4khLzvPEwZOFKCfX1vj0JuyWHueJikir6VyhvT3U5Ih01YvLVsNJf73xVJQ
         QXCc63GPohtaolaxDpS524Y1jbJQO1o9KsIeCb17Z0qkgCT+ynPE47LmUzEItYD+aiqB
         vtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bU94HJvf4K340DkZdb2nvnYU9RJLzU41hJicY4P0wGY=;
        b=smaH2L2uTSb8dtpmsMbizGkvyoUmVK53hCiFD6rYuaCYEvgH3zBz9HSmS2Rzfd7+e4
         NdrGt1WG3Xd9I1XJD6vLMr8MvY2Z5LHhWagIH/NHZvG2j9psM6fLtXeAP/zFC5yfEuPz
         cUAd/Zo+pRlfZVb9K0ULXmeDtgXn1JU6dN1/+XYsXeaLsUO4ye2NR7zQ87Cp8t6NjNxf
         hBZ7qKPboI/OEH7a0IMfwKyzJBAWLBJxrMaGgU/t9Revu021ZWUekycCfYzK1/H/NliS
         /Gbg3dAK1m1EJgGny9LINwgEsht01dFYvkNOJPymO/Qc6/mIrpGYgkG613Rx0t06C92g
         8W4A==
X-Gm-Message-State: AOAM5322AaQlKW3rtgLg5gnMzQMrhRZGcLnQoiY5Ugpyc/TvL24fSHqH
	ksFZE1ZarjVAuXf5HOvzWeMmqvtBNywhjZUv
X-Google-Smtp-Source: ABdhPJx+ZqVEuo8Obxcu/G841Q5qRPPxwQjgzA3qt+ExUaFN7xqYXoJsDMiEyB6bjPtR02TEag5MtA==
X-Received: by 2002:a05:6512:39c2:: with SMTP id k2mr6380673lfu.69.1613771697114;
        Fri, 19 Feb 2021 13:54:57 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id k5sm1098616ljh.130.2021.02.19.13.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 13:54:53 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-sentry-sdk: update to 0.20.3
Date: Fri, 19 Feb 2021 22:54:50 +0100
Message-Id: <20210219215450.2368194-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-sentry-sdk_0.19.5.bb => python3-sentry-sdk_0.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.19.5.bb => python3-sentry-sdk_0.20.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
index bb960eed0..13ba1e6fa 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[sha256sum] = "737a094e49a529dd0fdcaafa9e97cf7c3d5eb964bd229821d640bc77f3502b3f"
+SRC_URI[sha256sum] = "4ae8d1ced6c67f1c8ea51d82a16721c166c489b76876c9f2c202b8a50334b237"
 
 PYPI_PACKAGE = "sentry-sdk"
 inherit pypi setuptools3
-- 
2.25.1

