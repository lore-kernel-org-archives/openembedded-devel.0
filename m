Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.28706.1610942444714734925
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 20:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V1iWkNeW;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id w1so8435111pjc.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 20:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=w85KjI4gWX64V7FRM+IJcCRpEY8Z1aO16jTkkAerL3A=;
        b=V1iWkNeWTPqNJ9GsXkN3cUCMHdc+vjBsXlvOsEPoaC0DzceVQXbrUIcAZmHBES/QX5
         Dpi7i2CcDxM2dBVh5yMCjQBXa+NXtwbKqB4a6931GWyWpY+K4CLXn8YV7HZnMa4JTUfi
         fOcgeMLtgyvD/RCJLsGsNZN7+ITKOZuh1iRJtB4Xy+9lNpfWlCbeBHsckEGXW37eO4nX
         Ju9GQ7iPLH/N66ZfMV3ODiWp0fZmg0Ne1tBrYtlIextRb6Kh6NEu3i2yDuY5iy5KFPs9
         uxBxQ2TbjCesj81rftrv53Ybc/8EhjRpb0IDE1dYZOqwIrMygUOwty6AMpVx2+sZmA+A
         tAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=w85KjI4gWX64V7FRM+IJcCRpEY8Z1aO16jTkkAerL3A=;
        b=rS1crc+NVt3fPYJ36gFjum2kpzX5hXN+ktaTD56tuYfv63hyRzbMR1DFVGg9qRPGf6
         NZ9V2t/o+GY8BXcufQ0KAwxma1wyTiGYsfXEtcAVxI98xwsvYUFEjmBFEEK8RUG9uHh7
         UIFQOc5BZhS+N7XFpXBSAPQThw0BXHQBp/V/D395WJEF/X0yWkFhJHTVW2V3tO/9ANm0
         zQRFilAF9xisjAd+08BcKNSM4gINijncEDef7rI6SX9tNMGS1OM+j3QO7T9MPNAH7Ovi
         OL0LimRYIFMZPWBRcNTybm1pEewrIu+PXf6KNjkE+cEtdKJCIt99qw1fXKgEmIH3zN2Z
         m9LQ==
X-Gm-Message-State: AOAM532Yv6+Hl1uDrhfhLzJEMMwoTEQCbnGwh+C6RfRcH9Wpn4sJ7glt
	kzzv3uudFqu4FnJyqPNNIArToC8BxxyU0A==
X-Google-Smtp-Source: ABdhPJxpNGQQfzX28alNLQiRk1IxR1q+76UQQ/lZGWEiK+Xh8GAgjPmanW2SRkkNaxYexlTZ3887fg==
X-Received: by 2002:a17:90b:1b50:: with SMTP id nv16mr19239984pjb.153.1610942443949;
        Sun, 17 Jan 2021 20:00:43 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:64d8:445c:d3ae:b514])
        by smtp.gmail.com with ESMTPSA id z13sm1625978pgf.89.2021.01.17.20.00.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 20:00:43 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] ipset: add recipe
Date: Sun, 17 Jan 2021 20:00:41 -0800
Message-Id: <20210118040041.30941-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

This is needed for login-shield pkg in meta-security

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-filter/ipset/ipset_7.9.bb         | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-filter/ipset/ipset_7.9.bb

diff --git a/meta-networking/recipes-filter/ipset/ipset_7.9.bb b/meta-networking/recipes-filter/ipset/ipset_7.9.bb
new file mode 100644
index 0000000000..95e48f0131
--- /dev/null
+++ b/meta-networking/recipes-filter/ipset/ipset_7.9.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2017 Aaron Brice <aaron.brice@datasoft.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Administration tool for IP sets"
+HOMEPAGE = "http://ipset.netfilter.org"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+SECTION = "base"
+
+DEPENDS = "libtool libmnl"
+
+SRC_URI = "http://ftp.netfilter.org/pub/ipset/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "b75c13689eddf1d95b396840a69dc04fd7ae4112b10b70594bc0405df7b9b30a"
+
+inherit autotools pkgconfig module-base
+
+EXTRA_OECONF += "-with-kbuild=${KBUILD_OUTPUT} --with-ksource=${STAGING_KERNEL_DIR}"
+
+RRCOMMENDS_${PN} = "\
+    kernel-module-ip-set \
+" 
-- 
2.17.1

