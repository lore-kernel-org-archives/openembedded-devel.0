Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7700A766B2
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Nov 2015 11:07:01 +0000 (UTC)
Received: by wmec201 with SMTP id c201so48276092wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2015 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dOaxlylvBBqjfcKaDEErl75J80xfBeQmE/fy7DXjNIk=;
	b=TYuF22zH7zmvg/EuCBdr0shS56TkkHxpZ6+5WThLjm4hUz0j5TfBlk2lXL6gjdogLu
	wzEh6rvTr8lrZXjWOVsq/lIILdScZwi5gPknrFzmPt5Sh7f/vjIu0wGOjmb030hZq//b
	WpT/hEHk6YSeILXAsp1njciyfT5+lF6Wzu+qunRkkmwoUVDYo7wy3Op+gVNXK5ZgTzXT
	mN+FX+3vUQw1UEQ9xqopO9/yq5AxfZQ/krqH5DCAkppsz0H6QBckJQZiuibg9u8Dvd4c
	oiQnN3oFB27FBWiZP1RR5Z5tnEejGiHRuaOkc1JEVFohHE4BOOpz4rOv9zzudxmXxEcx
	E2gg==
X-Received: by 10.28.150.11 with SMTP id y11mr8870711wmd.43.1446980821801;
	Sun, 08 Nov 2015 03:07:01 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	d66sm8348066wma.21.2015.11.08.03.07.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Nov 2015 03:07:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Nov 2015 12:07:12 +0100
Message-Id: <1446980832-1762-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][meta-qt5] qtwebengine: add nss, nspr dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Nov 2015 11:07:03 -0000

* bundled nspr fails to build:
  | work/i586-oe-linux/qtwebengine/5.5.99+5.6.0-alpha1+gitAUTOINC+64dc919d31_7e655fbb76-r0/git/src/3rdparty/chromium/third_party/nss/nspr/pr/include/md/_unixos.h:596:9: error: unknown type name 'off64_t'
  |  typedef off64_t _MDOff64_t;
  |          ^

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index d12e3b9..8498de7 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -28,6 +28,9 @@ DEPENDS += "flac"
 DEPENDS += "yasm-native"
 EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm"
 
+DEPENDS += "nss nspr"
+EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_nss GYP_CONFIG+=use_system_nspr"
+
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
-- 
2.6.2


