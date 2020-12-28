Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.41014.1609122862066079907
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JoiRTu2C;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id h22so21041238lfu.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Dec 2020 18:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vHch12S580dw+kt+TbKX5jVv2J131WmytOKRGPUwrjI=;
        b=JoiRTu2Cwez6uPSqsvr0GMffNoSJ8S93m+Ju08cin3qA+N8muqjAjCNkrDKWeuQQe2
         z77Z4T0F5F/BfBwCzke7C7YkwYZQLfPBIav3w2VXl1P76AvzMZ8eE7T3OoBYPwhfPhIw
         l4rvAaIUEPWMJ569mT8mt4oUV+FEX7F/3pxLuhXH8u9vSs6FQwWXqolyzOToOZOqVse6
         lCjL9qD88UCrpKgmj3zuCd8RiKSLXzVCxhekUFofxiVfkiKCos9TGfVJtr32eD+t+SOY
         779BE5AO8zehL2kEwUH3fMi/aUeboJEzuwS8y+WudPx6/MLHCVXzq8TlK/hoD+pGDHZU
         G1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vHch12S580dw+kt+TbKX5jVv2J131WmytOKRGPUwrjI=;
        b=KUSnRMJ0mm9/C/RfQihb4khU2V7KclagHeCwjR+pDQfM6j77jLxiMi2x15F+LATASH
         VoWmRxu4ZByPQjTamCy+keyvZQVP3wwXoqBBOlKvijS8Odl2MkagXV8Hz+R3ynuzZrlH
         aglcI6zUBUT3rdbek11lQ7q0IBvyMcqBUV6TF2fPni7tut7oRTv3mt1GSfQBFpg6wIMr
         4NwjFa7JTHpE9xNcdwfkNS1LDZkEaRwQXvcSnWRf9dAYzAjQBzjqWhqhO1zsPSiva5Vx
         KRy09/vuyKOjfwWzAU0VdPbhQqQWdWyG7umHzuCb/cUQbThBtnXNw12AyVc7A/cHxJ1e
         SYdw==
X-Gm-Message-State: AOAM531HEFYgH41UqyMCCx2tazMZa5QEkUDeB92nn/xApkxpoGBhDp+W
	ux6tgJZ0h/7zLVLv6iy613aNDI5616eTdkk8
X-Google-Smtp-Source: ABdhPJyNZ+KWvmbPPHYnVE2YFkSaxNo0wPQ+vZTMdTHPgrCBuFVsR8YiCVeJu4uZpQEBB07ROFDKhg==
X-Received: by 2002:a19:8c05:: with SMTP id o5mr574746lfd.304.1609122860063;
        Sun, 27 Dec 2020 18:34:20 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id t15sm5194248lfl.33.2020.12.27.18.34.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 18:34:19 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 4/8] xterm: install xterm and uxterm desktop files
Date: Mon, 28 Dec 2020 05:34:03 +0300
Message-Id: <20201228023407.3498609-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
References: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify recipe to install application desktop files for xterm.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-graphics/xorg-app/xterm_353.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
index 6de704d0b7a8..6376388c2757 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
-DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses"
+DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
 LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b17b57654cc81e8e"
 
@@ -13,6 +13,9 @@ SRC_URI[sha256sum] = "e521d3ee9def61f5d5c911afc74dd5c3a56ce147c7071c74023ea24cac
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
+# Let xterm install .desktop files
+inherit mime-xdg
+
 EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
                  FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
@@ -30,6 +33,10 @@ do_configure() {
     oe_runconf
 }
 
+do_install_append() {
+    oe_runmake install-desktop DESTDIR="${D}" DESKTOP_FLAGS="--dir=${D}${DESKTOPDIR}"
+}
+
 # busybox can supply resize too
 inherit update-alternatives
 
-- 
2.29.2

