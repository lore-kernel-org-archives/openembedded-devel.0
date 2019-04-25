Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id EF77F60125
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 09:13:37 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id s15so29190316wra.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 02:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FCAZVkIuBo0JKD250SOSb50U7rHrYh38Ci43KElusmA=;
	b=Fsv920Upr8ljS0rIbrc66VmKz7B1qobMw6V6KqoUkaeVVdDZo2cXYyyc9iJVG+F3HL
	gpKUNCN4/nc2obSBoW1B6mAVR9NthfJQmAncCCV/B05CRiBPwjzAI1fTJPPlBHDb6Dsi
	bZSiveseZMp70GmRydKkNNG/dzgSCldz/QfUTHH2hwek/YCgTndrgzhUMwvoLMl24IIY
	+YS/r17aYub9dPHG6rgXdreZjE5qNQak+9/4Ze4BeSkXeY4MjX1WJqT3PrJL4yidAmIb
	rQNDO8nMUPgDLJK4qmPp9fz2EgQ+MGtxvrXSf2xvuram3NAo8/dfcRtve96cM1ktoU9W
	U6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FCAZVkIuBo0JKD250SOSb50U7rHrYh38Ci43KElusmA=;
	b=J1q9/GsFDW+B+swQLQT5HWIO37d2nIApzB3pQu7nVnAsKMgYHBK9UKYb1IwJoHf9jH
	QGeRvKJq/GJfqRGr8lWzLFUl35G4g0Kjt2XLg6iqWo3wD60qI9eZkRgZgikeHcbw9kcd
	wLgPs3xwm/Jluuyp6qWu5EkJpGIzCTClUR7wt/s8PjdfAC/hipMie1kwT7sT3dxjH3qR
	kPqGfeuPLgg2qQcfdJ3b4l6fmWQcIvEpV3lypiCqjfN99btBTu+zxoVHja25f230LfJ2
	0GPyfBjq/mHBArw+bzasvAy806IFQCwrbXcL7B/Rv+NQl+520Mp3cfMdC4OcA3vX1ngg
	ujoQ==
X-Gm-Message-State: APjAAAUnCAG3Tk22kPz7GU08uPhmaBvs47nhNpJm5SACabu3YhCikzor
	r2lcj/AlxE/qI+mxBSSi3Nx6TSdx
X-Google-Smtp-Source: APXvYqwcEXs6879sKDSNjYFU4GjwafXLUXF3GuIdk8sHrheGgiii4/lNELOaNgzLqMqxdLyUHR2Yaw==
X-Received: by 2002:a5d:6b04:: with SMTP id v4mr23277138wrw.69.1556183618427; 
	Thu, 25 Apr 2019 02:13:38 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q7sm7175695wmc.11.2019.04.25.02.13.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 25 Apr 2019 02:13:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Apr 2019 09:13:41 +0000
Message-Id: <20190425091341.3190-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libopus: use armv7a, aarch64 overrides when adding ne10 dependency
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
X-List-Received-Date: Thu, 25 Apr 2019 09:13:38 -0000

* to match what ne10 recipe does now
* fixes:
  ERROR: Nothing PROVIDES 'ne10' (but meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb DEPENDS on or otherwise requires it)
  ne10 was skipped: incompatible with machine qemuarm (not in COMPATIBLE_MACHINE)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libopus', 'ne10']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
index dd6789dc01..50d49370ba 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
@@ -28,13 +28,13 @@ EXTRA_OECONF = " \
     --enable-custom-modes \
 "
 
+# ne10 is available only for armv7a and aarch64
+DEPENDS_append_aarch64 = " ne10"
+DEPENDS_append_armv7a = " ne10"
+
 python () {
     if d.getVar('TARGET_FPU') in [ 'soft' ]:
         d.appendVar('PACKAGECONFIG', ' fixed-point')
-
-    # Ne10 is only available for armv7 and aarch64
-    if any((t.startswith('armv7') or t.startswith('aarch64')) for t in d.getVar('TUNE_FEATURES').split()):
-        d.appendVar('DEPENDS', ' ne10')
 }
 
 # Fails to build with thumb-1 (qemuarm)
-- 
2.17.1


