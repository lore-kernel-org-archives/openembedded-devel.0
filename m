Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.14634.1627188756414675752
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 21:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j8svxcEq;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id n10so7937161plf.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 21:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3RtGBYq5RzKK61HniFzsMgOA8XQ7UkRfBct6kpoG640=;
        b=j8svxcEqBs52AeFm3v3MwIzJWtYmQkbLiPE3XnEuhBaky+Cbs2zZNlEaCvVezfAaiA
         hyVoYiI9wZfQ6KDFjK6kxxJA+AzHl95ryNUpa43ZiF+nkSRi2GFijuXxjXgvN25Pard8
         E9VUIxRJDNJ1JaCqCxMQAAF4okQhwAo2EyXNkhizL/dTdV2T0ht1YpkN1faiKFPJS2AS
         9p3+b4AADh+GWECR2wJ41bXkRaRZC9c/NajxCW9Gfrmk0FxSEHCuzjdyg+k+Krx1pGzn
         kcVQiWt5Z0UIam7G2qwjygwCx507qO2jd6SiQLef+pG9X9MiqfJgs9Q0XTNxSUa8YpjR
         QdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3RtGBYq5RzKK61HniFzsMgOA8XQ7UkRfBct6kpoG640=;
        b=lstTUbcXZunD/oxrJi0gc9ykVbqppgOf2vZjziZ4vttHQHf+50lCoiO2UspjBUGXUN
         /xxlepfCWCWXF7oq7lNU1sXAzzQWfvmNIM2wMLej4t76PuBXGCiPCJpR4v98QEsONKQN
         EJJA/9D0r2VYDwyYTXwRjML5yx180RrIFNisp8OXc6hX2BiJrXcgYALcdZcAsXiXXK/y
         lLy4DJQDU48PJEbSMcxVO6LlyIo1OExcYbegqgPkS0eVm/eZq4A+Ogx1qeE5zawnw83y
         d/ql9ou4f7mHvSPn+V4KhRo+ZNxu+8osqmNWJ1pFqqVxqkXiC6JDbgNdILDjbgZPLWrr
         5jYQ==
X-Gm-Message-State: AOAM531y9i11b3Pyv69C+uIBb586Yb3SY6qt5zWS1voZgd3FVsF3P7xL
	9WVzHN8yE04e1b00gBR3Z3685GVYo/G79A==
X-Google-Smtp-Source: ABdhPJzaByHrLOYGgLKCLqMIr0hQu7Yh+3mMPw6rm8ZzZzWxawH/Ai91w90DdUIrZBoswu0SaolN5g==
X-Received: by 2002:a17:902:9042:b029:12c:c03:20e2 with SMTP id w2-20020a1709029042b029012c0c0320e2mr2344368plz.36.1627188755687;
        Sat, 24 Jul 2021 21:52:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id t10sm43368804pgv.52.2021.07.24.21.52.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:52:35 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/15] vboxguestdrivers: upgrade 6.1.14 -> 6.1.16
Date: Sat, 24 Jul 2021 21:52:11 -0700
Message-Id: <0066ffb6eb2a81b827ba0aa9e229105cabf098cc.1627164868.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627164868.git.akuster808@gmail.com>
References: <cover.1627164868.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7839164921ddb340a1bff322a1274c6022cb8565)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{vboxguestdrivers_6.1.14.bb => vboxguestdrivers_6.1.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.14.bb => vboxguestdrivers_6.1.16.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.14.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb
index 35dc4953bb..9282f663b4 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.14.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[md5sum] = "6e4313df24fd00b0dc0437c3746b940d"
-SRC_URI[sha256sum] = "91fa05bcfce36316ca93e3927c9550ea66286fff4c5bec900b753fca278ce1a0"
+SRC_URI[md5sum] = "a12a647f6c114f2cb1571089b36841fe"
+SRC_URI[sha256sum] = "49c1990da16d8a3d5bda8cdb961ec8195a901e67e4c79aea44c1521a5fc2f9f1"
 
 S ?= "${WORKDIR}/vbox_module"
 S_task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1

