Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 452FE71A91
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:57:31 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a23so28181pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 00:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/mTl+ug02QmXoA35u9RV6kKd+YvgZXHqvZW20GCz3rI=;
	b=i7W4yC2lP5nTVP+orAIzkucvW2ScH1v4s4YNnKxsLsyr+cDb1ZWAW0+wnIAF6J4zD5
	HAhcW/tT1s11khIhqcgGZiQfpOVkMJWz/+XAywUvMM4vaYfz1TKnYl8DH8/36ponAXuQ
	4BggIyKtj2/RaWH6e9xcP3F5fWTRgzJqYAQkfJO//45pafAS9aEPWhqqrsBb6SzkM4gy
	7+k+1Io7rMFq0bxaO7tJV4+Gyyv1Wfv4k2uizi7468sCay7H8HwNgKw2xclRYr04HJq4
	arWkTlSoZh52Xn0Qst9nBfrTIkfbYl1KCpQJnspqY+gPfAGQcbBeizDEaRMzyIKjK+TG
	Nn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/mTl+ug02QmXoA35u9RV6kKd+YvgZXHqvZW20GCz3rI=;
	b=qT5Y6elB4tdHnf87wgP0nyBy45fc3C7hPuabvrCZ0hHh7Jo/sDh7KAEeXpYPpFFREr
	pNQnpMJ1c023QUwOoeiTWXTXYKGmq4xJkbniO11h4J7WaF0mhr/AK+iTf0dXMvjPMx6K
	EyCx88GIYtUSaM/Xr8oVce3vQVfIgq3+FHUwujatyPzgb7t4HUO06A1Wwbs7Xru7jfb9
	UDl6t8+d+aBvPE9k+Mv+cWTEyo7VbHBDKNm1TW/CI+spMfIEUahwhxcmeE5yXbbPZUAL
	ETen5bJzFBVagu+5vxLox4LKsO1dMXuFOi4KclyivVjXqip2uvl//rYSDxcNpOzfAYk8
	h6ww==
X-Gm-Message-State: AN3rC/5X5E4/DF6Pvbc9gFYU8OPxZLOXCl2TLeMg5EDp3MwvS0sun7fm
	LN6AuPBphcfYjA==
X-Received: by 10.84.224.77 with SMTP id a13mr70348758plt.132.1494316652908;
	Tue, 09 May 2017 00:57:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	i67sm20250916pfk.87.2017.05.09.00.57.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:57:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 May 2017 00:57:11 -0700
Message-Id: <20170509075711.1575-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170509075711.1575-1-raj.khem@gmail.com>
References: <20170509075711.1575-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 9/9] kodi: Fix build when x11 is disabled
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 May 2017 07:57:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ge-order-of-detecting-libegl-and-libgles2.patch | 32 ++++++++++++++++++++++
 .../recipes-mediacenter/kodi/kodi_17.bb            | 10 ++++---
 2 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-change-order-of-detecting-libegl-and-libgles2.patch

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-change-order-of-detecting-libegl-and-libgles2.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-change-order-of-detecting-libegl-and-libgles2.patch
new file mode 100644
index 000000000..12a6c06e8
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-change-order-of-detecting-libegl-and-libgles2.patch
@@ -0,0 +1,32 @@
+From 21524598110e7a55113205dda4bc1a6d5987111c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 May 2017 06:41:33 +0000
+Subject: [PATCH] change order of detecting libegl and libgles2
+
+This actually helps building it on rpi/userland
+where libEGL depends on few functions from libGLESv2
+see
+https://www.raspberrypi.org/forums/viewtopic.php?t=7090
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b9e4240..1ca0297 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -951,8 +951,8 @@ if test "$use_gles" = "yes"; then
+       AC_MSG_RESULT(== WARNING: OpenGLES support is assumed.)
+       LIBS="$LIBS -lEGL -lGLESv2 -lbcm_host -lvcos -lvchiq_arm -lmmal -lmmal_core -lmmal_util -lvcsm"
+     else
+-      AC_CHECK_LIB([EGL],   [main],, AC_MSG_ERROR($missing_library))
+       AC_CHECK_LIB([GLESv2],[main],, AC_MSG_ERROR($missing_library))
++      AC_CHECK_LIB([EGL],   [main],, AC_MSG_ERROR($missing_library))
+     fi
+   fi
+ else
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 8f75bb48d..23f09af51 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -77,6 +77,7 @@ SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton \
            file://0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch \
            file://0011-Let-configure-pass-on-unknown-architectures-setting-.patch \
            file://0012-Revert-droid-fix-builds-with-AML-disabled.patch \
+           file://0001-change-order-of-detecting-libegl-and-libgles2.patch \
 "
 
 SRC_URI_append_libc-musl = " \
@@ -86,7 +87,9 @@ SRC_URI_append_libc-musl = " \
 SRC_URI[addons.md5sum] = "719614fa764011a18665d08af5c8c92f"
 SRC_URI[addons.sha256sum] = "350da57408c27473eaf40e7f544bc94841bf101dc4346085260c5c4af0adac97"
 
-inherit autotools-brokensep gettext pythonnative
+inherit autotools-brokensep gettext pythonnative distro_features_check
+
+REQUIRED_DISTRO_FEATURES += "opengl"
 
 S = "${WORKDIR}/git"
 
@@ -97,9 +100,8 @@ ACCEL ?= ""
 ACCEL_x86 = "vaapi vdpau"
 ACCEL_x86-64 = "vaapi vdpau"
 
-PACKAGECONFIG ??= "${ACCEL}"
-PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)}"
-PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', ' opengl', ' openglesv2', d)}"
+PACKAGECONFIG ??= "${ACCEL} opengl"
+PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', ' openglesv2', d)}"
 
 PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,"
 PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,virtual/egl"
-- 
2.12.2


