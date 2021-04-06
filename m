Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.1357.1617734611849201566
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 11:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KntSsdBl;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id hq27so23509712ejc.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kxMUZ1TbgKteWv1vijuhAmC81uDkI6Msi0X/7DD0MHU=;
        b=KntSsdBlRMkP0B+SRg+1Nr1E5oypmaVq61MkMg5aNXxNOERGPlr5dRRhDLUoLXhpya
         Z/Ie+1+g2ehqelKwe4J42GmYaXPprkDO3DmLvF3VLsyVt+PKtCqDT78xWHeWl8o1U9kC
         al8fQC/LR1CkiO9I1t/2+M0TUY2D5M0y5Or7XWrV1BV01ZFBT51CxwIQddH5ROsAOih0
         0yHgDwwAIvjBUC7bLZv+INpNmeyKQMuB9MoE9niB0bYeKCXWK+DbHsF5m3kN7XTjV0W1
         Mm1TItXZdSUo5ShVJXjbSWNhpBuvAMx1D9IiG2aB3ANfqPsevE8eqs70XqTPzbL73W9P
         /EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxMUZ1TbgKteWv1vijuhAmC81uDkI6Msi0X/7DD0MHU=;
        b=EWzh3l/XLS0oORw9A4mEDS++GzGg6+KpLEjn7X/GWhLfmCBeNiBrrFjNMU+dOPaY7Q
         J7RPbmL8Bgc0TWfj9xYFohzSkkTrlB2lw7nBMCVpqNw5ahorKHkGkcSsnS46mqI19R3q
         ri/NbQwNlAY1jUvtXzxN4QOcK+76la3Z0kFAJuBvxxQJT4ehuva5r4ZCa+tDYPdjDooO
         FFBpbbmrYuOw8UiBjNLTW1NXEjQevs1/H0qjo/ALbkR0d8GjICmB5dZbAf2vPXI37q8y
         OCMRp7H867zwI0fRo7WLZPIlPpLhfcf4s0xZgE5n/+f1xojbjaUQoginmQ0rDX9XkT3D
         +HUA==
X-Gm-Message-State: AOAM531j2fWvXSW5i/xiGXH0HjBY/7NKH49bUDEcE/fxRLoNyFkhybCk
	T/1MxnNqT6hIySj8yBt3pFhKeUiFZAs=
X-Google-Smtp-Source: ABdhPJz4lwbt/UO1JBO9dHJXmOD5j4wTChE0GP8W6Pth4YPAq4LXI7DO1tI7+58shCwryOJnLVFYgQ==
X-Received: by 2002:a17:906:78f:: with SMTP id l15mr13854457ejc.493.1617734610435;
        Tue, 06 Apr 2021 11:43:30 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a22sm14202701edu.14.2021.04.06.11.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:43:30 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 2/3] telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
Date: Tue,  6 Apr 2021 20:43:26 +0200
Message-Id: <20210406184327.1585452-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406184327.1585452-1-Martin.Jansa@gmail.com>
References: <20210406184327.1585452-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
index 2b05c61a0d..4d4e841f62 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
 inherit autotools pkgconfig gettext gobject-introspection vala
 
-EXTRA_OECONF = "--enable-vala-bindings"
+# Respect GI_DATA_ENABLED value when enabling vala-bindings:
+# configure: error: GObject-Introspection must be enabled for Vala bindings
+EXTRA_OECONF = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-vala-bindings', '--disable-vala-bindings', d)}"
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
-- 
2.30.2

