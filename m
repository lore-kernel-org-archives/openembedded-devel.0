Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web08.582.1607018679203465084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 10:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NlJAvAxk;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id 64so2796598wra.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 10:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PH7v+EE3c3aVYgpIKR7ioAzmq2ga5u6itc3sw4wpbeg=;
        b=NlJAvAxkOsInJV0AdoU72BLgQcDIAH905q+16gsIufTzMfLNIhe6bk2r2yNJjtBsT9
         2qgObVIvXh80fgVDGxFR4RjZk7rk71gxLayb7DK2fHT86I3Cs4Oq9MCjJ2jgJiM7TDxG
         PtNp/Asgtj9cO/ByfWXMvqnUIdcMXSi6wyKAqQiVijPZieKkJ/MSf5Js9VM6ZfGm/mSM
         qZJ3hs2HDQj211mL/4bR+fFmH/ACbKaqNPjnzCGpQDpGiWLelQ/lbX3QBCI9Zi+nGFQ/
         EDOKN7GEefF9F2cqZBUJb9MrCot+Xage555nsXdzrgN09fbcg3EDUjfU75vzF9JcobcD
         WrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PH7v+EE3c3aVYgpIKR7ioAzmq2ga5u6itc3sw4wpbeg=;
        b=UqLWU/yhcHesMKcD56jQh2K4mwuHMShvoyViaTQsXok0dtD9XA/8dQWm6MyWvMudRf
         ryk+kzNhHRpDD9gTZPwe/bHDNLgLeia+lcSFM9x0IcY913nlTpw2HvkqCHEfb9WcPUpy
         vef5oVxNvDIKW+JA9qBqTpwCwMtSdFK8UJRMYgtoi4fWID6f/bfP/I45k70am6uqfEFy
         2PunggoMvxCg6ZJQUOu3ye7mySKKEAm50NIvVeVQr8Q+5UkqDzyGmsOgGuljAnXGV9DS
         F/5Jt6o+nRQZ0GLkxT2o+r39A8Pi31WnEiVVow/4wkNFHQGkYEd0FD0KYa9LaCI2+cc9
         BeCw==
X-Gm-Message-State: AOAM531YmZxqU/J79CRfoCLabRU4iklbpGDEL0FZKsQTR96nha4pE4Fy
	sNVqgaIMdXdw+ABy8BKi/0zrPcsItYywlQ==
X-Google-Smtp-Source: ABdhPJxc7HDLUoD19eJLNcZuDfRlsYmhjb0Jju2HLVV9qGLexxKD2x9tYZF7pRkK6AfIuqhslCZUvQ==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr422999wrm.414.1607018677150;
        Thu, 03 Dec 2020 10:04:37 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id 2sm308090wrq.87.2020.12.03.10.04.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 10:04:36 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dbus-broker: upgrade 24 -> 25
Date: Thu,  3 Dec 2020 18:04:31 +0000
Message-Id: <20201203180431.1048894-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

See full changelog https://github.com/bus1/dbus-broker/releases/tag/v25

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
Bugfix release, nothing major to report

 .../recipes-core/dbus/{dbus-broker_24.bb => dbus-broker_25.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_24.bb => dbus-broker_25.bb} (92%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_24.bb b/meta-oe/recipes-core/dbus/dbus-broker_25.bb
similarity index 92%
rename from meta-oe/recipes-core/dbus/dbus-broker_24.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_25.bb
index 1a32b26e8..1f62c142f 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_24.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_25.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[sha256sum] = "024b54678d67edcc72ffe65c17d2495211bd20f2430b07ef1d26fdc93b4305ac"
+SRC_URI[sha256sum] = "a54fc5192280caf5824b82cb40f295c1195ad73c71bea5bd60218afb9df5bb29"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 
-- 
2.27.0

