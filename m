Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572BFC43217
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 12:57:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.22891.1669294664285779028
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 04:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=dHKBmldw;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso3871305wme.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 04:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmgrDBDx7rHfOd7lRnjJ/OuKGgDL23G5T/nKORfZOQY=;
        b=dHKBmldwticpiYnSqkvn5UzZPLg2+2VhZmi8lor6Kf0C17Be/MRaSPiPzW8q5kFATE
         I8n3DYQJnS22h0XZhpqmaIW0joXY1v8/hq+LYf7J+b/vwIiZ7QkSgj3cLmQ/dzo2SFyo
         Kv5Ifv5AO32SJw9bnjV703YXh7LbObbI20n0MMCNGvWhQD2mpP+1SX06FsC+zVh3xBD1
         dgbWpnmJqSMfSInI5uR4juFkUFaVX3HefkXlwDNAisHM7oNPDQVcbbO3uIcysdMF2kYw
         rcFJ0K5Z6PDJiXHvJkkPEYAT78SjwjlYjDJAYR32nmC2qDDXav9O4PRQpeJTkdBG/JXA
         NcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmgrDBDx7rHfOd7lRnjJ/OuKGgDL23G5T/nKORfZOQY=;
        b=yEr4hTUG4MLhLtS5ShV87ucvoTsVZRrhl4bTmse8zQeRZOKWQCKHnrrggqAVXtuPwg
         aWIDQQjwOAfqee+JrFUID4qgjIHKmHCex+XWtkiigLJZZqVskxr/UAtxMzVdF2qQXg2J
         RH21BFmQncVZLf6dp/puiunINvNLaOd3HfVbq/5zqyy4R+bf6VEU1dgp8l6baKWVV8M3
         vWX/d1wCWa/aZCd9bch4iEjNo3IUB4ZoNsAZ/VqlWThHPThoYRFBrtNyQ7RYnuBUj0y/
         mM1n4krdLDD4yqWfXODs7O6ygq0Gl4KUjOVLaKc50Wwj3iGrTtSkkiGcWq2jGQ+fyU0j
         CPoA==
X-Gm-Message-State: ANoB5pkt4yOz1h3wVuRud7MrGKFOB1+XQMbpzd8dbdw7sd8yMBlJBEa4
	G3QPSD6T3pXyZuGDh1W1rrmp2w==
X-Google-Smtp-Source: AA0mqf6qlmpx+6/P7kIEig/YXkS3/roR5+L/B6jPNm6qT+j4zUIITMNoPb9eX0BXL08od92DKG9ssQ==
X-Received: by 2002:a05:600c:3587:b0:3cf:a9c2:2b04 with SMTP id p7-20020a05600c358700b003cfa9c22b04mr23484628wmq.152.1669294662372;
        Thu, 24 Nov 2022 04:57:42 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b258:a75e:9c9c:4c03])
        by smtp.gmail.com with ESMTPSA id m6-20020adfc586000000b002366fb99cdasm1335181wrg.50.2022.11.24.04.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 04:57:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-kmod: new package
Date: Thu, 24 Nov 2022 13:57:39 +0100
Message-Id: <20221124125739.2252850-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 12:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99713

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for python3-kmod - a python wrapper around libkmod.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-kmod_0.9.1.bb  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb b/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
new file mode 100644
index 000000000..2ec4d474b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python bindings for kmod/libkmod."
+HOMEPAGE = "https://github.com/agrover/python-kmod"
+SECTION = "devel/python"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6d62c2454850386a2ffe44f72db83d74"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "f3bf829059bf88eca22f4f549e17aa316cdaa14302bf2ba49ddeee60cea109ff"
+
+DEPENDS += " \
+    kmod \
+    python3-cython-native \
+"
-- 
2.37.2


