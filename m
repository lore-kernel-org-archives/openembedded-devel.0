Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web12.1942.1596011742471191380
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 01:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=KTXN1/lR;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.181, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f181.google.com with SMTP id b25so24126115ljp.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 01:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrhXJ2dUuBaycg75itjMoWG4crfHJGFcOLSKPd+STS0=;
        b=KTXN1/lRymOgqb2eicygN5j8IvIdGQ5BbBjvT3OVNKbDDhaDMgxVS6jlPTB4V91FsS
         gZxF/wZ7GRQ9YHXNQAI0V3WOciWnaxyx8KI58SO3xPIpjYDkQuRuXidZsV4JAIoT+qGR
         odXZhQfg27Fed8YsXTkq2vAkallp9xYPrmy0avTk5P7WuhXSfXh8gspKsDUc1ESdP8YC
         Yr+FqNK0oFfGlCRaluYmdAJGotOMS8T2FaHmZsoj0Ac8xx0lDGB1SRqn9Z64yEEDwqmc
         9zBBc5+XPwb89xNIoDuTU3J8uKZSro6/tl26QAjQc/jXIhRnxDo/cbTRnMICkbY8yfqt
         +b2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrhXJ2dUuBaycg75itjMoWG4crfHJGFcOLSKPd+STS0=;
        b=Qfk44GVXm9Kf6CtsKL7bYvqj7KAKperVNcoPbCS/vksrhaow3+PqdnZvC1wYzCK/gO
         Tl9MeaC+9jbmfWwLaXf5wQYFrVpeXqB2jGyG121CV5WJFb+QQHz8XMHot07dY43MOZ+l
         EuW4breVTlop75J4qGE9EPiZ36TsfYvCW/H8+pjbILH98GO/M3TG/ItzA8Y2cxS/vdYF
         gxeHJUK+A0HSeohqFqht/9BpZoOSKJQfc3bkM17e+nbNFydi1FxIHJFXW4FkEj86smKo
         +zR0lXYfNpxdZai5d+UbonfDVNL2htmLZ/ZOg3MsVYqJHLVr55RjSQvIVNywBDv6CuKD
         lNkQ==
X-Gm-Message-State: AOAM531bddUHJvSNUn3CvxZ2DbFhPjx5kgbcI04xgdjFQOy2WxrbYAcf
	061th1Excja+uRNKTtypV9Uuvs5vFO0=
X-Google-Smtp-Source: ABdhPJyzwJe61CgFbTeQITWN4ecSGpjsIWE5tHPp3fRvlsL2JQli3XI1p9Ojv5PXXhrGd4eyoL2ddA==
X-Received: by 2002:a05:651c:110b:: with SMTP id d11mr577488ljo.245.1596011739856;
        Wed, 29 Jul 2020 01:35:39 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id s9sm258780ljh.46.2020.07.29.01.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:35:39 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 1/3] opus-tools: update to 0.2
Date: Wed, 29 Jul 2020 10:35:35 +0200
Message-Id: <20200729083537.2740433-1-open.source@oleksandr-kravchuk.com>
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
index a84f2bf07..000000000
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
index 000000000..766507de1
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

