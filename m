Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.1912.1609980862703585847
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 16:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lmGcWfOx;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id m25so10719457lfc.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 16:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/oElN4Wf+SqRgHPKI3YxnGbpmIMxuZxlfYi0ZmGfxs=;
        b=lmGcWfOxQerZ06VVbXU+FT5bdXjorJjJvMJ58Pvw1Fztph4H78HV31gG+wJrm2FNEp
         ccC5rJBiGzwv3wALV2aGuOZQPQB3C7af6+eC0UFdWefHdd0ApfEXg00UvmTKu2zc8/Wx
         rh2S89EIj4vcwml59D1SF0V3T6c4tM1fHHILIqm+Q8CVioF93bvpXieRYJkuJEWnngLT
         ORbsO/DyIemxEEaTF97u6XWqBK/h7FLDkkt+rbTRv0bf3SBXQEw3GlXWPMqHWBmngY3I
         2KPECc0IEc1fqIBj8Ak62dqstg9xtVTobIJE5Y8xcVvc9k0ajX1LvqO760N2MxVzcRlx
         US2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/oElN4Wf+SqRgHPKI3YxnGbpmIMxuZxlfYi0ZmGfxs=;
        b=cJFKar4PP84cLyn/n/efETDCP1yd/viY1GBJfboGkw1865JJ0j4nvQoPw+viG356O+
         Kfps0c6aljURuXjupD5+MLMBB7yIr+B6MK8rvzzL7sFbVZIOeomZ+WSDiM3POYgTkc+k
         jvV1uImgrRYBgktFl7YX7/PmRH1tr/MQSHWmgt9f40ZLw5SczIA/lQPJyaMtZX9T4hfv
         st/z5jIZI5f/y0AVetQaU3u6DdJshp+qZxKp4Qdb6l0BLfysbd5asdxlpCRXbEwDe97K
         8vqeEKhNFv42slvVEQjXMWslFCj6CQ2DqmqeKUrO/Lbc1YFF74wlA6GxV5KIMIS4hSdw
         5Rtw==
X-Gm-Message-State: AOAM531wiP0kFMwGaRRfn13AsFoHmP+rNZP7Eo3Zdi6XLzdAqog6UUTh
	qACtHaX+i3CU6z0gxVSTKK7iknuf3SAORQ==
X-Google-Smtp-Source: ABdhPJw+h/r+QJXXfDMDdT4vBPCi/L7/zrmQuayuqMANKQLc1XVo80HHRmlN93qZRriYfPRFYeHHHg==
X-Received: by 2002:a2e:574c:: with SMTP id r12mr3197457ljd.139.1609980860154;
        Wed, 06 Jan 2021 16:54:20 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([188.162.64.122])
        by smtp.gmail.com with ESMTPSA id v11sm791357ljg.128.2021.01.06.16.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 16:54:19 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 1/2] xterm: install xterm and uxterm desktop files
Date: Thu,  7 Jan 2021 03:54:17 +0300
Message-Id: <20210107005418.779965-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Modify recipe to install application desktop files for xterm.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 593f21eda5b119f6408975c6b15e94fb168cc9dc)
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

