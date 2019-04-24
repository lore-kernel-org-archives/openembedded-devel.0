Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B49056D61B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 14:51:36 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q16so4998394wmj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5vFzQJ3gznAEjfIjMULZ/sKtPKlUrU5uRQk8VkA2WVg=;
	b=G5e7cfdIVOrpyPVXQ4RN0Xu25otCsfy3dR1SlQpprNUTbgpTAbPt0+nNBvzazTZ54P
	uOxtBp/tuoVoHNfB5xXIRCScXlidK2Q4BvR/V4iUhyV39hL1TMz5BhyWXp2pbRhREW5l
	h2KpPuj1eAZqosMLC845DKw8Lp8uWpWfSJ/VKpzK114026A1g3p8/aGYQwfj6cTkOHgM
	rQqVhCd7nCq4VN9lrINr98kayyfQ7vjd1ImgScU5U+nw9lZ3U48C5K0JXm7afaxwBr2Z
	c5DLlXX5P2iM1TUELbPQ+ZwnbHbCvvZq4B4YNT3EDJlRMmNkLC1o54TQZDEY/KQmeCMk
	/i2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5vFzQJ3gznAEjfIjMULZ/sKtPKlUrU5uRQk8VkA2WVg=;
	b=LKmS2fLpQ8691PVu+O+PmNs8WNHUygjiSXzR/Jxm3fj3d/UMo4JVKex+lThNdw5gwD
	KD3KCSTUGc0/r1jK8XjTDjNikFNaEUMScvecKi9CQ5VyP2a/4jhyL+zuCEPsy2mn8nrr
	4+IWzchl37cGaEAYWGlSRKnPdGWbwWD5r82cNyNGrz5L2n0HijbNDJzQC+DcUdSHWSPq
	hO27md1ibxXhijzfdLSx6Du7NyY8eWk6VexTXfZHRj3IGRa9HcQQadqLLhPofZwMMguj
	ftrG5L59pMcpTUZYN+GEyN4MEkOqVFq5k7F1Aqf9KfO/wi+kt7nCR/LRdmUo+lZJTrDk
	jUlA==
X-Gm-Message-State: APjAAAXoSL/IY3TUi8s5p92c/KzMgggvtXTfhL5DPJiEAxFvBYrgUTbA
	TPxjJ3rWhQ1zCgV445U0bsVHQUY1
X-Google-Smtp-Source: APXvYqzU07Xiy3wdiv1xReB71BjN17fUVYqb12wQsauQDIC54A5dSte+iB5L29D0rA+FbCoz5YqIXQ==
X-Received: by 2002:a1c:e0c6:: with SMTP id x189mr6624245wmg.4.1556117497031; 
	Wed, 24 Apr 2019 07:51:37 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	t76sm26998970wmt.8.2019.04.24.07.51.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 07:51:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2019 14:51:35 +0000
Message-Id: <20190424145135.767-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] Revert "ell: remove recipe"
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
X-List-Received-Date: Wed, 24 Apr 2019 14:51:37 -0000

This reverts commit f4a59c5dd69a6d24cd500a6eba0b72e0d8b4f58c.

It was merged too early, ell wasn't merged to oe-core yet.

meta-oe/recipes-connectivity/iwd/iwd_0.14.bb depends on it and now there
is no provider in meta-oe nor oe-core.

Should be merged again after meta-oe warrior is branched and
ell in oe-core for the next release.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/ell/ell_0.17.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-core/ell/ell_0.17.bb

diff --git a/meta-oe/recipes-core/ell/ell_0.17.bb b/meta-oe/recipes-core/ell/ell_0.17.bb
new file mode 100644
index 0000000000..27f11cfbe2
--- /dev/null
+++ b/meta-oe/recipes-core/ell/ell_0.17.bb
@@ -0,0 +1,17 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+SRCREV = "ebc021cee3b2d20ca2af5e3ed02495da616b2fd3"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
+
+do_configure_prepend () {
+    mkdir -p ${S}/build-aux
+}
+
+DEPENDS = "dbus"
-- 
2.17.1


