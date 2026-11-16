Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22050.1794808962515799585
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fG23zX+T;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so8438552eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808962; x=1795413762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fX8Ov26be4ac6hGduAcboDyxQQU95lXBCyQfRMHTW+8=;
        b=fG23zX+TnB/G5FgmsGpjmwVMgmHap8+4foPMpzkBgY7Tqa3jpfVhpc0SRer5s7dLUs
         Yv+lhRF4c8GLkeGuhs71F9pq38Ws8gZ6fYN3dy7owaaf+KlVeD5CH+nqt1k5/akNGAYH
         4hsKcrxkgXzNTHvTaqV1EZEQkzAe49OXxMZelx132fj9JIetp3ESMRMnsOj5+IS10fzN
         CXzxpZpye7itQk3ue8fwZ0cWvSs3098v0mdBfexhTB2CTd4YUzBOtTKWrr//XQSvpql3
         Naoa8W0PFtbb95zLAhBjfBt2CAtSL0646VqAVpYYFzEc2b2V3VqHm3Ur6ajz28J8hsHN
         huig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808962; x=1795413762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fX8Ov26be4ac6hGduAcboDyxQQU95lXBCyQfRMHTW+8=;
        b=QBs+fvWAalAILlBQq8jMpY8MjflDpAhFwLRogpMKAO+ra7mqLrrQudP8IezTDYUSzg
         Vly98/zT3hEUoWKgEo1TrDCiEfmCRnZSUnR0ARThCqr5fOxy6GB5DEHBr7eFmJgkF508
         d2t3qEz3ja6d1MecKJW30IKawVe+fJwlydNJvHmiP2G+aJ06xEKgMa3tsxtgZjLRFayM
         JtIHiG/wvDdN4Lz3bTtjLCcQlf6wsMDlJntxieD2GCRYhWWNlDd+sppdNisRW1VQbFMb
         XYVvHlHvZ0fH5zR3NxtvbX8GHprEfRF0PZv2lwoFJ1EKBZLF5n3wGj9Xda2M3spIsaaN
         9Nsw==
X-Gm-Message-State: APuU4Z/tT9piXbWn7vWmQHz6tTRtFihz9251gsJCh+g8VAHiK4xhn+lv
	e2qfjGvDP5zpUnFlWbNxTyu4VRXuiKtq5TtTkFYkDyUVSHdClfNNvxDMtsn07r3D
X-Gm-Gg: AYBFou0Txw0r4Utp0DQuVNqi94e/8bOr4vAq9sG9GZXvWzgXlQROR/Ptsoz2V/0vXI4
	WNmDoWnXEVp1EB9+FVcBBT2LojO3Z0r3wNXbwrEr0V4n3Zqd+1i2+swrYi2+m/k8KCv5q+R9B3a
	Jzd3dD7F91HuP3ta64i+bxXR7AeUFV8aCEjot1bX3eXNBKBRNo5bn4a6QZDKwDAHO9CCoRWq5ht
	XQw4z7TpZfyu1K5fHst+0fXeQTyGwfvBAJHBXWO/Hn79KGWuidUoqywJedBSK8A2FO8zdYvtdoI
	QDEP1xV9+6jPoizh86FtWsOMbOpOJpPKejP/ScYJF4JMSksRlVB1Xgolog0cm8LVp3OCCfJ/FYN
	6HVNGEQ4JgxiNNdZRS8wfO7uJXv2Yzd0X42dvSeM9QS3HZ7t8Zvjzm8vBp3J7DA3/N0aeTPR/wz
	btL4YrDj9q0a5lZ0HwpyNZvGOWHlGOP5vu4JSoNtSGuBHgJEBJ0vI2SRZ3b1j50VJ0omyT3LHUV
	Po99MrAFZmL6LWtQ0PfSXC1atYhHpzhslpZGLLzaFvVP8Eunq71wf6JIUTOm+uunIF6sNjVRhiQ
	Z+wA1gmHozBBVJMICr/xP5VBwMr7zjyDSts2V6/PZt8bTiXO6rYqlML+bxx1OKK/ADp2wldh6Ni
	GQLvDa1kXnMZd0A+2WoicdvQcBPbvzSRSYf28K5/PGuyUlZD+FLKdTahHHl+ofKSeWIV2L/lGWo
	HN4BwzTbFCXd2iKZXelwPNp3RGhfquyI3O1AD0BIGdZIqwf6HFJ666X8HeQ3rO8yiIKL/gOAPfz
	6qNzIYNeXW6EI05aITWZDpPpco1o/oIrMShqWkTlQaXbHMhOKDP0s60PGvrzv69WHpWagn39Nse
	73RK
X-Received: by 2002:a05:693c:69c9:b0:368:2548:c08b with SMTP id 5a478bee46e88-37966e3a0fcmr9895442eec.21.1794808961831;
        Sun, 15 Nov 2026 22:02:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 26/30] xfce4-session: upgrade 4.21.1 -> 4.21.2
Date: Sun, 15 Nov 2026 22:02:04 -0800
Message-ID: <20261116060209.2916444-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132424
Content-Type: text/plain; charset="utf-8"

Refresh the gdk-pixbuf-csource patch. The new libxfce4session-client
library installs introspection data, inherit gobject-introspection.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...01-meson.build-Make-gdk-pixbuf-csource-available.patch | 8 ++++----
 .../{xfce4-session_4.21.1.bb => xfce4-session_4.21.2.bb}  | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.21.1.bb => xfce4-session_4.21.2.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-Make-gdk-pixbuf-csource-available.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-Make-gdk-pixbuf-csource-available.patch
index 6cc77262f7..d7acfc159e 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-Make-gdk-pixbuf-csource-available.patch
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-Make-gdk-pixbuf-csource-available.patch
@@ -14,18 +14,18 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/meson.build b/meson.build
-index 6f372e0..633a5c5 100644
+index 566dbd5..e989710 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -47,7 +47,7 @@ libxfce4util = dependency('libxfce4util-1.0', version: dependency_versions['libx
- libxfce4windowing = dependency('libxfce4windowing-0', version: dependency_versions['libxfce4windowing'])
+@@ -51,7 +51,7 @@ libxfce4windowing = dependency('libxfce4windowing-0', version: dependency_versio
  xfconf = dependency('libxfconf-0', version: dependency_versions['xfce4'])

+ xdt_gen_visibility = find_program('xdt-gen-visibility', required: true)
 -gdk_pixbuf_csource = find_program(gdk_pixbuf.get_variable(pkgconfig: 'gdk_pixbuf_csource'), required: true)
 +gdk_pixbuf_csource = find_program('gdk-pixbuf-csource', required: true)
+ sed = find_program('sed', required: true)

  # Feature: 'x11'
- x11_deps = []
 --
 2.49.0

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.2.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.2.bb
index 77ae5da6b8..6052d8a283 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.2.bb
@@ -9,12 +9,12 @@ DEPENDS = "libwnck3 libsm libxfce4ui libxfce4windowing virtual/libx11 gdk-pixbuf
 XFCE_COMPRESS_TYPE = "xz"
 XFCEBASEBUILDCLASS = "meson"

-inherit xfce update-alternatives features_check
+inherit xfce update-alternatives features_check gobject-introspection

 SRC_URI += "file://0001-meson.build-hard-code-path-to-iceauth.patch \
             file://0001-meson.build-Make-gdk-pixbuf-csource-available.patch \
 "
-SRC_URI[sha256sum] = "a8fe873fdb20366a44f1345400bfb29c2ff0cfe89dfefd852e2575464b80567c"
+SRC_URI[sha256sum] = "1809216cb1c658cba50c56b70bcdc1bd073bd357980a4dc335d442eb559bf18a"

 REQUIRED_DISTRO_FEATURES = "x11"

