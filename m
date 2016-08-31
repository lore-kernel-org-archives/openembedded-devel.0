Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9D02873216
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:41:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c133so291458wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rlMdYgDScbiSKfWIUWFr1qCVecVBKfAEtDUSMvXAv5E=;
	b=G5xA1ZcU/b4a/qM1Ncl8BDdBzpb57QGIMo/WpLJuKjoUIf2bSurADNUMjbrvDJbfSI
	YusERoSUuojX6Y1nDGPc/KDmRat3Q/7i0HsuDEbKTiP5UkJ+Jgj3k8xiSDeM6xjOrQPO
	fyn7QL6F3zYyhzInl/Kug6rxsbMrULodJ4KYyFX3pIyjLQssvFXuXeCc+dXywPuN9Hu/
	H5IejhFpfDax/1RN3QX44mz+xGvPjB3o6qVbEkG7PBZ6Cf/8j5dIaHT7odm5n7nl9yke
	RK2s9+5fl/adCFrMs5iqS/BxkAFoMVmY9KUD74anrgtFcTa+gXQA43FWIsSwqLpXaB36
	SXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rlMdYgDScbiSKfWIUWFr1qCVecVBKfAEtDUSMvXAv5E=;
	b=JWV03iH7eePMkFmnylod84FCwvYHEnE+dNBF0RkO7KM0yK9MNENcMbkYa02XAkuf2e
	biwlQfeowoX4apRyRcslnU8Od1FIT4W13xWAyKVZziKP05aeIvscou/BH8ivBAjDU0fw
	nbRu2TUKtNZd2C9iCgjbSYUOXaRg3qmHUcCsau0+wEAugQfT3G+DFsH3ElHOsGjtVajK
	wHZclkiH/5I5OJjnHg3fqtQprGDhwsLtg3RLJCUC0fbayunUMx9C8zAUuAvnzrveGq8z
	XaoWtqT1XC/86dtEhRzXJW0CX5mpweJsWKH6NV9kbQBfxCTY6nBpmzpnsX4F4VaEUYgs
	0CAA==
X-Gm-Message-State: AE9vXwOF/AeWjSpUfKdu0vkmb0ItEflLv7i1D+uIyl5evcfAOMLA9mIwdLa9XLIfug7f9A==
X-Received: by 10.28.58.7 with SMTP id h7mr23485521wma.35.1472672488512;
	Wed, 31 Aug 2016 12:41:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id u2sm25197680wmf.5.2016.08.31.12.41.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 12:41:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 21:41:04 +0200
Message-Id: <20160831194106.14065-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/11] tracker: blacklist, fails to build with new binutils-2.27
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
X-List-Received-Date: Wed, 31 Aug 2016 19:41:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index ff53669..7025280 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -83,3 +83,6 @@ FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
 
 SRC_URI[md5sum] = "f3a871beeebf86fd752863ebd22af9ac"
 SRC_URI[sha256sum] = "9b59330aa2e9e09feee587ded895e9247f71fc25f46b023d616d9969314bc7f1"
+
+# http://errors.yoctoproject.org/Errors/Details/81007/
+PNBLACKLIST[tracker] ?= "BROKEN: fails to build with new binutils-2.27"
-- 
2.9.2


