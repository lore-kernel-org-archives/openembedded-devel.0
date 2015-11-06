Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id ACC397708E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:38:02 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so30294948wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 05:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SOTFt/KM/1XfwMRv48dZveZYAnsSLjK7r8MBFbdviO0=;
	b=BTEtNslRga0cdlJLfmmjGZ49ZPwoxRGmfa5V/4DNMVTrVbbS9mjHGGbPJeaLzuHAmL
	7flz+pwCo/52jbYVpa2D1PBiP4Z6e7CkQJgbPxfYnTCno4h3GEirGAzMnxkBi53zGd+j
	7tIS7JJ7utBugjT7VLFHB4rBDVOuM2w+0nG1oD5USJLLWl+0MaFj8R7QIPpTmzsnbFjG
	MyYxK5t49KISEpn+NmDO283ADUDsjrRGSoxrc0TSdnTtZAq7WbD7Vfn/qotvgd/G7w8S
	ddQIZTH4rAUpCA53ztdMS91XkO7B6qiz2b68JK5LJy23KWbTcVveNPKOL5b533k4QQSK
	t2CQ==
X-Received: by 10.195.13.18 with SMTP id eu18mr16621318wjd.40.1446817082337;
	Fri, 06 Nov 2015 05:38:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id m143sm844713wmb.1.2015.11.06.05.38.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 05:38:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Nov 2015 14:38:09 +0100
Message-Id: <1446817092-9386-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
References: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 4/7] qtwebengine: fix QMAKE_AR variable
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
X-List-Received-Date: Fri, 06 Nov 2015 13:38:02 -0000

* OE_QMAKE_AR is only the tool, qtbase and other modules add correct
  parameters to it in linux-oe-g++ platform:
  recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch:+QMAKE_AR = $(OE_QMAKE_AR) cqs
  but here it was missing "cqs" causing following error at the end of
  qtwebengine build:
  i586-oe-linux-ar Release/libqtwebenginecoreapi.a .obj/qwebenginecookiestoreclient.o .obj/qwebengineurlrequestinfo.o .obj/qwebengineurlrequestjob.o .obj/qwebengineurlschemehandler.o .obj/moc_qwebenginecookiestoreclient.o .obj/moc_qwebengineurlrequestinterceptor.o .obj/moc_qwebengineurlrequestjob.o .obj/moc_qwebengineurlschemehandler.o
  i586-oe-linux-ar: invalid option -- 'R'
  Usage: i586-oe-linux-ar [emulation options] [-]{dmpqrstx}[abcDfilMNoPsSTuvV] [--plugin <name>] [member-name] [count] archive-file file...
  ...

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 72eb1b4..f02c4d6 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -59,7 +59,7 @@ do_configure() {
         QMAKE_LINK="${OE_QMAKE_LINK}" \
         QMAKE_CFLAGS="${OE_QMAKE_CFLAGS}" \
         QMAKE_CXXFLAGS="${OE_QMAKE_CXXFLAGS}" \
-        QMAKE_AR="${OE_QMAKE_AR}" \
+        QMAKE_AR="${OE_QMAKE_AR} cqs" \
         -after ${EXTRA_QMAKEVARS_POST}
 }
 
-- 
2.6.2


