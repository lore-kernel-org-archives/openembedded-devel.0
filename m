Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.4385.1623220732005163108
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c9ZCe0Pa;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a11so35960543ejf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=swRMYxWwEE9RX4k+AtHcQ/IqRemYii0UX0Yj9Gq0IoU=;
        b=c9ZCe0PavqVA/Uj8wtSGf1WsCYCOLv4W9AkCrctCRFN3elxASgjZSL367O0l2kq6ia
         k7HSn7IHSMPoYy7cdypy5XXgv5pCB3uJD2q4JPP9dVyvQ8tesMTLGemEeScZ3QzpO1VC
         eEzgDjXgv63z2NoYGnGdk4AfxVNWs6mQY9y9HkWfv5u3ggzNsln+ObvE9fcnXqsqb87l
         ra62a19MrO+W3w26OoCkNYwTNQQq5XnP1txeeELebTyPWzjEP27/IjFL590KRAFU8/GI
         BJP4O13kobGgHh6zAhqWGgJFgnq8sexPvvo2phpDLS+fDAG7oIAqQwzTCDX+3s3wnLB0
         r6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=swRMYxWwEE9RX4k+AtHcQ/IqRemYii0UX0Yj9Gq0IoU=;
        b=Mu6j4+2cim4oA/hN6qK5uansdcYTG5SsqoSBifohhGtLo5xc2sCnf2vEREp7k718R0
         d4SqFpY1tq9LYz3eLiVGIl1nV/QJwbP1t1r2ayTzEgEcS4YZ9IIkT9c06ZJc6FNKrn1z
         mfs+TCWccSLOuMNwICap5Xtsx4XwH/qD0ypuNnG5NmCNksX+gMZmwfyGPHfYGUWPD6Xw
         puCZfNkpiQP0wMeF1EIkI4S9naoaRmOKrtBUi7BFtGYNkePbO5YEZ/LMmkfHYsxumJU2
         FcGUYgk6skYLEzvm2LZXpneMwql2HwiXmFeSz3GDqxWBdGp+Kh3whkqypsJ3T96KMa7r
         Q2xg==
X-Gm-Message-State: AOAM530HO7kHZ79uVHdMkgP2PXT1UAG4ujPMn1JXT45N3LdEiSejw92m
	doKWdH8McyXW4u9k8/MCgSQYPWR/VBVrrw==
X-Google-Smtp-Source: ABdhPJxnpUpQO3Vtr3G0rOppTWxDqEyKJNQdfHRjRVoJ6wD9lJrzTM7CXxVVJR0DSLcfCtoG9vIm/w==
X-Received: by 2002:a17:907:7b91:: with SMTP id ne17mr21920194ejc.58.1623220730534;
        Tue, 08 Jun 2021 23:38:50 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:50 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/28] gnome-terminal: upgrade 3.36.2 -> 3.40.2
Date: Wed,  9 Jun 2021 08:38:14 +0200
Message-Id: <20210609063831.3400611-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-terminal_3.36.2.bb => gnome-terminal_3.40.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.36.2.bb => gnome-terminal_3.40.2.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.36.2.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.40.2.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.36.2.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.40.2.bb
index ce54faab2..62534a94a 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.40.2.bb
@@ -11,6 +11,7 @@ DEPENDS = " \
     glib-2.0-native \
     intltool-native \
     yelp-tools-native \
+    docbook-xsl-stylesheets-native libxslt-native \
     desktop-file-utils-native \
     gtk+3 \
     gsettings-desktop-schemas \
@@ -19,8 +20,7 @@ DEPENDS = " \
     libpcre2 \
 "
 
-SRC_URI[archive.md5sum] = "08150cbf2e23dd4f60f959a6eca8ef0c"
-SRC_URI[archive.sha256sum] = "41d1b6a3dc97c066e294acdb7f36931e81668638dcc92ffa25bca3ddebacdf46"
+SRC_URI[archive.sha256sum] = "4c79af8ffe8bd3a5daca1911ea2c0acd6872860a1dd5d7eea219f4ab4ae556ac"
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
 
 EXTRA_OECONF += " \
-- 
2.31.1

