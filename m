Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.5546.1630581911365138376
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Sep 2021 04:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OO96gmOg;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: whuang8933@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id m21so1531432qkm.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Sep 2021 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/80onwq8rX5y3mCoU06lNdbNMJDin6XVYWf7ecJHqfY=;
        b=OO96gmOgpuxZWLFOphADKHWtMVlzm88cXaNORtf136EsK9gpsZYYPBjhESdWhYP1Rk
         8fFH1KzpORlXyoUlh/eo492BhkuM0hbJ4AszAbnNIzav7nnkbwwV5MILsacfOtV7HThG
         jifD0WZNaVa+OIHJxMAiRG57Wbzd5Hs4wNRPSSkYF28okWEDy4YscNEAW/cuwuDWL5jC
         i6FeBQl9f4WsrkD3h88oSygp7XjpGSWFNWyipbsTWQVuRCTYaoTorJpP3m3G0wvjZizi
         PeP7BTm/BPJPMwySHPl7NETr/uJ2pyspilwRPAx0pDV0EoL118lqf1yi+2sNAzWWhhBN
         LvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/80onwq8rX5y3mCoU06lNdbNMJDin6XVYWf7ecJHqfY=;
        b=MZvDE2PaHa+ctmNSob8brVt3+TsiGpn1yE4BbpRaHmcd9ocEiFGoLmJRIKilg3eqqh
         h2h8xGOQN5iWDGP92YLa7qFiaXS+D1BkImmUDCrh6FSkFkY9kJ4IY9Wejk2h1rnTN5at
         pb8QeFZiRot2CXOJ4vDc2hr6g9WpcTdsfv+k1vk95XcUcFlRxfAxisEwc+AY7O67oSfl
         9ksHVZRLhl3CCi9PlZ24WI8j1hM0cZ1/zoIRRQn3ODyma0DcujGzVtKtoXnKdhTqsBm1
         jJv+A2H7WZIupkSGM5+TwQkoUr9yr9LW69shMUbIgnMCl7r+eYOc2aVNY0Tgsf4J08sG
         WXwg==
X-Gm-Message-State: AOAM530i8hvYhXHoOGy5qChrWwHWXdMK3VLc6WZ0M46BGzQeGG8He5vw
	jaVkjS0RiVFy9Vtg07OukY6qLY0ECYqr/A==
X-Google-Smtp-Source: ABdhPJwKWorYgfLSUHOOp8Znp0TGeb4UtkK7G4W3bn3eHQ5ExsSrVV2MUE7gWQgXvoFowOwMQ0jJeA==
X-Received: by 2002:a05:620a:1aaa:: with SMTP id bl42mr2650150qkb.469.1630581910257;
        Thu, 02 Sep 2021 04:25:10 -0700 (PDT)
Return-Path: <whuang8933@gmail.com>
Received: from dfedgebuild.ht.home ([2607:9880:2d78:22:fed1:6d0e:981c:b5db])
        by smtp.gmail.com with ESMTPSA id z6sm1179844qke.24.2021.09.02.04.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 04:25:09 -0700 (PDT)
From: "William Huang" <whuang8933@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: William Huang <whuang8933@gmail.com>
Subject: [meta-python][PATCH] recipes-devtools: python: add support for Kivy
Date: Thu,  2 Sep 2021 07:25:07 -0400
Message-Id: <20210902112507.3635856-1-whuang8933@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../0001-add-support-for-glesv2.patch         | 24 +++++++
 .../python/python3-kivy_2.0.0.bb              | 71 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
new file mode 100644
index 000000000..e50c7e7e2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
@@ -0,0 +1,24 @@
+diff --git a/setup.py b/setup.py
+index 9a507c6c4..3f5b70866 100644
+--- a/setup.py
++++ b/setup.py
+@@ -680,7 +680,18 @@ def determine_gl_flags():
+         c_options['use_x11'] = True
+         c_options['use_egl'] = True
+     else:
+-        flags['libraries'] = ['GL']
++        if cross_sysroot:
++            flags['include_dirs'] = [cross_sysroot + '/usr/include']
++            flags['library_dirs'] = [cross_sysroot + '/usr/lib']
++
++        if c_options['use_opengl_es2']:
++            print("using GLESv2 libraries")
++            flags['libraries'] = ['GLESv2']
++        else:
++            flags['libraries'] = ['GL']
++
++
++    print("cross_sysroot: " + str(cross_sysroot))
+     return flags, base_flags
+ 
+ 
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
new file mode 100644
index 000000000..3f6bafda8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
@@ -0,0 +1,71 @@
+SUMMARY = "Open source Python library for rapid development of applications \
+    that make use of innovative user interfaces, such as multi-touch apps."
+HOMEPAGE = "https://kivy.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f0c851d60495c7e27225a819e179208a"
+
+inherit setuptools3
+
+SRC_URI = "\
+    git://github.com/kivy/kivy.git;protocol=git;\
+"
+
+# Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
+# and mali-based OS's. We need to patch the setup file to tell Kivy setup
+# that our machine has GLES libaries installed as well
+# Also, if using SDL2 as backend, SDL2 needs to be configured wth gles
+SRC_URI += " \
+    file://0001-add-support-for-glesv2.patch \
+"
+SRCREV = "dedcb6bcabe3d8d6758dcee607e8c33b174d782b"
+
+S = "${WORKDIR}/git"
+
+PACKAGES += "${PN}-examples"
+FILES:${PN}-examples = "/usr/share/kivy-examples"
+
+USE_WAYLAND = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '1', '0', d)}"
+export USE_WAYLAND
+
+# if using Wayland, let's use pure Wayland (and not XWayland)
+# so do not build using X11 flag when we detect Wayland
+USE_X11 = " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland',  '0', \
+       bb.utils.contains('DISTRO_FEATURES', 'x11',      '1', \
+                                                        '0', d), d)}"
+export USE_X11
+
+# Use OpenGL ES 2.0 library
+KIVY_GRAPHICS = "gles"
+export KIVY_GRAPHICS
+
+KIVY_CROSS_SYSROOT="${WORKDIR}/recipe-sysroot"
+export KIVY_CROSS_SYSROOT
+
+DEPENDS += " \
+    gstreamer1.0 \
+    gstreamer1.0-python \
+    libsdl2 \
+    libsdl2-ttf \
+    libsdl2-image \
+    libsdl2-mixer \
+    pango \
+    python3 \
+    python3-cython-native \
+"
+
+RDEPENDS_${PN} = " \
+    gstreamer1.0 \
+    gstreamer1.0-python \
+    libsdl2 \
+    libsdl2-ttf \
+    libsdl2-image \
+    libsdl2-mixer \
+    pango \
+    python3 \
+    python3-docutils \
+    python3-fcntl \
+    python3-image \
+    python3-pillow \
+    python3-pygments \
+"
-- 
2.25.1

