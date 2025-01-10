Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88BDE7719D
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:09:21 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.685.1736539759358560735
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 12:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-84f1ea04c64so123442839f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 12:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539758; x=1737144558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnTIFIoQqcmvls0/OUBZ+CffF0U6a1gEzh324KWOkko=;
        b=b7XMGsVKmuYQ+Z7WoddG73WF7jMcO9BL4OQW1L6GUxPyzwK6ZfRT/bYlawqz++gGG2
         c4EsCaIeF/iSNqYT1WlQ+Mv7YibSRUO+t2JDFyfYS/3HqA7zlofeEqG+EEpdQ51lyZNj
         By9I+wpmPa/ocrXPz/muhjgH+8DHAcfXEXKd66ENmo3kSUG3zHGBxFKJ2fIxsZbq/oY8
         0zAUB1Shx7/fQflQA8XtMsmYsqwjUbFpWWuY5MxbwY8ZeBJGMuPwq15a044JRwT22EmC
         Viv+OkzyZCBLogcL7iD01e5qD2nYI6p9HstizLk5HPiw8e0LmGFJSaychoInoGvt2tFT
         jk2w==
X-Gm-Message-State: AOJu0YwhJy10ikytCtcNrvNRgnU9hKTlFQoPQN2416Y1OzNLCmiiWCoy
	A8UFfFw6fZjzouij0oVOmsAk3ddjpHEe/0XO3uC5dDRJp3/uUZmBBuu3Ow==
X-Gm-Gg: ASbGncsgWH5dMShlr28YECclmUf260u3IsA7Y+YPEoxVLbQlVsvCij1FPSmM2xcULZi
	XNzxpN6hKFAvuaz6QfV65Lax+w4QNR/AnHDrZ34Pp3Y9ZfeKOU2QEWDRYTUJ/pTyDZk21u3L/8a
	Bzfd1EZaNdWbQzOBP04Hvz5SxxvwF2NWtqz3vISpSbjvzB9tnMt21vuK7tyRySzWQRXPac/pshi
	dJdGk+0KuLyW8hs6nKGienPgUfprUVDA0dVnniV9pRmFIO4tzEXYsGbmP9SPSzEfMni00SOt/UH
	+pIiHBgSd2CPrp3PVPTmis/VgA==
X-Google-Smtp-Source: AGHT+IHKlPNsLPrCRsjWpfxqcg7AMTo64EVLjfQw/mMQfSgWPshCRfQ6Nve5cO2u1To7tdESeAL2ow==
X-Received: by 2002:a05:6602:3685:b0:847:22a7:240e with SMTP id ca18e2360f4ac-84ce01a4b45mr1113610639f.13.1736539758232;
        Fri, 10 Jan 2025 12:09:18 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc84dasm104467139f.46.2025.01.10.12.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:09:16 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 10/13] python3-u-msgpack-python: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 20:08:19 +0000
Message-Id: <20250110200822.3958062-10-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110200822.3958062-1-derek@asterius.io>
References: <20250110200822.3958062-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 20:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114800

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-u-msgpack-python/run-ptest       |  3 ---
 .../python/python3-u-msgpack-python_2.8.0.bb        | 13 ++-----------
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest b/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
index 6cde243fe..e95e4bbfb 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
@@ -5,18 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=17df11353545c53a2df0ce7655859306"
 
 SRC_URI[sha256sum] = "b801a83d6ed75e6df41e44518b4f2a9c221dc2da4bcd5380e3a0feda520bc61a"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
+do_install_ptest:append() {
        cp -f ${S}/test_umsgpack.py ${D}${PTEST_PATH}/
 }
 
-- 
2.34.1


