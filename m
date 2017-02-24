Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 244F877568
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 23:10:02 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id x71so4746235qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 15:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yBvzHuzDRwAAPp0zgPjBCLUvVX9Rp/AheWrCHnoYX1k=;
	b=HFrMiGlzadLIVJCJGvBnFO6C/aqqq8ZFr5J7DB9dmRooDYPd7Ixjo3pZeAKjeWuADU
	4OceHkjOdbVOoQwIAzTSeDHbg2nqgbu7wUQqi9OF5Wd3HBFNPClkdtYNqbBHyA/WjrRZ
	eJ9PaFCbMXhaJ6ONE3bhYkTMpivCTbp54U3LYNF1nMb9XNacJ7Di91mOeEETNqfXOtb/
	AFvUQluHrBVe2gINYhB3NH7yJtgkqHSe/2dLPlVhRmF40pF1rKgdldCEHn9+cNyPQiov
	MzN/p9KzTwo7a8KpjvhptkAGsodYm42mfw+X9gxGjZ7t6qGRKWXJyLgZYYRCzrBq4EfQ
	DoQQ==
X-Gm-Message-State: AMke39laCWiw7d5ob2IDaxXCqd2fNZvFPq+9fVEY/oWSE4tDUpI6gGCuAhTM05YiMhflZA==
X-Received: by 10.55.209.157 with SMTP id o29mr5068357qkl.154.1487977803432;
	Fri, 24 Feb 2017 15:10:03 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	k62sm5723463qkd.21.2017.02.24.15.10.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 15:10:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 18:09:54 -0500
Message-Id: <1487977795-2611-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487977795-2611-1-git-send-email-derek@asterius.io>
References: <1487977795-2611-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCH 2/3] font-bh-lucidatypewriter-100dpi: update depends to fix builds with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 23:10:02 -0000

Resolves build issue exposed by RSS
See http://errors.yoctoproject.org/Errors/Details/130625/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb                | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
index bffeb95..6e0b33c 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
@@ -6,7 +6,7 @@ SECTION = "x11/font"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0d221a9cd144806cb469735cc4775939"
 
-DEPENDS = "util-macros-native font-util-native bdftopcf-native"
+DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_class-native = "font-util-native"
 
@@ -16,5 +16,3 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "c8b73a53dcefe3e8d3907d3500e484a9"
 SRC_URI[sha256sum] = "62a83363c2536095fda49d260d21e0847675676e4e3415054064cbdffa641fbb"
-
-PNBLACKLIST[font-bh-lucidatypewriter-100dpi] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130625/"
-- 
2.7.4


