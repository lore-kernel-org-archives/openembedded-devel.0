Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id AD24A65FEC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:19 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id x48so4826130wes.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G30spWavIG/FAeJHLupj+dRO7r4mDRMAwBBnWjwRFX0=;
	b=dVnopyON400Pd4WoQYYNPCNINL9J41/Ya31wRWn2FnaNQpEbjvPIJBAiGOnNfQpicf
	EPlM0ATlczlc/Rdceo6s5dXKFomN987O9DJ589QwCDpRC4u21QSR9CUbBhmuWX8mkNSe
	r9OI1zTrOHJyWcfAJOMGv6MMGtnefdqGotA/3aAXBA36MQ+je0GQYSoZfPxajwP/Bp2V
	9jc9jWQumGXrnQiuP1cD3bUpWzZB0BB2decgwv1qMrSYeNENRk9TDETn57TSIbz9FpjZ
	/Smasf17UyM3C3A+q6m38D82b4gCuzWvHB7KS/xu3lqJ+hs1rUrCfYgMBseo0Mf4m+R4
	DOkQ==
X-Received: by 10.194.62.140 with SMTP id y12mr10953210wjr.27.1403342360131;
	Sat, 21 Jun 2014 02:19:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wv8sm5440193wjb.1.2014.06.21.02.19.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:19:07 +0200
Message-Id: <1403342349-11180-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 10/12] xpext: fix build with B!=S
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
index 7cb84ff..4a1379d 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -12,9 +12,9 @@ S = "${WORKDIR}/xpext-1.0"
 inherit autotools pkgconfig
 
 do_configure_prepend () {
-    cd ${S}
-    chmod +x ./autogen.sh
-    ./autogen.sh
+    cd ${B}
+    chmod +x ${S}/autogen.sh
+    ${S}/autogen.sh
 }
 
 SRC_URI[md5sum] = "1b0cb67b6f2bd7c4abef17648b062896"
-- 
2.0.0


