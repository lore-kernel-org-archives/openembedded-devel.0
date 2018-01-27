Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id B33F478864
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:46 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id o13so165722pli.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kM0w7BD25sgOD3TfsA3AuA80VSlLRxN7/sK8jq60r0E=;
	b=IwxsO4j665lWBgnqTEN1X7QFSLCvNfggwy7ag9ZvvhJzvZJUwvRuG9yQbWg3NJk/5U
	PyYAdd01I0TJk/1LAWFTjQa2RJ8lWfAXF9d9EqPRo4HU26NXeRrSEH60XWfWjVX/SSxz
	etUPmUxTVtP6AFCu1fdMHZT3Xbox9WoMsrtjIjpF5tq9wcTA4V6AsT+5K2hAsalV7aYd
	+bvKJHAVLWUCvt9pf1CFzkwTwmO4fGwcXk6MagBYavSifbJzA0LqGGLbf7RoZLLmWUm5
	OlR3A3O+fTZVaDG5PtHU64gt4dAMlItQgqoipV+6po9dhM6V/4ZR35Ry8m40UTTZtXj9
	fkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kM0w7BD25sgOD3TfsA3AuA80VSlLRxN7/sK8jq60r0E=;
	b=JvrXRyUCMYtYc3C9cgjU2PHeJejfUoEb6GcTcKH2VgHtGbaYrMa8O3Jn8wHwBWwCXt
	rAFAIarKefCc+pqjADM5Th8RhAnWnb2aWqpt9LGmp4ggICRwDPMZreAK0jpmu/oLYp7k
	+FviVQoNZUR9BEkCMxP1UkGpsRLNi4lM0dQgicJGZu0psU7ydal2SCbJcLZ+/hElnQdT
	CrPX52DBmVG5bDt/qDdjvlvIOSp2/2SXt57ht25tD0YuxsVMI6B4TQ0ukjfBp0WDyi4r
	PtyUsowc9ohLXcf4w10z6ABmLy8HSMwT8iM/gSFdeh9wE1e0QY2CsE2IO0Hcq7Lmtw8c
	YGaw==
X-Gm-Message-State: AKwxytdvAIs1aEkBfDicnQPylWXovLcYIug/1mdGWMZDjagr+EYlmKSS
	cw16uYC4lgPX4+AQsylnZ0/7jA==
X-Google-Smtp-Source: AH8x225BaKbETxOJkzc8WLW5DeRKF96HZ47NbuSxWqHmSiCiQ90rA29A8FnlHWb0PyvEIrD/zu7OYg==
X-Received: by 2002:a17:902:f64:: with SMTP id
	91-v6mr15528921ply.417.1517023487803; 
	Fri, 26 Jan 2018 19:24:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:07 -0800
Message-Id: <9d124e5b6bbe7df1e2800abaeeb599a1cb66d33c.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 07/36] android-tools: do_unpack_extra task removed
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:46 -0000

From: Dariusz Pelowski <dariusz.pelowski@gmail.com>

When user don't have properly configured git user.email and user.name
compilation fails on do_unpack_extra step when executing "git commit" command.

This patch removes whole do_unpack_extra task as it's unusual operation
for the recipe to remove .git directories and initialize new git repository
after do_unpack task.

Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit d2be40d2d907d0db304f44dde20a1c878a2f974c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../android-tools/android-tools_5.1.1.r37.bb           | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 75f5b9e..d3ccd1d 100644
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
2.7.4


