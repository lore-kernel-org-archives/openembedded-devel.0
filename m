Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2F272B1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 21:57:47 +0000 (UTC)
Received: by iodb91 with SMTP id b91so164872837iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 14:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s4GtS6d/lw8iIKON0orSGw5zKG5fnOHIVsgzYNrq+is=;
	b=wEz8cQtHWIr971bqCsSZOCi8mI2gMs7QjofMkla+SbqlEIZ/GuSGo3UJw4Q0O5poQM
	HdsS5qgix49dqvSx9bBi+0oTvc78KUHJlWFUrN9YLUkX5HLqNl+m7qAXOPHPiDfRQ65C
	p/lcNQcnAQes+rsvsoVMWIm1Kblba2Ul7U6X+mCoirgms6t+sZ5ZAjGlKlF4BVx3ly1Q
	r+vgCZskmMLIj6hqphKMUsQn/zlez0g0ZhOqdsrOMuF8FQGWdsoPoFkgvkyLOjod1xi1
	uSxLiq3sNlPzVVN4bgn5CO7Rt/Cf2U0LBl9fR0YIPDzdEEgh1iKS/MEs/45lxloxNalv
	VkSQ==
X-Received: by 10.107.136.148 with SMTP id s20mr19358409ioi.135.1440453467604; 
	Mon, 24 Aug 2015 14:57:47 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	w26sm1446845ioi.26.2015.08.24.14.57.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 14:57:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 14:57:40 -0700
Message-Id: <1440453460-12824-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440453460-12824-1-git-send-email-raj.khem@gmail.com>
References: <1440453460-12824-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qtbase: add libinput to depends when wayland is enabled in distro
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
X-List-Received-Date: Mon, 24 Aug 2015 21:57:48 -0000

Fixes warnings like

WARNING: QA Issue: qtbase-plugins rdepends on libinput, but it isn't a build dependency? [build-deps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 7d2d5ec..4e419a9 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -28,6 +28,7 @@ SRC_URI += "\
 "
 
 DEPENDS += "qtbase-native"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'wayland', 'libinput', '', d)}"
 
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
 
-- 
2.1.4


