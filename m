Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC33D6B512
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 17:41:32 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q5so4279796pfg.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2019 10:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uTZL5DT63RB2mYSRrHmREe017YaRanwZzFMHacVq9pY=;
	b=GwULCBelAKblrIcv+IKPx87cT6d8l7neVKlZD209iysdKiEP16NaFUDeYvx3Lxehvh
	W/UdA+GF6A7CgIKpi3rXqw+oLRuD6Teh7x+5R+IA+PNiX+Gn3SuAmjbR6dJ2TGGBTEdB
	AuMBYe1EEN6kf70QSYUGEBKNorpZcQHJTCV6uW3EXa+v61fkpXjQDh/Yb+X5eApFeXPs
	SlsWd9f7415CKDB17PMcTnFQEmplEeIW5jChyRhMQmeHTr1bRwvbrw2g6wS6I2/qmnov
	c4kcbuxZIsibdJsJaSh0dY2xv9fFBE0/53D69rsu6ajy5a7cXXMvLtEWUo0VJ4x6pdfl
	wUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uTZL5DT63RB2mYSRrHmREe017YaRanwZzFMHacVq9pY=;
	b=OZcjZweFNHDqV6LhDfzK+Ygq1YsTTP5iEJpOkY+WiOVLHAfiY/3/iZ7jV9t9XF4CN3
	kYPC8/6LsrUS4vJ226O0ZeEgjhAjXcidlSuIstoYDrywGLCMOw0ehzBvU0ynPoF+kxjE
	NpiQoELYfdvgigXzealDNFTxxozIgfh0jpb9oOECBIAT6u4E2e3vKFcHYrRnYu95R7zi
	I/+S0zJPNLzAe7lTSLXKh8+yiKHcc2V0IZObK1O6q6v209lRSp9Jsa2uAOprKE78NQlA
	padxREeVqsA8hoIcbJngITDad4STn2z/QVjtaIm83Dj2+RUXuc50vN9ZjbyNhb12Qssy
	bxnw==
X-Gm-Message-State: APjAAAVRR7bh+ZLtY5PVULPUZ7sjEW6vhZhXP/V36C9o/mBL/10Xq670
	irgDtRN1nT/sr8K32qxQC/3MnAsHsU4=
X-Google-Smtp-Source: APXvYqz05vqinO649vW8HfFrHjrylQAl1U7tRu+47tt7QbBbeqBMGL3Ai6z/VJxk7IxdeiBVadBkWw==
X-Received: by 2002:a63:1d02:: with SMTP id d2mr3408062pgd.190.1570210892791; 
	Fri, 04 Oct 2019 10:41:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id p11sm6357755pgb.1.2019.10.04.10.41.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 04 Oct 2019 10:41:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Oct 2019 10:41:24 -0700
Message-Id: <20191004174124.167120-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xscreensaver: Remove xserver-nodm-init rdep
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
X-List-Received-Date: Fri, 04 Oct 2019 17:41:34 -0000
Content-Transfer-Encoding: 8bit

this seems to be not required anyway

Fixes
ERROR: xscreensaver different signature for task do_package_write_ipk.sigdata between qemux86copy and qemux86
Hash for dependent task x11-common/xserver-nodm-init_3.0.bb:do_packagedata changed from de0944d4fcaeed0efdb143a18cc406bd043469ae291de1704a999bc878a7691c to ba7bdaf35860ba5bf5a5f4ce06379a77c88eb9806e09a1fc5373933888a46507

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
index 3a88f12ec8..c2b345da6a 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
@@ -15,7 +15,7 @@ SRC_URI += " \
 
 DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native bc-native"
 # These are only needed as part of the stopgap screensaver implementation:
-RDEPENDS_${PN} += "xserver-nodm-init liberation-fonts"
+RDEPENDS_${PN} += "liberation-fonts"
 
 inherit systemd perlnative pkgconfig gettext autotools-brokensep distro_features_check
 
-- 
2.23.0


