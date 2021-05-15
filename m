Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.554.1621121953057682672
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jcyTY6aC;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id p24so2523084ejb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PupkVaR2bZX6FPn4br0kmCr4Yw+W89D9COzbk7C9pVo=;
        b=jcyTY6aCWBobXuK/81BJRnfEOnWj5ccRKnuPkjhnJ8eFyg8XI/mfmHXNosMZ1OYfOJ
         jILP9cs6lQ31kAIBQ062hbdITfhY1PgEg6zZ4mZFhCjIhtiGtA1vaVw/5wbVGGSqZyr+
         RKPb6Vve6G36oQyLN6dqiJ9lMpysM8g/uN3uNwg37WQtDpm/0DMqIJRgk/xVHUEWPHas
         4sBIfLB6QmGJQIdH4Su+t+UrgchRolELM9rrVQnyFkdem9dLDyod2RsdVfJJH1gk0yc+
         Fu3qiFgF32nT4H9d3L8Qf++wVfiuXMcy1asFKeZm2Sccc0QCr7Pif0jeZgobCQ4WW8eI
         1Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PupkVaR2bZX6FPn4br0kmCr4Yw+W89D9COzbk7C9pVo=;
        b=kbiusVUZhecxQOODh1BQA6iWOWSSuTADDPerEuTTlZI+Bb/Pd1mdC8Ijq2Kycvq6tV
         egVnABC24H/8kmcSoKeEQErHjinIZkrlxw/5Gm0eFvIAhPUt30qrQeJbgS9D8JluIlSc
         zlB3Z/5XUlsxwzfK3kq3v16ngp8uBUxYQxm4W1/lmGyME59a7/BHMLWrOjj5k9oGs7QB
         AM9cIMjP6tlerjSqnl4tMDjZcTwdq0tgQWWOZVJTHLEp6SmwWGDHkFrHzWVwrp3iP/GB
         KU570hbUCmIqlAkJrNJCPFYzcn85TlRqyQw8hZfaGSaLqrL0IiUIQJUB+5If0kIjOMh+
         DvRw==
X-Gm-Message-State: AOAM533/U27C3R5j9BGzeLRViU76b3vFvqdw660QpvFyFrxenX1xHlwU
	yzaUqJTwDFB6uGyYgtRT6caXCF1T0+k=
X-Google-Smtp-Source: ABdhPJwlj7MeVxv/1/KnoobTyk/3rBCrtyFrQ4T4twGGbv/6Bgu1bRjYDERMoxgx83FAkV5YBEklcA==
X-Received: by 2002:a17:906:e105:: with SMTP id gj5mr56314787ejb.388.1621121951672;
        Sat, 15 May 2021 16:39:11 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:11 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/20] evince: upgrade 3.38.0 -> 40.1
Date: Sun, 16 May 2021 01:38:41 +0200
Message-Id: <20210515233853.583490-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evince/{evince_3.38.0.bb => evince_40.1.bb}             | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_3.38.0.bb => evince_40.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.38.0.bb b/meta-gnome/recipes-gnome/evince/evince_40.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/evince/evince_3.38.0.bb
rename to meta-gnome/recipes-gnome/evince/evince_40.1.bb
index 9c1d8641e..15fac9918 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.38.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_40.1.bb
@@ -13,6 +13,7 @@ DEPENDS = " \
     gstreamer1.0-plugins-base \
     orc \
     adwaita-icon-theme \
+    libhandy \
     ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} \
 "
 
@@ -20,7 +21,10 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext mime-xdg gtk-doc
 
-SRC_URI[archive.sha256sum] = "26df897a417545b476d2606b14731122e84278ae994bd64ea535449c3cf01948"
+def gnome_verdir(v):
+    return oe.utils.trim_version(v, 1)
+
+SRC_URI[archive.sha256sum] = "7a666363c350af2e3bbba7f14b3c1befc5012f9ed3d9d073447f4c59f33dcf2d"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.31.1

