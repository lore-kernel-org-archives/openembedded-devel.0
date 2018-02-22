Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id A0EF671AD1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 17:02:22 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u49so11281973wrc.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lsscolsmDRufnClOO/LvBBxhw0wWu3M7wnB9EHxus4E=;
	b=bzvxqXp+trkDsVdMZtVGZZ4+6etq4iRI2LhA4MssABiF5ZAzVk9PDgD57D6noMOa6P
	q6H13BaDDQPHNq9xCfesrzKDWQT5uRkIRA6FVLcBGKl2IS94iOrgpounuLfZh/dPBoHu
	JLrAi9jrWyxZ3YIMpXokfwRbEEcy6ItC29LNLdwN+VuwN4fc+Jh6a80I4T1SwHlF+OvL
	OWLKtsyjMwaHsO1JPFbjcNaIpuIMZO7dhh05EyuVVN5OXlWMT2EBDzz/w08PuKOHKVBK
	IUL0q24hbp9Y5xVM0fcSBi2/Dgt2TtpORiasYcgG/C/5biTImFmiC+NV9Lu1YBCopHYE
	Ta5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lsscolsmDRufnClOO/LvBBxhw0wWu3M7wnB9EHxus4E=;
	b=E9qDSMt99Wkeln9GND01MIlsFINcAwEUvRXFSUXUT8ujYdL1uB9t4fNnpxIQilKdHm
	0EEGVVdLMFdmCLoBfJD0/4SV0wo+LiZA6dz9HAAf84TnHFSwBtgRIvxJWi5MZSRwChxS
	C6cuPp3JypSBwkKxTQnNEqflmzq+YEW00tJIoL8vJK+Frv6BS26OMffcqfFK7j5CO8di
	NTmh0KZw662EXgD4J2d5+dgJbfIeXrQC/01psFXBeHxfPkGr4KFgLyowmBwf3ffbAuJ6
	8NRG7SiwxmdhnaYg6ioR0QLV0QQT2Qp3ZKoxF+Fk0SgJFxbpcplvZrBVjFH5PAVNCBS2
	L6mw==
X-Gm-Message-State: APf1xPAx21KXgID2I+jCKCNZDGAI/FkYWxnDwWFwiOgL2jsM8gVlQ9V9
	KJqCybDaqHjIHBXt8GKW+gdtJQ==
X-Google-Smtp-Source: AH8x2265MPVrLLYypkgwyOn/jZS3LdWLhwO3g3DYfXeJA70eZBp32fef6GXq7y61v/q2s4nL72ePCg==
X-Received: by 10.223.149.68 with SMTP id 62mr7104663wrs.249.1519318943701;
	Thu, 22 Feb 2018 09:02:23 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id c1sm429796wmh.1.2018.02.22.09.02.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 09:02:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Feb 2018 17:02:21 +0000
Message-Id: <20180222170221.1887-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-qt5][PATCHv2] qt5-git.inc: drop nobranch=1
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
X-List-Received-Date: Thu, 22 Feb 2018 17:02:24 -0000

* sneaked in with:
  commit 333949a8239dfa7788b35f1059614733e11a6a25
  Author: Samuli Piippo <samuli.piippo@qt.io>
  Date:   Thu Jan 26 16:54:50 2017 +0200

    Upgrade to Qt 5.8
* use 5.10.1 branch by defaut and fix QT_MODULE_BRANCH
  in qtknx, qtmqtt, qtwebkit-examples, qtwebkit which don't
  have 5.10.1 branch at all

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt5-git.inc              | 6 +++---
 recipes-qt/qt5/qtknx_git.bb             | 2 ++
 recipes-qt/qt5/qtmqtt_git.bb            | 2 ++
 recipes-qt/qt5/qtwebkit-examples_git.bb | 2 ++
 recipes-qt/qt5/qtwebkit_git.bb          | 2 ++
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 7ee0643..beba913 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -1,9 +1,9 @@
 # Copyright (C) 2012-2016 O.S. Systems Software LTDA.
-# Copyright (C) 2013-2017 Martin Jansa <martin.jansa@gmail.com>
+# Copyright (C) 2013-2018 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
-QT_MODULE_BRANCH ?= "5.10"
-QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH};nobranch=1"
+QT_MODULE_BRANCH ?= "5.10.1"
+QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
index 5e01e3c..fa981ab 100644
--- a/recipes-qt/qt5/qtknx_git.bb
+++ b/recipes-qt/qt5/qtknx_git.bb
@@ -9,4 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
+QT_MODULE_BRANCH = "5.10"
+
 SRCREV = "29c34e8f072afd01002ed3847d752b4e065f977e"
diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
index b705f7c..90c255d 100644
--- a/recipes-qt/qt5/qtmqtt_git.bb
+++ b/recipes-qt/qt5/qtmqtt_git.bb
@@ -9,4 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
+QT_MODULE_BRANCH = "5.10"
+
 SRCREV = "2c3c2a41c55a179332ec2a076856990f36dd5ef9"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 3e3e4a0..114fab7 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -17,4 +17,6 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
+QT_MODULE_BRANCH = "5.9"
+
 SRCREV = "a24c780b60d7d8bc00c4a48042cf7f32db777d55"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 5dee6a4..b23d4d6 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -87,4 +87,6 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
+QT_MODULE_BRANCH = "5.9"
+
 SRCREV = "97c4a80a1282c8c3eaa343011286b76fd4838c5f"
-- 
2.15.1


