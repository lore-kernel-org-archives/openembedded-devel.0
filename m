Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2EAC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 15:27:07 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.32011.1647876426680533009
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 08:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wc9sqfi7;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id m22so13368993pja.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJOeX3BhuKKU8fpZO0rxxUzlTG8dYN1JY3uMC/9HODg=;
        b=Wc9sqfi7rvYJwdGsYrE+hVO4daHo17oUfQQwqaGJMJ5mIagqWfrI20yj6Dicsy42QZ
         UVGNQB8DcJZob6YOEelRyDy5I1AOCZLmuzWOZI/lYJ/FQMRxdhxyr/FhdbLe/iDDB3cx
         Gnp0z+cUqXkkUaxGQpeDThL/ff8hhNKI5pshc7ToQAk69UzT6ld+zdlOjmstch2oKXm2
         8Py40prngzYKW4LkVC7589cAlO9720xs1j+Hu1t8nCq1GNGPxf4BWUJZEfuChfbGh+xc
         5hsVT6oyELE+cwzpgG1JgHJiBr0LP2ULWGQio8lbEiSDXAdsJJiEr7/rXjcUG72KGMts
         ZeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJOeX3BhuKKU8fpZO0rxxUzlTG8dYN1JY3uMC/9HODg=;
        b=6jQGrp9zij2yIdyoLm0Sc1DPYyvEmmi3gq+KfNwagugD3TY28WXKwvEtlJ9C1mBUnt
         vZLTL/eYbTWFQ6vrEV2dT5FNEwgb0jPn85WWfRdySytwWxJ98FJp0gwIPQG1htSqwae6
         yNcry3/WdrpSC5+Rg+qtaEfRrv8zimuErokShj/DnDPYO2jJjnTmG/5O8r2BT1SJsQhL
         agyoBRU9fnKT5UxDwWxU6lyv09NlkHzEE2xn3nlM7ZHUbICAf1X8i3KvUOeHUgTqB/tn
         Y8g+gWhsy18/J14Dnc7qP4DoDB691WaUnsDprMO4PQDPunIKLzghxqYFr/q2588f1RsL
         ZYcQ==
X-Gm-Message-State: AOAM530o0ubOqwLqxsOkoHZG87lZEQSK5MRgHfdga/dtp8mISDzne88P
	pNTmRkqJNPbL8FfflbwHh1H83k/hMYXPUg==
X-Google-Smtp-Source: 
 ABdhPJyOKJ/+feyPdLlRL81lDidrukTiiaQD5RXKJoH9OtLFvQHf9stmnwT3zR3JUPvkq7R3cigmtg==
X-Received: by 2002:a17:902:6845:b0:153:9af1:3134 with SMTP id
 f5-20020a170902684500b001539af13134mr13473152pln.169.1647876425444;
        Mon, 21 Mar 2022 08:27:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 d21-20020a056a00199500b004fa1f42eb77sm19437360pfl.117.2022.03.21.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 08:27:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] projucer: Upgrade to 6.1.6
Date: Mon, 21 Mar 2022 08:27:02 -0700
Message-Id: <20220321152702.3994142-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 15:27:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96111

Consider the commercial aspects of JUCE 6 End User License Agreement [1]

[1] https://juce.com/juce-6-licence

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/juce/projucer.inc      | 8 +++++---
 .../packagegroups/packagegroup-meta-multimedia.bb         | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
index 37680f498e..feb3564633 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -4,7 +4,9 @@ JUCE supported platforms, including Linux and Embedded Linux."
 SECTION = "utils"
 HOMEPAGE = "http://juce.com/"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e9c2db7897c0349a4cc1c6d2a8c5d5"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=eff9da77cdb81a803f8cbca6c16801d8"
+
+LICENSE_FLAGS = "commercial"
 
 inherit pkgconfig features_check
 
@@ -13,13 +15,13 @@ REQUIRED_DISTRO_FEATURES = "x11"
 DEPENDS = "libx11 libxext libxinerama libxrandr libxcursor freetype alsa-lib curl bzip2 libpng harfbuzz glib-2.0 libpcre"
 DEPENDS:append:libc-musl = " libexecinfo"
 
-SRCREV = "90e8da0cfb54ac593cdbed74c3d0c9b09bad3a9f"
+SRCREV = "2f980209cc4091a4490bb1bafc5d530f16834e58"
 BRANCH = "master"
 SRC_URI = "git://github.com/WeAreROLI/JUCE.git;protocol=https;branch=${BRANCH} \
 "
 
 S = "${WORKDIR}/git"
-PV = "6.0.8"
+PV = "6.1.6"
 
 JUCE_PROJUCER_BUILD_PATH = "${B}/extras/Projucer/Builds"
 JUCE_PROJUCER_MAKEFILE_PATH = "${JUCE_PROJUCER_BUILD_PATH}/LinuxMakefile"
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 62ca273160..2b7a43b93d 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -55,7 +55,7 @@ RDEPENDS:packagegroup-meta-multimedia = "\
     tearsofsteel-1080p \
     schroedinger \
     pipewire \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "projucer", "", d)} \
     libcamera \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "libde265 openh264", "", d)} \
     vorbis-tools \
-- 
2.35.1


