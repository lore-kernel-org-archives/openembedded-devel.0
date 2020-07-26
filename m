Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.26333.1595757558368675731
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 02:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=NU/SkPjw;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.175, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f175.google.com with SMTP id r19so14105325ljn.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+gT6ZGvDS6anH7DR3s2qHv9APU60A4HmakCsefzdYrg=;
        b=NU/SkPjwIY/LoOVz6CN/r96zX3dWmpIHB7ZE22yTcixNp9mcmy3ns3SG/t+gIlr/va
         MU6VHL95CWZTC8Jba5dsXhfW9zrfS+VFeanZKzPvgFq9G56wjqbMcXYvbiLul6C/HaJZ
         smUgLHQu1hAA3o3YSU9SWSurtrCHR9o0Fndfpd1DWe+lrZ94bpxA2/emsjVBurMURKSV
         7HJp/6YTeWq/UMJgd9BaYr1WkLUJLwFhV58w+qf5vPXpR+0psC2MlgIoFQvOXtkMq0H6
         EoQ7E8sCTsDGGicqLdCBWZuhu9JP0a6YSt4P2PEA5bI+O1uvnILCWYDXEpDkBD7C6JpF
         3qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+gT6ZGvDS6anH7DR3s2qHv9APU60A4HmakCsefzdYrg=;
        b=HsQ6K9mycywF9mOzhPRV0GqzKixZFy8s6iuNNFu07OqR6Fymuqj/b7FagrQ3RWsK9Z
         SjPimhDu6wx5djAM2PtAQwUmHUQ8xnwXo+0g0k1GxnG+WfW954WDtgTDGNSWOUK+hRHn
         B+a30g9EbCamaRFppMt4RQJXqZ/qa2GNMmWwsi9KQSjthdruNnMCmmxWY7jfx+hMtJ0T
         UrXzWRTvYuQPDSifYnIiWQ7HxNo9LV9nU0kjWiHk1+s8MRM7nt4ONxBk0Z/L+hdqKWMN
         RaqGTqt73DPy/fjOZHXdz5G9e2ZJXc2DKX04ChJUx21GJgyBmcD9+QlPGQ3gthZqRTMR
         qd3Q==
X-Gm-Message-State: AOAM532tVgsXJb2fEBPqpFhgnDSZ9UpNz7K2+PHowql7Gti5oUfGe1Ex
	lGgOlM+IiScY8OhNFaSOW4t+ijQTlVo=
X-Google-Smtp-Source: ABdhPJw1241Xeu+5/K2szJzhSIAr/kQmY9XB2ijvnIRacSoqkmm/IKa8/QsuI1MhNovU5FxcaozaeA==
X-Received: by 2002:a2e:858e:: with SMTP id b14mr8195605lji.301.1595757556006;
        Sun, 26 Jul 2020 02:59:16 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id q3sm1722904ljm.22.2020.07.26.02.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 02:59:15 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 1/2] opus-tools: update to 0.2
Date: Sun, 26 Jul 2020 11:59:12 +0200
Message-Id: <20200726095913.3962157-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../opus-tools/opus-tools_0.1.8.bb                | 15 ---------------
 .../opus-tools/opus-tools_0.2.bb                  | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
 create mode 100644 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb

diff --git a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
deleted file mode 100644
index a84f2bf078..0000000000
--- a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Opus Audio Tools"
-HOMEPAGE = "http://www.opus-codec.org/"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=843a066da9f1facfcc6ea6f616ffecb1"
-
-SRC_URI = "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.gz"
-SRC_URI[md5sum] = "b424790eda9357a4df394e2d7ca19eac"
-SRC_URI[sha256sum] = "e4e188579ea1c4e4d5066460d4a7214a7eafe3539e9a4466fdc98af41ba4a2f6"
-
-S = "${WORKDIR}/opus-tools-${PV}"
-
-DEPENDS = "libopus flac"
-
-inherit autotools pkgconfig
diff --git a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
new file mode 100644
index 0000000000..766507de17
--- /dev/null
+++ b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Opus Audio Tools"
+HOMEPAGE = "http://www.opus-codec.org/"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=79f6fc2a6239fbe5f6e52f20ac76698c"
+
+SRC_URI = "https://archive.mozilla.org/pub/opus/opus-tools-${PV}.tar.gz"
+SRC_URI[md5sum] = "ff2d0536e960cabbfb8ca7c8c1759b6c"
+SRC_URI[sha256sum] = "b4e56cb00d3e509acfba9a9b627ffd8273b876b4e2408642259f6da28fa0ff86"
+
+S = "${WORKDIR}/opus-tools-${PV}"
+
+DEPENDS = "libopus flac libopusenc opusfile"
+
+inherit autotools pkgconfig
-- 
2.25.1

