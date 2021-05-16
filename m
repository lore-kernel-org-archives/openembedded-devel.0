Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.4195.1621158048878613152
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 May 2021 02:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IhLaJ1L0;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id w1so323587pfu.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 May 2021 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N658yWG0+C385J8DHD1zNslZJ4eUZHTuGiNhDk/LB5g=;
        b=IhLaJ1L0c1OiPzhEqMsoBW2yVpk4LFi/ZsOvhglh6GRQUr+9vg19etz5Hx2vW270XW
         gATEwCPgw3O58oX7YdoHGbnGa+8WMbgfpMxY7mctqLib3efdqsQoI1si2brkXBz2FvzK
         v2iXlpiNAzsMT9DDUNbg172wtIis+F4P99dimYIIwq7XRwZOP1vQhxHrDoIG5c1c+q+x
         DmZfmzZaYPCWP9U4Dbqtq1jboXQmCim0YwFKY7N4r69sV/K4RVdc7NyO1w7OTdbuFCuJ
         GWSmGKxFhNce3HFKD2zmcbqudMk5XPNzDaZYj6j4GaGO9UKqfnjbhd5pDkmDMMzi46hT
         pAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N658yWG0+C385J8DHD1zNslZJ4eUZHTuGiNhDk/LB5g=;
        b=KkT/l+P2b4gct56jkWEDxQ5eD3gbeyW7sqETSXRG2YJeluTSbu6wCL4E/iMFEBGz/A
         kpxtOKUuf7OCvzy58xYZmGgyWmF6J4SIY9qXl/x9xnmob9pcPds8r3qukhn0JrMA0clR
         Swcxe7RkTvNk0aKJcn9zyAoQbojBj1/h0nJ5XAsz9IDjAeqO0/bCdq69w+MiwgSRo96Z
         FOu2vI4ill9SAVmJP0Gns2/AbMDqwmC2ahXC4M49zOhUJJwnPQeuzp4Ca/s2/hX4gHj0
         Yfc9r5jVYQz21TvPqM39ZvZa6itYLAxNpPMisCilx6VJPlSzz3Qx+nLeGkoeewMwlRps
         oRlg==
X-Gm-Message-State: AOAM530WdRrBpBi0ZBsUB+125QaTcVllBmKwxmLFEJfhMm1SwK1EKty+
	dcAbF7ELlMjkIObTxULdTq4bSthgaoySnQ==
X-Google-Smtp-Source: ABdhPJwSB8GT0YkReiEaAPmz25/PpX8BRZDbQfBZURE1b8eoVjmRzRXu/xA0T0PxMLZKqTUEoU90IA==
X-Received: by 2002:a62:5f86:0:b029:2c6:2aed:b8f9 with SMTP id t128-20020a625f860000b02902c62aedb8f9mr30711270pfb.65.1621158048037;
        Sun, 16 May 2021 02:40:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id g21sm7752407pfh.81.2021.05.16.02.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 02:40:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Update to latest master tip
Date: Sun, 16 May 2021 02:40:45 -0700
Message-Id: <20210516094045.2321532-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop upstreamed patch
jinja2.Environment.compile_templates no longer accepts py_compile
argument so delete it

Fixes
TypeError: compile_templates() got an unexpected keyword argument 'py_compile'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/libcamera/libcamera.bb |   9 +-
 ...o-variable-to-avoid-range-loop-warni.patch | 117 ------------------
 2 files changed, 6 insertions(+), 120 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uvcvideo-Use-auto-variable-to-avoid-range-loop-warni.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index b05df32102..30dab1d928 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -10,12 +10,11 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = " \
         git://linuxtv.org/libcamera.git;protocol=git \
-        file://0001-uvcvideo-Use-auto-variable-to-avoid-range-loop-warni.patch \
 "
 
-SRCREV = "f490a87fd339fc7443f5d8467ba56a35c750a5f7"
+SRCREV = "193ca8c353a42334f65ddfc988a105a47bca3547"
 
-PV = "202102+git${SRCPV}"
+PV = "202105+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -31,6 +30,10 @@ RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayla
 
 inherit meson pkgconfig python3native
 
+do_configure_prepend() {
+    sed -i -e 's|py_compile=True,||' ${S}/utils/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.py
+}
+
 do_install_append() {
     chrpath -d ${D}${libdir}/libcamera.so
 }
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uvcvideo-Use-auto-variable-to-avoid-range-loop-warni.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uvcvideo-Use-auto-variable-to-avoid-range-loop-warni.patch
deleted file mode 100644
index cec5fc2872..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uvcvideo-Use-auto-variable-to-avoid-range-loop-warni.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-Delivered-To: raj.khem@gmail.com
-Received: by 2002:a05:620a:20d3:0:0:0:0 with SMTP id f19csp2716715qka;
-        Sat, 27 Mar 2021 19:58:30 -0700 (PDT)
-X-Google-Smtp-Source: ABdhPJwyDnjZqZmFqHVShb/5/RoVkJ4Avv5bcnyuo85vIRR2vJDQF+QBZpQpEWHgx5GuEuwLVSC+
-X-Received: by 2002:a05:6512:22d0:: with SMTP id g16mr12125441lfu.650.1616900310724;
-        Sat, 27 Mar 2021 19:58:30 -0700 (PDT)
-ARC-Seal: i=1; a=rsa-sha256; t=1616900310; cv=none;
-        d=google.com; s=arc-20160816;
-        b=bZlu68tossyE2YcGkt0HzIhqTUroWDT/EgJvAiQBgZ6bPzMJ+wjwWp3LzViqOxiRPQ
-         r0cFyme7CJ9YRf2TLmpjGuv2RPQ+EkrtFdlB7i65nhDrwvBoxt78vF2tUoDgVLL1YrU9
-         wKgHPtBjtDcDveOXKQJH2j5HRwiBjCXlPRBhlSxV8kJPBj//dRaKm0MsxfiW/IgyN1tZ
-         FFxfe4Lk1Awm8ZKAklhdKMly3MFA6IbnjwNcN/84a0R/0+PLu9X8XIR6+CnrfqSgWOBx
-         zsV8p3HuVQTpX7Hhnkiz7PYudHsJJ/7KXeXTP6s9NNnZGu9A6U/E6VOob5BSm9DDIA5z
-         4AnA==
-ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
-        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
-         :to:from:dkim-signature;
-        bh=fbAn+wsNks5BGTY34H4T90NDFJaNV4nnt9vc9DBFaWQ=;
-        b=mLZNiQR/CdgcVTAc7OQmK0ZYTVpofG/EOqTIi2NYIYFhanWhatYY9Hx2xwxIp6kQ5R
-         n0uXh5tLth6aPYD09z3YcXYasEIszBKwoNUFjRA85lFm3d5/J2S1wC5rBy25QeCDOg57
-         QdzYrTBX2QGRHGQKauEnX5FLDTT+I53sPa87TyvxUKBS+lTAbJig70KfmL7FJIEWT1ZI
-         CZKCErYFlQTGNnwM0CYVXyHv54D2tA25veHQIJN8KK+XObNWuAY3rYpqKoUpOP4vpSPi
-         MXJWAV4L6NZEShWvwJiC4Zdy2xFzXASX27CAKIsX6T5Rub03grVTg6WVt9bChK1x5jeg
-         A2Yw==
-ARC-Authentication-Results: i=1; mx.google.com;
-       dkim=pass (test mode) header.i=@ideasonboard.com header.s=mail header.b=MniKswyT;
-       spf=pass (google.com: domain of laurent.pinchart@ideasonboard.com designates 213.167.242.64 as permitted sender) smtp.mailfrom=laurent.pinchart@ideasonboard.com
-Return-Path: <laurent.pinchart@ideasonboard.com>
-Received: from perceval.ideasonboard.com (perceval.ideasonboard.com. [213.167.242.64])
-        by mx.google.com with ESMTPS id v18si12339470ljj.208.2021.03.27.19.58.30
-        for <raj.khem@gmail.com>
-        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
-        Sat, 27 Mar 2021 19:58:30 -0700 (PDT)
-Received-SPF: pass (google.com: domain of laurent.pinchart@ideasonboard.com designates 213.167.242.64 as permitted sender) client-ip=213.167.242.64;
-Authentication-Results: mx.google.com;
-       dkim=pass (test mode) header.i=@ideasonboard.com header.s=mail header.b=MniKswyT;
-       spf=pass (google.com: domain of laurent.pinchart@ideasonboard.com designates 213.167.242.64 as permitted sender) smtp.mailfrom=laurent.pinchart@ideasonboard.com
-Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
-	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11F12332;
-	Sun, 28 Mar 2021 04:58:28 +0200 (CEST)
-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
-	s=mail; t=1616900309;
-	bh=BwCg4h9N9fJysbMT1Yjbazbp7zTImD9mkWJSjCKzCmg=;
-	h=From:To:Cc:Subject:Date:From;
-	b=MniKswyT+aUtPgeMFeLqW6cRMFsPRN4W1XtVDA6pqI0QTSSx5koEuzSfEybjs6Qbp
-	 ZdQar1r5nBIRCg9uq85YoLKoFeT7WN4PrwnRYPwaYGAFHfV44rDrq4RBe3VOIb+85W
-	 tKn4HEzjlFelrImVbeymBsgpVhITveSVH1MdYRsE=
-From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-To: libcamera-devel@lists.libcamera.org
-Cc: Khem Raj <raj.khem@gmail.com>
-Subject: [PATCH v2] libcamera: pipeline: uvcvideo: Avoid reference to temporary object
-Date: Sun, 28 Mar 2021 05:57:41 +0300
-Message-Id: <20210328025741.30246-1-laurent.pinchart@ideasonboard.com>
-X-Mailer: git-send-email 2.28.1
-MIME-Version: 1.0
-Content-Transfer-Encoding: 8bit
-
-From: Khem Raj <raj.khem@gmail.com>
-
-A range-based for loop whose range expression is an array of char
-pointers and range variable declaration is a const reference to a
-std::string creates a temporary string from the char pointer and binds
-the range variable reference to it. This creates a const reference to a
-temporary, which is valid in C++, and extends the lifetime of the
-temporary to the lifetime of the reference.
-
-However, lifetime extension in range-based for loops is considered as a
-sign of a potential issue, as a temporary is created for every
-iteration, which can be costly, and the usage of a reference in the
-range declaration doesn't make it obvious that the code isn't simply
-binding a reference to an existing object. gcc 11, with the
--Wrange-loop-construct option, flags this:
-
-uvcvideo.cpp:432:33: error: loop variable 'name' of type 'const string&' {aka 'const std::__cxx11::basic_string<cha
-r>&'} binds to a temporary constructed from type 'const char* const' [-Werror=range-loop-construct]
-|   432 |         for (const std::string &name : { "idVendor", "idProduct" }) {
-|       |                                 ^~~~
-
-To please the compiler, make the range variable a const char *. This may
-bring a tiny performance improvement, as the name is only used once, in
-a location where the compiler can use
-
-	operator+(const std::string &, const char *)
-
-instead of
-
-	operator+(const std::string &, const std::string &)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-
-Use a const char * type instead of auto, and update the commit message
-accordingly.
-
-Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
----
- src/libcamera/pipeline/uvcvideo/uvcvideo.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp b/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp
-index 031f96e28449..b6c6ade5ebaf 100644
---- a/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp
-+++ b/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp
-@@ -429,7 +429,7 @@ std::string PipelineHandlerUVC::generateId(const UVCCameraData *data)
- 
- 	/* Creata a device ID from the USB devices vendor and product ID. */
- 	std::string deviceId;
--	for (const std::string &name : { "idVendor", "idProduct" }) {
-+	for (const char *name : { "idVendor", "idProduct" }) {
- 		std::ifstream file(path + "/../" + name);
- 
- 		if (!file.is_open())
--- 
-Regards,
-
-Laurent Pinchart
-
-- 
2.31.1

