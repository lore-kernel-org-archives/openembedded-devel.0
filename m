Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C205ECA5FE4
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 16:27:54 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17248.1768753665126872875
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 08:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TjmpRINp;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so40642405e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 08:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768753663; x=1769358463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+G7Vi+Fa9anGeeIveMMoYB6vZ15DlFrK58XYxWOQcyw=;
        b=TjmpRINpEPF5UXJDmsjUC/Eyy5oZxI1QOmRGy2nFmrxa+dcosZERSFNu5oImYH21ZO
         W5aXXDeZTor8KyqtZRUfXSLeJ62C+P2XDzAUEuecKcsD7jdnlR4Z//u0viOpmdzIB44u
         0D4eNU0iy0K4d0cc3T95v3MoPG2jYPgdNjfIdPTz6ZCQy1yI7NQ4C7WYL06KDiBUHlZi
         aiE/jDRogmLirSONOUR+E8d1YogjRRUoFU0rH8pgUzZmV/dxrjgXTnBWwtoSCcgiMaGa
         2S61FQmqYo45gcJJ2iWYEEY3dGCBgxU2r+r+trURx8w8zc2RMjEFpp/m1iCqpUPyNSdb
         oR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768753663; x=1769358463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+G7Vi+Fa9anGeeIveMMoYB6vZ15DlFrK58XYxWOQcyw=;
        b=ilybwmWJ8vv9ocUshti4V8ChYvSLKDZMv4zMHNBOs9lt6mGtIbMF987pctmfpIkcL3
         IKR8RKVWM85QXmDuBavMIPo3FSPzTPlIk0B0gXsV7GmrvW9mKlVJFZ4oyhdy0SdBVrBJ
         4Utos2a9kZ+Yisdci433e13pvqKMquW2XWKYBSFhDN5EtRSPcxDPxDtFOCrD6KWVEFW9
         oR5fg5OhG5J86U2yiU3tuOPVN6Lx+zseIRaagw+PCoU222FgqV9Zqh/57qCQg/TJhmto
         BfPLwBh7xHFGbYucmvD+G685OXccUIL/48YBsGH022LbTKxD4MXbY8YqzMPEIC9JUotz
         DVmA==
X-Gm-Message-State: AOJu0Yz98HGI/DaSSoM0r7C4J65+2F0p8UwEg+P9zpL73FvM2PqnKp7o
	9PSKYYikhN/6TgM4wh0C2BmvficglQzLoFJ2YF+MvwX9YrD7RPkdD//Z5BV3xQ==
X-Gm-Gg: AY/fxX6J6VyS2I3R6hiq7tMyna2m0xKVb10O0ChDokvDZ/P9nJKYJ+Uk8+BELfhzC0Q
	g//TYU1t2c9l766kaitiTxS1RtsbnaIv4rV604UkKqrj3rzd4/4z3KXjoUUOa/dC3d7IAUiUmhH
	qjgPAl1mxTG5E6sAL6z/owMu4r+xd+p2iSiMr8ZXxbdLopJhnUer22WUhR/0mkt5MnGtZCkCqTC
	z2Gw/EiXxG2QxvjMo/xQhzL9TnahRh17bTuNdXB99wQk2dwHnq4+mACGVNTwyM2Np8CT5pnq2Co
	QGXZuh+nG0Ylo4TwR2MCVlxVEY6qiIwPynFEi6EuYVMZMNZIwbkTNSjsqQhcqOi1V4NjkYuN70S
	LZ+C1wZpchEr/R0OViSAQv93ag5EQIWANKK2kTP69oQjbhEOUaxxiuRzGLcuujYEqyK4cEXc9O3
	9Wp0V+FYEz
X-Received: by 2002:a05:600c:6612:b0:47e:dddc:3369 with SMTP id 5b1f17b1804b1-4801e3530b7mr115755105e9.35.1768753663425;
        Sun, 18 Jan 2026 08:27:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe47dddsm61402165e9.13.2026.01.18.08.27.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 08:27:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 4/5] python3-django: consolidate dependencies in .inc file
Date: Sun, 18 Jan 2026 17:27:38 +0100
Message-ID: <20260118162739.3764017-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118162739.3764017-1-skandigraun@gmail.com>
References: <20260118162739.3764017-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 16:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123575

Django 4.2.x recipe has been deleted, the dependencies that were specific
to version 5.x can be moved to the common .inc file.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-django.inc      | 3 ++-
 meta-python/recipes-devtools/python/python3-django_5.2.9.bb | 5 -----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-python/recipes-devtools/python/python3-django.inc
index 317793abba..589f6a5b85 100644
--- a/meta-python/recipes-devtools/python/python3-django.inc
+++ b/meta-python/recipes-devtools/python/python3-django.inc
@@ -15,6 +15,7 @@ FILES:${PN} += "${datadir}/django"
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "\
+    python3-asgiref \
     python3-compression \
     python3-ctypes \
     python3-datetime \
@@ -27,6 +28,7 @@ RDEPENDS:${PN} += "\
     python3-numbers \
     python3-pkgutil \
     python3-pytz \
+    python3-sqlparse \
     python3-threading \
     python3-unixadmin \
     python3-xml \
@@ -45,7 +47,6 @@ do_install_ptest(){
 
 RDEPENDS:${PN}-ptest += " \
     gettext \
-    python3-asgiref \
     python3-bcrypt \
     python3-compile \
     python3-docutils \
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
index fa9fb2e929..11f438d623 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
@@ -5,8 +5,3 @@ SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch \
             file://0001-Fix-test_strip_tags-test.patch \
 "
 SRC_URI[sha256sum] = "16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495"
-
-RDEPENDS:${PN} += "\
-    python3-sqlparse \
-    python3-asgiref \
-"

