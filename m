Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206CCC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 18:34:40 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.668.1651170876657109726
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 11:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=eD9q3RKq;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id u3so7912991wrg.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/qInRSNsPoSd7mahbGvD/uBPxjWKXpYBKl3LRv8VYuw=;
        b=eD9q3RKqHmEfE5i+bVAr5YoUyU3qVpDl4eBsAZ9UmgFzWpvb1hpaRa7QTkqNlxdOkq
         YoqdN3a4gg7aTZ2JEhS1Tm8i6b4Aa06cLW1RLsExWDaXFrU7fJg8yjbpsk8EmHaRcaZe
         e7Hxu/fKWa9wLgz/M7+OwkeN5SOA/B65Acnkaxio93loSFmdqV8/9YpM00ehfTSfyGaz
         tK1QDFxmlO0GSGIr4zV2YZeNsukqgJZTykvnDoYL6MKYbnSOxTZ1b9uIu0hO9QMLtyZ6
         gf8od/sYeZjuV7sV5foz4bAz+7bvT1e2DnAFpQ3qA7w5QH8NBH5iUTvpjmFlY9qg46yU
         wGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/qInRSNsPoSd7mahbGvD/uBPxjWKXpYBKl3LRv8VYuw=;
        b=CAJEyJjR/ie5P2iVJVWrv8QkkcN6/9HBBsm+BoiIuBxN1CnKYwtJUGFWMJMFQzNlWu
         x/kzYgrHX5WTTbn5aH4GdAah8eZOoLp4tDZWej1nq2dKKMDD8yJcKmU+AUDj3XPWnEj1
         LgbSyqrjN/MEEPInl5rp3TwAla2B/TJrlJEE4Ca5mR6+hGDK3YpEw1LyN86/KA90iRD7
         U/BzcLvLYu1wR8ZdlvrD/CXYK5qgeJ1o3PLK7iRXqLcGavDcyQVBPb/juzDhXsMUWRkU
         oOR73VjiJ3wUVSI9phjdjogvlbFjdbjGNOWH81puTD3A/4g7+0wey0RvwjXRAN+Ie1sd
         i0/w==
X-Gm-Message-State: AOAM530dFAclzbagGLFmex8PeLw1eOtIpHmJIMmSpO0Hc5WQ2GG7OQI6
	K7zlF7XUnFkr98TxWdw05qEvlg==
X-Google-Smtp-Source: 
 ABdhPJxfLerBpiccbLbFeWENW4EVkbjpBVrgh10qPW4+ISss6430TLmSClndjzlbKn7dcNETqNmHrg==
X-Received: by 2002:adf:d847:0:b0:20a:d393:4e4f with SMTP id
 k7-20020adfd847000000b0020ad3934e4fmr22167710wrl.707.1651170874786;
        Thu, 28 Apr 2022 11:34:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6c1d:8d9e:20c:34cf])
        by smtp.gmail.com with ESMTPSA id
 d13-20020adfc08d000000b0020ad7b380d3sm528264wrf.6.2022.04.28.11.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 11:34:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH v2] python3-pyfanotify: new package
Date: Thu, 28 Apr 2022 20:34:31 +0200
Message-Id: <20220428183431.2042283-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 18:34:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96846

This adds a recipe for pyfanotify - a python wrapper around linux'
fanotify interface.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
- fixed build with musl

 .../packagegroups/packagegroup-meta-python.bb |  1 +
 ...-FNM_EXTMATCH-if-not-already-defined.patch | 31 +++++++++++++++++++
 .../python/python3-pyfanotify_0.1.3.bb        | 18 +++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index f7bf36519..d2d9dcd18 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -300,6 +300,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pydicti \
     python3-pyephem \
     python3-pyexpect \
+    python3-pyfanotify \
     python3-pyfirmata \
     python3-pyflakes \
     python3-pyhamcrest \
diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch b/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
new file mode 100644
index 000000000..933e08626
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
@@ -0,0 +1,31 @@
+From 9e7894b97ae7afe43a9901b774de5aef401549ac Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Thu, 28 Apr 2022 16:32:06 +0200
+Subject: [PATCH] ext: define FNM_EXTMATCH if not already defined
+
+On musl this constant is not defined. Define it locally if not present.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+Upstream-Status: Inappropriate
+
+ src/ext.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/ext.c b/src/ext.c
+index 2ba9a14..98ffc20 100644
+--- a/src/ext.c
++++ b/src/ext.c
+@@ -18,6 +18,9 @@
+ #include <sys/un.h>
+ #include <unistd.h>
+ 
++#ifndef FNM_EXTMATCH
++#define FNM_EXTMATCH 0
++#endif
+ 
+ PyDoc_STRVAR(ext__doc__,
+ "Wrapper for fanotify.\n"
+-- 
+2.32.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb b/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb
new file mode 100644
index 000000000..a7c8f958e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python wrapper for Linux fanotify."
+HOMEPAGE = "https://github.com/baskiton/pyfanotify"
+AUTHOR = "Alexander Baskikh"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=636a36c9df04efcfacf839b8866d9a37"
+
+SRC_URI += "file://0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch"
+SRC_URI[sha256sum] = "0efa73922fd705b4e8f8f0b51cb88198ceef66cc309e1de21674ef44c879029d"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-crypt \
+    python3-datetime \
+    python3-logging \
+    python3-multiprocessing \
+"
-- 
2.32.0


