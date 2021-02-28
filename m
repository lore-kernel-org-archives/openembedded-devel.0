Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web09.5276.1614554464447728036
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 15:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id l64so16254939oig.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Feb 2021 15:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KHAbWCPW0Ch8XrgUbvp9Q5inyJfxgyt92bnO9PpMj5o=;
        b=INQ3Td4QtOByFuWJL0Snj7dgkfg8SUMQKeycjntIhDQv8N8zbcUND0Rz/7jHRfWlpS
         Q2h682s+4gu558cwBFq5KwqDeWQkUn/vDJL7lROBISJFOv13OtL0gmxQ44NJs5Xeb+qg
         fBhHwmsF0XB3lmr0UHxT97O+fNH9IeKHKV8xHmCJjZzPQNgZKbwMOyqLzgDenJxHeBLQ
         RVR/P3o2oi2F05qnQiiV4vCAOGXyfBKVzWQB2Gn/+YNHEC8Mvf5U9RJ5hzGdb2UCcBd5
         fAdTKMfZ58IlIWyGx882zMJhM0DzDfzd5PqnZ54FWPZ8u6Qi8wNN0TxNhj7Ivh2EhPN1
         JIEQ==
X-Gm-Message-State: AOAM532grqKd8P4B1Y4sfxU9FNNrU0XTIpHhxyggYR5zpsSP9jkdFAO8
	wgBnVvQFGqxS6phKjNWP2flp7YqmI0nDwA==
X-Google-Smtp-Source: ABdhPJxmdrA/dPTeiSLAZzfhI+md9HqS5UERqWUjlKSLllfYuMQ3byb7Stln+GN7ess6E0vA2ZvT9g==
X-Received: by 2002:a05:6808:d48:: with SMTP id w8mr9445238oik.166.1614554463294;
        Sun, 28 Feb 2021 15:21:03 -0800 (PST)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com. [68.201.52.49])
        by smtp.gmail.com with ESMTPSA id g11sm3112935oif.9.2021.02.28.15.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 15:21:02 -0800 (PST)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] freerdp: Upgrade 2.2.0 -> 2.3.0
Date: Sun, 28 Feb 2021 16:20:57 -0700
Message-Id: <20210228232057.73713-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 .../freerdp/{freerdp_2.2.0.bb => freerdp_2.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.2.0.bb => freerdp_2.3.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
index d446a31a5..8890f6ce9 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "d2ba84a6885f57674098fe8e76c5f99d880e580d"
+SRCREV = "14c7f7aed7dd4e2454ee0cd81028b9f790885021"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0 \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
-- 
2.25.1

