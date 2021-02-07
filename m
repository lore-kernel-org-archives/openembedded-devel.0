Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.19515.1612700973635767237
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 04:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DzhJYhO/;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 190so10166819wmz.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 04:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3A08DHxyfWnHGufrxPcuzKJnjbYop4E9crk0tiDXdI=;
        b=DzhJYhO/iJUGXzYU1NouRu8v1J/0S9XoAi1Thc3Y09okpq9Kmc6d6aLOg3+MVuTMKb
         F2Xq80XP3pMWmlcHavwrkD8yZTFJTAQpC1yagYq3FLDhwktQglhg3J2ct18jG4W8eEWQ
         HQHJcldUDYnF0ny3sBk4zKgtG2EviXWRL5LJ04x2t65bZGX1nCVwyBEkFOFkiW4xnuV7
         FZDlrLFJzWkQEJZd57rEKDA+FW/CC94LwbHZSLLu9aMCxvEDQvgTo6dSfzFhSPLQU12o
         swXs6zQ4KwHw2d8c+M3AVWA5pbRcdFgQ/g6AyTgkDMUcOZskH12MyGw6nHHpZ1bMsqzQ
         742A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3A08DHxyfWnHGufrxPcuzKJnjbYop4E9crk0tiDXdI=;
        b=JvZcpfuNQ7KefoElcn2o3VEEBDYOGS4TwEnPSfCPbxrfVDZnA5YkXGMEJYtaS1G7AC
         IHwsjA7zNnt7oXM/XwvbEjvfJRHm1UHWJR37R3zdiEkM75Enj19clLf9jIRKFHLFRyNd
         Qf5VA6vCstb9Cb1lcvVg5aNfNrrxyAPHNiK+7Sp79wNtF6hh/VRISe7CVDWhu/7WATo/
         0hnRyjLbLwuoI5GwdG9peUAqFToE78+DwJjWQgAjzPnHyEMEw14IgCXb57z35T7rF1pM
         rmvM9p/lqifZDS4mRKzPzfuTRxd7cTMvcQYJXCRZhOZb+/+dZosdiSoJXkb6Hc5XstJe
         QJSA==
X-Gm-Message-State: AOAM531myru1vb4+j63PyPIb8oQo+tbAgTH777x6wp1NevTxli37WAb9
	StHDHfgty69tu3J39QhZD3NEUZ5RkXg06w==
X-Google-Smtp-Source: ABdhPJwC90dQLfL0WZBx7Oc9+OG9cKk6hjFa6iDl8Hjy5WwmrTos+e9gg+Zz5PYwdm9kWUQ79ysv1w==
X-Received: by 2002:a05:600c:35ce:: with SMTP id r14mr10930691wmq.136.1612700970841;
        Sun, 07 Feb 2021 04:29:30 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j17sm15157575wmc.28.2021.02.07.04.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 04:29:29 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][PATCH] graphviz: use git fetcher instead of gitlab archives
Date: Sun,  7 Feb 2021 13:29:27 +0100
Message-Id: <20210207122927.3586198-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  graphviz-2.40.1-r0 do_package_qa: QA Issue: graphviz: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol [src-uri-bad]

* it's already fixed in gatesgarth and newer with new version from:
  commit 985be3901e79c9e45cd5d23774e3cfdaab476b44
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Mon Nov 2 18:33:34 2020 -0800

    graphviz: Upgrade to 2.44.1 release

    - Refresh patches to apply on new sources
    - Switch away from gitlab archives
    - Bypass pdf documentation generation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../graphviz/graphviz_2.40.1.bb                | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
index 12ecb99091..d393ae2a1c 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
@@ -19,13 +19,12 @@ DEPENDS_append_class-target = " ${BPN}-native"
 
 inherit autotools-brokensep pkgconfig gettext
 
-# The source tarball suggested at
-# https://graphviz.gitlab.io/_pages/Download/Download_source.html has no
-# version in its name. So once graphviz is updgraded, only first time users will
-# get checksum errors. Fedora people seem to expect same so they use a versioned
-# source - see https://src.fedoraproject.org/cgit/rpms/graphviz.git/tree/graphviz.spec
-
-SRC_URI = "https://gitlab.com/graphviz/graphviz/-/archive/stable_release_${PV}/graphviz-stable_release_${PV}.tar.gz \
+# it was already moved from github.com/ellson/graphviz to https://gitlab.com/graphviz/graphviz/
+# but the later doesn't have stable_release_2.40.1 tag (anymore?), but it has corresponding commit:
+# https://github.com/ellson/MOTHBALLED-graphviz/releases/tag/stable_release_2.40.1
+# https://gitlab.com/graphviz/graphviz/-/commit/67cd2e5121379a38e0801cc05cce5033f8a2a609
+SRCREV = "67cd2e5121379a38e0801cc05cce5033f8a2a609"
+SRC_URI = "git://gitlab.com/${BPN}/${BPN}.git \
            file://0001-plugin-pango-Include-freetype-headers-explicitly.patch \
 "
 # Use native mkdefs
@@ -33,10 +32,7 @@ SRC_URI_append_class-target = "\
            file://0001-Use-native-mkdefs.patch \
            file://0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch \
 "
-SRC_URI[md5sum] = "2acf30ca8e6cc8b001b0334db65fd072"
-SRC_URI[sha256sum] = "e6c3f8dbfde1c4523055403927bef29f97f9fc12715c1042b5dcf648a2c1c62a"
-
-S = "${WORKDIR}/${BPN}-stable_release_${PV}"
+S = "${WORKDIR}/git"
 
 EXTRA_OECONF_class-target = "\
                 --with-expatincludedir=${STAGING_INCDIR} \
-- 
2.27.0

