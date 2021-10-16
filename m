Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32294C433F5
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 12:44:50 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.10228.1634388288807694851
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=1YN5KQMk;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id x27so53744770lfa.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qNzQ0tJ3slUP5ZptHHV6TViTwVGhazs3KUzb8Ji5XCY=;
        b=1YN5KQMkl/mGKT5YDxdgD0T60LnjAokKfjLpq85cxlQUonN0b7fQnUtiD+/uqOKJUZ
         y2ECtQZaXwLjBdJG27rMVnYI/O6KMyd6q3H5nSAsTCBIGUh/kKL2Rb2Ky6vOi4Ek4pam
         nBJcBW3VZB17/ZmVIXJ0xLjZMkoCsvJOJkdd+p9vSeE4yYFsQBuYG0Uex2hK7gCarK3X
         1rVPV1LLJmw5jtuV/Hf+CurxF3bu4YdKEOxUI1nVVT3NHXdZqn+jEqxCYkUhorqvNOcl
         t7htLTOrmQ5QnCBp6O5ccLZawzZ3h48uuAHzBq99+MdUOREnMQ1cbveZdmf2eDpJkeVc
         Cxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qNzQ0tJ3slUP5ZptHHV6TViTwVGhazs3KUzb8Ji5XCY=;
        b=5zgtQb0mdZ4WuTFK7WOby6vm8OlgQ/DyUKfOpsu7sq//a18kxpfsdTXGaso7WmJ6nH
         WDLEpf9dNGS2fr0k80TgUWVLAsOS3AemGwnk+1aXMUNi7WQKmB7coIlOZhB6Yw3Np36H
         X2Wecc9PbSI4GG7nURpelduQZCdeM4uKMf4wDNCXoxbtVtp5ZIa040qu9FI6yEdnphqz
         3kNISe6QBQwFxARKsctIB5ZRkqwERqSxe6IsNbCyl0m79QoKtlf5tCT0G81rI5tFBmUu
         6vF6cZxrWiqraqt39NnsouYfwJj/0hlnkxwjgmj0l3nonXDxanx6Bsx7Hcgm5N5WLTw3
         ChUg==
X-Gm-Message-State: AOAM5304gS/HRQJjjJy5T1k/AFt+qyxBw+WYvLf3TrB2GSVtijFV1Fd4
	7rnHl7ux8mGw5AJXABYGqJBybY/cH7RgVlyV
X-Google-Smtp-Source: 
 ABdhPJwmGEVUNY2M6nHJH5kjUGC532PIAI6GW4CqZXRC0AB93p4v0slN0Cwdf65DAzAVFKW7TRLYRw==
X-Received: by 2002:a05:6512:3763:: with SMTP id
 z3mr17719771lft.601.1634388286104;
        Sat, 16 Oct 2021 05:44:46 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 r3sm841467lfc.114.2021.10.16.05.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 05:44:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-python] python3-pyatspi: update to 2.38.1
Date: Sat, 16 Oct 2021 14:43:37 +0200
Message-Id: <20211016124337.3734255-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 12:44:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93401

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pyatspi_2.34.0.bb => python3-pyatspi_2.38.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyatspi_2.34.0.bb => python3-pyatspi_2.38.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb
rename to meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
index 1368b923d..8ae9ac996 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db29218e6ba3794c56df7d4987dc7e4d \
                     file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
 
-SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=mainline"
-SRCREV = "cc99d68db66174f4499b9b325bc788393b972edd"
+SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=master"
+SRCREV = "6d5f47ee8e8a36140b52bf52fe954a131a0aa5dd"
+
 S = "${WORKDIR}/git" 
 
 # Same restriction as gtk+
-- 
2.25.1


