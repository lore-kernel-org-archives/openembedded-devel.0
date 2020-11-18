Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.25629.1605712101606890308
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lR5lsGbU;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id w4so1357937pgg.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=qmlkd9le8QLseK2rawLQQSI56DYUkPbq6Phd28GhNns=;
        b=lR5lsGbURGarU/AV7hrwqFEXdPxpoTo0xj8929UwoiWrneKS1soHrgRLiqdQUPxhWm
         XE8OnwF36xc0xbpGipELiEY5Syt/LteyhrwAYH5NwDTcvZGS1NgxNwcZe9pGFy8jn1mo
         mN/cgDsiihaSRHv0RZA+N+1JS57mLVTroikaDXgy2cE3Y7BxIavuF+RHNRSag8vsmH5u
         COnIQDaEjeL8sNlp9J75g77Gbc2TNNVDI8f3KukKqaSb0TWf54dviNIFvd7pl+EMG9Ic
         LB8lyw6RjP5QM+3quP2fGIdifHT0mQ7vp6yGxpzep0dBL0eBre7vY6EtZ+KnumA9xzJg
         aryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=qmlkd9le8QLseK2rawLQQSI56DYUkPbq6Phd28GhNns=;
        b=SmGkycVlVJ0jvfa4lon2RpiQ79JsgvXI+xVWfD99a6mSq9LrwfKAjI6p3jlFdKjrUN
         gucJm8NCtCTtTX4SeTcdxApMwkWYG/qYm3aAkCOziWuHUQQ9uTTUeBV3IbnOA/HLrxoU
         FdzTOF4W3RbeIZOsMKZmukLVvVn8l6gtuUs1Xy3V+Oej8RJbutxXb77vhHJhbdn4E0za
         RvWvz0xiq8PuQzemkrJBu27N3fteNl73JkxzWsYgK9Gf4tkI07a0feM+gHgQehh2ZgYr
         /EB+znAIr/YuVksc2+bcWH8b3QiFFpndyhp4H7Zhusd1JvJn//6COe99Y2kn0KezSWe3
         CVrA==
X-Gm-Message-State: AOAM530o+X9TybA0E1mBkFo7F3EBrxvdCdDJhj0Yz9aL5+1HE1NBCgz5
	KWPVp+qaeZKiqo72nCZ2W9AzTi5p49c=
X-Google-Smtp-Source: ABdhPJyQQNbLGuiUGbwOJZBOYDwF7YufgFflJKuB4v5Ta/8vpocicE+snJPa8zD2G6LQ1BwLAqnvBg==
X-Received: by 2002:a62:1b02:0:b029:18a:b052:deb1 with SMTP id b2-20020a621b020000b029018ab052deb1mr4945523pfb.32.1605712101011;
        Wed, 18 Nov 2020 07:08:21 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:20 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 17/17] python3-pyinotify: Add missing ctypes dependency
Date: Wed, 18 Nov 2020 07:07:57 -0800
Message-Id: <f2d02cb71eaff8eb285a1997b30be52486c160ae.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Mark Jonas <toertel@gmail.com>

pyinotify 0.9.6 has a runtime dependency on ctypes.
See https://github.com/seb-m/pyinotify/blob/0.9.6/python3/pyinotify.py#L82

pyinotify prefers ctypes to inotify_syscalls. The latter is only a
fallback.
See https://github.com/seb-m/pyinotify/blob/0.9.6/python3/pyinotify.py#L129

Signed-off-by: Mark Jonas <toertel@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
index ab339531746..049c3c3cf76 100644
--- a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
@@ -3,11 +3,12 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
 
 RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-smtpd \
+    ${PYTHON_PN}-threading \
 "
 
 SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
-- 
2.17.1

