Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2459072FC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:05 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so2948738wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nIE4JDx8XYrF0zeh7aeNfAlW8qf07dmEKH3W5ot2so8=;
	b=ivq9HR+jPx/HJcvkL4YfcelVgLPJNXkHstwiG15FnSpiQ7nMOngXY5qSLSzdWCg4Xy
	ZvWcV8IzoIt1c9XE7aik4VSSCA15gaqBH0gG5cNVXtGw1Q3JPuDS6rXUK79G77mSRX8B
	ixK+7IN6GwOKrrir3LjPSaRV3RxAbbvliw6xyatdJy/wBZiVguRqfqOTXTcvSVaAAfuc
	yH3u4WqnQyWpZte4w7fTgdlcQzgQxQtrp458/0Jritw235nG32JInSRv3DEn0a7NIhYg
	vM/0ToFbnASqlakGTCb1+zESSBPOmEigjex7pFPiuM8lj8VuRnqXfpUmNOEuqWr2+Jyu
	xSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nIE4JDx8XYrF0zeh7aeNfAlW8qf07dmEKH3W5ot2so8=;
	b=jBBCD+AAqvBarpr0LD05NAWslwna0XoRbNpwXqpytWv6L9FYufd6b9xKDe4J3wVaQB
	vDp7trfpFtxIvGbxEb639ZhwLidCqeGfWZyDHXzhT/LVWSFnqZlGjB2/fcaXlBXgEezu
	2K+ZrDOJTI+KoGEio0REBd1R1Bryw6tmBb393nAaUC+sdp6QlZkmFOi8l00gtlpJtP5Q
	knOmd3/7z6qM+LNfzY+BR5kS3IEXIAmH/q/C9uZIJ2wHyno2vsuugyGfVEuXiU2iCyou
	qK3e0QHoJ92skHJ+AtOfPVW2IIFJJPfq0ag7QJHMMA21E7KFtXDiSDTpmRqs52HeBmWL
	vzSQ==
X-Gm-Message-State: AMke39lZ56IXWE1QAIrV1Y95Gp8hiX61DfZvPuZ72rat0wfB5IWOAiRDHgnFY184AQvdVw==
X-Received: by 10.28.65.196 with SMTP id o187mr654903wma.37.1487804586791;
	Wed, 22 Feb 2017 15:03:06 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:42 +0100
Message-Id: <20170222230250.30288-4-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/11] gtk-engines: add glib-2.0-native to DEPENDS an unblacklist
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 2a0022b..83aa749 100644
--- a/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SECTION = "x11/base"
-DEPENDS = "intltool-native gtk+ gettext-native"
+DEPENDS = "intltool-native gtk+ gettext-native glib-2.0-native"
 
 PR = "r3"
 
@@ -53,5 +53,3 @@ SRC_URI += "file://glib-2.32.patch \
             file://substitute-tests.patch"
 SRC_URI[archive.md5sum] = "5deb287bc6075dc21812130604c7dc4f"
 SRC_URI[archive.sha256sum] = "15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5"
-
-PNBLACKLIST[gtk-engines] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130602/"
-- 
2.9.3


