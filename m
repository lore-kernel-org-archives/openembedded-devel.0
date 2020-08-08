Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.9009.1596906259267585133
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 10:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sMaBj9ve;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id t11so2669761plr.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vx3snfgK9EQxqoSbj9X/ipzs/FBNEnXMNKfZ59EGhek=;
        b=sMaBj9veUbq3oUsPh+sS3wq9X/929jsd0oG9eZ3ONjagWPXIVRCpdAb5ZU8hk29oCm
         CQeFlPzcbeJ6hQqmBWAKK4ckNZJMe9NIYbzgACr6jsZkOYyD1q4RMqsRXNJoP7gqHdSz
         j4Jh6Fv+gmQBcZBDyC6URkAIeb5IdwdJ8Ga8o6O6rxC4j2dfI0F3vKx6pcrcQhohSXKh
         IZlOPy5n8FQOf4y1A+OhzdtTOwyoFrtTukuQzRy6ldmx7CdJLb4P8ryx3+D/0l6N8lat
         Argtfa2SRPWqALdAvrG8YzCzKa5ZNWktCnqEaQG3cYuk0jdHYKPnDePWsrZC9UM8nGqo
         U1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vx3snfgK9EQxqoSbj9X/ipzs/FBNEnXMNKfZ59EGhek=;
        b=LMC/fvXYumpyEfPWsByBK30PwD3biyjXcAFcmO6AI8foBS+uA0RfWClcSuD3uiGKw2
         fP6tIkrcP8Jk4pEw39R++HTc8ZfIClfMTc7/NiRyjRyEkSsYOJSrMIaDXgVjolxOhl+G
         X7fZF2m21uuCtH4/5JniWwW83QIUa4mlJfT+pZFONyO+FmYs8UsJpBhj3mnlI6sZ0XA4
         Sg9VWjKTltXthIul5nH2/jB0x5mrDFOptl7UWJZoT6BHFPN0p0plqkUmAQQatr0kJXHc
         tW0LX2AyumJXG0RqJGbHQf2pt6rC5T/D03OnqNp0HmDEIrtKGKbFNbLeUW1VPgAbrFBf
         WiHA==
X-Gm-Message-State: AOAM530wO8PBPrHoA9+qbllJ0D4cXkCTkUwu9r+1T2OXYzAoC9BdHpCn
	yGhQtd2Hxhcw5a8z1/2fJdk+zyvpXZ4=
X-Google-Smtp-Source: ABdhPJzDQNJi1dDHvrokVudThNxzCOMYcRQefOz7LgE/ETVtgX+K2K0Xiwu3G89i6fBpGrz/EmHVig==
X-Received: by 2002:a17:90a:db87:: with SMTP id h7mr19729237pjv.51.1596906258427;
        Sat, 08 Aug 2020 10:04:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id j130sm14280225pgc.76.2020.08.08.10.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 10:04:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 9/9] prompt-toolkit: fix recipe
Date: Sat,  8 Aug 2020 10:04:07 -0700
Message-Id: <20200808170407.2326879-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200808170407.2326879-1-raj.khem@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

Add python3-image to rdepends since it import colorsys

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
index b4d20c2cd7..78fdbca4f2 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
@@ -18,6 +18,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-wcwidth \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-image \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

