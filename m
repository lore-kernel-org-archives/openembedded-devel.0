Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545CAC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 19:37:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.54572.1669923428664605618
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 11:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=VlOin5Oa;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id y16so4508218wrm.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 11:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/1AfUBtIPrUwwtLxhVmlNBbVGFoxllEej31zGNVdAFs=;
        b=VlOin5Oa5Ozt868xLXjK9dAvED8RGYSbe/CzTsHKVE5BqamZkjrv6EOjCyyzHrn1JT
         J0aLbrkYysFd9AdKKhJnkvowIf/XIkGaPcL5Hz7qXLcc/ksEgvN/SiGrtwuTj9Xa5dVr
         SDsiQ/3ahTPVrPH+uzkS7O3XAz3rRgvZzDltp7LxndgtHiTPbKPGD7GVNZdHA/HX5+XK
         Xlj/XIuiy2/Mw0B51YijQfgeeCisNfOGhNDq0Zn1oFt9xSf651KVKq1XLZqCytnuSK3R
         qpZrOSK/e+wxkt445/zNttDiyQNBlRPHKZ2vgQr96L8V7n5tHn11DNndqHN/p+iDZ2y0
         0S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1AfUBtIPrUwwtLxhVmlNBbVGFoxllEej31zGNVdAFs=;
        b=dUfFJe9fYC0MKsBNs/BdyoIjdAS0BYoebugvG51uGiVRQ6fYfyx9M7orR7psCNWwja
         Wn8MfukLBlp17qwutmQBx7nTEbxyRGqAF71e9tnwSTT+1hbdj6DoHEPM8buWgx1h1+Y2
         FscLLDYhYXNEPwxwrNB9s1HKmNZxwUmKrIVCTSya4xG8pxVNhHnqGd21njz8Kj8njP2v
         L+V4/4kbntIW6HdSNr4UI4DJe1OR5fYtTMJyVN5BmgJlrILkTxMWb90HS7//OHAs40Vv
         DS2HNFQCQawl0r4bmoTRZx0w0UlJ/vYhK1779RViljHnW9FBfPUQwZdRKqNbVTUENqwk
         bJVQ==
X-Gm-Message-State: ANoB5pmJvpMp+5YJ9X5Q50UWMtR5SwUmtzRV9KOJwm9/+g/662lE+2bb
	Zf+AN+dWTb71VCHoU7S9oVJzbw==
X-Google-Smtp-Source: AA0mqf5rzbtYcLTPZTkeNFvj+vcQdXop050rCNGZL5EL3FDctVej+IlamVjcps1MVHJXLZOYf9jI3Q==
X-Received: by 2002:adf:f54d:0:b0:242:9e6:ea4d with SMTP id j13-20020adff54d000000b0024209e6ea4dmr18483220wrp.251.1669923426583;
        Thu, 01 Dec 2022 11:37:06 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:26bb:b860:c227:f05d])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600011cf00b002366e3f1497sm5193266wrx.6.2022.12.01.11.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:37:06 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-watchdogdev: new package
Date: Thu,  1 Dec 2022 20:37:03 +0100
Message-Id: <20221201193703.3568216-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 19:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99904

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for watchdogdev - a python module for controlling linux
watchdog devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-watchdogdev_1.0.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-watchdogdev_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-watchdogdev_1.0.0.bb b/meta-python/recipes-devtools/python/python3-watchdogdev_1.0.0.bb
new file mode 100644
index 000000000..3acb366c1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-watchdogdev_1.0.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Linux watchdog device API for Python."
+HOMEPAGE = "https://github.com/timka/watchdogdev"
+SECTION = "devel/python"
+LICENSE = "Python-2.0"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=47;endline=47;md5=ad880087bee2eb64e368954eb7b99bfd"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "776ba57a07aef0084466493f40ce20814a29f8914a10ef8177317d02559fd017"
-- 
2.37.2


