Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.16498.1608945663055294573
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cH+ETZgL;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id h205so12288062lfd.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vHch12S580dw+kt+TbKX5jVv2J131WmytOKRGPUwrjI=;
        b=cH+ETZgLKkOLI3OJi3sEpyZv/jMj4P9IvRuBJ0silt037/uHzazTNqRySPUl45w6rn
         sH9Gj8wP9nJa1d5yaibaK4gxQ1YF8dkBx6430VXkUo2/ChHuaS146+GmhiyVK8nl6u/a
         Wff99zwNfkQTQ1SyCe5Yvn2HxzUV6p6LsAJF5+abtsurz6mEWiXARxA4OjK4h3Z5nap8
         cUY5npYMCpcW9vIAAe9FngbFchF6PF2PtL8bSlOUcEDZfEz1FM5ruNm6m12sb0QcePLq
         /wN/Bbb/VsAspLI6p949j9aOhHmhUC4+4eT0ziq+AtUfdT2uChe3oHMSGwvq6q00uNg5
         MU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vHch12S580dw+kt+TbKX5jVv2J131WmytOKRGPUwrjI=;
        b=XSQyWDX935GMXFev6gbv5a/yYNKJyGUpe2lDsO+nMgz5qDf3Zj3aZNIfrY7ZTDoa0U
         yeafBJ5j0lkgt1PSnjDKGUPVx/SdCksncF+QpS5l/oyeCW6/KYS0EXg6Ijna6lpRKH1+
         4BLHAvOvL6qAgFwcQ2bS5r3zSG2DOSbTz4gK72oBbBHqmRaaMw+7Puh92oPl63UjIZcg
         upjIliQWmki9fJM7Awf0rXzyNZJeXZHUSMBYs15vl48tZv1NIBNaOEg27CYgo72zdFoP
         J/9aCAfvf2CQuyEiyZ5sz4RnlYk+nm9qwPMW2q12vjRrayZ2i6pqSPdUOAXgKeLqtUjz
         6DvA==
X-Gm-Message-State: AOAM531rxJn1jC+vwZi+pIC5oDfLFMiWtS3MwLs7NZ9xVJcOsF9OJIE5
	IpwzKzE0ZiELbMglpwmDjrChdumnmB95eQ==
X-Google-Smtp-Source: ABdhPJyOJThZay1hSCgN+loMnDtQqcxU1+EeLA14pDAUtgOEXq2iaTJZ9vLu9gCP5jBjQd2jTem6fQ==
X-Received: by 2002:a2e:720f:: with SMTP id n15mr16249017ljc.405.1608945661024;
        Fri, 25 Dec 2020 17:21:01 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.59])
        by smtp.gmail.com with ESMTPSA id a15sm4306317lfg.27.2020.12.25.17.21.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 17:21:00 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/7] xterm: install xterm and uxterm desktop files
Date: Sat, 26 Dec 2020 04:20:52 +0300
Message-Id: <20201226012054.3689086-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
References: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
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

