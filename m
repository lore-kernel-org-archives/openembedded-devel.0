Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.1084.1600367371445501141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2020 11:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries-io.20150623.gappssmtp.com header.s=20150623 header.b=R7rim7WY;
 spf=softfail (domain: foundries.io, ip: 209.85.160.194, mailfrom: ricardo@foundries.io)
Received: by mail-qt1-f194.google.com with SMTP id h6so2703691qtd.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xWw4H3e1aw1PKfXDduMMa4VTND2pEIrmAoKwT7ygS4A=;
        b=R7rim7WYxNX+h1COCWiZpnQSYGLRPN+HNZq5VnDBsomMWz+BMXokG6w5qac3rbnKW8
         P+VEup53LH3JVLOBdZ7oh74kRlFMnXgZMIgL0PWdkOLjmZrcuCEJ02kYNbbCiodJJ11c
         liR4B1dXBWnNLmo4zQSpLxpd5neid1lIukeVnHCOcIVrUPMKxgtjjY3fuUr2SNmMrZqO
         ELviy4pZ4XkzzAg1dxyafdMd2Dj7sftPbqXmbui8NUBL3TjEXAppVtBPc6Wn66jnd07Z
         +2Gl4jZsTi6E+/d89wUZwbGQS3OR4+M4Puch8EJUDNNG61jkqGxKYeqQH6I+VBAn8Xvc
         B4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xWw4H3e1aw1PKfXDduMMa4VTND2pEIrmAoKwT7ygS4A=;
        b=movuuIQvdwRy6yjSUJoMqGtBc2SNVRrnsmMtadJvGwaX0xR1BbITEi+l8jXQ3McxvO
         JBMnouZfAy/WdOzA0mdTPJj4IySsH/X9Vhl/lgWUsnKPn1N/aYR40GnQC/2vbAxpECq2
         nmV+HUI2Dz6nI2Xb5TP3YYnvlEGDaIuecNwsyhhp0GU4WdeOqZ8Rf6cNxg22iD8lL1Og
         q6ox/thm2ksnj1BrsUmQBbsoZ1uGFo8PGudXvudBp/mB8fSdQmbpjKzexfuFPkG8qUgH
         kRkYLm4qUSAeBNl4tL6Pk7szQ2LS3iT5RnMshIW2mqpz+Ir0fO/0BV1s6nTAvWIdJwnG
         i0Eg==
X-Gm-Message-State: AOAM532+iHXVaupuGmDHI4Gma4i9JGe7bSQe+QFuhnqHYR7vlqhCSAPu
	OrgDLzqwT9nG89ZBvL8jcH25D3iSKfL9
X-Google-Smtp-Source: ABdhPJzN4pxZT8MQylO1kr3XNuqDr8Zyst5QP1MObDER52o/kzry4o6LkoCLhDoUh1xilbJ08b9xbA==
X-Received: by 2002:ac8:6f0d:: with SMTP id g13mr30187393qtv.236.1600367370141;
        Thu, 17 Sep 2020 11:29:30 -0700 (PDT)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:f722:44f9:7b2f:8a1f:cf52])
        by smtp.gmail.com with ESMTPSA id k185sm387415qkd.94.2020.09.17.11.29.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 11:29:29 -0700 (PDT)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pcsc-lite: upgrade 1.8.26 -> 1.9.0
Date: Thu, 17 Sep 2020 15:29:04 -0300
Message-Id: <20200917182904.22753-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- SCardEndTransaction(): greatly improve performances (x300)
- tokenparser: accept any Unicode character in a reader name
- Use /run instead of /var/run by default
- Fix a memory leak from a polkit call
- Some other minor improvements

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 .../pcsc-lite/{pcsc-lite_1.8.26.bb => pcsc-lite_1.9.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.26.bb => pcsc-lite_1.9.0.bb} (92%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
similarity index 92%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
index 91d77ac93..6f38d65e0 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "\
 	https://pcsclite.apdu.fr/files/${BP}.tar.bz2 \
 	file://0001-pcsc-spy-use-python3-only.patch \
 "
-SRC_URI[md5sum] = "9d36882998449daceec267c68a21ff0d"
-SRC_URI[sha256sum] = "3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9"
+SRC_URI[md5sum] = "eb595f2d398ff229207a6ec09fbc4e98"
+SRC_URI[sha256sum] = "0148d403137124552c5d0f10f8cdab2cbb8dfc7c6ce75e018faf667be34f2ef9"
 
 inherit autotools systemd pkgconfig perlnative
 
-- 
2.28.0

