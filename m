Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.25471.1605712085521002300
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d1TeyGe+;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id gv24so1187819pjb.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RrMiz/hVp4OSQZcs1+llyAW09lOC9+vKZzraolJTIJI=;
        b=d1TeyGe+y4M0UG/xHfizTJfTlxL/JZY1Z8xp7I4hb1Ho5waUHXuW9wD17blDRrkhrj
         srMCbhOK6KO7WuUPRFhR01eKyOWFhj3HLbf96EJy5qKZTQUwfHkdFTUddy4xS8h+DlUR
         8MZo21hDyj7lCBq+Xb9t1uQh0vg7aaReejlvcjh2qlfsLVS8u1GwRlOTi/SYDt/leT4W
         Ohr+DtGNzznN729NJtrOU7DSk+0XwmuJeaTewGZw6wInMqaX0BBHD3S9Z3rm6uSByTbI
         Ws0TOpSqK0bg8M7pWtAxQlVmjjVIiOD+/7V38v6a4eMMOlbGfKUqK0i+vma+5H4Fecm9
         MPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RrMiz/hVp4OSQZcs1+llyAW09lOC9+vKZzraolJTIJI=;
        b=NiG72waLSn2ICyD1lGUu2TFzVDtEFkXrd63vjAxTrJtnK7IkORxmbf5cqnK1E0dsPK
         7ABkFnorzBY8RUCfVg10fswQYe6xSNBdrX9Di2k2HtpmuIObU6SX6o3dKK5wjYahPmiB
         N7Dn4MXOy6/zDXgdnHvAWayNjuyCNayRkF1qEqGa3W5h6ix5GXja6Ye1a1p/LpzQKon4
         5JIPab/tADts5Wnv+WDX5/+XXxBkKv80FbTvkHoVBNP3MFyeG3FEqdSGBZZQ23eJeAPS
         WeunenghVi9xDUQPcuLwUG413gPUU9VtiIa+wmWKGKxLiMYy96OvXWLEKG/v2q079LGF
         nXqg==
X-Gm-Message-State: AOAM5304xaeIJPNsKMCuHAOAP/pDAN2bFYbuGjDsRLfKIeDz2SPSnU3d
	GEt74Cv5HJ4MOYHdNt9f8r3hOh5wsms=
X-Google-Smtp-Source: ABdhPJyN77tIpCTG/B+eotZXN5Alh6o3PzcG0jJATr1Mcok2TKHsWpULlHZnHZFLjrvmQdiUeD1vzA==
X-Received: by 2002:a17:90a:f317:: with SMTP id ca23mr355431pjb.141.1605712084700;
        Wed, 18 Nov 2020 07:08:04 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:04 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/17] usb-modeswitch, usb-modeswitch-data: fix usrmerge
Date: Wed, 18 Nov 2020 07:07:41 -0800
Message-Id: <8ce3a09b1341eb795c7c2846c7e19bf8d78277b5.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 50a487fc0b0123b154db73f79bbb18b23eb234f0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../usb-modeswitch/usb-modeswitch-data_20191128.bb            | 4 ++--
 .../recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
index 938c0f9c26b..ca970e59bb3 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
@@ -11,9 +11,9 @@ SRC_URI[md5sum] = "e8fce7eb949cbe16c61fb71bade4cc17"
 SRC_URI[sha256sum] = "3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9"
 
 do_install() {
-    oe_runmake install DESTDIR=${D}
+    oe_runmake install DESTDIR=${D} RULESDIR=${D}/${nonarch_base_libdir}/udev/rules.d
 }
 
 RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
-FILES_${PN} += "${base_libdir}/udev/rules.d/ \
+FILES_${PN} += "${nonarch_base_libdir}/udev/rules.d/ \
                 ${datadir}/usb_modeswitch"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
index baad340908a..6a5287af495 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
@@ -19,7 +19,7 @@ RDEPENDS_${PN} = "tcl"
 RRECOMMENDS_${PN} = "usb-modeswitch-data"
 
 do_install() {
-    oe_runmake DESTDIR=${D} install
+    oe_runmake DESTDIR=${D} UDEVDIR=${D}/${nonarch_base_libdir}/udev install
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}/${systemd_unitdir}/system
         install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_unitdir}/system
-- 
2.17.1

