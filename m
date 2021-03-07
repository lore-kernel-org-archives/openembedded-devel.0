Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.23330.1615134303379666654
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 08:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Hrtee0Uh;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id p21so15486420lfu.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 08:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TT2r48uGb45fvvX5tYihs9PsNZp+PWkMkb/p80ocpGw=;
        b=Hrtee0UhmisOKI2dBX7ibFTrF1/loS7wIZdz9k4eXkZqEwXosmM2pz6psbh+TZSXL7
         /mebumK/PUyddf25faSnnZREdJUHjjcVxbT1gcXY/9E/Ussh1ygSMatKiVp3e6ntEW5L
         M+V014U+JuGXEIeDyrtz3APFUwWx1gR95GWVWisOb5tDu4j2jS5OFaC+zW2ZuPycAs+r
         eqcEFmRDo45NXbeam4c6YUej1Qzl7Rg0H5oBsb1D9QAItVyxxzupkvGR97MOaI2CFCEu
         C5JmgPkSsPJuycufVeWYjZKYH7BDi7o/GL4IgJo41Ik62xJscG/HJE1MGtCVp8TH3Ad9
         Gb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TT2r48uGb45fvvX5tYihs9PsNZp+PWkMkb/p80ocpGw=;
        b=gOJhACmIPq126lCLKSW/0YlnQqTqEzy33AgTd71XCNQAt98lIPiWbHrYWTFlHKUcWR
         0rJ5uwnunTjikg6PU9zqTKBtnEzyqgEJNorNyB/yvs+Sxf34ovHSGahxnYlBGsgmZW0h
         Ahow2DkaIH1YC6IupyRnumdBC02hjmyPCa/MnlPbk2NI29YOBV+d0tbT3Dt3nC4GtHG2
         XRuSE6CSVPhzxaBb+wimHX7IBM27JeYJAIpAwdSdQJ0QBlaYFk51at9BiB9UKhscFM5k
         VTR9TDyXqZgm8eFZB1N+fCxovmuT5knhdhtJV2qU22aSZnO+F2hXH5qz+yCXhLWR4GBT
         1IjQ==
X-Gm-Message-State: AOAM530oUMKygPGF9x+zAyl5hkuOVPj+5Txl/rD1YjK3/cvAjfNXYjMK
	RcXIRHrplwaooLQmJdBjsatyQOxQCNs1eRQo
X-Google-Smtp-Source: ABdhPJx/vOscVHcIq2ZWcgMeDy80a2dpW1lpu3ya9C8aWZLLboa41CAG07kYDz4UQLFcQaoLNS1qxQ==
X-Received: by 2002:ac2:569c:: with SMTP id 28mr11452721lfr.414.1615134301124;
        Sun, 07 Mar 2021 08:25:01 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id f23sm1141688lja.43.2021.03.07.08.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 08:25:00 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-yamlloader: update to 1.0.0
Date: Sun,  7 Mar 2021 17:24:51 +0100
Message-Id: <20210307162451.974014-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...python3-yamlloader_0.5.5.bb => python3-yamlloader_1.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_0.5.5.bb => python3-yamlloader_1.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
index dbf84d413..a2483a6f4 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[md5sum] = "2e0750ace81235f750c072833d79c4c3"
-SRC_URI[sha256sum] = "dcab5f16b39bb03d10dda4cd4f30c943675ec4c7771807fc67e7f1bb319bf4c8"
+SRC_URI[sha256sum] = "e96dc3dc6895d814c330c054c966d993fc81ef1dbf5a30a4bdafeb256359e058"
 
 inherit pypi setuptools3
 
-- 
2.25.1

