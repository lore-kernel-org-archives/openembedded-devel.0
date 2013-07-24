Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id C01C76B31B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:08 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so215216eaj.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7vfwVzDh3IRgBMaZqvA1Bo47GwAc0PzG2mPmChsPHfg=;
	b=ONQu6vrhZcrc4IYuJgqGeggBTmo3uobCkiYj8mI+NHp9hT4d/NxLOmOm/IYws4vWCf
	kDaONoGhBC8lWSp4WjAaSXMDAJ3locQhpUFr8mhqUPSL3AoQ2+JwnnWT1xVQurBbnf0A
	IZW3iKggQ1VfA1rKBatThAD46zgxAY2PRPtrCqCE/tYXtEZALSqAY0OjVK38QHOdYJXJ
	cCv+6qyMspm7XD2pif1weh12eJlI0AmCMyxFGTAl4solwDxv1iHjSYwcjOPVlMRR0zVk
	NgcwzbxIXCWHz92dzsNGRsi6ZCuavaRguz0B2wCA+G7s0DKZdHb4qGlDMzHc4CU9ET76
	1mvQ==
X-Received: by 10.14.109.195 with SMTP id s43mr37353868eeg.132.1374669669236; 
	Wed, 24 Jul 2013 05:41:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm65925492eew.1.2013.07.24.05.41.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:55 +0200
Message-Id: <d28fa8283d316aa4672b8a43c9860ab1ec74c519.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/29] libass: add PACKAGECONFIG for harfbuzz
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:09 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic
* runtime dependencies for glib-2.0 harfbuzz libffi libicudata libicule libicuuc libstdc++ are added
  only when harfbuzz is detected

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libass/libass.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass.inc
index 4dd5181..a0dc564 100644
--- a/meta-oe/recipes-multimedia/libass/libass.inc
+++ b/meta-oe/recipes-multimedia/libass/libass.inc
@@ -13,6 +13,9 @@ SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz"
 
 inherit autotools pkgconfig
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[harfbuzz] = "--enable-harfbuzz,--disable-harfbuzz,harfbuzz"
+
 EXTRA_OECONF = " \
     --enable-enca \
     --enable-fontconfig \
-- 
1.8.3.2


