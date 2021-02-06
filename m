Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.12948.1612649550637216069
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 14:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=hetrpY4q;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.65, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f65.google.com with SMTP id q12so16129051lfo.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 14:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKNh9c2oyN2wEVdgPaSGw8NwdrZwo7F+L5iFrDsVZA4=;
        b=hetrpY4q5DwvMVGHSe82s8qBxJmca7PcDAr/a1suR2wN4sSx0KPBV8H4mK8XgD2Ye9
         FEWXxzYvtKqiAppvvq3sQ9ojeCc9+83hqFyaHl/7TSTKmO8mU/bOox0Ql3PByy0RnGVI
         LgjFURiPPoEMifioPEl5T6aljv0R8c8qNgL4aagPFKceOSeULvNgwNUUAT9HdBgFNW4u
         DgOKl25SMv37F2ahfbjpD3/ziFzs7yMZ5QyYG5Nl777ZVkLsw+e5vGF8RB8fADvw7QAJ
         7vBo8tvabs+qIFWRUnZVgKtmmor6blpLysOR5z5m2V1hSDA1AhIHsWk6kTVQaxq05p2/
         gipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JKNh9c2oyN2wEVdgPaSGw8NwdrZwo7F+L5iFrDsVZA4=;
        b=KThax2O60Hl5lCdNmHaUeAf6YKj0swPgvR4AZ/oOcws5Fc9VRGL7SVe0DMjFC/a2C7
         rYbO4rw1sc3Ybc8BX9O5D7Tw4Y+42EHvCwsnkc6+itDvlzvo1HkzXSfLg10IT3r3U5fY
         ODNgfndy05l1M6Sfwpyw7hGMpddU1PgrU76Mi9g/k0LN7Vk/HnYYIR8XHcqy371i7iyT
         fr96n5Gtr1GoEjxPyPnd9ZvCjhQF5wpHne7uXo9mLV7pFebxH9l8mnXGt1A4UjaMtTwr
         Flionze+rf+hnJRkO3aPYIfNBUDUlU3oeioU+ws6gCJhq2zYUQSf9sHscEesmzWPpiH0
         6bQA==
X-Gm-Message-State: AOAM530oRxtcUJaRAfuTtaYrXqeHAyHy0OLKJGMOq1IbQC+BLzkN6h0V
	InYbD/CUrkclO1jqAKTcY0v4P/HuJZDIR/Wk
X-Google-Smtp-Source: ABdhPJwmp7aqWfh5ffqGJ5JlKie4zKrX3VSkIclBkIjkrrv+xJjmjF+0zTklNK6IVhmcUcLT3fGFiQ==
X-Received: by 2002:a19:6d0a:: with SMTP id i10mr6110261lfc.367.1612649548469;
        Sat, 06 Feb 2021 14:12:28 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id o11sm1451289lfu.157.2021.02.06.14.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 14:12:28 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] ipset: update to 7.10
Date: Sat,  6 Feb 2021 23:12:26 +0100
Message-Id: <20210206221226.4052790-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-filter/ipset/{ipset_7.9.bb => ipset_7.10.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/ipset/{ipset_7.9.bb => ipset_7.10.bb} (87%)

diff --git a/meta-networking/recipes-filter/ipset/ipset_7.9.bb b/meta-networking/recipes-filter/ipset/ipset_7.10.bb
similarity index 87%
rename from meta-networking/recipes-filter/ipset/ipset_7.9.bb
rename to meta-networking/recipes-filter/ipset/ipset_7.10.bb
index 00b98ede5..b724233ba 100644
--- a/meta-networking/recipes-filter/ipset/ipset_7.9.bb
+++ b/meta-networking/recipes-filter/ipset/ipset_7.10.bb
@@ -10,7 +10,7 @@ SECTION = "base"
 DEPENDS = "libtool libmnl"
 
 SRC_URI = "http://ftp.netfilter.org/pub/ipset/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "b75c13689eddf1d95b396840a69dc04fd7ae4112b10b70594bc0405df7b9b30a"
+SRC_URI[sha256sum] = "b24906ba43e2fe322bd41863476761d749a4bddf5ce4c2265ba04b03bc7e9cf6"
 
 inherit autotools pkgconfig module-base
 
-- 
2.25.1

