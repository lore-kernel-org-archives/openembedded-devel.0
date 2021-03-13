Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.245.1615616021498746555
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 22:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SkUgIlBT;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id n10so17249304pgl.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 22:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jvv43sumAEoNIw0OV9BGZkjERNmopR2B1T250xJrR50=;
        b=SkUgIlBTXOYbtVws7Kh8OLRM+RvUMZIzscU3E4zrve/FpxeHO2BoIg0rjeLeTs6XTd
         evIfWfDqiKWloBALtDU0cA3C0V7dygvdGxIyeC5g7/PY/ooiy9v32IymP/ZLOAaG2b3d
         yOoWlOYpLJnPAgyVehC8EIAHSS6qi0ZwTQU2fZbIXxQG1GV8EKbnHDHY4pyVI1ieICXZ
         o5lsTpp1QX7HLHqTsmyw9adPDgXZVDyJkJWmVlsuqQyuIsnkiU9Ojk4uSqkyx/jSm4eQ
         +OEWpODczl9FQ/ypWdKz8BAhtrUbomTy6WwYwB+CXxIyOAuQrjMamFAGu4x/rzJbfDD3
         GsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jvv43sumAEoNIw0OV9BGZkjERNmopR2B1T250xJrR50=;
        b=pYMU15dMYsyhnmbkxSonJQIhFqbFEtArCgeqN311VhVRRW+9ffDnOuWsNwCoktzUrs
         sZyon/tvVeZY0KRgj8G47bih2mvJYyeKWT4UE/xCKfmmfNHQJ24YGBIl6VExd4MM5WvU
         aR68nU3Du6wHP8kJj0SIJtdKgYfUPXQZUHkNvV6L6fpwMbneSJE2uIRgauJ8IXxFpvU4
         TlqKN5wa6HFzzA5AP0Av3ug/w6luNJtubqz8BNsl09eY3+KIVhcEHIIxzPvsaF1FrH9O
         8mRzvg0FPDwi9ltjOpba5fGGfIaHqNEC+lZ4K5jcbs3WiBJgGWHORXT9DM2pfgJSNvjR
         rakA==
X-Gm-Message-State: AOAM532LZSOUeGSS6LXRxnnYndgNQ+34x5jv7e4tHnsCgQWBKu3pI+/v
	VQkzuSv9XITtJGZG/o4LWotkVSMxeucMJw==
X-Google-Smtp-Source: ABdhPJz7y/OKOxXszqLU0gf4SrYYCL/C7PJ8SxjtNc6r7AGGNIDyiClXBpcahMsfTWeRKmMrenv0IA==
X-Received: by 2002:a63:d7:: with SMTP id 206mr13585111pga.30.1615616020752;
        Fri, 12 Mar 2021 22:13:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id 9sm6944908pgy.79.2021.03.12.22.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 22:13:40 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] ply: upgrade to latest
Date: Fri, 12 Mar 2021 22:13:36 -0800
Message-Id: <20210313061338.2624068-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set PV 2.1.1+git

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ply/ply_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
index 7d693b36da..bf91c7b853 100644
--- a/meta-oe/recipes-devtools/ply/ply_git.bb
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -5,8 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS += "bison-native"
 
+PV = "2.1.1+git${SRCPV}"
+
 SRC_URI = "git://github.com/iovisor/ply"
-SRCREV = "aa5b9ac31307ec1acece818be334ef801c802a12"
+SRCREV = "e25c9134b856cc7ffe9f562ff95caf9487d16b59"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2

