Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.496.1588806544333106820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 16:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WITH3Ouy;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id t7so1274633plr.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2020 16:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/kcDU9A+GEoZX16z4hIkt6lX9QXR1EH4dmrEi19EH3s=;
        b=WITH3OuyrTdq1pZe288XvSXO24oxlh1N04ihFOzlzTmnqeBJJVU9fOO2+V8b674RM/
         q5DzO/O3modkXqAS9r1qiAiw3VJxO43rlFFYJiw2nz9EdcBaAQyfdBxYHGvwXmsg6xXi
         J7VgbWezNY2s2r5LH7HQmype0uJqLD5R+/VTS70IigYMyJ9ASzhSL7RIZRCaNIik97Ha
         7XTo/sDO8II+anVG2//kFyw1wTEPQdH9Yx+O3cWEQ/iPaHEZHzNzLYuLvBhg8itZJPzr
         ieYmoBceedTwur1fMkdW3BkhDBmKLgvsD1mvezzqQ0tvRjpCtTzKeaD2BdG7MM2tPuaG
         0qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/kcDU9A+GEoZX16z4hIkt6lX9QXR1EH4dmrEi19EH3s=;
        b=jSjKdH6UK+9FuxTnDvXLMfkIUsZQgUL7yShVYnnPDVtSw1vrBUyB/XQU4m0xsAfmVJ
         gNg/g5P/ZzXg0O2lKIfYegJXgNL3EKh5vrKNwZjoiLEMt107Cje1CUQ8+kNmeicvCqHZ
         6pLeZcEsKrGKRK3a04uBiKETuAdzRoXRPgaYr1aMo928c+99NhDNxJeDBk5Z+rlP62ju
         I2B88ZR7AVjbQF0DECgKX1LjbI83ceUw8qPuVZEjVIkJtBED9NMBCiLfUsi44yfdmzHo
         jK4xdiscKBnxbNn7Ylc/JmjSGAHyl9FE0jPHWnX1LEwZdCqg37nQ2zFokKoTBKV7Mjte
         gZ5A==
X-Gm-Message-State: AGi0PuY1jS21JrP+lORXh5qB7z3eWBggyGX7zfu5xA7hmpVVtwU8LWzT
	2QZjUqb5wt09mDP1RtqzAPy/8rfS3U8=
X-Google-Smtp-Source: APiQypJq9tVBOLA343GQZx4oEXWyVie6IShRqYNBz36gPXZjvS+k4e8JbVM2yjwKEJOjjyrWAA0wIg==
X-Received: by 2002:a17:90b:601:: with SMTP id gb1mr10541288pjb.148.1588806543295;
        Wed, 06 May 2020 16:09:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d90d])
        by smtp.gmail.com with ESMTPSA id f9sm2334102pgj.2.2020.05.06.16.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 16:09:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] con2fbmap: Add recipe
Date: Wed,  6 May 2020 16:08:57 -0700
Message-Id: <20200506230857.886136-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

con2fbmap is handy for debugging OS bringup on
TFT/LCD displays

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb

diff --git a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb b/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
new file mode 100644
index 0000000000..45203f029b
--- /dev/null
+++ b/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
@@ -0,0 +1,17 @@
+# Copyright (C) 2020 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Simple utility for swapping an fbtft-based device as the console."
+HOMEPAGE = "https://gitlab.com/pibox/con2fbmap"
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SECTION = "console/utils"
+DEPENDS = ""
+
+SRCREV = "61ed2f28b294b1ebeb767df8cb5fcd391709c8e2"
+SRC_URI = "git://gitlab.com/pibox/con2fbmap.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
-- 
2.26.2

