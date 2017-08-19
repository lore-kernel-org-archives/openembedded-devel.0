Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1897808B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:31:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r77so6725942wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 03:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UXV1EWHSUyPr97tClcRj9JR8hG+hN+jhA8ciFG3u6a8=;
	b=B5CHrp13MmK+kIr3q1LwbMh/c7E/YjK/eeqrO3S7CnCiV3IICRfixOY3M4VNEwD8Vs
	U/CQWY/FpdaWXAk4ehX5QFEMGnRvo7gJygBC7PbPJFWwaM8eB5F1LnKAK/9iU8Uus4TQ
	XO2+27QXC/rdSjomdiw/noXakf5nkigq+AgGOkkEdM7yVPKsbtr+8ER/EquVVMTiXZFr
	dbB4KFj7dayzMLja+o6kXIz7XrGajUcYiJyfpx9msmE5hLP6Qpq4X/HllI4ODyPleGl7
	donkRLECnODlKhROkGClrjs3pC4eoHxWoPadotToR8dBm//8o/vZJG1hBdfoH+/TdgYM
	8lgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UXV1EWHSUyPr97tClcRj9JR8hG+hN+jhA8ciFG3u6a8=;
	b=Deto4rCM9jM6g+EHfVvP1bAsmFHWwHgyyb/98nIGegv/3Tu6/h+F2Rh2+E7NtDPjoD
	E850lUp722qdI0OYX3wLRSxHXahr1OmwbKiE7Fv8qxY37VtI9yArExRklfnR365d3owZ
	hNN3f5TVIs6CsOz7Uy+Z8Jp/vYz1R13rwrwlzs/qp83s9lzt54jnoVOyZt9G/XrybU7V
	2zhWlW6n2u+OEiCN374NDcD7iLL3nsWgKl//dX/DwvCpo13yjA+8Jvym6xRzRh/AsFt1
	geV6OhzC6bNmOrKpUHMoVf7Yk0A66v52nvhJAjK8jLzeq3af4cK5uAiQgSHX5qRTkU1V
	9ROw==
X-Gm-Message-State: AHYfb5iikPxFpyDKeXs7reG46VdIlgPyoIRYnnfIhKBWcfeNyUOj4/YD
	4c98wWTDrhZnjLMX
X-Received: by 10.28.54.202 with SMTP id y71mr3450750wmh.106.1503138708075;
	Sat, 19 Aug 2017 03:31:48 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 91sm6012826wrg.83.2017.08.19.03.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Aug 2017 03:31:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Aug 2017 12:33:25 +0200
Message-Id: <20170819103325.16967-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [meta-qt5][PATCH] qtwebengine: disable SECURITY_STRINGFORMAT to fix the build
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
X-List-Received-Date: Sat, 19 Aug 2017 10:31:47 -0000

* meta/conf/distro/include/security_flags.inc adds -Wformat and
  -Wformat-security, but openh264 adds -Wno-format after that causing
  build to fail

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 45b885c..830e640 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -34,6 +34,14 @@ EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm \
 "
 EXTRA_QMAKEVARS_CONFIGURE += "-feature-system-ninja -no-feature-system-gn"
 
+# chromium/third_party/openh264/openh264.gyp adds
+# -Wno-format to openh264_cflags_add
+# similarly chromium/third_party/openh264/BUILD.gn for newer qtwebengine
+# causing following error, because -Wformat-security cannot be used together with -Wno-format
+# cc1plus: error: -Wformat-security ignored without -Wformat [-Werror=format-security]
+# http://errors.yoctoproject.org/Errors/Details/150333/
+SECURITY_STRINGFORMAT = ""
+
 # To use system ffmpeg you need to enable also libwebp, opus, vpx											    
 # Only depenedencies available in oe-core are enabled by default
 PACKAGECONFIG ??= "libwebp flac libevent libxslt speex nss"
-- 
2.14.0


