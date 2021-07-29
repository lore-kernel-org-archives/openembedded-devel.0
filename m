Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.17221.1627601824571582477
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gMyoXxWC;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id a20so8899063plm.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sQHgY75dP1RcwBwb/7yTag5IaGkS+VwFdTBzEHJyYD8=;
        b=gMyoXxWCq3TLQoUcpKngvIjXzhw+pqkU9Movfc+tBeJZcnkSlaecC9nEKYmJifiogM
         CZZnzAq3AWQEBmX9whCZDYpZdxVyrl0nYlQtxciRLd2/BG0+NMnJR70MCIBEZ3cNAkP6
         AKwovb2HDPnMNmMItJXYmbaczt7xIQY33mM03+CxZOvAKKdUqfg+RMIh1lea+Cft6C7R
         GUYrdMtMjKvVe0hXAt+RMpLOBjYDZCzVX784EETkuZRXxT2t+0bueMPhcB4CJ2d0zZYy
         Ijue/5rAQAc5PfCQ3EaXGMPU51sszI63JfZi2/bMogUwwGDKOTK0Ootq2x3eClGyk3KQ
         opFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sQHgY75dP1RcwBwb/7yTag5IaGkS+VwFdTBzEHJyYD8=;
        b=C+UrSeOJ1BbkkxIj+Y66oBd1cyS56DITKxmDxm6ZTNt/B0SaWEvcZvwk0JXhH9FwBJ
         Nm+Ycjo6pj8Ncay0rqHKvG9MFJk5BUlE/dViSNhLZciRfmgz/Lne7UMa27U5yD4pxk69
         qpCGj2x4Nm0StFB/WarrvQM5oo2ZsaAmlQWT+aW1cIc0YybDRss59K8NIF6EOwEBq2n0
         qMg7LbNR/XEqvzsV/GvqjpkZyWmWZkqyzPL1wdEotY7Me1pqiWnTBUNibUbqUK74AK0J
         JqOqLpPpgpUkPyA+OJnIq4jL2pBJ9dwMzPy+IkZsxz80IMi6up46edSq7y5pgQ0DsscT
         2scg==
X-Gm-Message-State: AOAM5316lpHL09HqBuepYGtI+W+MEaA+l909JFLjXruH0N183U8IHmte
	h5YxRZM/h1nTzMVZ/007BCMix7bi6DOUZg==
X-Google-Smtp-Source: ABdhPJw9xPso4gjkizSnxF/pRMW3zLP8DjyUPVrSHDWjtpFG0eIyTq0gTFbEbR9GmKJzizAvLhfT7Q==
X-Received: by 2002:a63:e0c:: with SMTP id d12mr5866007pgl.386.1627601823897;
        Thu, 29 Jul 2021 16:37:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.37.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:37:03 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 12/15] vboxguestdrivers: upgrade 6.1.20 -> 6.1.22
Date: Thu, 29 Jul 2021 16:36:45 -0700
Message-Id: <97a5a4b40c143f71c8bff403c51a061a0d5e8b6f.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 319490178b999a74a82d092320de5d9d2e5c67bd)
[Stable branch]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{vboxguestdrivers_6.1.20.bb => vboxguestdrivers_6.1.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.20.bb => vboxguestdrivers_6.1.22.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
index 9df2e3960e..a074d0a558 100644
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

