Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 91B2D7597C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2015 19:00:38 +0000 (UTC)
Received: by wicgj17 with SMTP id gj17so118530682wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Aug 2015 12:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=au5sEPyHX3DUB/FMH1PmQ2kUdGCKCHwG2AOzEQ31MxU=;
	b=XxDundPj/E3spBKwrZRbntWutO+Fz2EIu8P6TGIcZxODyfEV8Qv51VSV+NG4ZTXdvu
	Z/yW6WCAbNqQDHJEX7zAbMitSAdrJ13Q01L8Z/hHCFOnK69D156iLYhSnRMMxsoHGJw5
	u0idtXnECJw74luAZdibAM2bOoSPaBRBwmxh7Hf1K6LZbvLqRp4//QaOMA83sA6Npz6n
	rAnT4JgeQphwcyfoQ8vcCLzh75n1NbLXLNM2TaeHcq8ibWH/oPNE/KCpHFTeIfdrGezf
	9CtDxx+MN/BA5bGu7dd2aO2Ar6B9vk1Y0yDAuji2RUKaFMndjOqu+VmEprorqOsi0obb
	Eglw==
X-Received: by 10.180.86.234 with SMTP id s10mr20184824wiz.77.1438628438182;
	Mon, 03 Aug 2015 12:00:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	dz4sm14917237wib.17.2015.08.03.12.00.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 12:00:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Aug 2015 21:00:38 +0200
Message-Id: <1438628438-9452-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438628438-9452-1-git-send-email-Martin.Jansa@gmail.com>
References: <1429280204-27191-3-git-send-email-Martin.Jansa@gmail.com>
	<1438628438-9452-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qt5-plugin-generic-vboxtouch: add -Wno-narrowing to fix build with gcc-5.2
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
X-List-Received-Date: Mon, 03 Aug 2015 19:00:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
index 5352d15..2676bdd 100644
--- a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
+++ b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
@@ -9,12 +9,15 @@ LIC_FILES_CHKSUM = " \
     file://evdevmousehandler.cpp;beginline=1;endline=40;md5=9081062f6e7f74b6e62ad7ecee4a71be \
 "
 
-PV = "1.0+gitr${SRCPV}"
+PV = "1.1.3+gitr${SRCPV}"
 
 DEPENDS = "qtbase"
 
+# Needed with gcc-5.2 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65801
+CXXFLAGS += "-Wno-narrowing"
+
 SRC_URI = "git://github.com/nemomobile/qt5-plugin-generic-vboxtouch.git"
-SRCREV = "7d7a6dfd501c43687e7bb110610cac5f7c9abd4b"
+SRCREV = "d613ad1cc64d7a6a9b38df4d49146170be6876aa"
 S = "${WORKDIR}/git/vboxtouch"
 
 inherit qmake5
-- 
2.5.0


