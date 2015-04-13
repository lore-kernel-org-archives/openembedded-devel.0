Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 461616AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:27:46 +0000 (UTC)
Received: by widdi4 with SMTP id di4so41025964wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M2eN8XT4USj7+FQI0O7LvuLg2eyYWamov1Of4JfWHto=;
	b=Y3rK8ChHJj39bDu0ZGE/Chkw+ZTT59LddChVIUYU7MA1XOx9FC+sHr3jGUYxOPIGUi
	aRJN3rg6YE9eO/qRpAKSpDlsI9SJzE5HPUpMnJKDKZz4hIYkFFGWPkrvXNhQBPwt7Mx8
	6ZDnvFMKcIMWm99l5611YTdIc1HaEihZ2DG/Up4j53crxD674dqp/2JoA4LJhbXpJTYh
	+Oyj92xzHMZB2JLC7CeaZjNBclHzNdcBrgnQwks1aAe4f7bWVR6fKvWF3C+FZegNtrOz
	nVZMdq4awmPrPkHC+Fqk3X2M/FXdhuCUje3TUIhYei7VJn+PjUzS28iXfcCnU2p1j1Bi
	VoEA==
X-Received: by 10.180.12.3 with SMTP id u3mr18737517wib.65.1428910067854;
	Mon, 13 Apr 2015 00:27:47 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B569.dip0.t-ipconnect.de.
	[217.249.181.105]) by mx.google.com with ESMTPSA id
	i10sm10139643wja.40.2015.04.13.00.27.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 00:27:47 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Apr 2015 09:27:31 +0200
Message-Id: <1428910057-23647-2-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
Cc: Sven Ebenfeld <sven.ebenfeld@vaillant.de>
Subject: [meta-java][PATCH v2 1/7] icedtea7-native: Add missing dependencies
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
X-List-Received-Date: Mon, 13 Apr 2015 07:27:47 -0000

From: Sven Ebenfeld <sven.ebenfeld@vaillant.de>

icedtea7 is looking for xsltproc and attr during configuration process.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 1f193e1..ff0c998 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -4,12 +4,12 @@ LICENSE  = "GPL-2.0-with-classpath-exception"
 INC_PR = "r1"
 
 DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
-           rhino-native ant-native \
+           rhino-native ant-native libxslt-native attr-native \
            libx11-native xproto-native libxt-native libxext-native libxrender-native \
            giflib-native jpeg-native libpng-native \
            glib-2.0-native freetype-native zlib-native \
            fontconfig-native zip-native alsa-lib-native \
-	   unzip-native \
+           unzip-native \
           "
 
 inherit native java autotools
-- 
1.8.1.rc3


