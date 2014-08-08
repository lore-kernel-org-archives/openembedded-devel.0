Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0724E709FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 14:17:53 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so1110368wiw.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Aug 2014 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hPfjt47OULyq9u0lPLOSSWw7ikxm9BDvlRqdWfCqbtE=;
	b=pXt0cgLmkkmbGn3uwd0bKzJJMNo7iwIUai4RAgXudzQ0yJF9wa2Y2Vi3qgO/qlDxre
	qV/7NDq2ykEReub99iF4HHOOBI+lFTOTmtdOblQrWnJX1bnMpPHH7aJVofWL2fR1Gsn/
	1HxLCVW34Rv53lI4Dd8j70fZ/u+QteiZfAJNhO1XdtGx7EwMYqlEUxH+wyg4YT/LMK/I
	DOcrFID6qLQGkzaw9hxhtxzB5JUiZab8B6sGT7GcMAZ0dVe6kC4cUP1eh2wA1oyUslA6
	+BSjYNj+BEYiTLymlnQbF9DnDcOaWrjy1Lqp6DMjWK/xUmX4iCp+VuxJoq7xwKZXlDmZ
	EV1A==
X-Received: by 10.194.78.100 with SMTP id a4mr27544285wjx.106.1407507474281;
	Fri, 08 Aug 2014 07:17:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w1sm7589726wiz.14.2014.08.08.07.17.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 07:17:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Aug 2014 16:18:24 +0200
Message-Id: <1407507504-4041-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [RFC][PATCH] libpostproc: switch to lu-zero's for on github with 12 fixes
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
X-List-Received-Date: Fri, 08 Aug 2014 14:17:54 -0000

* last commit on videolan.org is more than 1 year old, lu-zero's for has couple of fixes
  and also defines the version in the code, use that instead of 0.0.0"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
index aae1700..811175c 100644
--- a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
+++ b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
@@ -5,13 +5,10 @@ DEPENDS = "libav"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "0.0.0+git${SRCPV}"
-PR = "r1"
+PV = "52.3.0+git${SRCPV}"
 
-DEFAULT_PREFERENCE = "-1"
-
-SRCREV = "3b7053f46dbfe4662063345245cb00b6acbbe969"
-SRC_URI = "git://git.videolan.org/libpostproc.git"
+SRCREV = "811db3b957dfde24aef2d0f82e297e5bf552d873"
+SRC_URI = "git://github.com/lu-zero/postproc;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.0.4


