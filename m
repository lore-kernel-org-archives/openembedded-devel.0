Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0695C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:56 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.58178.1702626767509940515
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AInKGrIQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-551f9ca15b4so373051a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626766; x=1703231566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltSLUW8kU2c+IsecmorNJ6tQK4k1S6DwO48Yj5W1pEE=;
        b=AInKGrIQxwbe62gkPts/n95jzvhy1OrsRQtWOiNZLUm8qqn2nFhy+auzd0T5nKaPL2
         d8A6DnIfwRSvmt+Mcol81GYmaq8iEYg8wdQuH5YUJHiRQNL2nTpz5YQvgIrgv68oi3gM
         KgqiqA+oOFxty0zmbahRWtFkIY0P/3+dpdvRwwSq9Onjbr5sUYDJEbEpAReCYXgY2fv4
         7kX5BY4TPt1PhU3n+ptSsPBwLeVL+LH2IR/ZWOP2QcLhVtDCguQTzS+wV/QtBlKPsHRV
         DEj1TSmR7Z+p5FVqbNBExxgFA74epKPO/d9X6zoGmemH0L7HGQvzyvcMS6VW39TlKzix
         lyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626766; x=1703231566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltSLUW8kU2c+IsecmorNJ6tQK4k1S6DwO48Yj5W1pEE=;
        b=Bs7iS0LEEJthIbAOd17y4bB8PvUKh4AndjLCzxxFW27Cw/i2FqsD5PXUnBuJcwpXMl
         VRY+gkCB/w1YelF76XDFVeZWkSVe64lZq2+H686EDCp9RJXGhhsYhvL86SvJbYKx9L+H
         B8LS86gvIR/U7hwmhh6OhQvrg3nOL2bi1E/BiOz3nb9E8echOcL9XWsqFZ4ERs+kHtPu
         TyXC73+W3TM6QfI9cgfUNTII5f+xoiqDeJ28kCr6UgAUbXtep/x71IOAJFkUSPlNW/Jq
         mwAir5+CVGP9FKfYtBnmMtnJGTeGFZOKOOOwmEQUZdhSusVIlXvg5Olm7C9VCn9sJroT
         8lBA==
X-Gm-Message-State: AOJu0YwDm98Sz0R87yplixeBycMjTNSMY4/F0q6v6BkRio3fKy95bVOY
	TjuKDUEd9uAaaZ6CleVT5zK5zBWwLD4=
X-Google-Smtp-Source: AGHT+IFKNMv3i7sUf9tBz7FGLUiGvMqGrTmJMmMyWqXLtfURqRh1YNzdGrgu7Y8ztraqlswqXCqI0A==
X-Received: by 2002:a17:906:5352:b0:a23:124a:a6f1 with SMTP id j18-20020a170906535200b00a23124aa6f1mr776884ejo.142.1702626765835;
        Thu, 14 Dec 2023 23:52:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/20] python3-pyinotify: remove as unmaintained
Date: Fri, 15 Dec 2023 08:52:20 +0100
Message-Id: <20231215075239.3049865-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107494

There hasn't been a release in years, and python 3.12 is no longer
compatible as it has removed the smtpd module.
https://github.com/seb-m/pyinotify

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-pyinotify_0.9.6.bb         | 19 -------------------
 2 files changed, 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 3b9a0f048..af1b7ba92 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -321,7 +321,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pyflakes \
     python3-pyhamcrest \
     python3-pyiface \
-    python3-pyinotify \
     python3-pyjks \
     python3-pyjwt \
     python3-pykickstart \
diff --git a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
deleted file mode 100644
index 8dd5e1580..000000000
--- a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Python pyinotify: Linux filesystem events monitoring"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-smtpd \
-    ${PYTHON_PN}-threading \
-"
-
-SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
-SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
-
-inherit pypi setuptools3
-- 
2.39.2


