Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id CC5BD7EEC2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:34 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id b13so16207233pfo.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=w/zuleIKWoCmDzgslEya2lJa7b/pmGv1ZNKiqEydxVk=;
	b=jfHJ94noN1Jp802BbN7ckTi3JjuowqT1VvAeBgmjFQnqzo8GIsWXOmKYwnY7xfPIhk
	z2qyjpKRcxNn/VssTl4dkmYtrOT/RNaWd/+oVxejAYPdjTOElqJ7He/WA8irZ+rkHKJY
	+/eRyQXd+5JSTAMcmQAv60+5P0VfXocadECSV3RefJT9fvrHstQ0/A3DG8wQ49SvgWIu
	18ZJw2ruTzW4vCUcNtaHFoYlBDWdUNAZBQ0x84Rpnt8oUi2q5cB73o1SRmYsjiaZifKB
	Ed2ig2uWmrgFAZuoixbYZi6LXcE5mg35KAZJj8HNwF/P3bcEPQ4tnYQBLnXq8YuvcMWO
	y35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w/zuleIKWoCmDzgslEya2lJa7b/pmGv1ZNKiqEydxVk=;
	b=ZEpBnWU8MC9xgGDpcU3X2YUlR+H33lmQrjN02VA8grL/LLoAxr6vTOoFc8QdU7gLXa
	k5wjAI9OxJFz93TyRJBs96uFhHMDlszP4WlRZvOW9zRV66eRRSfDRGiSunAHJP73+CK1
	InxLncmo13bAGeksNAJ+NbfdTcC2735zSMg/q7TAzBCnAo4U6QRRtLi5osuiYLm+ow2m
	0Z8ZYg/xHLZDK9jpFtppG1mQD+NUg0692WzGFESAx7Iy/W5hrxcZ7Ik4fOsK9+se5dXw
	ULqHIbp+3uOtkEgcW0p+GUVom33SBZe5yOQgRGtdqfVpEwV26fScOACaE1pZuPH5TTpz
	KHiA==
X-Gm-Message-State: APjAAAWRUbrTpBOoz5lYKprD2xUK9vyr6JKm/zSmMM54vbJQjieVx8Ht
	ZCsYRm+Bdtsa7N5YROnZIPfvRnr785c=
X-Google-Smtp-Source: APXvYqzxq/GGOQn0/twYc+LCiZFXxyYpvXi2H00xpgWwma1Ov6UZWFjg7P4g6pMzustnovSdZQKEWQ==
X-Received: by 2002:a63:f13:: with SMTP id e19mr66997829pgl.132.1563727175529; 
	Sun, 21 Jul 2019 09:39:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:14 -0700
Message-Id: <20190721163919.32659-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 09/14] dumb-init: Switch to git fetcher
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:35 -0000
Content-Transfer-Encoding: 8bit

github archives are not reliable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dumb-init/{dumb-init_1.2.0.bb => dumb-init_1.2.2.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/dumb-init/{dumb-init_1.2.0.bb => dumb-init_1.2.2.bb} (63%)

diff --git a/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.0.bb b/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.2.bb
similarity index 63%
rename from meta-oe/recipes-extended/dumb-init/dumb-init_1.2.0.bb
rename to meta-oe/recipes-extended/dumb-init/dumb-init_1.2.2.bb
index e1a6d9508b..09eab9dcd0 100644
--- a/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.0.bb
+++ b/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.2.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/Yelp/dumb-init/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5940d39995ea6857d01b8227109c2e9c"
 
-SRC_URI = "https://github.com/Yelp/dumb-init/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "4eb7f43d7823686723ff7ac1bad097cb"
-SRC_URI[sha256sum] = "74486997321bd939cad2ee6af030f481d39751bc9aa0ece84ed55f864e309a3f"
+SRCREV = "b1e978e486114797347deefcc03ab12629a13cc3"
+SRC_URI = "git://github.com/Yelp/dumb-init"
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS} ${LDFLAGS}'"
 
-- 
2.22.0


