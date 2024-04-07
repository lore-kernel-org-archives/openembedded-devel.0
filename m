Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15CECD128A
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 21:25:27 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.92276.1712525119014013137
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 14:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l7yWgiwc;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a51c37a5025so123380666b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 14:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712525117; x=1713129917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U1TzuPOzxRisPWgS+2RWZK7jc8RUts/z5anpAdEpEXw=;
        b=l7yWgiwcheFAiUgoLIDHeH4L3s0xegblSJbPj0Qjvo5eQvcUOAojhnU/r5xmn7q+Z7
         vFN89nsQY0T20EmZ/J1NljHrid7wwqh3PO2Fs961aH6i9kF4EHG9VW7YL0XI9xV6I+Ww
         HuqUUmGg9UKu1bwdrOLkrUv8vIDUPLsS685miO8ZcKllWURYdFuvO8QUsHSkaIKb/3wK
         Wst6msFHRChy/Ge/DI12Fu7irnmqKjzpeLOkyrlcaTz1vcesWf1EdCvr7mJoCqHIGP6j
         5jZ2crY2KBQMeQrFXFbiyKOlwDKO05ycpJ8ek6KBknM3iD7jHqpmQI92MdrD7KPIEKdG
         Lviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712525117; x=1713129917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1TzuPOzxRisPWgS+2RWZK7jc8RUts/z5anpAdEpEXw=;
        b=CUBcmCZU6oBdDXNKv538+M9CMr8nfdbYfMqafVN12XiCUEMHHZchjMctdjOLmGn3VW
         Qu1hj6w/ouWuqobg55JKqo3biiIAqj7Nc/rDJ2vrBldhVg70ywBWUrXZ4QGGwwBBlcV8
         UfS9r5/ZHauw6gCcI2xOq2UxKAnc6aKhTjC1Z4QV6sWK8wbZR5VJsbMrLi9FzqsHrKoL
         QMkNvTTRF88Cuma3pw/TpyvoCGVc8K57IPtzsEovCwGrOGKhXDSJ8hs0fxgpM2anC4PR
         Bl43ZYSmZcRqfFSffcahSq59vK3IF/mecbB/I0NbO+AHv7PMP531vcs2LibVHIiE7St8
         mieQ==
X-Gm-Message-State: AOJu0Yz3KCmJZjCxEMXQ5npFVw6RFWG8iXUN2nIjp6eZGiqv4ZZN/x+F
	N2RZjogDDKfDhm56vGsb0CK5S6TwNlThKFpSskN11uBRxXBFUbxKvr9q3maeuDk=
X-Google-Smtp-Source: AGHT+IH8yy8HAsmvp3PQ3nC5EeFYDofhfVVCpdy7XDIItAwyOMT9vfdf/BpsLCtbvgx8i0/4GdtjCQ==
X-Received: by 2002:a17:906:234f:b0:a51:8aa8:56b7 with SMTP id m15-20020a170906234f00b00a518aa856b7mr4316659eja.35.1712525116666;
        Sun, 07 Apr 2024 14:25:16 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id dr20-20020a170907721400b00a518c69c4e3sm3560974ejc.23.2024.04.07.14.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 14:25:15 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-casttube: upgrade 0.2.0 -> 0.2.1
Date: Sun,  7 Apr 2024 21:24:42 +0000
Message-Id: <20240407212445.667665-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 21:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109852

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/python3-casttube_0.2.0.bb             | 13 -------------
 .../python/python3-casttube_0.2.1.bb             | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-casttube_0.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb b/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
deleted file mode 100644
index 64948d2e9..000000000
--- a/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "YouTube Chromecast API"
-HOMEPAGE = "https://github.com/ur1katz/casttube"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
-
-SRC_URI[md5sum] = "4bb24ba1639d16c8fa367537bf3b88a6"
-SRC_URI[sha256sum] = "f25b3c634efe702896233690f7590e8d6311590910f18dbb763b90419d9ef53c"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} = "\
-    python3-requests \
-"
diff --git a/meta-python/recipes-devtools/python/python3-casttube_0.2.1.bb b/meta-python/recipes-devtools/python/python3-casttube_0.2.1.bb
new file mode 100644
index 000000000..af3daf016
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-casttube_0.2.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "YouTube Chromecast API"
+HOMEPAGE = "https://github.com/ur1katz/casttube"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d3aafde5479a4102b867156e2527a34e"
+
+SRC_URI[sha256sum] = "54d2af8c7949aa9c5db87fb11ef0a478a5d3e7ac6d2d2ac8dd1711e3a516fc82"
+
+inherit pypi setuptools3
+
+FILES:${PN} += "\
+    /usr/LICENSE \
+"
+
+RDEPENDS:${PN} = "\
+    python3-requests \
+"
-- 
2.34.1


