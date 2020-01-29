Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 934B260212
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:33:06 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so4027061wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 04:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4gP0MaDALVROQ7SfOmyeKApQQJieTqSdJQnK/2owrso=;
	b=Zr3AMWnmVsMVUxyQN67L022+D6LGCX5Qx68dz3WGbRLIcsB5G5oLfD0Bps0YHYFUYQ
	lX3sKQkXicXRkp+KzVnwKXwpPwnGiWWUF/kf1WrbIeEdE6ZxnQWTt9yGE3ok9LcllZBB
	LQX9rFPJIu5p6Lnn5hAzdIcfn4DAldg6xP3ZHgfJ59MZjtjKaq8IUd2Z1VUJ8sRyoYfn
	LP5YtLhCqmANtPrJm1sCOqcIKd0IT2D62YTg5BlBScCiOWZ8/iXNI4pqbP0MLujXTiAt
	Tbv62fvmLCzmDYZUFlNEAAbfaDh6vwUwED7YQJ3Ysim0D2Eo3dZPISj5EEOsNg2oSE4L
	gRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4gP0MaDALVROQ7SfOmyeKApQQJieTqSdJQnK/2owrso=;
	b=V2DrnOST+Ga/FTc9nDAvKxjUW3yqNLrHk7aeFmV6jzxadIHK+FesXi5MeUUJZKyrAq
	cn1sd59Pcp9jdQY4/ScMm2d6iWIaDWaeM+0s/jEbV/BmRpOzUCm+CnjfNN1Nyzrmybve
	YFd1ykeDs3qHRjAUj1q9klJ2tyZ2dS9VSxymfgES+f/fUfMsbIB0iBxT0GcIilK4A1g3
	K3m9/BY0SsW6xgS1Bh3NoMx2E+eu17icjBnhxabv4H8Wnngxb8d5m1e5w/XeyCLNgXRB
	MzNna8X/m2lC4P76V7hYNuxMPbH7XDP3uSO+1q3fCgUaBjwowtGjKYyKO4TrTN1wCCaF
	xtnQ==
X-Gm-Message-State: APjAAAVI8wdsvJI+WFDJnI9K0x4ILx6fleCXCHDGxQr+NR/YxrTgCJ/D
	HgeTatfCU9VDi7CTm5QPu6+f0ZS288Y=
X-Google-Smtp-Source: APXvYqz4yUwIFjJUBEDpyZ/psodvWGgyBdMy30TLC+5qwt66W0niCT25lzhY3KXtZtf8Ap3unOeF6A==
X-Received: by 2002:a1c:6755:: with SMTP id b82mr10836435wmc.126.1580291944394;
	Wed, 29 Jan 2020 01:59:04 -0800 (PST)
Received: from localhost.localdomain
	(lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
	by smtp.gmail.com with ESMTPSA id x7sm2174416wrq.41.2020.01.29.01.59.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:59:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:59:01 +0100
Message-Id: <20200129095901.18965-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: update v1.4.1 -> v1.4.2
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:11 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

While the v1.5 version of libgpiod has already been released - we can't
integrate it in yocto yet as it requires v5.5 linux kernel headers to
build. In the meantime - update the recipe to build the latest bug-fix
release from the v1.4.x branch.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../libgpiod/{libgpiod_1.4.1.bb => libgpiod_1.4.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.4.1.bb => libgpiod_1.4.2.bb} (80%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.2.bb
similarity index 80%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.4.2.bb
index 0391deb86..bad88a54e 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.2.bb
@@ -2,8 +2,8 @@ require libgpiod.inc
 
 DEPENDS += "autoconf-archive-native"
 
-SRC_URI[md5sum] = "585b4bb431f99c4ba9b3ee58b9d494c1"
-SRC_URI[sha256sum] = "21ae8fd1f8dafc2eb2ba50e652390cf533d21351419a7426255895cb52e21b1c"
+SRC_URI[md5sum] = "b552bfa87685dfd728a1485e914bfae2"
+SRC_URI[sha256sum] = "b289b70e3d63a8e06205f7445d5342f4742277c267ce24a7c4d0017fff339e41"
 
 # enable cxx bindings
 PACKAGECONFIG ?= "cxx"
-- 
2.19.1


