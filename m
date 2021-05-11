Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.10855.1620728832946239437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 03:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qcMg3mSn;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id di13so22238401edb.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 03:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=brVVSmayd+4rPpUbAlP6JJQ+sFab2goMTd2Usk5/Kp8=;
        b=qcMg3mSnGp5PUPp2+hYjnVMQ3b/3m9MxJMr9VesL0Hccn/+79at/6vVSjJT3YPpm1w
         1K6+FjK097mW3AuJtWiMzpsagqraJ3TkLAu1M3OhwyqHuSr0o+sOLxISa9WBKQ9QTaNX
         fj/jQKOGcTT9tH43rtZHxcHi8bXzI1jUcnEFy0lPWbEla5g+jo4p3iSipX1ddPku8Jh2
         cZaW78Iy0JnoTw3HeXyflGZ3+IdwGj1IoP5p2JzN19n2HOzs24ThI6Woxy5JNd09/s9I
         n5TLJSoVxupoiglOssZuuYRPwvFyl3mY8eUCpFJnk/cA+P2tWi5YPsecBhZWGnEuqFDj
         Uunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=brVVSmayd+4rPpUbAlP6JJQ+sFab2goMTd2Usk5/Kp8=;
        b=oqlM3RtYdHjxxyjZGPGyGEKq5TlYJvMmFrOE3GkhHl7PSZ1vocT5RBqlvvOqfd3Yre
         ejONJrzAUIcY7fENjIW6QntpO4B/nS0X2bjMAWGE7R070bAZWv4z0yXr4uNTuiwOzWx2
         o0sKg0wbZQ2yXVnq1CD6v5Q+DFKMS77I8WhrmoZ9WYAx9X33ec57MxQiFiqNuxpyyHWa
         e8hDM7xbkdJvrb9cbWR9RBn8AIVsCeV1YmR6yGJ5c1mKjPBZ5ouZeBpmYS0Qy1KtubC1
         zxQ4EJmTVTc/YUDMUJccABo86lwxikGyyy1WmOzR3YADhJVHqsZ7lwkqF9H4hatYnfUK
         /v6A==
X-Gm-Message-State: AOAM533byoQPpWRzVSm1ekWC6ZzA15CQ1iChpeaejVQaLIKsi+f1kgaZ
	pQ83Aj4vE9pPWybnLb/GATHPFdXXZMbMPQ==
X-Google-Smtp-Source: ABdhPJx77wpPWe5YtUrDYu4Q7QZf0F/s3tlYCA8cdS4ti/L3wq5IpafZ32phuGjMHLtY60pXJPvWTg==
X-Received: by 2002:aa7:d5c9:: with SMTP id d9mr35582230eds.153.1620728831032;
        Tue, 11 May 2021 03:27:11 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan (93-50-192-18.ip153.fastwebnet.it. [93.50.192.18])
        by smtp.gmail.com with ESMTPSA id ga28sm11162066ejc.20.2021.05.11.03.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 03:27:10 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.20 -> 6.1.22
Date: Tue, 11 May 2021 12:27:08 +0200
Message-Id: <20210511102708.122706-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...{vboxguestdrivers_6.1.20.bb => vboxguestdrivers_6.1.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.20.bb => vboxguestdrivers_6.1.22.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
index 9df2e3960..a074d0a55 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
     file://add__divmoddi4.patch \
 "
-SRC_URI[md5sum] = "f2fe05e72c37d40afb36b9fb3aa38b78"
-SRC_URI[sha256sum] = "e690c91974a2e7a5aca2c0939ad514382f9a2136797a5e0b96aab778e42bc8a7"
+SRC_URI[md5sum] = "abb1a20021e5915fe38c666e8c11cf80"
+SRC_URI[sha256sum] = "99816d2a15205d49362a31e8ffeb8262d2fa0678c751dfd0a7c43b2faca8be49"
 
 S ?= "${WORKDIR}/vbox_module"
 S_task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1

