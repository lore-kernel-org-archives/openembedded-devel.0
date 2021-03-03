Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.1084.1614813871493797523
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 15:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jJwLnA6r;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id o10so17545273pgg.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 15:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJEgzJSB5l9FI762/8iHFvPyQKO4kzl2xyNXD992S88=;
        b=jJwLnA6rgqi7hfO7AEGo5LmwuoF+wEv7rDbf/iqHnRkNlEj0sihGukeS9/+nr7lgN7
         pLTFBdJmsnIrYO9qFGPdjP5NXCAS5GrCMBfVjxsy7N6QzaAJ3dbMi/BnzV4dQgGNbsPf
         llOZ+NJMcBRwiXKhPx9i9g1wzu3n9ughhdLRihCB+uo2tGL2hThoXFt0uRc3BvMebvhi
         njybmw5EQp7KxNcky8PNxaDSOzMHf+q5szYwZ/3qcaHahkld3N/VmvkeuJUR91rzP+Uk
         W9sBqQZBQqRmMPWtHwCzFGa9sjwkaHXDWFag+RoHezSNRuvDbBIiKLZHnNXq1OiKrYCJ
         GezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJEgzJSB5l9FI762/8iHFvPyQKO4kzl2xyNXD992S88=;
        b=nVviMP0657U4OprqIvZF0iTud01RjV90rtZnqb3TYpNh7yyrNlbrOUgP7aLyEDrp+N
         qd8+Ld2GvgMSefyrNF0S/KJNF7tJ3ZD4aiebMETPQ3xf2ywHsPRpjmHivAEtCJmn1g3r
         0QiBRZFa5vAzmoazwraMTqbQVRnnjAPJnJ7xT2KQCA7KxIcrN/PUxjlq1uxP45z7RgHt
         zWD5NKFfChBS9gqUathAP6jlKfE+tY/xOb4xz6ychnjwpwQ329e+PSlOJTpBYXiBWpYu
         WtVNLorVZ/RZPv+Y+Zk4Ja+8HegYs04Pc6qBc0souWsDxzE4SXUQsY/7cf6FpMqT3DZz
         30cA==
X-Gm-Message-State: AOAM530tRy/SoVudWzidnG/Bz81rf2x5U6IxthYycR7N0pwVayTR1os1
	meYEXRrDcdi5nbPWO1NirE1+rUHdUylGTg==
X-Google-Smtp-Source: ABdhPJylEOKCy+7PiyjvZoMFEU8vObbWQwI9vNRx4uRccTVlrgYa48UsD5hDbqi9ojKnBLGVLXsMag==
X-Received: by 2002:a05:6a00:148a:b029:1ae:6d20:fbb3 with SMTP id v10-20020a056a00148ab02901ae6d20fbb3mr1281772pfu.55.1614813870637;
        Wed, 03 Mar 2021 15:24:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id nl9sm7855850pjb.52.2021.03.03.15.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 15:24:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Update to latest
Date: Wed,  3 Mar 2021 15:24:28 -0800
Message-Id: <20210303232428.3373728-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a fix for build with gcc11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/libcamera/libcamera.bb |  7 ++--
 ...o-variable-to-avoid-range-loop-warni.patch | 38 +++++++++++++++++++
 2 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uvcvideo-Use-auto-variable-to-avoid-range-loop-warni.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 5505626d3e..b05df32102 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -10,15 +10,16 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = " \
         git://linuxtv.org/libcamera.git;protocol=git \
+        file://0001-uvcvideo-Use-auto-variable-to-avoid-range-loop-warni.patch \
 "
 
-SRCREV = "1e8c91b65695449c5246d17ba7dc439c8058b781"
+SRCREV = "f490a87fd339fc7443f5d8467ba56a35c750a5f7"
 
-PV = "202008+git${SRCPV}"
+PV = "202102+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
+DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls boost chrpath-native"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
 PACKAGES =+ "${PN}-gst"
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uvcvideo-Use-auto-variable-to-avoid-range-loop-warni.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uvcvideo-Use-auto-variable-to-avoid-range-loop-warni.patch
new file mode 100644
index 0000000000..4ca412c695
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uvcvideo-Use-auto-variable-to-avoid-range-loop-warni.patch
@@ -0,0 +1,38 @@
+From 767267ef69c001870d41caf9c60dd7fec89b0a13 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Mar 2021 15:11:46 -0800
+Subject: [PATCH] uvcvideo: Use auto variable to avoid range loop warnings
+
+With c++17 loop range bases are defined where copy is obvious since
+iterator returns a copy and not reference, gcc11 will emit a warning
+about this
+
+uvcvideo.cpp:432:33: error: loop variable 'name' of type 'const string&' {aka 'const std::__cxx11::basic_string<cha
+r>&'} binds to a temporary constructed from type 'const char* const' [-Werror=range-loop-construct]
+|   432 |         for (const std::string &name : { "idVendor", "idProduct" }) {
+|       |                                 ^~~~
+
+Therefore making it explicit is better
+
+Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2021-March/017966.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libcamera/pipeline/uvcvideo/uvcvideo.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp b/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp
+index 031f96e2..ef23ece7 100644
+--- a/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp
++++ b/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp
+@@ -429,7 +429,7 @@ std::string PipelineHandlerUVC::generateId(const UVCCameraData *data)
+ 
+ 	/* Creata a device ID from the USB devices vendor and product ID. */
+ 	std::string deviceId;
+-	for (const std::string &name : { "idVendor", "idProduct" }) {
++	for (const auto name : { "idVendor", "idProduct" }) {
+ 		std::ifstream file(path + "/../" + name);
+ 
+ 		if (!file.is_open())
+-- 
+2.30.1
+
-- 
2.30.1

