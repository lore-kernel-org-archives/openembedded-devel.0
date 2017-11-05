Return-Path: <dariusz.pelowski@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 72F357197A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Nov 2017 11:06:46 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id 90so7540120lfs.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Nov 2017 03:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZLcK9gtVvAbdwcuePVHTYmVbwbR+DOdeOZLnJ/bzPY0=;
	b=FUPkpdGJjzJwH+ahCloB17pXBa89EEdRNB5TT/e6OeoxfORmppRrX9uhoi25WJnhv2
	rk3Jes1S9+k4EgabMODq+e8+CvCScNpUVMRk5KAv0ImWDTff2FJHdK17OhZI0H4bv67y
	J1BIViwbGCOBS/QTc6O9j9oI3CWs4cnGWbrfuBWMNc3vIEaMRfJQlJ5u/JwLJ+duzf/C
	PucIDfrRXQauB3rwJ2a7JLMuP2namaIaGZrzjC5FJeR2hYP4GDDuQfvf35uIOYL0xgJe
	yf2wYdwUrI1E3Tvx7taFNOkQ5/7icxPWp3KfmCjo/PjlLYLp0yGci0y4DOek81GJETqy
	aZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZLcK9gtVvAbdwcuePVHTYmVbwbR+DOdeOZLnJ/bzPY0=;
	b=Ct64uxxxeSFRbs1YfGNQ8xt+Z1BSRRtCHC8OGsba/7rlv9YUezYZpdIvjdaVgE0Chn
	O8OMQx5q2TXNGbuNLBweZQv5bVRRhQVLuyB5HD48Pf00Cc0it0i8x4ilknzSka8FtOxS
	ADoXe+oyGsI5PtUa3HmiuGlm3FSDzT6Rto7PV/sRbIY6+5n/+nbwxYGGLcJEGBaVTmUy
	GKdzTfYK0JKLOtBwl2A94Oj86sJWN5SYIsqqJOwDlvS5M7X0fMaa4RTjQovmGGfsgZDn
	kMeCrGJQVf6vx2fZxE2ZN0IDhaewZd1S0bHtZARwMmKfa7FGbv7n7yRYO00A3HDdaDSa
	fuIw==
X-Gm-Message-State: AMCzsaXr/ofNdft3VzG9YY6Mldi5mSFNX4PBtLMdYW1ircwlGvdpmnHR
	94phstvKO5V3Y3X9zElxbOQN/sLW
X-Google-Smtp-Source: ABhQp+QlmXjcdGsvuGZ7Ifrnpt2mTFhKQ2MTW6PJeWrxU7UBpVte05npDh23lIedTv3VrHM3A4VRaQ==
X-Received: by 10.46.67.14 with SMTP id q14mr5067812lja.73.1509880006841;
	Sun, 05 Nov 2017 03:06:46 -0800 (PST)
Received: from duzy.lan (user-188-33-218-82.play-internet.pl. [188.33.218.82])
	by smtp.gmail.com with ESMTPSA id
	y191sm1853359lfd.51.2017.11.05.03.06.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Nov 2017 03:06:46 -0800 (PST)
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Nov 2017 12:06:39 +0100
Message-Id: <20171105110639.8103-1-dariusz.pelowski@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-oe][PATCH] android-tools: do_unpack_extra task removed
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
X-List-Received-Date: Sun, 05 Nov 2017 11:06:47 -0000

When user don't have properly configured git user.email and user.name
compilation fails on do_unpack_extra step when executing "git commit" command.

This patch removes whole do_unpack_extra task as it's unusual operation
for the recipe to remove .git directories and initialize new git repository
after do_unpack task.

Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
---
 .../android-tools/android-tools_5.1.1.r37.bb           | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 75f5b9e26..d3ccd1d06 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -54,24 +54,6 @@ inherit systemd
 
 SYSTEMD_SERVICE_${PN} = "android-tools-adbd.service"
 
-# Get rid of files uneeded to build Android tools
-do_unpack_extra() {
-    cd ${S}
-    rm -rf \
-      system/core/.git \
-      system/extras/.git \
-      hardware/libhardware/.git \
-      external/libselinux/.git \
-      build/.git
-    git init
-    git add .
-    git commit -m \
-      "Initial import - committed ${ANDROID_TAG}"
-    git clean -fdx
-}
-
-addtask unpack_extra after do_unpack before do_patch
-
 # Find libbsd headers during native builds
 CC_append_class-native = " -I${STAGING_INCDIR}"
 CC_append_class-nativesdk = " -I${STAGING_INCDIR}"
-- 
2.14.3


