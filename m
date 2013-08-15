Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id BA3CA6B7C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:48 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so180543eak.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=7vfwVzDh3IRgBMaZqvA1Bo47GwAc0PzG2mPmChsPHfg=;
	b=cQdFIRx+LOAUL7OnE1yCghno89PDdY7Fz4lfKzy/rQykmcg+svvdlXMI1RQzBA3NSb
	5vFs5gVMGwU5vRqMhWRzh7utmqcxxLsZYPQFV/6HjXenCzDg/1E72I8t9svTQ5twrrC7
	yeA9XC2DmKuW+wHbQ9FT3LgZdpMOnazNbD311W6+dfEK6tqVLoh2+egh6O+PmasbdTZ4
	jPkg+31XGajH8znTVdOF1HGekIq4DNNjDaiYnX28/7xQ8/jqpLbskhyhd2DS/6FHA/5Y
	IRa1CWmoJYsgRFtyo0YAW/mP3Kluciri5ta0iJUe2MqLi4LYnRiAY6x+waEJiHWtVrjo
	bYig==
X-Received: by 10.14.246.11 with SMTP id p11mr20952489eer.9.1376551189197;
	Thu, 15 Aug 2013 00:19:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm82051592eeg.17.2013.08.15.00.19.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:22 +0200
Message-Id: <85f80f10ff0cd215ece4126602932a4594d4da2b.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 42/60] libass: add PACKAGECONFIG for harfbuzz
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:49 -0000

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


