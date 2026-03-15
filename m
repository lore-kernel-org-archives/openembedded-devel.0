Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF868F30283
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 20:24:56 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36377.1773606286742492615
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 13:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ElHp2aNj;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso33801995e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773606285; x=1774211085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3lHDIMPwoCxtITY16fr171BaDkXuf/nZFVKfI0rnJo=;
        b=ElHp2aNjk4tRE62ZbixsfdaF4RMnIf3CpMlGRnCA8l99TboQXQOr9I7Z/Ngi2RgZl2
         K1ubnKzEn5C2Mz6wKOtEuCrroAn5r6AVCOfX5rbpejrRRRllAuZ9RDeS7thZZtJT/fyI
         0FLG+AbtCBe2qZdAF/KF3TYn+YTJP9WmN2edyKtZJ0Au+plhRVutetrX/NV4mLjqxsoT
         Nxdj9PsAJp4CdJpMYcGm5654iU0k4xrzkF9aHFxFgqLY6qOGKFKF22Ydop+sCb+A5lLr
         7J8RCplEM5LoGbzEWTt/ypL3YhXhgb3MMb3W7vvPbTewVYyUr6jAUeb4XPTWqbnkXw8l
         8U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773606285; x=1774211085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3lHDIMPwoCxtITY16fr171BaDkXuf/nZFVKfI0rnJo=;
        b=lohDb91cwF1y9mbsrRWGtOCfGIyAfEL42aA2uTRk/oEbD+1YiBqvIwYfhMypBEkBve
         4PaH7+aLgPtP2uu3SIT+4gj6dUpOZMS8V7o1B4WZRRSlDFxy/G/qWQIGR5sZ8pcr54SC
         nwgdzfcdBINpWrm754zN9gecGM920QzyKiN2jaNszcwn+HMkkKrHEXMWKjvjAKbvJXry
         GxpnvY4xJFPlwnXDgGdHb3CY7NnW2qHCpAszuEYEUdoJ3JRiqQo3rQpRRHKvBJysKHmX
         DWEJGH7T63cO1DesotZ3ay1kL5DQ/ZukWOIxlrBi1+wKzxc6zQBDpfQAQW9a8Vht8spO
         qwgw==
X-Gm-Message-State: AOJu0YyCUWvKGDj9dU5++NRUxckAuFkSxw3JKiszabV1P6lUQWIBbXvG
	zRQmz3gNf93nxhefunxTRZV6FDbkMhG0F5QD0200VAfHTrkU6bmOxeyZCnBaxA==
X-Gm-Gg: ATEYQzw4hSWzgEyzMjR7m3kf+gNBfudwfDVnSN5ekoEkTMyhtFG0CiLbFD68JjK9ejD
	1popDarext+J6lvkgTnPjsehjKidv8llAskce170+sTyR06xILcB09Z34tsG0UVrbxRYYL5cTkE
	gHAPfC1b7IR2a0orOvg1LWdOV+I7Gvrv96LJxPBzr43H3RxCRLUokqUAbEJY70MXjSjUUAFio9t
	6eDTx/v+fX1jh1OMrQ27vYMtcJNF4FEPLMIxY47tkO2gtzJVoUqXhv6jDR0KbozcKFGWns4lS44
	exaQRCz+0X9uPGpKvQdUJIHAOMIeKPvYckyixmhMtnT8U+weZ6woDYcm89wHy0YfWPWbWiFpAZb
	RVvZCIF0hDJKDeGaXPsAoy1gCGghbt0io7pAIE3LQv0TMH6kJYIr9kjEF1LX8gf7vctVomZZtRf
	X/Ta7pZhHeYxhBKE0F78sN
X-Received: by 2002:a05:600c:4e4a:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-4855649360amr183021915e9.0.1773606284685;
        Sun, 15 Mar 2026 13:24:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66e3f8sm366325615e9.14.2026.03.15.13.24.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:24:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-xstatic: add patch to build w/ Setuptools 82
Date: Sun, 15 Mar 2026 21:24:43 +0100
Message-ID: <20260315202443.485191-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 20:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125245

Setuptools 82 dropped pkg_resources module. It is not used
by the setup script, nevertheless, it is imported, and this
missing module fails compilation.

This patch removes this import.

Upstream started to work on refactoring their setup scripts, so
this patch is not appropriate to them - once/if they release, most
likely this patch can be dropped.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-remove-pkg_resources-import.patch    | 32 +++++++++++++++++++
 .../python/python3-xstatic_1.0.3.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/0001-remove-pkg_resources-import.patch

diff --git a/meta-python/recipes-devtools/python/files/0001-remove-pkg_resources-import.patch b/meta-python/recipes-devtools/python/files/0001-remove-pkg_resources-import.patch
new file mode 100644
index 0000000000..6278d58fc1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/0001-remove-pkg_resources-import.patch
@@ -0,0 +1,32 @@
+From d9152f0dc31b655654edcee6859b3e3a06ef4c98 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 15 Mar 2026 21:16:54 +0100
+Subject: [PATCH] remove pkg_resources import
+
+setutools 82 dropped pkf_resources module. Also, beside importing
+it, it isn't used for anything.
+
+Upstream has started to rework their setup config, and moved to
+build_meta, however that's still in development, and there seem to
+be no stable version yet.
+
+Once there is a new version, most likely this patch can be dropped.
+
+Upstream-Status: Inappropriate [see above]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index b655222..c2aff91 100644
+--- a/setup.py
++++ b/setup.py
+@@ -8,7 +8,6 @@ XStatic - setup.py
+ import os
+ 
+ from setuptools import setup, find_packages
+-import pkg_resources
+ 
+ # The README.txt file should be written in reST so that PyPI can use
+ # it to generate your project's PyPI page. 
diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
index f4a75c9b6c..bf542aba5a 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://README.txt;md5=1418684272f85f400cebf1b1a255c5cd"
 PYPI_PACKAGE = "XStatic"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
+SRC_URI += "file://0001-remove-pkg_resources-import.patch"
 SRC_URI[sha256sum] = "402544cc9e179489441054f09c807804e115ea246907de87c0355fb4f5a31268"
 
 DEPENDS += " \

