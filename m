Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6825465D48
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 05:38:56 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so134177928pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2015 22:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HmyODx+AONb3yQmo8x2QIuOw6LK5wAJNRiI9sB/Bxrw=;
	b=Z9E/QJ+iES9Z909qbHGg7KJ9rBFUJ16N3rLsTS9a9Z5gT7lBRJwyommEYVtmz24njn
	5ttf5ipIoP5aKD8x71A/nU0/uhk+QZ7Cp8C1ApEOXsIJbz8tjjLkQjwz7QHNvCoL41iP
	N1f8WjBy+jfpcuoXUmGLsHIN2UE6icWySxuOaI73lcSkvbDCQkVCdLi1lI4Xrz+/Je2W
	Z5SydMKwyan2A+3HqYfkJfTDr6GDplWAB3H5RjXtlt1vjmzvDsO9gsXcPdZgVXRKnP5M
	I85rt0ZBByJ009+PfDtrVY5ELoW4YWPpnci1RSTtWYzFAkG3DVQ8uj60K0Q6S0R/k6sL
	Aupw==
X-Received: by 10.66.243.69 with SMTP id ww5mr41409294pac.106.1431927537530;
	Sun, 17 May 2015 22:38:57 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id en2sm8720299pab.14.2015.05.17.22.38.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 May 2015 22:38:56 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2015 15:38:36 +1000
Message-Id: <1431927516-18675-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.1
Subject: [meta-oe][PATCH] nodejs: update to 0.12.3
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
X-List-Received-Date: Mon, 18 May 2015 05:38:57 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_0.12.2.bb => nodejs_0.12.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.2.bb => nodejs_0.12.3.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.3.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.12.3.bb
index 0e789f9..4f80d80 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.3.bb
@@ -8,8 +8,8 @@ DEPENDS = "openssl"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://enable-armv5e-build.patch \
 "
-SRC_URI[md5sum] = "b7f4a9f2e361a7026789a7d6c45a6d30"
-SRC_URI[sha256sum] = "ac7e78ade93e633e7ed628532bb8e650caba0c9c33af33581957f3382e2a772d"
+SRC_URI[md5sum] = "955448ae6c50a56da3f8992114563b71"
+SRC_URI[sha256sum] = "e65d83c6f2c874e28f65c5e192ac0acd2bbb52bfcf9d77e33442d6765a3eb9da"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.4.1


