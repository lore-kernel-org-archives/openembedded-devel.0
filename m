Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 33CB865C93
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:23:32 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so3893403wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 11:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g5sLdCeGblnue9nVRVOJnyIvjwPL/6yDfGF/D4VE5fY=;
	b=x2i5UK0XoukttYTzZDikKfguCsxITh6ffGf2I5DuVx1JkByNn26YdVRIO/dsGeGzRp
	Xg36J32i0leleK8xtyxnxScYOat+MI10FUiRafWXEXj/fBbMG24mvsz8VFLSJ/CpsOE2
	BC31+PThwz3fxOWqkslMdor7Qc9w6u5suLkKGQgmQx4bSXSqf1eGKdmzLIdDVvGJDs1Q
	rTT5mH8VZFVhCXFh/aMy6YE29bEpXO/H8eHG9FZw0/9DLcq7gbbhJ/xuKeZhcnGpNOv3
	4cqz8CNPH+/aVme1w2y0kxIPJM093reXAlNNC501rsiVKEuE5dHSF7csjiyh7oMHgIE5
	Vr9g==
X-Received: by 10.180.84.7 with SMTP id u7mr34209110wiy.27.1405707813150;
	Fri, 18 Jul 2014 11:23:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	de6sm15991893wjc.16.2014.07.18.11.23.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 11:23:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 20:23:38 +0200
Message-Id: <1405707818-12348-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405707818-12348-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405707818-12348-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 4/4] gdal: use autotools-brokensep
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
X-List-Received-Date: Fri, 18 Jul 2014 18:23:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
index 6a6e62f..14f1a57 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${BP}.tar.xz"
 SRC_URI[md5sum] = "f354c614aea76e5630e4edbf06e5c292"
 SRC_URI[sha256sum] = "e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60b91639fb8d443791"
 
-inherit autotools lib_package binconfig
+inherit autotools-brokensep lib_package binconfig
 
 EXTRA_OECONF = "--without-perl \
                 --without-php \
-- 
2.0.0


