Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 15D417867C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:45 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id o8so16219862wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vjsM1dn3NMUlBOPRoxu3K/eLxOExt59wfSL+fyRr33M=;
	b=rIp/g68yiX9IGz+qTH2+sqGGzi9PSpTX48U/Fzpa6xltdRF4vQWyuE9n6vEudT8WGj
	Bkb+MPXV4YCXNGipChrS6x+KqQO+q6VzbUheXVmbNypVzQ5FAuVM0CdveNmw5iXXIbar
	nbtXRF1Y2kjrO7LZzbz1bkuS/LHDGHyTxc36jktmOyMfB9ik0kGJMs87BBK/CBEaUWJi
	wLRV1C3ESUiZDMLRkgkuxCMXNtcAjGYkZpCbJoaigzHScRODUF2LfO6nc9PBzR06Jxie
	y05LJLSJMoUwxA5JREMmGjjH7fRS5di+WmAY+WFxjYSymXLUJoCiwq7WtZKKpjzJIpgc
	nz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vjsM1dn3NMUlBOPRoxu3K/eLxOExt59wfSL+fyRr33M=;
	b=q2iPOVfVtQ4VYFwG9FKswWlAHINPGoXLEDEq105lUoZ07YEk0sZGidGwri/d7hZdgp
	OKELJoGRto20zNFVonwXz5NdSYR3C5XbhXdEZh6C629oIDmqEZSWZoy1rJk3lYQLAngU
	EOfAuCoipcONHfzjbeiNjiD4WTORzvI/8NUS2K0961UDo35HIobK+Ukn1p+VQh6tD713
	75PIaQvA6Vl3g1qcvQWA3GK5qgss0wKImiPsPSva/bgw0TLyRmTxRKKO05Z++GkP1vcH
	VkGDaR9Dq7+z9N+E/qxHCd4lXXPeXZYeAc7GX77NZLj/Wkj47DNKkEWatedHPH8HuuGz
	0QfQ==
X-Gm-Message-State: AElRT7F0WBtsq/Gcu/Z6PUg3QP3u9mgDXV7LR+3ZrRupxPTcjmQlYxre
	YgvqGPZQuu8TSI0JDTFdQpLNaA==
X-Google-Smtp-Source: AG47ELvA3AnzXKpy9l+JcAM/DsQ1ZZo7hEWierL/IGLHJykmQk0HA5s8mu5RvjBM1ougPSJPWe0Vgg==
X-Received: by 10.223.143.86 with SMTP id p80mr30432475wrb.31.1521981346755;
	Sun, 25 Mar 2018 05:35:46 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:16 +0200
Message-Id: <20180325123520.16452-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/20] libass: update 0.13.6 -> 0.14.0
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Migrate libass.inc into recipe - nothing else uses it
* Use git repo to avoid github checksum trouble

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb                 | 4 ----
 meta-oe/recipes-multimedia/libass/{libass.inc => libass_0.14.0.bb} | 4 +++-
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
 rename meta-oe/recipes-multimedia/libass/{libass.inc => libass_0.14.0.bb} (86%)

diff --git a/meta-oe/recipes-multimedia/libass/libass_0.13.6.bb b/meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
deleted file mode 100644
index 40ac0f811..000000000
--- a/meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-multimedia/${BPN}/${BPN}.inc
-
-SRC_URI[md5sum] = "daa6cfca437c0776af5f79750cdd9b4e"
-SRC_URI[sha256sum] = "f8a874d104e3e72e2cc057e5a1710c650b10367486845a26e5ff28ed7a912c2d"
diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
similarity index 86%
rename from meta-oe/recipes-multimedia/libass/libass.inc
rename to meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
index 4bc3db062..3454a5c27 100644
--- a/meta-oe/recipes-multimedia/libass/libass.inc
+++ b/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a42532a0684420bdb15556c3cdd49a75"
 
 DEPENDS = "enca fontconfig freetype libpng fribidi"
 
-SRC_URI = "https://github.com/libass/libass/releases/download/${PV}/libass-${PV}.tar.xz"
+SRC_URI = "git://github.com/libass/libass.git"
+SRCREV = "73284b676b12b47e17af2ef1b430527299e10c17"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-- 
2.14.3


