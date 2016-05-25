Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id A2D6D60761
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 01:27:59 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yl2so3568488pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 18:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ZXj+7Ps09a/iYSlzs9forRmPQgkI8zLivZvsYqBhKqg=;
	b=E6OPHi7bbFF5IN+KOtjjUxtCymZXyd7V6AobNu2r7j6OpoNhPK+TlUFz8ILgVTHb70
	gznNegntITrG8DWhFJZEYA2Gz7qt2+iQHM3KYbfj8BFEahb18W2WLrWVxerAyC521D2v
	X7KnU7WB6maJRkwM5XcueshEr/oRgCm7YUmkubGnXQuL1pmUkZq0uP+Qi4saFEN7sKof
	NS3EyXJMMpJdaTJsyARGynoPr5e3soPu04Zhbf0cR2DxzEK/SbGsJCNnAYXJ45YxIums
	f4VDAQhuexNQSSP5cISe83iP8+A28UHCy51UvMWI0CGae25fwHjkmeTFbitxthtOtpsP
	zZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZXj+7Ps09a/iYSlzs9forRmPQgkI8zLivZvsYqBhKqg=;
	b=Uz6fz6HH/zXc4pSD80Wun+sVKR8uDp1gGQAFuuXEpI1DojdYXpmfcGBl4PMyRqFDsU
	WkBDWpdUmlSc30qrG2JCseeh7TRikmZJU01TnKAFr5IDjpcVvARh6lIQmxlCyDqBYETG
	14uD4XzP59+QjwYEDss9QB0e5j9lq/f6vDVs9JmJfrLZoY5tv30f8GhCo7CSc7H43ZJl
	PziU3m9uwTNhJqo3kbDuWzYlelUANoI1dKyasy+TlA553ZlXFdsUGSeY5CWOW0vPzAJX
	USmwj6ZaFVIWK3U84gMGbefHNEoM5heb7/AeFv8zMN7aRGgKEfuIeMKsIlNUj6q6BKWD
	HPsQ==
X-Gm-Message-State: ALyK8tIkPuRPLDkufTbk83aHkuY+366YgkZCnOKnDhsY+Hj933yBGsGsBBToJzziHhXtxg==
X-Received: by 10.66.229.33 with SMTP id sn1mr1762845pac.49.1464139680635;
	Tue, 24 May 2016 18:28:00 -0700 (PDT)
Received: from Pahoa2.mvista.com ([50.233.148.158])
	by smtp.gmail.com with ESMTPSA id
	17sm21223872pfj.96.2016.05.24.18.27.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 May 2016 18:27:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 May 2016 18:27:58 -0700
Message-Id: <1464139678-18772-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][krogoth][PATCH] Revert "leptonica: add PACAKGECONFIG for openjpeg"
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
X-List-Received-Date: Wed, 25 May 2016 01:28:01 -0000

This reverts commit 1726e7172b66769c1597719cf7aba852159317a0.

This patch added a build warning.
WARNING: leptonica-1.70-r0 do_configure: QA Issue: leptonica: configure was passed unrecognised options: --without-libopenjpeg [unknown-configure-option]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
index 28701fc..e826e05 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
@@ -11,7 +11,4 @@ EXTRA_OECONF += " \
     --without-libwebp \
 "
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[openjpeg] = "--with-libopenjpeg,--without-libopenjpeg,openjpeg"
-
 inherit autotools pkgconfig
-- 
2.3.5


