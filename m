Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.12372.1612990559972011621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZRU88ebP;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id t142so3044567wmt.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Kw/K8zFdg/mrFjpPsmrB6Io0JZTymnIE0yYp90Rbmqo=;
        b=ZRU88ebPF/zBPCd3Cku8Mu8wZ5aAdQlJ7nA5KH/rTgFDGqtKi2wdr+cMs30Yl1uX/Y
         mufqVgY5p/tAzjLCggp+vctvWvUs/a7YmCu9R5uK01YVUIJ4MP6KpwJxcrQ01ozI0WFC
         BKQANt6llAjPOW8Hoe4kAYALBpFRA+Lzf76FDW/Ack89XNpVCMloq/C60srOvAm+x4Ep
         4ZWe9FoLx3kOxtI2k+ow+VTVyqghkwNrFrFvaGK7LacDaFUF/m0IOF6rjhxIl6iKDMRQ
         W5xIyNxCXftL+oowc5zb4eHMuaYFuRc8zyLOYZlkOlOwFIvXsrevMZVQU3swOZVGqf1H
         18lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kw/K8zFdg/mrFjpPsmrB6Io0JZTymnIE0yYp90Rbmqo=;
        b=WdJe+YaaXrj4ua+TW70xsxLWhxI7Qak2kl69cqkkkt7/QQm3KWwBFl2cgv6z7FAkiC
         KDKAazLpkchAtEzs8gXyRmIe8gI8Psvt/iIqV/vjLoagV/xvw8mjSozkZx1dQlcc+cZ6
         u8beHPGUgHx9WTNK0W3gLsn3UvrMVVDiyxqOBimAJNrRkAq8pcdnFGrXnXQg+ES0VNiX
         250goIdcFpQgL7Zjh9Q0dsXe/9f/WLMcuUCWiMWovh3pPXxY4TUF9wsxhByPJB4FjkLR
         8VBAa3SPNsK7+CJqok0oLt3BFmS3fUaaKUux+wMJMbJFlaAPYShDtC8tGPatCBbqUI0o
         slQQ==
X-Gm-Message-State: AOAM533afhiXRF5HgQgFuOd3a8wwcOrWJIIqiTBVBj75drwjgwUZ2yjS
	TVXbb+0kYfrQvEeC6Qhp29+F/B2yAlg=
X-Google-Smtp-Source: ABdhPJzWRQPW/J+XHP+5MR601vNbQaxh0AI8GqHqxV3qh7okZGexXqVL6q7vsAB1UkN5WVRSIawowQ==
X-Received: by 2002:a1c:318a:: with SMTP id x132mr911129wmx.6.1612990558583;
        Wed, 10 Feb 2021 12:55:58 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:58 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/13] cairomm4: initial add 1.16.0
Date: Wed, 10 Feb 2021 21:55:35 +0100
Message-Id: <20210210205538.690009-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-graphics/cairo/cairomm4_1.16.0.bb    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/cairo/cairomm4_1.16.0.bb

diff --git a/meta-oe/recipes-graphics/cairo/cairomm4_1.16.0.bb b/meta-oe/recipes-graphics/cairo/cairomm4_1.16.0.bb
new file mode 100644
index 000000000..561962da4
--- /dev/null
+++ b/meta-oe/recipes-graphics/cairo/cairomm4_1.16.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "C++ bindings for Cairo graphics library"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
+
+inherit meson 
+
+BPN = "cairomm"
+
+DEPENDS = "cairo libsigc++-3"
+
+SRC_URI = "https://www.cairographics.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "7e881492c5f9f546688c31160deb742c166fc4c68b6b8eb9920c00a0f0f144f9"
+
+FILES_${PN}-dev += "${libdir}/cairomm-*/"
+
-- 
2.26.2

