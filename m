Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 65F6C6B50D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:18 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so1273662eak.32
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=J0GoOkKWSrV2DvMjEqf2VDYTmzRjwbpX9z79stGHncI=;
	b=bCBDhtBRd+DZkZgLFntS2AFRq3uTpi3wHUFay881+FPnw5+hMNKWP26NspooPXu+nj
	Ii8k/Ats/PpsyFfj0pUkMLDuqEQ2i9pUiix/E6jp51YKyZhdC0WqDOXkbNfGTv9d49kL
	A7X8USZggx5PsEX2K5oJcR6XT+stgP1doInIxuCVsdiGaCiLAzcz4/qPwxIOVCnXbdAl
	wxvF8FGcVbGbfLq8fN4F5skAEopGic86IjnxQ4+O/pshdfUKI7O2mtiL+UgkP5Eo7coY
	6autGyQMZs/sB7zYVviRp+POtNw8RJmUC0oyCcNqQE51HygGHGhnS5IrcaR1H3PjjpN4
	1lpw==
X-Received: by 10.15.91.3 with SMTP id r3mr3463545eez.4.1375652838804;
	Sun, 04 Aug 2013 14:47:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j2sm28797195eep.6.2013.08.04.14.47.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:39 +0200
Message-Id: <1375652867-10498-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/15] fbreader: add sqlite3 dependency
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:18 -0000

* fails to build without:
  | Compiling SQLiteCommand.o ...Compiling SQLiteConnection.o ...Compiling
  SQLiteDataBase.o ...Compiling SQLiteDataReader.o ...Compiling
  SQLiteFactory.o ...In file included from SQLiteDataReader.h:26:0,
  |                  from SQLiteDataReader.cpp:20:
  | SQLiteCommand.h:24:21: fatal error: sqlite3.h: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb | 2 +-
 meta-gpe/recipes-support/fbreader/fbreader_git.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
index 4786846..662224c 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.fbreader.org"
 SECTION = "x11/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://fbreader/LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl"
+DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl sqlite3"
 
 SRC_URI = "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
 file://Makefile.patch \
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_git.bb b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
index 937bdc8..ff0b5da 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_git.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.fbreader.org"
 SECTION = "x11/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://fbreader/LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl"
+DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl sqlite3"
 SRCREV = "2cf1ec0e306e1122dbed850bfa005cd59a6168ee"
 PV = "0.99.5+gitr${SRCPV}"
 PR = "r0"
-- 
1.8.3.2


