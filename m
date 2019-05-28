Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A3B0D7DF2B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 17:42:02 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d17so3906266wmb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iGBHr9TRbXJsyn1C/xsUCVvbdMN/IF0Eof64b3kCZ4g=;
	b=a8ABTJtBQ9UMVL6GzZYxFbaB4ZFnWU1C1rXAXoQFsSmKP1QHBp10CdZ+37q31Qnzut
	SboZh1Mm+2h1XObaIYfTof/qHN+iSgdlg1fCUdeOGzdz1mmJ/bEwAJen73waSGtALM5U
	cR7Ilc4UQXQwHbH0JmSQ2Z+/Yb4NGW9MoMg3WbgL+jYIGWLUD2xn1FZ+mJfKw4Nl1jEO
	Gr4xfkT3gZdLe2e/egtM4Ta8EhgTH0ftjHmB2u/x3bw7Uf3Bv5CPI0NKCIGC0izgqDbX
	urQelP/wv8K89ZuHAbHwwtqOfL/zh3Hf7uCE9qnSTN7EaWAO0QTIsxUHw6Nc4tTpZXT+
	VG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iGBHr9TRbXJsyn1C/xsUCVvbdMN/IF0Eof64b3kCZ4g=;
	b=e3ZU74oHJWsN7Jj8eNy5cJff7frI/bOsYKMKDK51LrBg/Tm2dCeMfxMhh5Dq89dGQa
	Vv89ldq6O062cYEHDCKmjXlrkOb4OoIc0hCaIKVXs1gF3qWR8JA487sIGX1vE/pfMNo9
	1PMNLyXSo+nDG5M0Ulx1lWcAHlyf89Ga0tGJfiIQPHZRmhIrq1VL76DfzcNVk9ar82sS
	Nr/ezhtcH14CMY80UbOXmdWDDMZpyPNvpPazTSpi2cqyrhfYkDTsHCioZb6ZTXb73hl7
	/5H6LUYd0kL/rvZeA0Bpq3ZMCNFv5/LMXjDrqf03QU4J70QG34qwbVRWAZi6s9Ts4z1C
	01sg==
X-Gm-Message-State: APjAAAXMwHTXjqE7Wf0K1g1FXNcmD1xdvTjfsMgyEOm8jYFRi+M89I9k
	fxIp2UsXPEHVO1Bem/Ln9qM3exM1
X-Google-Smtp-Source: APXvYqxBbjS/WWbuotfVWNiJfXD/M2/Yi7Gw734pDt7rS/wytIZfOj/Hx2ziDurcvGt4MhBC2Bzo+A==
X-Received: by 2002:a05:600c:114f:: with SMTP id
	z15mr4243299wmz.104.1559065322926; 
	Tue, 28 May 2019 10:42:02 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	j7sm12278857wrt.31.2019.05.28.10.42.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 10:42:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2019 17:42:03 +0000
Message-Id: <20190528174203.726-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libmikmod: upgrade to 3.3.11.1
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
X-List-Received-Date: Tue, 28 May 2019 17:42:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../mikmod/{libmikmod_3.3.6.bb => libmikmod_3.3.11.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.6.bb => libmikmod_3.3.11.1.bb} (73%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
similarity index 73%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
index bbf58f9540..76e10f86a3 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/project/mikmod/outdated_versions/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "9dd9bed30c6f7607a55480234606071b"
-SRC_URI[sha256sum] = "3f363e03f7b1db75b9b6602841bbd440ed275a548e53545f980df8155de4d330"
+SRC_URI[md5sum] = "f69d7dd06d307e888f466fc27f4f680b"
+SRC_URI[sha256sum] = "ad9d64dfc8f83684876419ea7cd4ff4a41d8bcd8c23ef37ecb3a200a16b46d19"
 
 inherit autotools binconfig lib_package
 
-- 
2.17.1


