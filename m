Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EE8C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 11:39:38 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.36888.1707046774666324234
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Feb 2024 03:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZsYVO9TB;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5605c7b1f32so134687a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Feb 2024 03:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707046772; x=1707651572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6z/bs8miz0u3OhCrVNCWOFxcC3qnvWZfgJoC6VgpwA=;
        b=ZsYVO9TB3E6Ha/IRYmPhpczdzFy34oB1W6seuiolu4UlsnXqT/YATsNnCzAs4rxHyg
         Vh/CCMPFKig0TlnxMihL9k3IwNEC/iITfM2172YUj7B6jTRLogcskgJZwo75Vif5csGj
         4+L7XDazY0Xmee1vG8f1Qkphwgwpbtei3IcOde1Qir9a+TOLAE3kI/VLRK1/iCG7spfP
         wU5G1e+60PTJyH7RUrkAb1u5HwFCFdwiB7w8HcveQ7LzsMIXwZ7hBlBWoAZ4LPnAv8Sm
         5UODgfvQaMut0GKhHC7XiuMVQR/PVHogIMddP9AS6M9+9Sv0kdTUWiobNO2zEOJ6ZoHM
         6MqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707046772; x=1707651572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6z/bs8miz0u3OhCrVNCWOFxcC3qnvWZfgJoC6VgpwA=;
        b=iXe7HLtwbUZeWuU5DKA0GBK+FfPv8oXit9MPgs25D7SROORv8BFj1W9WWDKPv9+IUN
         nxZvvrKoPg/NclrMDF/qIXP18BS8JxXmUfkVJebTSWUHT1KHAHdFpCRTsGaosZ8vg2XO
         0h7xnGzFiZfOHXfTTL18g2lgshpYyV48A/6leONSWqBpbMAuEnjrBFGH/3HSQiUchYMe
         EPOaWhOvx1mxTA/VjHeDPQ8dNVpVWlNENlJAlsMXRbF22o0zfLaFlRGk+1wVM1K+dBA3
         YgYcP2s43smjZSWIlSopn8Hciu8FENgC4IkkaHov4PCWi5FL+l102wgIbUv6ZMSlugJ4
         1GGA==
X-Gm-Message-State: AOJu0YyPxQVcZQ0JRLJFOGjg/+FPgQdIyshTxM3ozgBeVRyJqo4lj/tX
	PNoSWSHiYykf1wQ4a0ib1zfrucpJiZ7LBY1WF6g/IfrWKVFJRB5qQ3uoT7wspXdVcA==
X-Google-Smtp-Source: AGHT+IH63reWiopeuXodhbNsGiLuDB2FPqOmin+QSrAwDZF9VR0g7co1kTvYaRBP8ZaGOM0xd9iEGw==
X-Received: by 2002:a17:906:d10e:b0:a31:61ad:6554 with SMTP id b14-20020a170906d10e00b00a3161ad6554mr7007789ejz.69.1707046772205;
        Sun, 04 Feb 2024 03:39:32 -0800 (PST)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id hy26-20020a1709068a7a00b00a375d7ea71csm1477089ejc.116.2024.02.04.03.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 03:39:31 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] python3-pychromecast: add missing RDEPENDS, and add initial recipe for dependency.
Date: Sun,  4 Feb 2024 11:39:29 +0000
Message-Id: <20240204113929.2629588-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Feb 2024 11:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108562

python3-pychromecast mentions casttube as a runtime dependency. Included is an initial
recipe as well.
Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/python3-casttube_0.2.0.bb                | 13 +++++++++++++
 .../python/python3-pychromecast_13.1.0.bb           |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb b/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
new file mode 100644
index 000000000..408dff87b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-casttube_0.2.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "YouTube Chromecast API"
+HOMEPAGE = "https://github.com/ur1katz/casttube"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "4bb24ba1639d16c8fa367537bf3b88a6"
+SRC_URI[sha256sum] = "f25b3c634efe702896233690f7590e8d6311590910f18dbb763b90419d9ef53c"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = "\
+    ${PYTHON_PN}-requests \
+"
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
index feae3174a..618aba4a6 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
@@ -16,4 +16,5 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-requests \
     ${PYTHON_PN}-protobuf \
     ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-casttube \
 "
-- 
2.34.1


