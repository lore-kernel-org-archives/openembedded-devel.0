Return-Path: <brgl@bgdev.pl>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id B39D878458
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 08:40:02 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id 80so32347200lfy.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 01:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RtTfpPG1Yc+xopwcm3tbaFBcCoory6E0/869s3crVKM=;
	b=MHRrEdkQwMZNeDj8U3yHewQH+aMxSDRECU9KTvlHz0G9NnGkW0tLJTAuERCwpJgqb2
	85Yb/9GG2vA/rPmm5gceyvX0Zgx/nFzZJWyym0zRXMaq/pYqWr1z0dNeLQRzL1h+nOav
	+A7VTlruMjJPzMRUGokaCJcnmMmg5L+/Mu+rcrIoI0gWqbpmiZSt0XEe3tCr6l0WYE7E
	mnv25z3eYaO/Mg8uabppHoz5zvLR3aQpLnLTKV5Ncg9WXDqw/bFSdVZuCyf0IUKxZoii
	slAgPoUpaSWBYudnsFZ+EU9xTD7gBTahB+dm3OXkLtgcFu7uNTf2tdJUr0lfPdbWeTEa
	irxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RtTfpPG1Yc+xopwcm3tbaFBcCoory6E0/869s3crVKM=;
	b=A5wJeYnSHmk2t8xSS+rfyAgsyqJAKai8eEf1y99FQA1hIZa8MLz6Ya1HqKFmJSp1tW
	erpYiOh8oT4xUG4m4mmuOdYivSMfcMQ8F2xEaO/xpCE3I5yULnXBaphy8P6nivfwdfhH
	+jjzKUZhqZwXl3VTiQogU6+0w2bOYqJVYhh5ObNybsoNiiJ9uz4KWTNBDrEkQv5rweJ1
	K590Pm3BM0pnMHywFkcloGl1Z6WJIHraY66Y/oucGJBjbHxelgAXj/BfFDFveqn4YOsx
	IfZOMPtxZ+u97nmqomolY0RT5HkdbwOOYDHezH7U6onDurejHX5qRwawbWehYO+Ktxdy
	xMzA==
X-Gm-Message-State: AHPjjUjCfRiJjsDkmSF8FPngnQ/QF7zVwBEFxc7p+rWvHx7q0BUwx7jZ
	ls6jFj9BptqRgQGLQjBAcA==
X-Google-Smtp-Source: AOwi7QBycwe8J/lSag5UjV6lUug4tqS7FUq6WEqMCoeuyvcTpSZ+b1Jsfx1MMmscX4PZrhBwiOQ+Ww==
X-Received: by 10.25.81.216 with SMTP id g85mr5327581lfl.231.1505292003030;
	Wed, 13 Sep 2017 01:40:03 -0700 (PDT)
Received: from bgdev-debian.nomovok.info (auth.nomovok.info. [83.150.126.21])
	by smtp.gmail.com with ESMTPSA id
	p9sm2875675lja.5.2017.09.13.01.40.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 01:40:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Sep 2017 10:39:53 +0200
Message-Id: <20170913083953.13788-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.13.2
Cc: Bartosz Golaszewski <bartekgola@gmail.com>
Subject: [meta-oe][PATCH] libgpiod: bump version to v0.3.1
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
X-List-Received-Date: Wed, 13 Sep 2017 08:40:03 -0000

From: Bartosz Golaszewski <bartekgola@gmail.com>

The project is now hosted at kernel.org. Updates since v0.2 include
a couple bug-fixes and new features for gpiomon.

Signed-off-by: Bartosz Golaszewski <bartekgola@gmail.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.bb | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.bb b/meta-oe/recipes-support/libgpiod/libgpiod.bb
index fe56f7b..c506057 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.bb
@@ -1,21 +1,14 @@
 SUMMARY = "C library and tools for interacting with the linux GPIO character device"
-HOMEPAGE = "https://github.com/brgl/libgpiod"
 
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
-UPSTREAM_CHECK_URI = "git://github.com/brgl/libgpiod/releases"
+SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
 
-SRC_URI = "git://github.com/brgl/libgpiod.git"
+SRC_URI[md5sum] = "5f9d855352b1a5272cf6f1c2e20689d2"
+SRC_URI[sha256sum] = "6dfd6aeb544e8b7baf484a05c9ae0e67022c109362a41d87005393046b6beacf"
 
-SRCREV = "7ab5e53b69cce313ba87033a442cabd417f5d895"
-
-PV = "0.2+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-SRC_URI[md5sum] = "68f039487e940c15bbfc50a10ab4715b"
-SRC_URI[sha256sum] = "7d7085d4e9cb811742ca8c5fe03458067efaeaa8abc23968d2e3c56bcc2d2ef8"
+PV = "0.3.1"
 
 inherit autotools pkgconfig
 
-- 
2.7.4


