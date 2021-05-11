Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.7071.1620698858135096742
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 19:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jn2Fh51z;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id b11-20020a7bc24b0000b0290148da0694ffso327642wmj.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 19:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xs6esllyC01YjIRfRDbm5lqU/2WtGyva+DprVpDx0+8=;
        b=jn2Fh51zcmAosxNHa6k7iUc0uuWin6XrlhvipUk54VF3n7300gM3cC1BJLtibB+Ezr
         DpZEjSby4/qCUOa8E+9jEe3YzTh8C9vlj9I3P9DTOp5sHvMqyq1eI2dFnxGBG91pBHjg
         leJinmWwU+mAZgyLJv+5imb4HWfyQcNlJEK8vKe80IWQH6tQDy6OYfEKNU02fZEyLTiX
         LxCn0Tv2IaxjT8ZTXMxwQJcq4tMM9GOZGFjTNzNTLEWnOSaDgwIoqIzrA4X8NeFJfMQP
         6Wqw7b9+ztwqMm2sdxmV0cWH0PBXza+AKvHUVRVeHUa6/tNebCSmUo+FPTiX07ME/axn
         K3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xs6esllyC01YjIRfRDbm5lqU/2WtGyva+DprVpDx0+8=;
        b=OIprtTLxm07Br/fvNdlTuHPWEdz/sSXohh079vX7ARwNJL7i8dBkktXqi4P84Q5epo
         6TjC85WuRw7iS+eaLZXsoyvasJz+PUdx+WnNX00Rftw4ZWpoMTVauTgAkTtpEjXx1guY
         7D6jakCDEgbf03V75qiulOrID19lhsfU1eBVdeorWfs2kWmSoylkE/oIsatCoRhn0Dig
         29Gs1+KhTTNZQbHYkxmFSNA9hlrlXTVw/oRAeyV/WiXKMxXnKgcqzWMmI4qL3hT5yA20
         Uu0MkqcDag6G0Ssrb2aaan5LsNLidyxPnCtZCxHjOCFgriwwrn63PeslEPqYVj1YbIrf
         427A==
X-Gm-Message-State: AOAM532vuoQT6cGsUbVuXU+F6CeIPBFNpMz6xFttMIi5OkYH/9Abpmby
	DtFhOlZ+MOiOzmGdM1xYtYveUSUMdJU=
X-Google-Smtp-Source: ABdhPJxUEFBDM4IRgpkAkLtZuBW1s7T4RxkzsZtPo1AVvgHqA8RAwSMryKiQDWuz56jKhBNcsCLTrQ==
X-Received: by 2002:a05:600c:1551:: with SMTP id f17mr28787967wmg.124.1620698856529;
        Mon, 10 May 2021 19:07:36 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f4fac346ac282ef7d435921.dip0.t-ipconnect.de. [2003:f0:7f4f:ac34:6ac2:82ef:7d43:5921])
        by smtp.gmail.com with ESMTPSA id n12sm20145075wmq.29.2021.05.10.19.07.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:07:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/7] libgtop: tidy up recipe
Date: Tue, 11 May 2021 04:07:19 +0200
Message-Id: <20210511020725.346160-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
index f0c9cdb0e..63615e433 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "LibGTop2"
+SUMMARY = "A library for collecting system monitoring data"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
@@ -8,9 +8,6 @@ inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-ver
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "c6d67325cd97b2208b41e07e6cc7b947"
 SRC_URI[archive.sha256sum] = "78f3274c0c79c434c03655c1b35edf7b95ec0421430897fb1345a98a265ed2d4"
 
 DEPENDS = "glib-2.0 libxau"
-
-EXTRA_OEMAKE += "LIBGTOP_LIBS="
-- 
2.30.2

