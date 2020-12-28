Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.40791.1609122859542368592
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=njGCS1w1;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id a12so20977771lfl.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Dec 2020 18:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=V+bVDergOhQjHxb4VEdIHDDuH8fPYC/bAbHJMrE/doU=;
        b=njGCS1w1rx0ky+4+mw2GQSGjNEoU4MUHjzxFo9b5igUpKIqnZyZosm4c+ajhm6tIwu
         IHZ0eWDkw2gVjGcWFO/Dq2WudYW90lYR2M6WBU7iR6w48j8SkoXGn7jgcw88lyB49sDV
         AvdbBMmMXRdBK8wrEY9Gg4hTc60+KqzN02fyTW5Uj2dBZ+hCzqbCf6gzf6n8FIneKa3S
         6/k7uHHz9/XQbqIZQiH5QM3J7WmPOguHGILC37fDZeAo2J+DjEdhr1duk+zX8IbhDPpt
         ePdvAdSmnCqu4u6VLOIRizJ/EdYXVwFKIY+t8MyWlkl2CFJnHrIodJTOpIyj4RxFHMln
         C2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V+bVDergOhQjHxb4VEdIHDDuH8fPYC/bAbHJMrE/doU=;
        b=F2ibzu0mwQ5XhQolff7K67gE+h4P0RtkKpkMR6eS8fZgzdOscgsMJrfGKf4CHr9n9N
         kLim9iIbm1GiXhcYRKuVXaWBvV3Buz1l9e3rlBfNVLapV4XwsXLV/CrUB7xUdmX2ERC7
         Co1opygiQXf7Ip49hbohNiFHQXcs6OZ/uHcnfAkIF2b9Q5qxqZSBmIauiUQo1jOrntUP
         dYgk7IzdF2UdMF396nRQ1RyRGlEqiTRV3dpWvUY8PxLBIMF2iE903FrXoSKf70qO0p0R
         SFsw+eoMXT/aUM95LT8s4z6hXN1fI/P2L0zP91sdjPojqVQyffpZwJQEXz2NARPu2Oyh
         I7Dg==
X-Gm-Message-State: AOAM533heFaj30R4l9YDyV/Dce2N0mss2YkW2BKP1rBquxYR27fkkk1e
	Pujw3bC4ckKmJZ4oH7M2ygoySnT92rVUnJAr
X-Google-Smtp-Source: ABdhPJxdf7o6JGmK1KAUybKtlx/U7I9REdNfITs1ZVwgkm1/GR8EhlcWB6tidLIcpyxWYF8jQSc9sQ==
X-Received: by 2002:a05:651c:11c9:: with SMTP id z9mr19868214ljo.96.1609122857518;
        Sun, 27 Dec 2020 18:34:17 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id t15sm5194248lfl.33.2020.12.27.18.34.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 18:34:16 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/8] feh: imlib2 based image viewer
Date: Mon, 28 Dec 2020 05:34:01 +0300
Message-Id: <20201228023407.3498609-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
References: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add feh, small but powerfull image viewer. One of its features is an
ability to set X11 root window background.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 meta-oe/recipes-graphics/feh/feh_3.6.1.bb     | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/feh/feh_3.6.1.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 82db3d6788ad..47ff91a4f872 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -448,6 +448,7 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm", "dnfdragora", "", d)} \
     fontforge \
     fbida \
+    feh \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "freeglut", "", d)} \
     ftgl \
     fvwm \
diff --git a/meta-oe/recipes-graphics/feh/feh_3.6.1.bb b/meta-oe/recipes-graphics/feh/feh_3.6.1.bb
new file mode 100644
index 000000000000..1e49e68f8959
--- /dev/null
+++ b/meta-oe/recipes-graphics/feh/feh_3.6.1.bb
@@ -0,0 +1,31 @@
+SUMMARY = "X11 image viewer aimed mostly at console users"
+AUTHOR = "Tom Gilbert & Daniel Friesel"
+HOMEPAGE = "https://feh.finalrewind.org/"
+SECTION = "x11/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f91bd06901085c94bdc50649d98c5059"
+DEPENDS = "\
+    imlib2 \
+    virtual/libx11 libxt\
+"
+
+SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "9b1edec52cbae97b17530cb5db10666abfb9983f51a5d820c89added6f7b1ea8"
+
+inherit mime-xdg features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+EXTRA_OEMAKE = "curl=0 xinerama=0 PREFIX=/usr"
+
+do_compile () {
+     oe_runmake
+}
+
+do_install () {
+     oe_runmake install app=1 'DESTDIR=${D}' 'ICON_PREFIX=${D}${datadir}/icons'
+}
+
+RDEPENDS_${PN} += "imlib2-loaders"
+
+FILES_${PN} += "${datadir}/icons"
-- 
2.29.2

