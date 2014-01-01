Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 179D26B5FD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:57:26 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id a15so5936015eae.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JAiZKLirSrCnB+LnosvusHUR/UQ12zHIF+7or9EYnw4=;
	b=bNTC4hSj7KIThiU3n0IrHreSPhlM0vqMPlN3UgfJYXDpoZWljj/Qv82HUM5CZKdTEH
	AkSIe2BChXDiiVGtVQNjiMXgE25WLXXFoW9OXajJxMabAviiAJKqs7j57Or3uQaKw0wn
	e0dPMZIoQU/bk0lRjAbLQc//0DeOV9cCofQ9Ax9hZAoDpF7LTaZXI87MbO2Jglk3WD1G
	StBHdNkLp1TqmCn9zSd6edVAfEmakXpFdkYrFT/sWf8IhlGUdBeauCz15EaYSP8YtmVe
	DjWDaV+baejdLiFhKkSUaGXzB7PkSESyPJ4eXGxpMrHwYITiHOcw18t7cvDiVhYC9bm1
	Y3bQ==
X-Received: by 10.15.77.134 with SMTP id p6mr64696278eey.0.1388581047795;
	Wed, 01 Jan 2014 04:57:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 44sm126895080eek.5.2014.01.01.04.57.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:57:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2014 13:57:20 +0100
Message-Id: <1388581046-8713-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/8] qtserialport-e: Fix branch param
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
X-List-Received-Date: Wed, 01 Jan 2014 12:57:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.0.bb | 1 -
 meta-oe/recipes-qt/qtserialport/qtserialport.inc        | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.0.bb b/meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.0.bb
index dcaac20..c466562 100644
--- a/meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.0.bb
+++ b/meta-oe/recipes-qt/qtserialport/qtserialport-e_5.1.0.bb
@@ -3,4 +3,3 @@ inherit qt4e
 require qtserialport.inc
 
 SRCREV = "22e45f0b0f956c025339d72ad53dca57ef684858"
-
diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport.inc b/meta-oe/recipes-qt/qtserialport/qtserialport.inc
index fc2020d..dde49a5 100644
--- a/meta-oe/recipes-qt/qtserialport/qtserialport.inc
+++ b/meta-oe/recipes-qt/qtserialport/qtserialport.inc
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 inherit pkgconfig
 
 SRC_URI = " \
-    git://gitorious.org/qt/qtserialport.git \
+    git://gitorious.org/qt/qtserialport.git;branch=stable \
 "
 
 S = "${WORKDIR}/git"
-- 
1.8.4.3


