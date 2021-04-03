Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.34384.1617479834496352675
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Apr 2021 12:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uKd1MrTn;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id f8so4642535edd.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Apr 2021 12:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T3ZYYPb7MbCzK7PC4YzugAh+thWt95IP7d/JjM7rITw=;
        b=uKd1MrTnULR1Vd34jibm4ikdCiZSlmhexD2looc7BANp1Uri+7Vdc80XPnmqNKfbJs
         LCydo2nnSDbq2yj5KXu/jVgt54g7A+vxa0fzLo7aOje8JiDnLJHsIewmhcnzFuHyUne5
         UvAk+t1V+pJq2UOr7PRY8r5pTyRyVh4AgEask4G0A/pmS+JsKBFmuQlOQLeGVCj8OyFT
         r1dCs278P6U8qcepqHFjDXJJfsDifr9TxMqNr5osHJd6co1us9vWM1tMLBWtTpKL525K
         KTmfX5xAQCG1GTcTC5OBCA9yEf48HHR4YVOjNO/B9BPZvuIDkyENUJmYXRP1JKSG8svC
         2k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T3ZYYPb7MbCzK7PC4YzugAh+thWt95IP7d/JjM7rITw=;
        b=dmwNvz3gVKygQHPOBb8aiMlFGkaWXVMRXdQHy3Qb7hS9LTAn6AxFjZ2O78wSpxTSV1
         Rlp6M25y/pXH6rzOJs1Obs/lr4vmZCimq+wM7fy/DUnsCwTBzybh1zSoJbPYHQgUIaLM
         sy6WA0F0YLTV/nikelD8eohdEJ/z15h2AQDDHeilv7OoQihf4FEyXleqNlWOwBhTZJWr
         JZs+gnvk9cId/5RCzEegSVqchSL11VYTSgqlAPHB9SXSiE4By8BkGo4Et45nVqsTRlS/
         XH6ETsgFMf0F/ZuWpRW6YfqdXOGAxB/Hdhku3/P2ugEVjaTGFGeTnHLXzitXFxRHrG/h
         UHZQ==
X-Gm-Message-State: AOAM531dFc6c2t3JLWyTrdfmJRPh+66/3T0/Sc9ZBAAa1Dm4iv0f1skg
	iRqH+jrnA9/BkoQbBVLCb+g7ogsVuZs=
X-Google-Smtp-Source: ABdhPJy7vx7hcm3Da7RIoF2S1sbZAkyTpyxO9SRmUt1UbJy7rqK9jarTN4S/ubjeOZX+qK0JNDKfIA==
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr22844609edd.103.1617479833109;
        Sat, 03 Apr 2021 12:57:13 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k26sm5897561ejk.29.2021.04.03.12.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 12:57:12 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
Date: Sat,  3 Apr 2021 21:57:10 +0200
Message-Id: <20210403195710.1402036-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210403195710.1402036-1-Martin.Jansa@gmail.com>
References: <20210403195710.1402036-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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

